{*******************************************************}
{                                                       }
{           CodeGear Delphi Runtime Library             }
{                                                       }
{ Copyright(c) 2010-2019 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}
{  Delphi-Objective-C Bridge                            }
{  Interfaces for Cocoa framework AVFoundation          }
{                                                       }
{  Copyright 2008-2010 Apple Inc. All rights reserved.  }
{                                                       }
{  Translator: Embarcadero Technologies, Inc.           }
{ Copyright (c) 2012-2014 Embarcadero Technologies, Inc.}
{*******************************************************}

unit Macapi.AVFoundation;

interface

uses
  Macapi.ObjectiveC,
  Macapi.CocoaTypes,
  Macapi.Dispatch,
  Macapi.Foundation,
  Macapi.QuartzCore,
  Macapi.CoreServices
  {$IFDEF OSX64}
  , Macapi.CoreFoundation,
  Macapi.CoreGraphics,
  Macapi.AppKit,
  Macapi.CoreAudio,
  Macapi.CoreMedia,
  Macapi.CoreMIDI,
  Macapi.ImageIO
  {$ENDIF}
  ;

const
  AVAssetExportSessionStatusCancelled = 5;
  AVAssetExportSessionStatusCompleted = 3;
  AVAssetExportSessionStatusExporting = 2;
  AVAssetExportSessionStatusFailed = 4;
  AVAssetExportSessionStatusUnknown = 0;
  AVAssetExportSessionStatusWaiting = 1;
  AVAssetImageGeneratorCancelled = 2;
  AVAssetImageGeneratorFailed = 1;
  AVAssetImageGeneratorSucceeded = 0;
  AVAssetReaderStatusCancelled = 4;
  AVAssetReaderStatusCompleted = 2;
  AVAssetReaderStatusFailed = 3;
  AVAssetReaderStatusReading = 1;
  AVAssetReaderStatusUnknown = 0;
  AVAssetReferenceRestrictionForbidAll = 65535;
  AVAssetReferenceRestrictionForbidCrossSiteReference = 4;
  AVAssetReferenceRestrictionForbidLocalReferenceToLocal = 8;
  AVAssetReferenceRestrictionForbidLocalReferenceToRemote = 2;
  AVAssetReferenceRestrictionForbidNone = 0;
  AVAssetReferenceRestrictionForbidRemoteReferenceToLocal = 1;
  AVAssetWriterStatusCancelled = 4;
  AVAssetWriterStatusCompleted = 2;
  AVAssetWriterStatusFailed = 3;
  AVAssetWriterStatusUnknown = 0;
  AVAssetWriterStatusWriting = 1;
  AVAudioQualityHigh = 96;
  AVAudioQualityLow = 32;
  AVAudioQualityMax = 127;
  AVAudioQualityMedium = 64;
  AVAudioQualityMin = 0;
  AVCaptureDevicePositionBack = 1;
  AVCaptureDevicePositionFront = 2;
  AVCaptureDevicePositionUnspecified = 0;
  AVCaptureDeviceTransportControlsNotPlayingMode = 0;
  AVCaptureDeviceTransportControlsPlayingMode = 1;
  AVCaptureExposureModeAutoExpose = 1;
  AVCaptureExposureModeContinuousAutoExposure = 2;
  AVCaptureExposureModeLocked = 0;
  AVCaptureFlashModeAuto = 2;
  AVCaptureFlashModeOff = 0;
  AVCaptureFlashModeOn = 1;
  AVCaptureFocusModeAutoFocus = 1;
  AVCaptureFocusModeContinuousAutoFocus = 2;
  AVCaptureFocusModeLocked = 0;
  AVCaptureTorchModeAuto = 2;
  AVCaptureTorchModeOff = 0;
  AVCaptureTorchModeOn = 1;
  AVCaptureVideoOrientationLandscapeLeft = 4;
  AVCaptureVideoOrientationLandscapeRight = 3;
  AVCaptureVideoOrientationPortrait = 1;
  AVCaptureVideoOrientationPortraitUpsideDown = 2;
  AVCaptureWhiteBalanceModeAutoWhiteBalance = 1;
  AVCaptureWhiteBalanceModeContinuousAutoWhiteBalance = 2;
  AVCaptureWhiteBalanceModeLocked = 0;
  AVContentAuthorizationBusy = 4;
  AVContentAuthorizationCancelled = 2;
  AVContentAuthorizationCompleted = 1;
  AVContentAuthorizationNotAvailable = 5;
  AVContentAuthorizationNotPossible = 6;
  AVContentAuthorizationTimedOut = 3;
  AVContentAuthorizationUnknown = 0;
  AVErrorApplicationIsNotAuthorized = -11836;
  AVErrorCompositionTrackSegmentsNotContiguous = -11824;
  AVErrorContentIsNotAuthorized = -11835;
  AVErrorContentIsProtected = -11831;
  AVErrorDecodeFailed = -11821;
  AVErrorDecoderNotFound = -11833;
  AVErrorDeviceAlreadyUsedByAnotherSession = -11804;
  AVErrorDeviceInUseByAnotherApplication = -11815;
  AVErrorDeviceLockedForConfigurationByAnotherProcess = -11817;
  AVErrorDeviceNotConnected = -11814;
  AVErrorDeviceWasDisconnected = -11808;
  AVErrorDiskFull = -11807;
  AVErrorEncoderNotFound = -11834;
  AVErrorExportFailed = -11820;
  AVErrorFileAlreadyExists = -11823;
  AVErrorFileFailedToParse = -11829;
  AVErrorFileFormatNotRecognized = -11828;
  AVErrorInvalidCompositionTrackSegmentDuration = -11825;
  AVErrorInvalidCompositionTrackSegmentSourceDuration = -11827;
  AVErrorInvalidCompositionTrackSegmentSourceStartTime = -11826;
  AVErrorInvalidSourceMedia = -11822;
  AVErrorMaximumDurationReached = -11810;
  AVErrorMaximumFileSizeReached = -11811;
  AVErrorMaximumNumberOfSamplesForFileFormatReached = -11813;
  AVErrorMaximumStillImageCaptureRequestsExceeded = -11830;
  AVErrorMediaChanged = -11809;
  AVErrorMediaDiscontinuity = -11812;
  AVErrorNoDataCaptured = -11805;
  AVErrorNoImageAtTime = -11832;
  AVErrorOperationNotSupportedForAsset = -11838;
  AVErrorOutOfMemory = -11801;
  AVErrorSessionConfigurationChanged = -11806;
  AVErrorSessionNotRunning = -11803;
  AVErrorUnknown = -11800;
  AVKeyValueStatusCancelled = 4;
  AVKeyValueStatusFailed = 3;
  AVKeyValueStatusLoaded = 2;
  AVKeyValueStatusLoading = 1;
  AVKeyValueStatusUnknown = 0;
  AVPlayerActionAtItemEndAdvance = 0;
  AVPlayerActionAtItemEndNone = 2;
  AVPlayerActionAtItemEndPause = 1;
  AVPlayerItemStatusFailed = 2;
  AVPlayerItemStatusReadyToPlay = 1;
  AVPlayerItemStatusUnknown = 0;
  AVPlayerStatusFailed = 2;
  AVPlayerStatusReadyToPlay = 1;
  AVPlayerStatusUnknown = 0;
  AVVideoFieldModeBoth = 0;
  AVVideoFieldModeBottomOnly = 2;
  AVVideoFieldModeDeinterlace = 3;
  AVVideoFieldModeTopOnly = 1;
  AVAUDIOFORMAT_HAVE_CMFORMATDESCRIPTION = 1;
  AVAUDIONODE_HAVE_AUAUDIOUNIT = 1;
  AVAUDIOIONODE_HAVE_AUDIOUNIT = 1;
  AVAUDIOENGINE_HAVE_MUSICPLAYER = 1;
  AVAUDIOENGINE_HAVE_AUAUDIOUNIT = 1;
  AVAUDIOUNIT_HAVE_AUDIOUNIT = 1;
  AVAUDIOUNITCOMPONENT_HAVE_AUDIOCOMPONENT = 1;
  AVAudioOtherFormat = 0;
  AVAudioPCMFormatFloat32 = 1;
  AVAudioPCMFormatFloat64 = 2;
  AVAudioPCMFormatInt16 = 3;
  AVAudioPCMFormatInt32 = 4;
  AVAudioConverterPrimeMethod_Pre = 0;
  AVAudioConverterPrimeMethod_Normal = 1;
  AVAudioConverterPrimeMethod_None = 2;
  AVAudioConverterInputStatus_HaveData = 0;
  AVAudioConverterInputStatus_NoDataNow = 1;
  AVAudioConverterInputStatus_EndOfStream = 2;
  AVAudioConverterOutputStatus_HaveData = 0;
  AVAudioConverterOutputStatus_InputRanDry = 1;
  AVAudioConverterOutputStatus_EndOfStream = 2;
  AVAudioConverterOutputStatus_Error = 3;
  AVAudio3DMixingRenderingAlgorithmEqualPowerPanning = 0;
  AVAudio3DMixingRenderingAlgorithmSphericalHead = 1;
  AVAudio3DMixingRenderingAlgorithmHRTF = 2;
  AVAudio3DMixingRenderingAlgorithmSoundField = 3;
  AVAudio3DMixingRenderingAlgorithmStereoPassThrough = 5;
  AVAudio3DMixingRenderingAlgorithmHRTFHQ = 6;
  AVAudioEngineManualRenderingErrorInvalidMode = -80800;
  AVAudioEngineManualRenderingErrorInitialized = -80801;
  AVAudioEngineManualRenderingErrorNotRunning = -80802;
  AVAudioEngineManualRenderingStatusError = -1;
  AVAudioEngineManualRenderingStatusSuccess = 0;
  AVAudioEngineManualRenderingStatusInsufficientDataFromInputNode = 1;
  AVAudioEngineManualRenderingStatusCannotDoInCurrentContext = 2;
  AVAudioEngineManualRenderingModeOffline = 0;
  AVAudioEngineManualRenderingModeRealtime = 1;
  AVAudioUnitReverbPresetSmallRoom = 0;
  AVAudioUnitReverbPresetMediumRoom = 1;
  AVAudioUnitReverbPresetLargeRoom = 2;
  AVAudioUnitReverbPresetMediumHall = 3;
  AVAudioUnitReverbPresetLargeHall = 4;
  AVAudioUnitReverbPresetPlate = 5;
  AVAudioUnitReverbPresetMediumChamber = 6;
  AVAudioUnitReverbPresetLargeChamber = 7;
  AVAudioUnitReverbPresetCathedral = 8;
  AVAudioUnitReverbPresetLargeRoom2 = 9;
  AVAudioUnitReverbPresetMediumHall2 = 10;
  AVAudioUnitReverbPresetMediumHall3 = 11;
  AVAudioUnitReverbPresetLargeHall2 = 12;
  AVAudioUnitEQFilterTypeParametric = 0;
  AVAudioUnitEQFilterTypeLowPass = 1;
  AVAudioUnitEQFilterTypeHighPass = 2;
  AVAudioUnitEQFilterTypeResonantLowPass = 3;
  AVAudioUnitEQFilterTypeResonantHighPass = 4;
  AVAudioUnitEQFilterTypeBandPass = 5;
  AVAudioUnitEQFilterTypeBandStop = 6;
  AVAudioUnitEQFilterTypeLowShelf = 7;
  AVAudioUnitEQFilterTypeHighShelf = 8;
  AVAudioUnitEQFilterTypeResonantLowShelf = 9;
  AVAudioUnitEQFilterTypeResonantHighShelf = 10;
  AVAudioEnvironmentDistanceAttenuationModelExponential = 1;
  AVAudioEnvironmentDistanceAttenuationModelInverse = 2;
  AVAudioEnvironmentDistanceAttenuationModelLinear = 3;
  AVAudioPlayerNodeBufferLoops = 1;
  AVAudioPlayerNodeBufferInterrupts = 2;
  AVAudioPlayerNodeBufferInterruptsAtLoop = 4;
  AVAudioPlayerNodeCompletionDataConsumed = 0;
  AVAudioPlayerNodeCompletionDataRendered = 1;
  AVAudioPlayerNodeCompletionDataPlayedBack = 2;
  AVMusicSequenceLoadSMF_PreserveTracks = 0;
  AVMusicSequenceLoadSMF_ChannelsToTracks = 1 shl 0;
  AVMusicTrackLoopCountForever = -1;
  AVAudioUnitDistortionPresetDrumsBitBrush = 0;
  AVAudioUnitDistortionPresetDrumsBufferBeats = 1;
  AVAudioUnitDistortionPresetDrumsLoFi = 2;
  AVAudioUnitDistortionPresetMultiBrokenSpeaker = 3;
  AVAudioUnitDistortionPresetMultiCellphoneConcert = 4;
  AVAudioUnitDistortionPresetMultiDecimated1 = 5;
  AVAudioUnitDistortionPresetMultiDecimated2 = 6;
  AVAudioUnitDistortionPresetMultiDecimated3 = 7;
  AVAudioUnitDistortionPresetMultiDecimated4 = 8;
  AVAudioUnitDistortionPresetMultiDistortedFunk = 9;
  AVAudioUnitDistortionPresetMultiDistortedCubed = 10;
  AVAudioUnitDistortionPresetMultiDistortedSquared = 11;
  AVAudioUnitDistortionPresetMultiEcho1 = 12;
  AVAudioUnitDistortionPresetMultiEcho2 = 13;
  AVAudioUnitDistortionPresetMultiEchoTight1 = 14;
  AVAudioUnitDistortionPresetMultiEchoTight2 = 15;
  AVAudioUnitDistortionPresetMultiEverythingIsBroken = 16;
  AVAudioUnitDistortionPresetSpeechAlienChatter = 17;
  AVAudioUnitDistortionPresetSpeechCosmicInterference = 18;
  AVAudioUnitDistortionPresetSpeechGoldenPi = 19;
  AVAudioUnitDistortionPresetSpeechRadioTower = 20;
  AVAudioUnitDistortionPresetSpeechWaves = 21;
  AVSpeechBoundaryImmediate = 0;
  AVSpeechBoundaryWord = 1;
  AVSpeechSynthesisVoiceQualityDefault = 1;
  AVSpeechSynthesisVoiceQualityEnhanced = 2;
  AVContentKeyRequestStatusRequestingResponse = 0;
  AVContentKeyRequestStatusReceivedResponse = 1;
  AVContentKeyRequestStatusRenewed = 2;
  AVContentKeyRequestStatusRetried = 3;
  AVContentKeyRequestStatusCancelled = 4;
  AVContentKeyRequestStatusFailed = 5;
  AVCaptureAutoFocusRangeRestrictionNone = 0;
  AVCaptureAutoFocusRangeRestrictionNear = 1;
  AVCaptureAutoFocusRangeRestrictionFar = 2;
  AVCaptureExposureModeCustom = 3;
  AVAuthorizationStatusNotDetermined = 0;
  AVAuthorizationStatusRestricted = 1;
  AVAuthorizationStatusDenied = 2;
  AVAuthorizationStatusAuthorized = 3;
  AVCaptureColorSpace_sRGB = 0;
  AVCaptureColorSpace_P3_D65 = 1;
  AVCaptureVideoStabilizationModeOff = 0;
  AVCaptureVideoStabilizationModeStandard = 1;
  AVCaptureVideoStabilizationModeCinematic = 2;
  AVCaptureVideoStabilizationModeAuto = -1;
  AVCaptureAutoFocusSystemNone = 0;
  AVCaptureAutoFocusSystemContrastDetection = 1;
  AVCaptureAutoFocusSystemPhaseDetection = 2;
  AVCaptureSessionInterruptionReasonVideoDeviceNotAvailableInBackground = 1;
  AVCaptureSessionInterruptionReasonAudioDeviceInUseByAnotherClient = 2;
  AVCaptureSessionInterruptionReasonVideoDeviceInUseByAnotherClient = 3;
  AVCaptureSessionInterruptionReasonVideoDeviceNotAvailableWithMultipleForegroundApps = 4;
  AVCaptureSessionInterruptionReasonVideoDeviceNotAvailableDueToSystemPressure = 5;
  AVCaptureOutputDataDroppedReasonNone = 0;
  AVCaptureOutputDataDroppedReasonLateData = 1;
  AVCaptureOutputDataDroppedReasonOutOfBuffers = 2;
  AVCaptureOutputDataDroppedReasonDiscontinuity = 3;
  AVCaptureLensStabilizationStatusUnsupported = 0;
  AVCaptureLensStabilizationStatusOff = 1;
  AVCaptureLensStabilizationStatusActive = 2;
  AVCaptureLensStabilizationStatusOutOfRange = 3;
  AVCaptureLensStabilizationStatusUnavailable = 4;
  AVCaptureSystemPressureFactorNone = 0;
  AVCaptureSystemPressureFactorSystemTemperature = 1 shl 0;
  AVCaptureSystemPressureFactorPeakPower = 1 shl 1;
  AVCaptureSystemPressureFactorDepthModuleTemperature = 1 shl 2;
  AVDepthDataQualityLow = 0;
  AVDepthDataQualityHigh = 1;
  AVDepthDataAccuracyRelative = 0;
  AVDepthDataAccuracyAbsolute = 1;
  AVErrorDecoderTemporarilyUnavailable = -11839;
  AVErrorEncoderTemporarilyUnavailable = -11840;
  AVErrorInvalidVideoComposition = -11841;
  AVErrorReferenceForbiddenByReferencePolicy = -11842;
  AVErrorInvalidOutputURLPathExtension = -11843;
  AVErrorScreenCaptureFailed = -11844;
  AVErrorDisplayWasDisabled = -11845;
  AVErrorTorchLevelUnavailable = -11846;
  AVErrorIncompatibleAsset = -11848;
  AVErrorFailedToLoadMediaData = -11849;
  AVErrorServerIncorrectlyConfigured = -11850;
  AVErrorApplicationIsNotAuthorizedToUseDevice = -11852;
  AVErrorFailedToParse = -11853;
  AVErrorFileTypeDoesNotSupportSampleReferences = -11854;
  AVErrorUndecodableMediaData = -11855;
  AVErrorAirPlayControllerRequiresInternet = -11856;
  AVErrorAirPlayReceiverRequiresInternet = -11857;
  AVErrorVideoCompositorFailed = -11858;
  AVErrorCreateContentKeyRequestFailed = -11860;
  AVErrorUnsupportedOutputSettings = -11861;
  AVErrorOperationNotAllowed = -11862;
  AVErrorContentIsUnavailable = -11863;
  AVErrorFormatUnsupported = -11864;
  AVErrorMalformedDepth = -11865;
  AVErrorContentNotUpdated = -11866;
  AVErrorNoLongerPlayable = -11867;
  AVErrorNoCompatibleAlternatesForExternalDisplay = -11868;
  AVErrorNoSourceTrack = -11869;
  AVErrorExternalPlaybackNotSupportedForAsset = -11870;
  AVMovieWritingAddMovieHeaderToDestination = 0;
  AVMovieWritingTruncateDestinationToMovieHeaderOnly = 1 shl 0;
  AVPlayerTimeControlStatusPaused = 0;
  AVPlayerTimeControlStatusWaitingToPlayAtSpecifiedRate = 1;
  AVPlayerTimeControlStatusPlaying = 2;
  AVPlayerHDRModeHLG = 1;
  AVPlayerHDRModeHDR10 = 2;
  AVPlayerHDRModeDolbyVision = 4;
  AVPlayerLooperStatusUnknown = 0;
  AVPlayerLooperStatusReady = 1;
  AVPlayerLooperStatusFailed = 2;
  AVPlayerLooperStatusCancelled = 3;
  AVQueuedSampleBufferRenderingStatusUnknown = 0;
  AVQueuedSampleBufferRenderingStatusRendering = 1;
  AVQueuedSampleBufferRenderingStatusFailed = 2;
  AVSampleBufferRequestDirectionForward = 1;
  AVSampleBufferRequestDirectionNone = 0;
  AVSampleBufferRequestDirectionReverse = -1;
  AVSampleBufferRequestModeImmediate = 0;
  AVSampleBufferRequestModeScheduled = 1;

// ===== External functions =====

const
  libAVFoundation = '/System/Library/Frameworks/AVFoundation.framework/AVFoundation';

function AVMakeRectWithAspectRatioInsideRect(aspectRatio: CGSize; boundingRect: CGRect): CGRect; cdecl; external libAVFoundation name _PU + 'AVMakeRectWithAspectRatioInsideRect';

type
{$M+}
// ===== Forward declarations =====

  AVAudioPlayerDelegate = interface;
  AVAudioRecorderDelegate = interface;
  AVCaptureAudioDataOutputSampleBufferDelegate = interface;
  AVCaptureFileOutputDelegate = interface;
  AVCaptureFileOutputRecordingDelegate = interface;
  AVCaptureVideoDataOutputSampleBufferDelegate = interface;

  AVTimedMetadataGroup = interface;
  AVCaptureInputPort = interface;
  AVCaptureOutput = interface;
  AVCaptureSession = interface;
  AVSynchronizedLayer = interface;
  AVCaptureDeviceFormat = interface;
  AVCaptureDevice = interface;
  AVVideoComposition = interface;
  AVCaptureInput = interface;
  AVCaptureDeviceInputSource = interface;
  AVPlayerLayer = interface;
  AVPlayerItemAccessLogEvent = interface;
  AVMetadataItem = interface;
  AVPlayerItemAccessLog = interface;
  AVPlayer = interface;
  AVPlayerItem = interface;
  AVPlayerItemTrack = interface;
  AVCaptureVideoPreviewLayer = interface;
  AVPlayerItemErrorLogEvent = interface;
  AVFrameRateRange = interface;
  AVPlayerItemErrorLog = interface;
  AVCaptureConnection = interface;
  AVAssetTrack = interface;
  AVAssetWriter = interface;
  AVAssetTrackSegment = interface;
  AVAssetReaderOutput = interface;
  AVAssetExportSession = interface;
  AVAsset = interface;
  AVAssetImageGenerator = interface;
  AVAssetReader = interface;
  AVCaptureAudioChannel = interface;
  AVAudioRecorder = interface;
  AVVideoCompositionLayerInstruction = interface;
  AVVideoCompositionCoreAnimationTool = interface;
  AVVideoCompositionInstruction = interface;
  AVAudioPlayer = interface;
  AVAssetWriterInputPixelBufferAdaptor = interface;
  AVAssetWriterInput = interface;
  AVAudioMix = interface;
  AVAudioMixInputParameters = interface;
  AVMutableVideoCompositionLayerInstruction = interface;
  AVMutableVideoCompositionInstruction = interface;
  AVURLAsset = interface;
  AVQueuePlayer = interface;
  AVMutableVideoComposition = interface;
  AVCaptureFileOutput = interface;
  AVCaptureDeviceInput = interface;
  AVCaptureStillImageOutput = interface;
  AVCaptureScreenInput = interface;
  AVCaptureAudioPreviewOutput = interface;
  AVAssetReaderTrackOutput = interface;
  AVAssetReaderAudioMixOutput = interface;
  AVCaptureAudioDataOutput = interface;
  AVAssetReaderVideoCompositionOutput = interface;
  AVCaptureVideoDataOutput = interface;
  AVMutableAudioMixInputParameters = interface;
  AVMutableAudioMix = interface;
  AVMutableTimedMetadataGroup = interface;
  AVMutableMetadataItem = interface;
  AVCompositionTrack = interface;
  AVComposition = interface;
  AVCompositionTrackSegment = interface;
  AVMutableCompositionTrack = interface;
  AVCaptureMovieFileOutput = interface;
  AVCaptureAudioFileOutput = interface;
  AVMutableComposition = interface;
{$IFDEF OSX64}
  AVAudioBuffer = interface;
  AVAudioPCMBuffer = interface;
  AVAudioCompressedBuffer = interface;
  AVAudioChannelLayout = interface;
  AVAudioConnectionPoint = interface;
  AVAudioFormat = interface;
  AVAudioConverter = interface;
  AVAudioNode = interface;
  AVAudioMixing = interface;
  AVAudioStereoMixing = interface;
  AVAudio3DMixing = interface;
  AVAudioMixingDestination = interface;
  AVAudioIONode = interface;
  AVAudioInputNode = interface;
  AVAudioOutputNode = interface;
  AVAudioTime = interface;
  AVAudioEngine = interface;
  AVAudioUnit = interface;
  AVAudioUnitEffect = interface;
  AVAudioUnitReverb = interface;
  AVAudioUnitEQFilterParameters = interface;
  AVAudioUnitEQ = interface;
  AVAudioEnvironmentDistanceAttenuationParameters = interface;
  AVAudioEnvironmentReverbParameters = interface;
  AVAudioEnvironmentNode = interface;
  AVAudioFile = interface;
  AVAudioMixerNode = interface;
  AVAudioPlayerNode = interface;
  AVAudioSequencer = interface;
  AVMusicTrack = interface;
  AVAudioUnitComponent = interface;
  AVAudioUnitComponentManager = interface;
  AVAudioUnitDelay = interface;
  AVAudioUnitDistortion = interface;
  AVAudioUnitGenerator = interface;
  AVAudioUnitMIDIInstrument = interface;
  AVAudioUnitSampler = interface;
  AVAudioUnitTimeEffect = interface;
  AVAudioUnitTimePitch = interface;
  AVAudioUnitVarispeed = interface;
  AVMIDIPlayer = interface;
  AVSpeechSynthesisVoice = interface;
  AVSpeechUtterance = interface;
  AVSpeechSynthesizer = interface;
  AVSpeechSynthesizerDelegate = interface;
  AVAsynchronousKeyValueLoading = interface;
  AVContentKeySession = interface;
  AVContentKeySessionDelegate = interface;
  AVContentKeyRequest = interface;
  AVPersistableContentKeyRequest = interface;
  AVContentKeyResponse = interface;
  AVContentKeyRecipient = interface;
  AVFragmentMinding = interface;
  AVFragmentedAsset = interface;
  AVFragmentedAssetMinder = interface;
  AVAssetCache = interface;
  AVVideoCompositionRenderContext = interface;
  AVVideoCompositing = interface;
  AVAsynchronousVideoCompositionRequest = interface;
  AVAsynchronousCIImageFilteringRequest = interface;
  AVVideoCompositionValidationHandling = interface;
  AVAssetReaderOutputMetadataAdaptor = interface;
  AVAssetReaderSampleReferenceOutput = interface;
  AVAssetResourceLoader = interface;
  AVAssetResourceLoaderDelegate = interface;
  AVAssetResourceLoadingRequestor = interface;
  AVAssetResourceLoadingRequest = interface;
  AVAssetResourceRenewalRequest = interface;
  AVAssetResourceLoadingContentInformationRequest = interface;
  AVAssetResourceLoadingDataRequest = interface;
  AVFragmentedAssetTrack = interface;
  AVAssetTrackGroup = interface;
  AVMediaSelectionGroup = interface;
  AVMediaSelectionOption = interface;
  AVAssetWriterInputGroup = interface;
  AVAssetWriterInputPassDescription = interface;
  AVAssetWriterInputMetadataAdaptor = interface;
  AVCameraCalibrationData = interface;
  AVCaptureDeviceDiscoverySession = interface;
  AVCaptureDepthDataOutput = interface;
  AVCaptureDepthDataOutputDelegate = interface;
  AVMetadataObject = interface;
  AVMetadataFaceObject = interface;
  AVMetadataMachineReadableCodeObject = interface;
  AVCaptureMetadataOutput = interface;
  AVCaptureMetadataOutputObjectsDelegate = interface;
  AVCapturePhotoOutput = interface;
  AVCapturePhotoCaptureDelegate = interface;
  AVCapturePhotoSettings = interface;
  AVCapturePhotoBracketSettings = interface;
  AVCaptureResolvedPhotoSettings = interface;
  AVCapturePhoto = interface;
  AVCapturePhotoFileDataRepresentationCustomizer = interface;
  AVCaptureBracketedStillImageSettings = interface;
  AVCaptureManualExposureBracketedStillImageSettings = interface;
  AVCaptureAutoExposureBracketedStillImageSettings = interface;
  AVCaptureDataOutputSynchronizer = interface;
  AVCaptureDataOutputSynchronizerDelegate = interface;
  AVCaptureSynchronizedDataCollection = interface;
  AVCaptureSynchronizedData = interface;
  AVCaptureSynchronizedSampleBufferData = interface;
  AVCaptureSynchronizedMetadataObjectData = interface;
  AVCaptureSynchronizedDepthData = interface;
  AVCaptureMetadataInput = interface;
  AVCaptureSystemPressureState = interface;
  AVDepthData = interface;
  AVPortraitEffectsMatte = interface;
  AVMediaSelection = interface;
  AVMutableMediaSelection = interface;
  AVMetadataItemValueRequest = interface;
  AVMetadataItemFilter = interface;
  AVMovieTrack = interface;
  AVMutableMovieTrack = interface;
  AVFragmentedMovieTrack = interface;
  AVMovie = interface;
  AVMutableMovie = interface;
  AVMediaDataStorage = interface;
  AVFragmentedMovie = interface;
  AVFragmentedMovieMinder = interface;
  AVOutputSettingsAssistant = interface;
  AVPlayerItemMediaDataCollector = interface;
  AVPlayerItemMetadataCollector = interface;
  AVPlayerItemMetadataCollectorPushDelegate = interface;
  AVPlayerItemOutput = interface;
  AVPlayerItemVideoOutput = interface;
  AVPlayerItemOutputPullDelegate = interface;
  AVPlayerItemLegibleOutput = interface;
  AVPlayerItemLegibleOutputPushDelegate = interface;
  AVPlayerItemOutputPushDelegate = interface;
  AVPlayerItemMetadataOutput = interface;
  AVPlayerItemMetadataOutputPushDelegate = interface;
  AVPlayerLooper = interface;
  AVPlayerMediaSelectionCriteria = interface;
  AVQueuedSampleBufferRendering = interface;
  AVRouteDetector = interface;
  AVSampleBufferAudioRenderer = interface;
  AVSampleBufferDisplayLayer = interface;
  AVSampleBufferRenderSynchronizer = interface;
  AVSampleCursor = interface;
  AVSampleBufferGenerator = interface;
  AVSampleBufferRequest = interface;
  AVTextStyleRule = interface;
  AVMetadataGroup = interface;
  AVDateRangeMetadataGroup = interface;
  AVMutableDateRangeMetadataGroup = interface;

  // Needs review - BEGIN
  PInt16 = ^Int16;
  PPInt16 = ^PInt16;
  PInt32 = ^Int32;
  PPInt32 = ^PInt32;
  PPSingle = ^PSingle;
  PNSDictionary = ^NSDictionary;
  PNSString = ^NSString;
  PAVAudioConverterInputStatus = ^AVAudioConverterInputStatus;

  MTAudioProcessingTapRef = Pointer; // From MediaToolbox framework
  // Needs review - END

  AVAudioFramePosition = Int64;
  AVAudioFrameCount = UInt32;
  AVAudioPacketCount = UInt32;
  AVAudioChannelCount = UInt32;

  AVAudioNodeCompletionHandler = procedure of object;
  AVAudioNodeBus = NSUInteger;

  AVAudio3DPoint = record
    x: Single;
    y: Single;
    z: Single;
  end;

  AVAudio3DVector = AVAudio3DPoint;

  AVAudio3DVectorOrientation = record
    forward: AVAudio3DVector;
    up: AVAudio3DVector;
  end;

  AVAudio3DAngularOrientation = record
    yaw: Single;
    pitch: Single;
    roll: Single;
  end;

  AVAudioCommonFormat = NSInteger;
  AVAudioConverterPrimeMethod = NSInteger;

  AVAudioConverterPrimeInfo = record
    leadingFrames: AVAudioFrameCount;
    trailingFrames: AVAudioFrameCount;
  end;

  AVAudioConverterInputStatus = NSInteger;
  AVAudioConverterOutputStatus = NSInteger;

  AVAudioConverterInputBlock = function(inNumberOfPackets: AVAudioPacketCount; outStatus: PAVAudioConverterInputStatus): AVAudioBuffer of object;

  AVAudioNodeTapBlock = procedure(buffer: AVAudioPCMBuffer; when: AVAudioTime) of object;
  AVAudio3DMixingRenderingAlgorithm = NSInteger;

  AVAudioIONodeInputBlock = function(inNumberOfFrames: AVAudioFrameCount): PAudioBufferList of object;
  AVAudioEngineManualRenderingError = NSInteger;
  AVAudioEngineManualRenderingStatus = NSInteger;
  AVAudioEngineManualRenderingMode = NSInteger;

  AVAudioEngineManualRenderingBlock = function(numberOfFrames: AVAudioFrameCount; outBuffer: PAudioBufferList;
    outError: POSStatus): AVAudioEngineManualRenderingStatus of object;
  AVAudioUnitReverbPreset = NSInteger;
  AVAudioUnitEQFilterType = NSInteger;
  AVAudioEnvironmentDistanceAttenuationModel = NSInteger;
  AVAudioQuality = NSInteger;
  AVAudioPlayerNodeBufferOptions = NSInteger;
  AVAudioPlayerNodeCompletionCallbackType = NSInteger;

  AVAudioPlayerNodeCompletionHandler = procedure(callbackType: AVAudioPlayerNodeCompletionCallbackType) of object;
  AVMusicTimeStamp = Float64;
  AVMusicSequenceLoadOptions = NSInteger;

  _AVBeatRange = record
    start: AVMusicTimeStamp;
    length: AVMusicTimeStamp;
  end;

  AVBeatRange = _AVBeatRange;
  AVMusicTrackLoopCount = NSInteger;
  AVAudioUnitDistortionPreset = NSInteger;

  AVMIDIPlayerCompletionHandler = procedure of object;
  AVSpeechBoundary = NSInteger;
  AVSpeechSynthesisVoiceQuality = NSInteger;
  AVLayerVideoGravity = NSString;
  AVKeyValueStatus = NSInteger;
  AVContentKeySystem = NSString;
  AVContentKeyRequestRetryReason = NSString;
  AVContentKeyRequestStatus = NSInteger;
  AVMediaType = NSString;
  AVMediaCharacteristic = NSString;
  AVFileType = NSString;
  AVMetadataFormat = NSString;
  AVMetadataKeySpace = NSString;
  AVMetadataKey = NSString;
  AVMetadataExtraAttributeKey = NSString;
  AVAssetReferenceRestrictions = NSInteger;
  AVAudioTimePitchAlgorithm = NSString;
  AVAssetExportSessionStatus = NSInteger;
  AVAssetImageGeneratorApertureMode = NSString;
  AVAssetImageGeneratorResult = NSInteger;

  AVAssetImageGeneratorCompletionHandler = procedure(requestedTime: CMTime; image: CGImageRef; actualTime: CMTime;
    result: AVAssetImageGeneratorResult; error: NSError) of object;
  AVAssetReaderStatus = NSInteger;

  AVPixelAspectRatio = record
    horizontalSpacing: NSInteger;
    verticalSpacing: NSInteger;
  end;

  AVEdgeWidths = record
    left: CGFloat;
    top: CGFloat;
    right: CGFloat;
    bottom: CGFloat;
  end;

  AVTrackAssociationType = NSString;
  AVAssetWriterStatus = NSInteger;
  AVAssetWriterInputMediaDataLocation = NSString;
  AVCaptureSessionPreset = NSString;
  AVCaptureDevicePosition = NSInteger;
  AVCaptureDeviceType = NSString;
  AVCaptureFlashMode = NSInteger;
  AVCaptureTorchMode = NSInteger;
  AVCaptureFocusMode = NSInteger;
  AVCaptureAutoFocusRangeRestriction = NSInteger;
  AVCaptureExposureMode = NSInteger;
  AVCaptureWhiteBalanceMode = NSInteger;

  AVCaptureWhiteBalanceGains = record
    redGain: Single;
    greenGain: Single;
    blueGain: Single;
  end;

  AVCaptureWhiteBalanceChromaticityValues = record
    x: Single;
    y: Single;
  end;

  AVCaptureWhiteBalanceTemperatureAndTintValues = record
    temperature: Single;
    tint: Single;
  end;

  AVAuthorizationStatus = NSInteger;
  AVCaptureDeviceTransportControlsSpeed = Single;
  AVCaptureDeviceTransportControlsPlaybackMode = NSInteger;
  AVCaptureColorSpace = NSInteger;
  AVCaptureVideoStabilizationMode = NSInteger;
  AVCaptureAutoFocusSystem = NSInteger;
  AVCaptureSessionInterruptionReason = NSInteger;
  AVCaptureVideoOrientation = NSInteger;
  AVVideoFieldMode = NSInteger;
  AVCaptureOutputDataDroppedReason = NSInteger;
  AVVideoCodecType = NSString;
  AVVideoApertureMode = NSString;
  AVMetadataObjectType = NSString;
  AVCaptureLensStabilizationStatus = NSInteger;
  AVCaptureSystemPressureLevel = NSString;
  AVCaptureSystemPressureFactors = NSInteger;
  AVDepthDataQuality = NSInteger;
  AVDepthDataAccuracy = NSInteger;
  AVError = NSInteger;
  AVMetadataIdentifier = NSString;
  AVMovieWritingOptions = NSInteger;
  AVOutputSettingsPreset = NSString;
  AVPlayerStatus = NSInteger;
  AVPlayerTimeControlStatus = NSInteger;
  AVPlayerWaitingReason = NSString;
  AVPlayerActionAtItemEnd = NSInteger;
  AVPlayerHDRMode = NSInteger;
  AVPlayerItemStatus = NSInteger;
  AVPlayerItemLegibleOutputTextStylingResolution = NSString;
  AVContentAuthorizationStatus = NSInteger;
  AVPlayerLooperStatus = NSInteger;
  AVQueuedSampleBufferRenderingStatus = NSInteger;

  AVSampleCursorSyncInfo = record
    sampleIsFullSync: Boolean;
    sampleIsPartialSync: Boolean;
    sampleIsDroppable: Boolean;
  end;

  AVSampleCursorDependencyInfo = record
    sampleIndicatesWhetherItHasDependentSamples: Boolean;
    sampleHasDependentSamples: Boolean;
    sampleIndicatesWhetherItDependsOnOthers: Boolean;
    sampleDependsOnOthers: Boolean;
    sampleIndicatesWhetherItHasRedundantCoding: Boolean;
    sampleHasRedundantCoding: Boolean;
  end;

  AVSampleCursorStorageRange = record
    offset: Int64;
    length: Int64;
  end;

  AVSampleCursorChunkInfo = record
    chunkSampleCount: Int64;
    chunkHasUniformSampleSizes: Boolean;
    chunkHasUniformSampleDurations: Boolean;
    chunkHasUniformFormatDescriptions: Boolean;
  end;

  AVSampleBufferRequestDirection = NSInteger;
  AVSampleBufferRequestMode = NSInteger;
  TAVAudioUnitBlockMethod1 = procedure(audioUnit: AVAudioUnit; error: NSError) of object;
  TAVAudioUnitComponentManagerBlockMethod1 = procedure(comp: AVAudioUnitComponent; stop: PBoolean) of object;
  TAVAsynchronousKeyValueLoadingBlockMethod1 = procedure of object;
  TAVContentKeySessionBlockMethod1 = procedure(secureTokenData: NSData; error: NSError) of object;
  TAVContentKeyRequestBlockMethod1 = procedure(contentKeyRequestData: NSData; error: NSError) of object;
  TAVAssetExportSessionBlockMethod1 = procedure of object;
  TAVAssetExportSessionBlockMethod2 = procedure(compatible: Boolean) of object;
  TAVAssetExportSessionBlockMethod3 = procedure(compatibleFileTypes: NSArray) of object;
  TAVVideoCompositionBlockMethod1 = procedure(request: AVAsynchronousCIImageFilteringRequest) of object;
  TAVMutableVideoCompositionBlockMethod1 = procedure(request: AVAsynchronousCIImageFilteringRequest) of object;
  TAVAssetWriterBlockMethod1 = procedure of object;
  TAVAssetWriterInputBlockMethod1 = procedure of object;
  TAVCaptureDeviceBlockMethod1 = procedure(syncTime: CMTime) of object;
  TAVCaptureDeviceBlockMethod2 = procedure(granted: Boolean) of object;
  TAVCapturePhotoOutputBlockMethod1 = procedure(prepared: Boolean; error: NSError) of object;
  TAVCaptureStillImageOutputBlockMethod1 = procedure(imageDataSampleBuffer: CMSampleBufferRef; error: NSError) of object;
  TAVCaptureStillImageOutputBlockMethod2 = procedure(prepared: Boolean; error: NSError) of object;
  TAVCaptureStillImageOutputBlockMethod3 = procedure(sampleBuffer: CMSampleBufferRef; stillImageSettings: AVCaptureBracketedStillImageSettings;
    error: NSError) of object;
  TAVMetadataItemBlockMethod1 = procedure of object;
  TAVMetadataItemBlockMethod2 = procedure(valueRequest: AVMetadataItemValueRequest) of object;
  TAVPlayerBlockMethod1 = procedure(finished: Boolean) of object;
  TAVPlayerBlockMethod2 = procedure(time: CMTime) of object;
  TAVPlayerBlockMethod3 = procedure of object;
  TAVPlayerItemBlockMethod1 = procedure(finished: Boolean) of object;
  TAVPlayerItemBlockMethod2 = procedure of object;
  TAVQueuedSampleBufferRenderingBlockMethod1 = procedure of object;
  TAVSampleBufferAudioRendererBlockMethod1 = procedure(flushSucceeded: Boolean) of object;
  TAVSampleBufferDisplayLayerBlockMethod1 = procedure of object;
  TAVSampleBufferRenderSynchronizerBlockMethod1 = procedure(didRemoveRenderer: Boolean) of object;
  TAVSampleBufferRenderSynchronizerBlockMethod2 = procedure(time: CMTime) of object;
  TAVSampleBufferRenderSynchronizerBlockMethod3 = procedure of object;
  TAVSampleBufferGeneratorBlockMethod1 = procedure(dataReady: Boolean; error: NSError) of object;
{$ENDIF}

  // ===== Protocol declarations =====


  AVAsynchronousKeyValueLoading = interface
    ['{6A7DAE6F-B701-4D4D-B3DD-906C74C0BF8D}']
    {$IFDEF OSX64}
    procedure loadValuesAsynchronouslyForKeys(keys: NSArray; handler: TAVAsynchronousKeyValueLoadingBlockMethod1); cdecl;
    {$ENDIF}
    function statusOfValueForKey(key: NSString; error: NSError): AVKeyValueStatus; cdecl;
  end;
  AVAudioPlayerDelegate = interface(IObjectiveC)
    ['{A36A19B7-F324-4C33-8F72-8A5714C90A8C}']
    procedure audioPlayerDecodeErrorDidOccur(player: AVAudioPlayer; error: NSError); cdecl;
    procedure audioPlayerDidFinishPlaying(player: AVAudioPlayer; successfully: Boolean); cdecl;
  end;
  AVAudioRecorderDelegate = interface(IObjectiveC)
    ['{79549A53-A7CE-4DC3-9AAC-FFC5FCA01107}']
    procedure audioRecorderDidFinishRecording(recorder: AVAudioRecorder; successfully: Boolean); cdecl;
    procedure audioRecorderEncodeErrorDidOccur(recorder: AVAudioRecorder; error: NSError); cdecl;
  end;
  AVCaptureAudioDataOutputSampleBufferDelegate = interface(IObjectiveC)
    ['{22015942-1F1E-4E83-8ED1-B0D096703D76}']
    procedure captureOutput(captureOutput: AVCaptureOutput; didOutputSampleBuffer: CMSampleBufferRef; fromConnection: AVCaptureConnection); cdecl;
  end;
  AVCaptureFileOutputDelegate = interface(IObjectiveC)
    ['{E8B7841F-8FD3-4653-9450-3CA097F2D4E5}']
    procedure captureOutput(captureOutput: AVCaptureOutput; didOutputSampleBuffer: CMSampleBufferRef; fromConnection: AVCaptureConnection); cdecl;
    {$IFDEF OSX64}
    function captureOutputShouldProvideSampleAccurateRecordingStart(output: AVCaptureOutput): Boolean; cdecl;
    {$ENDIF}
  end;
  AVCaptureFileOutputRecordingDelegate = interface(IObjectiveC)
    ['{357F0719-63B9-4BE3-B0CD-DFBE2229C198}']
    {$IFDEF OSX64}
    [MethodName('captureOutput:didFinishRecordingToOutputFileAtURL:fromConnections:error:')]
    {$ENDIF}
    procedure captureOutput(captureOutput: AVCaptureFileOutput; didFinishRecordingToOutputFileAtURL: NSURL; fromConnections: NSArray; error: NSError); cdecl; overload;
    {$IFDEF OSX64}
    [MethodName('captureOutput:willFinishRecordingToOutputFileAtURL:fromConnections:error:')]
    procedure captureOutputWillFinishRecordingToOutputFileAtURL(output: AVCaptureFileOutput; fileURL: NSURL; fromConnections: NSArray; error: NSError); cdecl; overload;
    [MethodName('captureOutput:didStartRecordingToOutputFileAtURL:fromConnections:')]
    procedure captureOutputDidStartRecordingToOutputFileAtURL(output: AVCaptureFileOutput; fileURL: NSURL; fromConnections: NSArray); cdecl; overload;
    [MethodName('captureOutput:didPauseRecordingToOutputFileAtURL:fromConnections:')]
    procedure captureOutputDidPauseRecordingToOutputFileAtURL(output: AVCaptureFileOutput; fileURL: NSURL; fromConnections: NSArray); cdecl;
    [MethodName('captureOutput:didResumeRecordingToOutputFileAtURL:fromConnections:')]
    procedure captureOutputDidResumeRecordingToOutputFileAtURL(output: AVCaptureFileOutput; fileURL: NSURL; fromConnections: NSArray); cdecl;
    {$ENDIF}
  end;
  AVCaptureVideoDataOutputSampleBufferDelegate = interface(IObjectiveC)
    ['{E10F8D60-FACF-4C7D-BD26-5B44B48D1FA9}']
    {$IFDEF OSX64}
    [MethodName('captureOutput:didOutputSampleBuffer:fromConnection:')]
    {$ENDIF}
    procedure captureOutput(captureOutput: AVCaptureOutput; didOutputSampleBuffer: CMSampleBufferRef; fromConnection: AVCaptureConnection); cdecl; overload;
    {$IFDEF OSX64}
    [MethodName('captureOutput:didDropSampleBuffer:fromConnection:')]
    procedure captureOutputDidDropSampleBuffer(output: AVCaptureOutput; sampleBuffer: CMSampleBufferRef; fromConnection: AVCaptureConnection); cdecl;
    {$ENDIF}
  end;

// ===== Interface declarations =====

  AVTimedMetadataGroupClass = interface(NSObjectClass)
    ['{4C94B1EA-473D-4BE3-8961-D8660807FDDE}']
  end;
  AVTimedMetadataGroup = interface(NSObject)
    ['{37E80B6D-9DA5-4517-91B6-E1FC653AF47E}']
    {$IFDEF OSX64}
    function copyFormatDescription: CMMetadataFormatDescriptionRef; cdecl;
    {$ENDIF}
    function initWithItems(items: NSArray; timeRange: CMTimeRange): Pointer; cdecl;
    {$IFDEF OSX64}
    function initWithSampleBuffer(sampleBuffer: CMSampleBufferRef): Pointer; cdecl;
    {$ENDIF}
    function items: NSArray; cdecl;
    function timeRange: CMTimeRange; cdecl;
  end;
  TAVTimedMetadataGroup = class(TOCGenericImport<AVTimedMetadataGroupClass, AVTimedMetadataGroup>)  end;

  AVCaptureInputPortClass = interface(NSObjectClass)
    ['{B5ACA2A4-5E45-4846-9087-03747B91F17F}']
  end;
  AVCaptureInputPort = interface(NSObject)
    ['{BC1B8C1E-565C-419C-815D-35DE86D1772E}']
    {$IFDEF OSX64}
    function clock: CMClockRef; cdecl;
    {$ENDIF}
    function formatDescription: CMFormatDescriptionRef; cdecl;
    function input: AVCaptureInput; cdecl;
    function isEnabled: Boolean; cdecl;
    function mediaType: NSString; cdecl;
    procedure setEnabled(enabled: Boolean); cdecl;
  end;
  TAVCaptureInputPort = class(TOCGenericImport<AVCaptureInputPortClass, AVCaptureInputPort>)  end;

  AVCaptureOutputClass = interface(NSObjectClass)
    ['{A1F907E8-E4ED-4D38-80AA-E64168FB25DC}']
  end;
  AVCaptureOutput = interface(NSObject)
    ['{05F18F87-BA90-4774-89E6-4A41C7BF4319}']
    function connectionWithMediaType(mediaType: NSString): AVCaptureConnection; cdecl;
    function connections: NSArray; cdecl;
    {$IFDEF OSX64}
    function metadataOutputRectOfInterestForRect(rectInOutputCoordinates: CGRect): CGRect; cdecl;
    function rectForMetadataOutputRectOfInterest(rectInMetadataOutputCoordinates: CGRect): CGRect; cdecl;
    [MethodName('transformedMetadataObjectForMetadataObject:connection:')]
    function transformedMetadataObjectForMetadataObject(metadataObject: AVMetadataObject; connection: AVCaptureConnection): AVMetadataObject; cdecl;
    {$ENDIF}
  end;
  TAVCaptureOutput = class(TOCGenericImport<AVCaptureOutputClass, AVCaptureOutput>)  end;

  AVCaptureSessionClass = interface(NSObjectClass)
    ['{745FFD2C-8789-4E32-B2CF-B2F712BADE4F}']
  end;
  AVCaptureSession = interface(NSObject)
    ['{B667FB95-0118-48D9-AE9C-1484C42159C1}']
    procedure addConnection(connection: AVCaptureConnection); cdecl;
    procedure addInput(input: AVCaptureInput); cdecl;
    procedure addInputWithNoConnections(input: AVCaptureInput); cdecl;
    procedure addOutput(output: AVCaptureOutput); cdecl;
    procedure addOutputWithNoConnections(output: AVCaptureOutput); cdecl;
    {$IFDEF OSX64}
    function automaticallyConfiguresApplicationAudioSession: Boolean; cdecl;
    function automaticallyConfiguresCaptureDeviceForWideColor: Boolean; cdecl;
    {$ENDIF}
    procedure beginConfiguration; cdecl;
    function canAddConnection(connection: AVCaptureConnection): Boolean; cdecl;
    function canAddInput(input: AVCaptureInput): Boolean; cdecl;
    function canAddOutput(output: AVCaptureOutput): Boolean; cdecl;
    function canSetSessionPreset(preset: NSString): Boolean; cdecl;
    procedure commitConfiguration; cdecl;
    function inputs: NSArray; cdecl;
    {$IFDEF OSX64}
    function isInterrupted: Boolean; cdecl;
    {$ENDIF}
    function isRunning: Boolean; cdecl;
    {$IFDEF OSX64}
    function masterClock: CMClockRef; cdecl;
    {$ENDIF}
    function outputs: NSArray; cdecl;
    procedure removeConnection(connection: AVCaptureConnection); cdecl;
    procedure removeInput(input: AVCaptureInput); cdecl;
    procedure removeOutput(output: AVCaptureOutput); cdecl;
    function sessionPreset: NSString; cdecl;
    {$IFDEF OSX64}
    procedure setAutomaticallyConfiguresApplicationAudioSession(automaticallyConfiguresApplicationAudioSession: Boolean); cdecl;
    procedure setAutomaticallyConfiguresCaptureDeviceForWideColor(automaticallyConfiguresCaptureDeviceForWideColor: Boolean); cdecl;
    {$ENDIF}
    procedure setSessionPreset(sessionPreset: NSString); cdecl;
    {$IFDEF OSX64}
    procedure setUsesApplicationAudioSession(usesApplicationAudioSession: Boolean); cdecl;
    {$ENDIF}
    procedure startRunning; cdecl;
    procedure stopRunning; cdecl;
    {$IFDEF OSX64}
    function usesApplicationAudioSession: Boolean; cdecl;
    {$ENDIF}
  end;
  TAVCaptureSession = class(TOCGenericImport<AVCaptureSessionClass, AVCaptureSession>)  end;

  AVSynchronizedLayerClass = interface(CALayerClass)
    ['{98D343AE-AEA3-4E87-87F9-D9FAFC21E90C}']
    {class} function synchronizedLayerWithPlayerItem(playerItem: AVPlayerItem): Pointer; cdecl;
  end;
  AVSynchronizedLayer = interface(CALayer)
    ['{E9D0E415-BB8D-4E83-99D3-959D54457C02}']
    function playerItem: AVPlayerItem; cdecl;
    procedure setPlayerItem(playerItem: AVPlayerItem); cdecl;
  end;
  TAVSynchronizedLayer = class(TOCGenericImport<AVSynchronizedLayerClass, AVSynchronizedLayer>)  end;

  AVCaptureDeviceFormatClass = interface(NSObjectClass)
    ['{33DAB63A-7FCD-47F1-AAB9-392059BDF345}']
  end;
  AVCaptureDeviceFormat = interface(NSObject)
    ['{F0B88852-EBCA-4D6C-A59B-F0CE93694B7F}']
    {$IFDEF OSX64}
    function autoFocusSystem: AVCaptureAutoFocusSystem; cdecl;
    {$ENDIF}
    function formatDescription: CMFormatDescriptionRef; cdecl;
    {$IFDEF OSX64}
    function highResolutionStillImageDimensions: CMVideoDimensions; cdecl;
    function isPortraitEffectsMatteStillImageDeliverySupported: Boolean; cdecl;
    function isVideoBinned: Boolean; cdecl;
    function isVideoHDRSupported: Boolean; cdecl;
    function isVideoStabilizationModeSupported(videoStabilizationMode: AVCaptureVideoStabilizationMode): Boolean; cdecl;
    function isVideoStabilizationSupported: Boolean; cdecl; // API_DEPRECATED("Use isVideoStabilizationModeSupported: instead.", ios(7.0, 8.0))
    function maxExposureDuration: CMTime; cdecl;
    function maxISO: Single; cdecl;
    {$ENDIF}
    function mediaType: NSString; cdecl;
    {$IFDEF OSX64}
    function minExposureDuration: CMTime; cdecl;
    function minISO: Single; cdecl;
    function supportedColorSpaces: NSArray; cdecl;
    function supportedDepthDataFormats: NSArray; cdecl;
    function unsupportedCaptureOutputClasses: NSArray; cdecl;
    function videoFieldOfView: Single; cdecl;
    function videoMaxZoomFactor: CGFloat; cdecl;
    function videoMaxZoomFactorForDepthDataDelivery: CGFloat; cdecl;
    function videoMinZoomFactorForDepthDataDelivery: CGFloat; cdecl;
    {$ENDIF}
    function videoSupportedFrameRateRanges: NSArray; cdecl;
    {$IFDEF OSX64}
    function videoZoomFactorUpscaleThreshold: CGFloat; cdecl;
    {$ENDIF}
  end;
  TAVCaptureDeviceFormat = class(TOCGenericImport<AVCaptureDeviceFormatClass, AVCaptureDeviceFormat>)  end;

  AVCaptureDeviceClass = interface(NSObjectClass)
    ['{74F45CA3-C520-4069-8EE3-DCD1B19FB5F3}']
    {class} function defaultDeviceWithMediaType(mediaType: NSString): Pointer; cdecl;
    {class} function deviceWithUniqueID(deviceUniqueID: NSString): Pointer; cdecl;
    {class} function devices: NSArray; cdecl;
    {class} function devicesWithMediaType(mediaType: NSString): NSArray; cdecl;
  end;
  AVCaptureDevice = interface(NSObject)
    ['{CC532659-BBE1-442D-B1D9-9ECA7BD7B2D3}']
    {$IFDEF OSX64}
    function activeColorSpace: AVCaptureColorSpace; cdecl;
    function activeDepthDataFormat: AVCaptureDeviceFormat; cdecl;
    function activeDepthDataMinFrameDuration: CMTime; cdecl;
    {$ENDIF}
    function activeFormat: AVCaptureDeviceFormat; cdecl;
    function activeInputSource: AVCaptureDeviceInputSource; cdecl;
    {$IFDEF OSX64}
    function activeMaxExposureDuration: CMTime; cdecl;
    {$ENDIF}
    function activeVideoMinFrameDuration: CMTime; cdecl;
    function activeVideoMaxFrameDuration: CMTime; cdecl;
    {$IFDEF OSX64}
    function autoFocusRangeRestriction: AVCaptureAutoFocusRangeRestriction; cdecl;
    function automaticallyAdjustsVideoHDREnabled: Boolean; cdecl;
    function automaticallyEnablesLowLightBoostWhenAvailable: Boolean; cdecl;
    procedure cancelVideoZoomRamp; cdecl;
    function chromaticityValuesForDeviceWhiteBalanceGains(whiteBalanceGains: AVCaptureWhiteBalanceGains): AVCaptureWhiteBalanceChromaticityValues; cdecl;
    function deviceType: AVCaptureDeviceType; cdecl;
    function deviceWhiteBalanceGains: AVCaptureWhiteBalanceGains; cdecl;
    function deviceWhiteBalanceGainsForChromaticityValues(chromaticityValues: AVCaptureWhiteBalanceChromaticityValues): AVCaptureWhiteBalanceGains; cdecl;
    function deviceWhiteBalanceGainsForTemperatureAndTintValues(tempAndTintValues: AVCaptureWhiteBalanceTemperatureAndTintValues): AVCaptureWhiteBalanceGains; cdecl;
    function dualCameraSwitchOverVideoZoomFactor: CGFloat; cdecl;
    function exposureDuration: CMTime; cdecl;
    {$ENDIF}
    function exposureMode: AVCaptureExposureMode; cdecl;
    function exposurePointOfInterest: CGPoint; cdecl;
    {$IFDEF OSX64}
    function exposureTargetBias: Single; cdecl;
    function exposureTargetOffset: Single; cdecl;
    {$ENDIF}
    function flashMode: AVCaptureFlashMode; cdecl; // API_DEPRECATED("Use AVCapturePhotoSettings.flashMode instead.", ios(4.0, 10.0))
    function focusMode: AVCaptureFocusMode; cdecl;
    function focusPointOfInterest: CGPoint; cdecl;
    function formats: NSArray; cdecl;
    {$IFDEF OSX64}
    function grayWorldDeviceWhiteBalanceGains: AVCaptureWhiteBalanceGains; cdecl;
    {$ENDIF}
    function hasFlash: Boolean; cdecl;
    function hasMediaType(mediaType: NSString): Boolean; cdecl;
    function hasTorch: Boolean; cdecl;
    function inputSources: NSArray; cdecl;
    function isAdjustingExposure: Boolean; cdecl;
    function isAdjustingFocus: Boolean; cdecl;
    function isAdjustingWhiteBalance: Boolean; cdecl;
    {$IFDEF OSX64}
    function isAutoFocusRangeRestrictionSupported: Boolean; cdecl;
    {$ENDIF}
    function isConnected: Boolean; cdecl;
    function isExposureModeSupported(exposureMode: AVCaptureExposureMode): Boolean; cdecl;
    function isExposurePointOfInterestSupported: Boolean; cdecl;
    {$IFDEF OSX64}
    function isFlashActive: Boolean; cdecl; // API_DEPRECATED("Use AVCapturePhotoOutput's -isFlashScene instead.", ios(5.0, 10.0))
    function isFlashAvailable: Boolean; cdecl;
    {$ENDIF}
    function isFlashModeSupported(flashMode: AVCaptureFlashMode): Boolean; cdecl; // API_DEPRECATED("Use AVCapturePhotoOutput's -supportedFlashModes instead.", ios(4.0, 10.0))
    function isFocusModeSupported(focusMode: AVCaptureFocusMode): Boolean; cdecl;
    function isFocusPointOfInterestSupported: Boolean; cdecl;
    function isInUseByAnotherApplication: Boolean; cdecl;
    {$IFDEF OSX64}
    function isLockingFocusWithCustomLensPositionSupported: Boolean; cdecl;
    function isLockingWhiteBalanceWithCustomDeviceGainsSupported: Boolean; cdecl;
    function isLowLightBoostEnabled: Boolean; cdecl;
    function isLowLightBoostSupported: Boolean; cdecl;
    function ISO: Single; cdecl;
    function isRampingVideoZoom: Boolean; cdecl;
    function isSmoothAutoFocusEnabled: Boolean; cdecl;
    function isSmoothAutoFocusSupported: Boolean; cdecl;
    function isSubjectAreaChangeMonitoringEnabled: Boolean; cdecl;
    {$ENDIF}
    function isSuspended: Boolean; cdecl;
    {$IFDEF OSX64}
    function isTorchActive: Boolean; cdecl;
    function isTorchAvailable: Boolean; cdecl;
    {$ENDIF}
    function isTorchModeSupported(torchMode: AVCaptureTorchMode): Boolean; cdecl;
    {$IFDEF OSX64}
    function isVideoHDREnabled: Boolean; cdecl;
    {$ENDIF}
    function isWhiteBalanceModeSupported(whiteBalanceMode: AVCaptureWhiteBalanceMode): Boolean; cdecl;
    {$IFDEF OSX64}
    function lensAperture: Single; cdecl;
    function lensPosition: Single; cdecl;
    {$ENDIF}
    function linkedDevices: NSArray; cdecl;
    function localizedName: NSString; cdecl;
    function lockForConfiguration(outError: NSError): Boolean; cdecl;
    {$IFDEF OSX64}
    function manufacturer: NSString; cdecl;
    function maxAvailableVideoZoomFactor: CGFloat; cdecl;
    function maxExposureTargetBias: Single; cdecl;
    function maxWhiteBalanceGain: Single; cdecl;
    function minAvailableVideoZoomFactor: CGFloat; cdecl;
    function minExposureTargetBias: Single; cdecl;
    {$ENDIF}
    function modelID: NSString; cdecl;
    function position: AVCaptureDevicePosition; cdecl;
    {$IFDEF OSX64}
    [MethodName('rampToVideoZoomFactor:withRate:')]
    procedure rampToVideoZoomFactor(factor: CGFloat; rate: Single); cdecl;
    procedure setActiveColorSpace(activeColorSpace: AVCaptureColorSpace); cdecl;
    procedure setActiveDepthDataFormat(activeDepthDataFormat: AVCaptureDeviceFormat); cdecl;
    procedure setActiveDepthDataMinFrameDuration(activeDepthDataMinFrameDuration: CMTime); cdecl;
    {$ENDIF}
    procedure setActiveFormat(activeFormat: AVCaptureDeviceFormat); cdecl;
    procedure setActiveInputSource(activeInputSource: AVCaptureDeviceInputSource); cdecl;
    {$IFDEF OSX64}
    procedure setActiveMaxExposureDuration(activeMaxExposureDuration: CMTime); cdecl;
    {$ENDIF}
    procedure setActiveVideoMinFrameDuration(activeVideoMinFrameDuration: CMTime); cdecl;
    procedure setActiveVideoMaxFrameDuration(activeVideoMaxFrameDuration: CMTime); cdecl;
    {$IFDEF OSX64}
    procedure setAutoFocusRangeRestriction(autoFocusRangeRestriction: AVCaptureAutoFocusRangeRestriction); cdecl;
    procedure setAutomaticallyAdjustsVideoHDREnabled(automaticallyAdjustsVideoHDREnabled: Boolean); cdecl;
    procedure setAutomaticallyEnablesLowLightBoostWhenAvailable(automaticallyEnablesLowLightBoostWhenAvailable: Boolean); cdecl;
    {$ENDIF}
    procedure setExposureMode(exposureMode: AVCaptureExposureMode); cdecl;
    {$IFDEF OSX64}
    [MethodName('setExposureModeCustomWithDuration:ISO:completionHandler:')]
    procedure setExposureModeCustomWithDuration(duration: CMTime; ISO: Single; handler: TAVCaptureDeviceBlockMethod1); cdecl;
    {$ENDIF}
    procedure setExposurePointOfInterest(exposurePointOfInterest: CGPoint); cdecl;
    {$IFDEF OSX64}
    [MethodName('setExposureTargetBias:completionHandler:')]
    procedure setExposureTargetBias(bias: Single; handler: TAVCaptureDeviceBlockMethod1); cdecl;
    {$ENDIF}
    procedure setFlashMode(flashMode: AVCaptureFlashMode); cdecl; // API_DEPRECATED("Use AVCapturePhotoSettings.flashMode instead.", ios(4.0, 10.0))
    procedure setFocusMode(focusMode: AVCaptureFocusMode); cdecl;
    {$IFDEF OSX64}
    [MethodName('setFocusModeLockedWithLensPosition:completionHandler:')]
    procedure setFocusModeLockedWithLensPosition(lensPosition: Single; handler: TAVCaptureDeviceBlockMethod1); cdecl;
    {$ENDIF}
    procedure setFocusPointOfInterest(focusPointOfInterest: CGPoint); cdecl;
    {$IFDEF OSX64}
    procedure setSmoothAutoFocusEnabled(smoothAutoFocusEnabled: Boolean); cdecl;
    procedure setSubjectAreaChangeMonitoringEnabled(subjectAreaChangeMonitoringEnabled: Boolean); cdecl;
    {$ENDIF}
    procedure setTorchMode(torchMode: AVCaptureTorchMode); cdecl;
    {$IFDEF OSX64}
    [MethodName('setTorchModeOnWithLevel:error:')]
    function setTorchModeOnWithLevel(torchLevel: Single; outError: PNSError): Boolean; cdecl;
    [MethodName('setTransportControlsPlaybackMode:speed:')]
    {$ENDIF}
    procedure setTransportControlsPlaybackMode(mode: AVCaptureDeviceTransportControlsPlaybackMode; speed: AVCaptureDeviceTransportControlsSpeed); cdecl;
    {$IFDEF OSX64}
    procedure setVideoHDREnabled(videoHDREnabled: Boolean); cdecl;
    procedure setVideoZoomFactor(videoZoomFactor: CGFloat); cdecl;
    {$ENDIF}
    procedure setWhiteBalanceMode(whiteBalanceMode: AVCaptureWhiteBalanceMode); cdecl;
    {$IFDEF OSX64}
    [MethodName('setWhiteBalanceModeLockedWithDeviceWhiteBalanceGains:completionHandler:')]
    procedure setWhiteBalanceModeLockedWithDeviceWhiteBalanceGains(whiteBalanceGains: AVCaptureWhiteBalanceGains; handler: TAVCaptureDeviceBlockMethod1); cdecl;
    {$ENDIF}
    function supportsAVCaptureSessionPreset(preset: NSString): Boolean; cdecl;
    {$IFDEF OSX64}
    function systemPressureState: AVCaptureSystemPressureState; cdecl;
    function temperatureAndTintValuesForDeviceWhiteBalanceGains(whiteBalanceGains: AVCaptureWhiteBalanceGains): AVCaptureWhiteBalanceTemperatureAndTintValues; cdecl;
    function torchLevel: Single; cdecl;
    {$ENDIF}
    function torchMode: AVCaptureTorchMode; cdecl;
    function transportControlsPlaybackMode: AVCaptureDeviceTransportControlsPlaybackMode; cdecl;
    function transportControlsSpeed: AVCaptureDeviceTransportControlsSpeed; cdecl;
    function transportControlsSupported: Boolean; cdecl;
    function transportType: Int32; cdecl;
    function uniqueID: NSString; cdecl;
    procedure unlockForConfiguration; cdecl;
    {$IFDEF OSX64}
    function videoZoomFactor: CGFloat; cdecl;
    {$ENDIF}
    function whiteBalanceMode: AVCaptureWhiteBalanceMode; cdecl;
  end;
  TAVCaptureDevice = class(TOCGenericImport<AVCaptureDeviceClass, AVCaptureDevice>)  end;

  AVVideoCompositionClass = interface(NSObjectClass)
    ['{33942A0B-6AED-41F2-8024-A5A546E63964}']
    {$IFDEF OSX64}
    [MethodName('videoCompositionWithAsset:applyingCIFiltersWithHandler:')]
    {class} function videoCompositionWithAsset(asset: AVAsset; applier: TAVVideoCompositionBlockMethod1): AVVideoComposition; cdecl;
    {class} function videoCompositionWithPropertiesOfAsset(asset: AVAsset): AVVideoComposition; cdecl;
    {$ENDIF}
  end;
  AVVideoComposition = interface(NSObject)
    ['{6EC79EEC-9626-4AD5-B5DA-880D6189C787}']
    function animationTool: AVVideoCompositionCoreAnimationTool; cdecl;
    {$IFDEF OSX64}
    function colorPrimaries: NSString; cdecl;
    function colorTransferFunction: NSString; cdecl;
    function colorYCbCrMatrix: NSString; cdecl;
    // function customVideoCompositorClass: Class; cdecl; // https://developer.apple.com/documentation/avfoundation/avvideocomposition/1389622-customvideocompositorclass?language=objc
    {$ENDIF}
    function frameDuration: CMTime; cdecl;
    function instructions: NSArray; cdecl;
    {$IFDEF OSX64}
    [MethodName('isValidForAsset:timeRange:validationDelegate:')]
    function isValidForAsset(asset: AVAsset; timeRange: CMTimeRange; validationDelegate: Pointer): Boolean; cdecl;
    function renderScale: Single; cdecl;
    {$ENDIF}
    function renderSize: CGSize; cdecl;
    {$IFDEF OSX64}
    function sourceTrackIDForFrameTiming: CMPersistentTrackID; cdecl;
    {$ENDIF}
  end;
  TAVVideoComposition = class(TOCGenericImport<AVVideoCompositionClass, AVVideoComposition>)  end;

  AVCaptureInputClass = interface(NSObjectClass)
    ['{2097E5B8-7DBB-4163-AEF5-F5219CDE89A0}']
  end;
  AVCaptureInput = interface(NSObject)
    ['{BA89A6A6-ABF4-484E-870A-0D46DA4F0FB9}']
    function ports: NSArray; cdecl;
  end;
  TAVCaptureInput = class(TOCGenericImport<AVCaptureInputClass, AVCaptureInput>)  end;

  AVCaptureDeviceInputSourceClass = interface(NSObjectClass)
    ['{EA35B7BE-FE2E-430A-AF83-2F6C790BA60F}']
  end;
  AVCaptureDeviceInputSource = interface(NSObject)
    ['{A8F59FC0-9CD5-4918-B948-EB49B7A65C0C}']
    function inputSourceID: NSString; cdecl;
    function localizedName: NSString; cdecl;
  end;
  TAVCaptureDeviceInputSource = class(TOCGenericImport<AVCaptureDeviceInputSourceClass, AVCaptureDeviceInputSource>)  end;

  AVPlayerLayerClass = interface(CALayerClass)
    ['{090F5E38-D228-4323-9195-AB99D99938CD}']
    {class} function playerLayerWithPlayer(player: AVPlayer): Pointer; cdecl;
  end;
  AVPlayerLayer = interface(CALayer)
    ['{D26ED910-C694-465D-BD25-5CC296BBF6B4}']
    function isReadyForDisplay: Boolean; cdecl;
    {$IFDEF OSX64}
    function pixelBufferAttributes: NSDictionary; cdecl;
    {$ENDIF}
    function player: AVPlayer; cdecl;
    {$IFDEF OSX64}
    procedure setPixelBufferAttributes(pixelBufferAttributes: NSDictionary); cdecl;
    {$ENDIF}
    procedure setPlayer(player: AVPlayer); cdecl;
    procedure setVideoGravity(videoGravity: NSString); cdecl;
    function videoGravity: NSString; cdecl;
    {$IFDEF OSX64}
    function videoRect: CGRect; cdecl;
    {$ENDIF}
  end;
  TAVPlayerLayer = class(TOCGenericImport<AVPlayerLayerClass, AVPlayerLayer>)  end;

  AVPlayerItemAccessLogEventClass = interface(NSObjectClass)
    ['{93C390A9-6319-4728-A950-57B08C50DB49}']
  end;
  AVPlayerItemAccessLogEvent = interface(NSObject)
    ['{EB79F70F-E097-4F28-AE60-25EDB31E552C}']
    function URI: NSString; cdecl;
    {$IFDEF OSX64}
    function averageAudioBitrate: Double; cdecl;
    function averageVideoBitrate: Double; cdecl;
    function downloadOverdue: NSInteger; cdecl;
    {$ENDIF}
    function durationWatched: NSTimeInterval; cdecl;
    {$IFDEF OSX64}
    function indicatedAverageBitrate: Double; cdecl;
    {$ENDIF}
    function indicatedBitrate: Double; cdecl;
    {$IFDEF OSX64}
    function mediaRequestsWWAN: NSInteger; cdecl;
    {$ENDIF}
    function numberOfBytesTransferred: Int64; cdecl;
    function numberOfDroppedVideoFrames: NSInteger; cdecl;
    {$IFDEF OSX64}
    function numberOfMediaRequests: NSInteger; cdecl;
    {$ENDIF}
    function numberOfSegmentsDownloaded: NSInteger; cdecl;
    function numberOfServerAddressChanges: NSInteger; cdecl;
    function numberOfStalls: NSInteger; cdecl;
    function observedBitrate: Double; cdecl;
    {$IFDEF OSX64}
    function observedBitrateStandardDeviation: Double; cdecl;
    function observedMaxBitrate: Double; cdecl;
    function observedMinBitrate: Double; cdecl;
    {$ENDIF}
    function playbackSessionID: NSString; cdecl;
    function playbackStartDate: NSDate; cdecl;
    function playbackStartOffset: NSTimeInterval; cdecl;
    {$IFDEF OSX64}
    function playbackType: NSString; cdecl;
    {$ENDIF}
    function segmentsDownloadedDuration: NSTimeInterval; cdecl;
    function serverAddress: NSString; cdecl;
    {$IFDEF OSX64}
    function startupTime: NSTimeInterval; cdecl;
    function switchBitrate: Double; cdecl;
    function transferDuration: NSTimeInterval; cdecl;
    {$ENDIF}
  end;
  TAVPlayerItemAccessLogEvent = class(TOCGenericImport<AVPlayerItemAccessLogEventClass, AVPlayerItemAccessLogEvent>)  end;

  AVMetadataItemClass = interface(NSObjectClass)
    ['{DB034D5D-086B-4D54-9528-B7220372743C}']
    {$IFDEF OSX64}
    [MethodName('identifierForKey:keySpace:')]
    {class} function identifierForKey(key: Pointer; keySpace: AVMetadataKeySpace): AVMetadataIdentifier; cdecl;
    {class} function keyForIdentifier(identifier: AVMetadataIdentifier): Pointer; cdecl;
    {class} function keySpaceForIdentifier(identifier: AVMetadataIdentifier): AVMetadataKeySpace; cdecl;
    [MethodName('metadataItemsFromArray:withKey:keySpace:')]
    {$ENDIF}
    {class} function metadataItemsFromArray(array_: NSArray; withKey: Pointer; keySpace: NSString): NSArray; cdecl; overload;
    {$IFDEF OSX64}
    [MethodName('metadataItemsFromArray:withLocale:')]
    {$ENDIF}
    {class} function metadataItemsFromArray(array_: NSArray; withLocale: NSLocale): NSArray; cdecl; overload;
    {$IFDEF OSX64}
    [MethodName('metadataItemsFromArray:filteredAndSortedAccordingToPreferredLanguages:')]
    {class} function metadataItemsFromArray(metadataItems: NSArray; preferredLanguages: NSArray): NSArray; cdecl; overload;
    [MethodName('metadataItemsFromArray:filteredByMetadataItemFilter:')]
    {class} function metadataItemsFromArray(metadataItems: NSArray; metadataItemFilter: AVMetadataItemFilter): NSArray; cdecl; overload;
    [MethodName('metadataItemsFromArray:filteredByIdentifier:')]
    {class} function metadataItemsFromArray(metadataItems: NSArray; identifier: AVMetadataIdentifier): NSArray; cdecl; overload;
    [MethodName('metadataItemWithPropertiesOfMetadataItem:valueLoadingHandler:')]
    {class} function metadataItemWithPropertiesOfMetadataItem(metadataItem: AVMetadataItem; handler: TAVMetadataItemBlockMethod2): AVMetadataItem; cdecl;
    {$ENDIF}
  end;
  AVMetadataItem = interface(NSObject)
    ['{15ABF8E3-5360-451C-B8AE-C01F9B7F26D5}']
    function commonKey: NSString; cdecl;
    {$IFDEF OSX64}
    function dataType: NSString; cdecl;
    {$ENDIF}
    function dataValue: NSData; cdecl;
    function dateValue: NSDate; cdecl;
    function duration: CMTime; cdecl;
    {$IFDEF OSX64}
    function extendedLanguageTag: NSString; cdecl;
    {$ENDIF}
    function extraAttributes: NSDictionary; cdecl;
    {$IFDEF OSX64}
    function identifier: AVMetadataIdentifier; cdecl;
    {$ENDIF}
    function key: Pointer; cdecl;
    function keySpace: NSString; cdecl;
    {$IFDEF OSX64}
    [MethodName('loadValuesAsynchronouslyForKeys:completionHandler:')]
    procedure loadValuesAsynchronouslyForKeys(keys: NSArray; handler: TAVMetadataItemBlockMethod1); cdecl;
    {$ENDIF}
    function locale: NSLocale; cdecl;
    function numberValue: NSNumber; cdecl;
    {$IFDEF OSX64}
    function startDate: NSDate; cdecl;
    [MethodName('statusOfValueForKey:error:')]
    {$ENDIF}
    function statusOfValueForKey(key: NSString; error: NSError): AVKeyValueStatus; cdecl;
    function stringValue: NSString; cdecl;
    function time: CMTime; cdecl;
    function value: Pointer; cdecl;
  end;
  TAVMetadataItem = class(TOCGenericImport<AVMetadataItemClass, AVMetadataItem>)  end;

  AVPlayerItemAccessLogClass = interface(NSObjectClass)
    ['{A6D04F22-8262-4CF7-ADE5-D36BA8DB7661}']
  end;
  AVPlayerItemAccessLog = interface(NSObject)
    ['{93CB32D7-8C95-49B9-865E-B9FA01E48544}']
    function events: NSArray; cdecl;
    function extendedLogData: NSData; cdecl;
    function extendedLogDataStringEncoding: NSStringEncoding; cdecl;
  end;
  TAVPlayerItemAccessLog = class(TOCGenericImport<AVPlayerItemAccessLogClass, AVPlayerItemAccessLog>)  end;

  AVPlayerClass = interface(NSObjectClass)
    ['{691E8D75-B4C8-4415-BE94-013EC8394DC6}']
    {$IFDEF OSX64}
    {class} function availableHDRModes: AVPlayerHDRMode; cdecl;
    {$ENDIF}
    {class} function playerWithPlayerItem(item: AVPlayerItem): Pointer; cdecl;
    {class} function playerWithURL(URL: NSURL): Pointer; cdecl;
  end;
  AVPlayer = interface(NSObject)
    ['{941C8324-C5AD-431E-876C-7ED574C33825}']
    function actionAtItemEnd: AVPlayerActionAtItemEnd; cdecl;
    {$IFDEF OSX64}
    [MethodName('addBoundaryTimeObserverForTimes:queue:usingBlock:')]
    function addBoundaryTimeObserverForTimes(times: NSArray; queue: dispatch_queue_t; block: TAVPlayerBlockMethod3): Pointer; cdecl;
    [MethodName('addPeriodicTimeObserverForInterval:queue:usingBlock:')]
    function addPeriodicTimeObserverForInterval(interval: CMTime; queue: dispatch_queue_t; block: TAVPlayerBlockMethod2): Pointer; cdecl;
    function allowsExternalPlayback: Boolean; cdecl;
    function appliesMediaSelectionCriteriaAutomatically: Boolean; cdecl;
    function audioOutputDeviceUniqueID: NSString; cdecl;
    function automaticallyWaitsToMinimizeStalling: Boolean; cdecl;
    procedure cancelPendingPrerolls; cdecl;
    {$ENDIF}
    function currentItem: AVPlayerItem; cdecl;
    function currentTime: CMTime; cdecl;
    function error: NSError; cdecl;
    {$IFDEF OSX64}
    function externalPlaybackVideoGravity: AVLayerVideoGravity; cdecl;
    {$ENDIF}
    function initWithPlayerItem(item: AVPlayerItem): Pointer; cdecl;
    function initWithURL(URL: NSURL): Pointer; cdecl;
    function isClosedCaptionDisplayEnabled: Boolean; cdecl;
    {$IFDEF OSX64}
    function isExternalPlaybackActive: Boolean; cdecl;
    {$ENDIF}
    function isMuted: Boolean; cdecl;
    {$IFDEF OSX64}
    function masterClock: CMClockRef; cdecl;
    function mediaSelectionCriteriaForMediaCharacteristic(mediaCharacteristic: AVMediaCharacteristic): AVPlayerMediaSelectionCriteria; cdecl;
    function outputObscuredDueToInsufficientExternalProtection: Boolean; cdecl;
    {$ENDIF}
    procedure pause; cdecl;
    procedure play; cdecl;
    {$IFDEF OSX64}
    procedure playImmediatelyAtRate(rate: Single); cdecl;
    function preferredVideoDecoderGPURegistryID: UInt64; cdecl;
    [MethodName('prerollAtRate:completionHandler:')]
    procedure prerollAtRate(rate: Single; completionHandler: TAVPlayerBlockMethod1); cdecl;
    function preventsDisplaySleepDuringVideoPlayback: Boolean; cdecl;
    {$ENDIF}
    function rate: Single; cdecl;
    {$IFDEF OSX64}
    function reasonForWaitingToPlay: AVPlayerWaitingReason; cdecl;
    {$ENDIF}
    procedure removeTimeObserver(observer: Pointer); cdecl;
    procedure replaceCurrentItemWithPlayerItem(item: AVPlayerItem); cdecl;
    {$IFDEF OSX64}
    procedure seekToDate(date: NSDate); overload; cdecl;
    [MethodName('seekToDate:completionHandler:')]
    procedure seekToDate(date: NSDate; completionHandler: TAVPlayerBlockMethod1); overload; cdecl;
    {$ENDIF}
    procedure seekToTime(time: CMTime); overload; cdecl;
    {$IFDEF OSX64}
    [MethodName('seekToTime:toleranceBefore:toleranceAfter:completionHandler:')]
    procedure seekToTime(time: CMTime; toleranceBefore: CMTime; toleranceAfter: CMTime; completionHandler: TAVPlayerBlockMethod1); overload; cdecl;
    [MethodName('seekToTime:completionHandler:')]
    procedure seekToTime(time: CMTime; completionHandler: TAVPlayerBlockMethod1); overload; cdecl;
    [MethodName('seekToTime:toleranceBefore:toleranceAfter:')]
    {$ENDIF}
    procedure seekToTime(time: CMTime; toleranceBefore: CMTime; toleranceAfter: CMTime); overload; cdecl;
    procedure setActionAtItemEnd(actionAtItemEnd: AVPlayerActionAtItemEnd); cdecl;
    {$IFDEF OSX64}
    procedure setAllowsExternalPlayback(allowsExternalPlayback: Boolean); cdecl;
    procedure setAppliesMediaSelectionCriteriaAutomatically(appliesMediaSelectionCriteriaAutomatically: Boolean); cdecl;
    procedure setAudioOutputDeviceUniqueID(audioOutputDeviceUniqueID: NSString); cdecl;
    procedure setAutomaticallyWaitsToMinimizeStalling(automaticallyWaitsToMinimizeStalling: Boolean); cdecl;
    {$ENDIF}
    procedure setClosedCaptionDisplayEnabled(closedCaptionDisplayEnabled: Boolean); cdecl;
    {$IFDEF OSX64}
    procedure setExternalPlaybackVideoGravity(externalPlaybackVideoGravity: AVLayerVideoGravity); cdecl;
    procedure setMasterClock(masterClock: CMClockRef); cdecl;
    [MethodName('setMediaSelectionCriteria:forMediaCharacteristic:')]
    procedure setMediaSelectionCriteria(criteria: AVPlayerMediaSelectionCriteria; mediaCharacteristic: AVMediaCharacteristic); cdecl;
    {$ENDIF}
    procedure setMuted(muted: Boolean); cdecl;
    {$IFDEF OSX64}
    procedure setPreferredVideoDecoderGPURegistryID(preferredVideoDecoderGPURegistryID: UInt64); cdecl;
    procedure setPreventsDisplaySleepDuringVideoPlayback(preventsDisplaySleepDuringVideoPlayback: Boolean); cdecl;
    {$ENDIF}
    procedure setRate(rate: Single); {$IFDEF OSX64}overload;{$ENDIF} cdecl;
    {$IFDEF OSX64}
    [MethodName('setRate:time:atHostTime:')]
    procedure setRate(rate: Single; itemTime: CMTime; hostClockTime: CMTime); overload; cdecl;
    procedure setUsesExternalPlaybackWhileExternalScreenIsActive(usesExternalPlaybackWhileExternalScreenIsActive: Boolean); cdecl;
    {$ENDIF}
    procedure setVolume(volume: Single); cdecl;
    function status: AVPlayerStatus; cdecl;
    {$IFDEF OSX64}
    function timeControlStatus: AVPlayerTimeControlStatus; cdecl;
    function usesExternalPlaybackWhileExternalScreenIsActive: Boolean; cdecl;
    {$ENDIF}
    function volume: Single; cdecl;
  end;
  TAVPlayer = class(TOCGenericImport<AVPlayerClass, AVPlayer>)  end;

  AVPlayerItemClass = interface(NSObjectClass)
    ['{6B78CF7E-535B-460D-88FB-65A17F8B9579}']
    {class} function playerItemWithAsset(asset: AVAsset): Pointer; {$IFDEF OSX64}overload;{$ENDIF} cdecl;
    {$IFDEF OSX64}
    [MethodName('playerItemWithAsset:automaticallyLoadedAssetKeys:')]
    {class} function playerItemWithAsset(asset: AVAsset; automaticallyLoadedAssetKeys: NSArray): Pointer; overload; cdecl;
    {$ENDIF}
    {class} function playerItemWithURL(URL: NSURL): Pointer; cdecl;
  end;
  AVPlayerItem = interface(NSObject)
    ['{A27D597B-D7FD-4CED-BFC7-24F47B60AF9B}']
    function accessLog: AVPlayerItemAccessLog; cdecl;
	{$IFDEF OSX64}
    procedure addMediaDataCollector(collector: AVPlayerItemMediaDataCollector); cdecl;
    procedure addOutput(output: AVPlayerItemOutput); cdecl;
    {$ENDIF}
    function asset: AVAsset; cdecl;
    function audioMix: AVAudioMix; cdecl;
	{$IFDEF OSX64}
    function audioTimePitchAlgorithm: AVAudioTimePitchAlgorithm; cdecl;
    function automaticallyLoadedAssetKeys: NSArray; cdecl;
    {$ENDIF}
    procedure cancelContentAuthorizationRequest; cdecl;
    procedure cancelPendingSeeks; cdecl;
	{$IFDEF OSX64}
    function canPlayFastForward: Boolean; cdecl;
    function canPlayFastReverse: Boolean; cdecl;
    function canPlayReverse: Boolean; cdecl;
    function canPlaySlowForward: Boolean; cdecl;
    function canPlaySlowReverse: Boolean; cdecl;
    function canStepBackward: Boolean; cdecl;
    function canStepForward: Boolean; cdecl;
    function canUseNetworkResourcesForLiveStreamingWhilePaused: Boolean; cdecl;
    {$ENDIF}
    function contentAuthorizationRequestStatus: AVContentAuthorizationStatus; cdecl;
    function currentDate: NSDate; cdecl;
    {$IFDEF OSX64}
    function currentMediaSelection: AVMediaSelection; cdecl;
    {$ENDIF}
    function currentTime: CMTime; cdecl;
    {$IFDEF OSX64}
    function customVideoCompositor: Pointer; cdecl;
    {$ENDIF}
    function duration: CMTime; cdecl;
    function error: NSError; cdecl;
    function errorLog: AVPlayerItemErrorLog; cdecl;
    function forwardPlaybackEndTime: CMTime; cdecl;
    function initWithAsset(asset: AVAsset): Pointer; {$IFDEF OSX64}overload;{$ENDIF} cdecl;
    {$IFDEF OSX64}
    [MethodName('initWithAsset:automaticallyLoadedAssetKeys:')]
    function initWithAsset(asset: AVAsset; automaticallyLoadedAssetKeys: NSArray): Pointer; overload; cdecl;
    {$ENDIF}
    function initWithURL(URL: NSURL): Pointer; cdecl;
    function isApplicationAuthorizedForPlayback: Boolean; cdecl;
    function isAuthorizationRequiredForPlayback: Boolean; cdecl;
    function isContentAuthorizedForPlayback: Boolean; cdecl;
    function isPlaybackBufferEmpty: Boolean; cdecl;
    function isPlaybackBufferFull: Boolean; cdecl;
    function isPlaybackLikelyToKeepUp: Boolean; cdecl;
    function loadedTimeRanges: NSArray; cdecl;
    {$IFDEF OSX64}
    function mediaDataCollectors: NSArray; cdecl;
    function outputs: NSArray; cdecl;
    function preferredForwardBufferDuration: NSTimeInterval; cdecl;
    function preferredMaximumResolution: CGSize; cdecl;
    function preferredPeakBitRate: Double; cdecl;
    {$ENDIF}
    function presentationSize: CGSize; cdecl;
    {$IFDEF OSX64}
    procedure removeMediaDataCollector(collector: AVPlayerItemMediaDataCollector); cdecl;
    procedure removeOutput(output: AVPlayerItemOutput); cdecl;
    [MethodName('requestContentAuthorizationAsynchronouslyWithTimeoutInterval:completionHandler:')]
    procedure requestContentAuthorizationAsynchronouslyWithTimeoutInterval(timeoutInterval: NSTimeInterval; handler: TAVPlayerItemBlockMethod2); cdecl;
    {$ENDIF}
    function reversePlaybackEndTime: CMTime; cdecl;
    {$IFDEF OSX64}
    function seekingWaitsForVideoCompositionRendering: Boolean; cdecl;
    [MethodName('seekToDate:completionHandler:')]
    function seekToDate(date: NSDate; completionHandler: TAVPlayerItemBlockMethod1): Boolean; overload; cdecl;
    {$ENDIF}
    function seekToDate(date: NSDate): Boolean; {$IFDEF OSX64}overload;{$ENDIF} cdecl;
    {$IFDEF OSX64}
    [MethodName('seekToTime:completionHandler:')]
    procedure seekToTime(time: CMTime; completionHandler: TAVPlayerItemBlockMethod1); overload; cdecl;
    {$ENDIF}
    procedure seekToTime(time: CMTime); cdecl; overload;
    {$IFDEF OSX64}
    [MethodName('seekToTime:toleranceBefore:toleranceAfter:')]
    {$ENDIF}
    procedure seekToTime(time: CMTime; toleranceBefore: CMTime; toleranceAfter: CMTime); cdecl; overload;
    function seekableTimeRanges: NSArray; cdecl;
    {$IFDEF OSX64}
    function selectedMediaOptionInMediaSelectionGroup(mediaSelectionGroup: AVMediaSelectionGroup): AVMediaSelectionOption; cdecl;
    [MethodName('selectMediaOption:inMediaSelectionGroup:')]
    procedure selectMediaOption(mediaSelectionOption: AVMediaSelectionOption; mediaSelectionGroup: AVMediaSelectionGroup); cdecl;
    procedure selectMediaOptionAutomaticallyInMediaSelectionGroup(mediaSelectionGroup: AVMediaSelectionGroup); cdecl;
    {$ENDIF}
    procedure setAudioMix(audioMix: AVAudioMix); cdecl;
    {$IFDEF OSX64}
    procedure setAudioTimePitchAlgorithm(audioTimePitchAlgorithm: AVAudioTimePitchAlgorithm); cdecl;
    procedure setCanUseNetworkResourcesForLiveStreamingWhilePaused(canUseNetworkResourcesForLiveStreamingWhilePaused: Boolean); cdecl;
    {$ENDIF}
    procedure setForwardPlaybackEndTime(forwardPlaybackEndTime: CMTime); cdecl;
    {$IFDEF OSX64}
    procedure setPreferredForwardBufferDuration(preferredForwardBufferDuration: NSTimeInterval); cdecl;
    procedure setPreferredMaximumResolution(preferredMaximumResolution: CGSize); cdecl;
    procedure setPreferredPeakBitRate(preferredPeakBitRate: Double); cdecl;
    {$ENDIF}
    procedure setReversePlaybackEndTime(reversePlaybackEndTime: CMTime); cdecl;
    {$IFDEF OSX64}
    procedure setSeekingWaitsForVideoCompositionRendering(seekingWaitsForVideoCompositionRendering: Boolean); cdecl;
    procedure setTextStyleRules(textStyleRules: NSArray); cdecl;
    procedure setVideoApertureMode(videoApertureMode: AVVideoApertureMode); cdecl;
    {$ENDIF}
    procedure setVideoComposition(videoComposition: AVVideoComposition); cdecl;
    function status: AVPlayerItemStatus; cdecl;
    procedure stepByCount(stepCount: NSInteger); cdecl;
    {$IFDEF OSX64}
    function textStyleRules: NSArray; cdecl;
    function timebase: CMTimebaseRef; cdecl;
    {$ENDIF}
    function timedMetadata: NSArray; cdecl;
    function tracks: NSArray; cdecl;
    {$IFDEF OSX64}
    function videoApertureMode: AVVideoApertureMode; cdecl;
    {$ENDIF}
    function videoComposition: AVVideoComposition; cdecl;
  end;
  TAVPlayerItem = class(TOCGenericImport<AVPlayerItemClass, AVPlayerItem>)  end;

  AVPlayerItemTrackClass = interface(NSObjectClass)
    ['{8DAE6A2C-737F-4996-826A-169BE01CF594}']
  end;
  AVPlayerItemTrack = interface(NSObject)
    ['{680F9FD4-5166-4BEC-8F34-D9D08F417E79}']
    function assetTrack: AVAssetTrack; cdecl;
    {$IFDEF OSX64}
    function currentVideoFrameRate: Single; cdecl;
    {$ENDIF}
    function isEnabled: Boolean; cdecl;
    procedure setEnabled(enabled: Boolean); cdecl;
    {$IFDEF OSX64}
    procedure setVideoFieldMode(videoFieldMode: NSString); cdecl;
    function videoFieldMode: NSString; cdecl;
    {$ENDIF}
  end;
  TAVPlayerItemTrack = class(TOCGenericImport<AVPlayerItemTrackClass, AVPlayerItemTrack>)  end;

  AVCaptureVideoPreviewLayerClass = interface(CALayerClass)
    ['{920CF542-3D33-49F5-A88C-3E07318DEA0D}']
    {class} function layerWithSession(session: AVCaptureSession): Pointer; cdecl;
    {class} function layerWithSessionWithNoConnection(session: AVCaptureSession): Pointer; cdecl;
  end;
  AVCaptureVideoPreviewLayer = interface(CALayer)
    ['{E1EBB076-3D7C-47CA-ACC5-A669E2EBA6EB}']
    {$IFDEF OSX64}
    function automaticallyAdjustsMirroring: Boolean; cdecl; // API_DEPRECATED("Use AVCaptureConnection's automaticallyAdjustsVideoMirroring instead.", ios(4.0, 6.0))
    function captureDevicePointOfInterestForPoint(pointInLayer: CGPoint): CGPoint; cdecl;
    {$ENDIF}
    function connection: AVCaptureConnection; cdecl;
    function initWithSession(session: AVCaptureSession): Pointer; cdecl;
    function initWithSessionWithNoConnection(session: AVCaptureSession): Pointer; cdecl;
    {$IFDEF OSX64}
    function isMirrored: Boolean; cdecl; // API_DEPRECATED("Use AVCaptureConnection's videoMirrored instead.", ios(4.0, 6.0))
    function isMirroringSupported: Boolean; cdecl; // API_DEPRECATED("Use AVCaptureConnection's isVideoMirroringSupported instead.", ios(4.0, 6.0))
    function isOrientationSupported: Boolean; cdecl; // API_DEPRECATED("Use AVCaptureConnection's isVideoOrientationSupported instead.", ios(4.0, 6.0))
    function metadataOutputRectOfInterestForRect(rectInLayerCoordinates: CGRect): CGRect; cdecl;
    function orientation: AVCaptureVideoOrientation; cdecl; // API_DEPRECATED("Use AVCaptureConnection's videoOrientation instead.", ios(4.0, 6.0))
    function pointForCaptureDevicePointOfInterest(captureDevicePointOfInterest: CGPoint): CGPoint; cdecl;
    function rectForMetadataOutputRectOfInterest(rectInMetadataOutputCoordinates: CGRect): CGRect; cdecl;
    {$ENDIF}
    function session: AVCaptureSession; cdecl;
    {$IFDEF OSX64}
    procedure setAutomaticallyAdjustsMirroring(automaticallyAdjustsMirroring: Boolean); cdecl; // API_DEPRECATED("Use AVCaptureConnection's automaticallyAdjustsVideoMirroring instead.", ios(4.0, 6.0))
    procedure setMirrored(mirrored: Boolean); cdecl; // API_DEPRECATED("Use AVCaptureConnection's videoMirrored instead.", ios(4.0, 6.0))
    procedure setOrientation(orientation: AVCaptureVideoOrientation); cdecl; // API_DEPRECATED("Use AVCaptureConnection's videoOrientation instead.", ios(4.0, 6.0))
    {$ENDIF}
    procedure setSession(session: AVCaptureSession); cdecl;
    procedure setSessionWithNoConnection(session: AVCaptureSession); cdecl;
    procedure setVideoGravity(videoGravity: NSString); cdecl;
    {$IFDEF OSX64}
    function transformedMetadataObjectForMetadataObject(metadataObject: AVMetadataObject): AVMetadataObject; cdecl;
    {$ENDIF}
    function videoGravity: NSString; cdecl;
  end;
  TAVCaptureVideoPreviewLayer = class(TOCGenericImport<AVCaptureVideoPreviewLayerClass, AVCaptureVideoPreviewLayer>)  end;

  AVPlayerItemErrorLogEventClass = interface(NSObjectClass)
    ['{7D27B720-04E7-4CDD-8473-4D7EC2A1CBA8}']
  end;
  AVPlayerItemErrorLogEvent = interface(NSObject)
    ['{5AC660A5-A04F-4EBB-97C2-4DD38AE3F386}']
    function URI: NSString; cdecl;
    function date: NSDate; cdecl;
    function errorComment: NSString; cdecl;
    function errorDomain: NSString; cdecl;
    function errorStatusCode: NSInteger; cdecl;
    function playbackSessionID: NSString; cdecl;
    function serverAddress: NSString; cdecl;
  end;
  TAVPlayerItemErrorLogEvent = class(TOCGenericImport<AVPlayerItemErrorLogEventClass, AVPlayerItemErrorLogEvent>)  end;

  AVFrameRateRangeClass = interface(NSObjectClass)
    ['{51C96BF2-51EC-4E25-A4CE-806D18607A5D}']
  end;
  AVFrameRateRange = interface(NSObject)
    ['{700FEF02-5332-4B8B-B608-23147D5A56CC}']
    function maxFrameDuration: CMTime; cdecl;
    function maxFrameRate: Float64; cdecl;
    function minFrameDuration: CMTime; cdecl;
    function minFrameRate: Float64; cdecl;
  end;
  TAVFrameRateRange = class(TOCGenericImport<AVFrameRateRangeClass, AVFrameRateRange>)  end;

  AVPlayerItemErrorLogClass = interface(NSObjectClass)
    ['{5C676276-2109-4D16-8672-60245A9CE9CD}']
  end;
  AVPlayerItemErrorLog = interface(NSObject)
    ['{CA870439-085F-4AE5-94E6-4E2F7E6FE4B3}']
    function events: NSArray; cdecl;
    function extendedLogData: NSData; cdecl;
    function extendedLogDataStringEncoding: NSStringEncoding; cdecl;
  end;
  TAVPlayerItemErrorLog = class(TOCGenericImport<AVPlayerItemErrorLogClass, AVPlayerItemErrorLog>)  end;

  AVCaptureConnectionClass = interface(NSObjectClass)
    ['{17021D41-6B6B-4F11-B121-39D5FEBB4579}']
    {class} function connectionWithInputPort(port: AVCaptureInputPort; videoPreviewLayer: AVCaptureVideoPreviewLayer): Pointer; cdecl;
    {class} function connectionWithInputPorts(ports: NSArray; output: AVCaptureOutput): Pointer; cdecl;
  end;
  AVCaptureConnection = interface(NSObject)
    ['{4F4BC321-39B0-4881-9F5F-DA4C720B6E1D}']
    {$IFDEF OSX64}
    function activeVideoStabilizationMode: AVCaptureVideoStabilizationMode; cdecl;
    {$ENDIF}
    function audioChannels: NSArray; cdecl;
    function automaticallyAdjustsVideoMirroring: Boolean; cdecl;
    {$IFDEF OSX64}
    function enablesVideoStabilizationWhenAvailable: Boolean; cdecl; // API_DEPRECATED("Use preferredVideoStabilizationMode instead.", ios(6.0, 8.0))
    [MethodName('initWithInputPort:videoPreviewLayer:')]
    {$ENDIF}
    function initWithInputPort(port: AVCaptureInputPort; videoPreviewLayer: AVCaptureVideoPreviewLayer): Pointer; cdecl;
    {$IFDEF OSX64}
    [MethodName('initWithInputPorts:output:')]
    {$ENDIF}
    function initWithInputPorts(ports: NSArray; output: AVCaptureOutput): Pointer; cdecl;
    function inputPorts: NSArray; cdecl;
    function isActive: Boolean; cdecl;
    {$IFDEF OSX64}
    function isCameraIntrinsicMatrixDeliveryEnabled: Boolean; cdecl;
    function isCameraIntrinsicMatrixDeliverySupported: Boolean; cdecl;
    {$ENDIF}
    function isEnabled: Boolean; cdecl;
    function isVideoFieldModeSupported: Boolean; cdecl;
    {$IFDEF OSX64}
    function isVideoMaxFrameDurationSupported: Boolean; cdecl; // API_DEPRECATED("Use AVCaptureDevice's activeFormat.videoSupportedFrameRateRanges instead.", ios(5.0, 7.0))
    {$ENDIF}
    function isVideoMinFrameDurationSupported: Boolean; cdecl; // API_DEPRECATED("Use AVCaptureDevice's activeFormat.videoSupportedFrameRateRanges instead.", ios(5.0, 7.0))
    function isVideoMirrored: Boolean; cdecl;
    function isVideoMirroringSupported: Boolean; cdecl;
    function isVideoOrientationSupported: Boolean; cdecl;
    {$IFDEF OSX64}
    function isVideoStabilizationEnabled: Boolean; cdecl; // API_DEPRECATED("Use activeVideoStabilizationMode instead.", ios(6.0, 8.0))
    function isVideoStabilizationSupported: Boolean; cdecl;
    {$ENDIF}
    function output: AVCaptureOutput; cdecl;
    {$IFDEF OSX64}
    function preferredVideoStabilizationMode: AVCaptureVideoStabilizationMode; cdecl;
    {$ENDIF}
    procedure setAutomaticallyAdjustsVideoMirroring(automaticallyAdjustsVideoMirroring: Boolean); cdecl;
    {$IFDEF OSX64}
    procedure setCameraIntrinsicMatrixDeliveryEnabled(cameraIntrinsicMatrixDeliveryEnabled: Boolean); cdecl;
    {$ENDIF}
    procedure setEnabled(enabled: Boolean); cdecl;
    {$IFDEF OSX64}
    procedure setEnablesVideoStabilizationWhenAvailable(enablesVideoStabilizationWhenAvailable: Boolean); cdecl; // API_DEPRECATED("Use preferredVideoStabilizationMode instead.", ios(6.0, 8.0))
    procedure setPreferredVideoStabilizationMode(preferredVideoStabilizationMode: AVCaptureVideoStabilizationMode); cdecl;
    {$ENDIF}
    procedure setVideoFieldMode(videoFieldMode: AVVideoFieldMode); cdecl;
    {$IFDEF OSX64}
    procedure setVideoMaxFrameDuration(videoMaxFrameDuration: CMTime); cdecl; // API_DEPRECATED("Use AVCaptureDevice's activeVideoMaxFrameDuration instead.", ios(5.0, 7.0))
    {$ENDIF}
    procedure setVideoMinFrameDuration(videoMinFrameDuration: CMTime); cdecl; // API_DEPRECATED("Use AVCaptureDevice's activeVideoMinFrameDuration instead.", ios(5.0, 7.0))
    procedure setVideoMirrored(videoMirrored: Boolean); cdecl;
    procedure setVideoOrientation(videoOrientation: AVCaptureVideoOrientation); cdecl;
    {$IFDEF OSX64}
    procedure setVideoScaleAndCropFactor(videoScaleAndCropFactor: CGFloat); cdecl;
    {$ENDIF}
    function videoFieldMode: AVVideoFieldMode; cdecl;
    {$IFDEF OSX64}
    function videoMaxFrameDuration: CMTime; cdecl; // API_DEPRECATED("Use AVCaptureDevice's activeVideoMaxFrameDuration instead.", ios(5.0, 7.0))
    function videoMaxScaleAndCropFactor: CGFloat; cdecl;
    {$ENDIF}
    function videoMinFrameDuration: CMTime; cdecl; // API_DEPRECATED("Use AVCaptureDevice's activeVideoMinFrameDuration instead.", ios(5.0, 7.0))
    function videoOrientation: AVCaptureVideoOrientation; cdecl;
    function videoPreviewLayer: AVCaptureVideoPreviewLayer; cdecl;
    {$IFDEF OSX64}
    function videoScaleAndCropFactor: CGFloat; cdecl;
    {$ENDIF}
  end;
  TAVCaptureConnection = class(TOCGenericImport<AVCaptureConnectionClass, AVCaptureConnection>)  end;

  AVAssetTrackClass = interface(NSObjectClass)
    ['{302158FA-96C5-4A4B-AC00-5AE58022F714}']
  end;
  AVAssetTrack = interface(NSObject)
    ['{5782B4EC-0DCC-476E-9951-FEB48DB8E28F}']
    function asset: AVAsset; cdecl;
    {$IFDEF OSX64}
    function associatedTracksOfType(trackAssociationType: AVTrackAssociationType): NSArray; cdecl;
    {$ENDIF}
    function availableMetadataFormats: NSArray; cdecl;
    {$IFDEF OSX64}
    function availableTrackAssociationTypes: NSArray; cdecl;
    function canProvideSampleCursors: Boolean; cdecl;
    {$ENDIF}
    function commonMetadata: NSArray; cdecl;
    function estimatedDataRate: Single; cdecl;
    function extendedLanguageTag: NSString; cdecl;
    function formatDescriptions: NSArray; cdecl;
    function hasMediaCharacteristic(mediaCharacteristic: NSString): Boolean; cdecl;
    {$IFDEF OSX64}
    function isDecodable: Boolean; cdecl;
    {$ENDIF}
    function isEnabled: Boolean; cdecl;
    {$IFDEF OSX64}
    function isPlayable: Boolean; cdecl;
    {$ENDIF}
    function isSelfContained: Boolean; cdecl;
    function languageCode: NSString; cdecl;
    {$IFDEF OSX64}
    function makeSampleCursorAtFirstSampleInDecodeOrder: AVSampleCursor; cdecl;
    function makeSampleCursorAtLastSampleInDecodeOrder: AVSampleCursor; cdecl;
    function makeSampleCursorWithPresentationTimeStamp(presentationTimeStamp: CMTime): AVSampleCursor; cdecl;
    {$ENDIF}
    function mediaType: NSString; cdecl;
    {$IFDEF OSX64}
    function metadata: NSArray; cdecl;
    {$ENDIF}
    function metadataForFormat(format: NSString): NSArray; cdecl;
    {$IFDEF OSX64}
    function minFrameDuration: CMTime; cdecl;
    {$ENDIF}
    function naturalSize: CGSize; cdecl;
    function naturalTimeScale: CMTimeScale; cdecl;
    function nominalFrameRate: Single; cdecl;
    function preferredTransform: CGAffineTransform; cdecl;
    function preferredVolume: Single; cdecl;
    {$IFDEF OSX64}
    function requiresFrameReordering: Boolean; cdecl;
    {$ENDIF}
    function samplePresentationTimeForTrackTime(trackTime: CMTime): CMTime; cdecl;
    function segmentForTrackTime(trackTime: CMTime): AVAssetTrackSegment; cdecl;
    function segments: NSArray; cdecl;
    function timeRange: CMTimeRange; cdecl;
    function totalSampleDataLength: Int64; cdecl;
    function trackID: CMPersistentTrackID; cdecl;
  end;
  TAVAssetTrack = class(TOCGenericImport<AVAssetTrackClass, AVAssetTrack>)  end;

  AVAssetWriterClass = interface(NSObjectClass)
    ['{445CA4E3-DBF8-43C1-A24D-2A0F3B280395}']
    {class} function assetWriterWithURL(outputURL: NSURL; fileType: NSString; error: NSError): Pointer; cdecl;
  end;
  AVAssetWriter = interface(NSObject)
    ['{60566C37-0D16-47E3-A551-0AA54B47AFC2}']
    procedure addInput(input: AVAssetWriterInput); cdecl;
    {$IFDEF OSX64}
    procedure addInputGroup(inputGroup: AVAssetWriterInputGroup); cdecl;
    {$ENDIF}
    function availableMediaTypes: NSArray; cdecl;
    function canAddInput(input: AVAssetWriterInput): Boolean; cdecl;
    {$IFDEF OSX64}
    function canAddInputGroup(inputGroup: AVAssetWriterInputGroup): Boolean; cdecl;
    [MethodName('canApplyOutputSettings:forMediaType:')]
    {$ENDIF}
    function canApplyOutputSettings(outputSettings: NSDictionary; forMediaType: NSString): Boolean; cdecl;
    procedure cancelWriting; cdecl;
    {$IFDEF OSX64}
    function directoryForTemporaryFiles: NSURL; cdecl;
    {$ENDIF}
    procedure endSessionAtSourceTime(endTime: CMTime); cdecl;
    function error: NSError; cdecl;
    function finishWriting: Boolean; cdecl;
    {$IFDEF OSX64}
    procedure finishWritingWithCompletionHandler(handler: TAVAssetWriterBlockMethod1); cdecl;
    [MethodName('initWithURL:fileType:error:')]
    {$ENDIF}
    function initWithURL(outputURL: NSURL; fileType: NSString; error: NSError): Pointer; cdecl;
    {$IFDEF OSX64}
    function inputGroups: NSArray; cdecl;
    {$ENDIF}
    function inputs: NSArray; cdecl;
    function metadata: NSArray; cdecl;
    function movieFragmentInterval: CMTime; cdecl;
    function movieTimeScale: CMTimeScale; cdecl;
    function outputFileType: NSString; cdecl;
    function outputURL: NSURL; cdecl;
    {$IFDEF OSX64}
    function overallDurationHint: CMTime; cdecl;
    procedure setDirectoryForTemporaryFiles(directoryForTemporaryFiles: NSURL); cdecl;
    {$ENDIF}
    procedure setMetadata(metadata: NSArray); cdecl;
    procedure setMovieFragmentInterval(movieFragmentInterval: CMTime); cdecl;
    procedure setMovieTimeScale(movieTimeScale: CMTimeScale); cdecl;
    {$IFDEF OSX64}
    procedure setOverallDurationHint(overallDurationHint: CMTime); cdecl;
    {$ENDIF}
    procedure setShouldOptimizeForNetworkUse(shouldOptimizeForNetworkUse: Boolean); cdecl;
    function shouldOptimizeForNetworkUse: Boolean; cdecl;
    procedure startSessionAtSourceTime(startTime: CMTime); cdecl;
    function startWriting: Boolean; cdecl;
    function status: AVAssetWriterStatus; cdecl;
  end;
  TAVAssetWriter = class(TOCGenericImport<AVAssetWriterClass, AVAssetWriter>)  end;

  AVAssetTrackSegmentClass = interface(NSObjectClass)
    ['{75045BE9-5228-4913-B7EC-D1E05645CF0C}']
  end;
  AVAssetTrackSegment = interface(NSObject)
    ['{7D240EE9-332E-41F0-88CA-EBF0B720F078}']
    function isEmpty: Boolean; cdecl;
    function timeMapping: CMTimeMapping; cdecl;
  end;
  TAVAssetTrackSegment = class(TOCGenericImport<AVAssetTrackSegmentClass, AVAssetTrackSegment>)  end;

  AVAssetReaderOutputClass = interface(NSObjectClass)
    ['{FA9839EB-2C0D-464C-9D25-8190EE199750}']
  end;
  AVAssetReaderOutput = interface(NSObject)
    ['{2FDBB250-2466-49E0-BA5E-5C19EA25FC62}']
    {$IFDEF OSX64}
    function alwaysCopiesSampleData: Boolean; cdecl;
    {$ENDIF}
    function copyNextSampleBuffer: CMSampleBufferRef; cdecl;
    {$IFDEF OSX64}
    procedure markConfigurationAsFinal; cdecl;
    {$ENDIF}
    function mediaType: NSString; cdecl;
    {$IFDEF OSX64}
    procedure resetForReadingTimeRanges(timeRanges: NSArray); cdecl;
    procedure setAlwaysCopiesSampleData(alwaysCopiesSampleData: Boolean); cdecl;
    procedure setSupportsRandomAccess(supportsRandomAccess: Boolean); cdecl;
    function supportsRandomAccess: Boolean; cdecl;
    {$ENDIF}
  end;
  TAVAssetReaderOutput = class(TOCGenericImport<AVAssetReaderOutputClass, AVAssetReaderOutput>)  end;

  AVAssetExportSessionClass = interface(NSObjectClass)
    ['{4C471FD3-49A2-4F27-9D9C-9BA3E6A1ED87}']
    {class} function allExportPresets: NSArray; cdecl;
    {$IFDEF OSX64}
    [MethodName('determineCompatibilityOfExportPreset:withAsset:outputFileType:completionHandler:')]
    {class} procedure determineCompatibilityOfExportPreset(presetName: NSString; asset: AVAsset; outputFileType: AVFileType; handler: TAVAssetExportSessionBlockMethod2); cdecl;
    {$ENDIF}
    {class} function exportPresetsCompatibleWithAsset(asset: AVAsset): NSArray; cdecl;
    {$IFDEF OSX64}
    [MethodName('exportSessionWithAsset:presetName:')]
    {$ENDIF}
    {class} function exportSessionWithAsset(asset: AVAsset; presetName: NSString): Pointer; cdecl;
  end;
  AVAssetExportSession = interface(NSObject)
    ['{515970BB-7FFA-4B3D-A923-8C5F72AB5B2B}']
    {$IFDEF OSX64}
    function asset: AVAsset; cdecl;
    {$ENDIF}
    function audioMix: AVAudioMix; cdecl;
    {$IFDEF OSX64}
    function audioTimePitchAlgorithm: AVAudioTimePitchAlgorithm; cdecl;
    {$ENDIF}
    procedure cancelExport; cdecl;
    {$IFDEF OSX64}
    function canPerformMultiplePassesOverSourceMediaData: Boolean; cdecl;
    function customVideoCompositor: Pointer; cdecl;
    procedure determineCompatibleFileTypesWithCompletionHandler(handler: TAVAssetExportSessionBlockMethod3); cdecl;
    function directoryForTemporaryFiles: NSURL; cdecl;
    {$ENDIF}
    function error: NSError; cdecl;
    {$IFDEF OSX64}
    function estimatedOutputFileLength: Int64; cdecl;
    procedure exportAsynchronouslyWithCompletionHandler(handler: TAVAssetExportSessionBlockMethod1); cdecl;
    function fileLengthLimit: Int64; cdecl;
    [MethodName('initWithAsset:presetName:')]
    {$ENDIF}
    function initWithAsset(asset: AVAsset; presetName: NSString): Pointer; cdecl;
    {$IFDEF OSX64}
    function maxDuration: CMTime; cdecl;
    {$ENDIF}
    function metadata: NSArray; cdecl;
    {$IFDEF OSX64}
    function metadataItemFilter: AVMetadataItemFilter; cdecl;
    {$ENDIF}
    function outputFileType: NSString; cdecl;
    function outputURL: NSURL; cdecl;
    function presetName: NSString; cdecl;
    function progress: Single; cdecl;
    procedure setAudioMix(audioMix: AVAudioMix); cdecl;
    {$IFDEF OSX64}
    procedure setAudioTimePitchAlgorithm(audioTimePitchAlgorithm: AVAudioTimePitchAlgorithm); cdecl;
    procedure setCanPerformMultiplePassesOverSourceMediaData(canPerformMultiplePassesOverSourceMediaData: Boolean); cdecl;
    procedure setDirectoryForTemporaryFiles(directoryForTemporaryFiles: NSURL); cdecl;
    procedure setFileLengthLimit(fileLengthLimit: Int64); cdecl;
    {$ENDIF}
    procedure setMetadata(metadata: NSArray); cdecl;
    {$IFDEF OSX64}
    procedure setMetadataItemFilter(metadataItemFilter: AVMetadataItemFilter); cdecl;
    {$ENDIF}
    procedure setOutputFileType(outputFileType: NSString); cdecl;
    procedure setOutputURL(outputURL: NSURL); cdecl;
    procedure setShouldOptimizeForNetworkUse(shouldOptimizeForNetworkUse: Boolean); cdecl;
    procedure setTimeRange(timeRange: CMTimeRange); cdecl;
    procedure setVideoComposition(videoComposition: AVVideoComposition); cdecl;
    function shouldOptimizeForNetworkUse: Boolean; cdecl;
    function status: AVAssetExportSessionStatus; cdecl;
    function supportedFileTypes: NSArray; cdecl;
    function timeRange: CMTimeRange; cdecl;
    function videoComposition: AVVideoComposition; cdecl;
  end;
  TAVAssetExportSession = class(TOCGenericImport<AVAssetExportSessionClass, AVAssetExportSession>)  end;

  AVAssetClass = interface(NSObjectClass)
    ['{CE952542-B222-407C-9608-776841514537}']
    {class} function assetWithURL(URL: NSURL): Pointer; cdecl;
  end;
  AVAsset = interface(NSObject)
    ['{A52810C0-3D64-4F9A-BF95-C4E9BE72383C}']
    {$IFDEF OSX64}
    function allMediaSelections: NSArray; cdecl;
    {$ENDIF}
    function availableChapterLocales: NSArray; cdecl;
    {$IFDEF OSX64}
    function availableMediaCharacteristicsWithMediaSelectionOptions: NSArray; cdecl;
    {$ENDIF}
    function availableMetadataFormats: NSArray; cdecl;
    procedure cancelLoading; cdecl;
    {$IFDEF OSX64}
    function canContainFragments: Boolean; cdecl;
    function chapterMetadataGroupsBestMatchingPreferredLanguages(preferredLanguages: NSArray): NSArray; cdecl;
    [MethodName('chapterMetadataGroupsWithTitleLocale:containingItemsWithCommonKeys:')]
    {$ENDIF}
    function chapterMetadataGroupsWithTitleLocale(locale: NSLocale; containingItemsWithCommonKeys: NSArray): NSArray; cdecl;
    function commonMetadata: NSArray; cdecl;
    {$IFDEF OSX64}
    function containsFragments: Boolean; cdecl;
    function creationDate: AVMetadataItem; cdecl;
    {$ENDIF}
    function duration: CMTime; cdecl;
    function hasProtectedContent: Boolean; cdecl;
    {$IFDEF OSX64}
    function isCompatibleWithAirPlayVideo: Boolean; cdecl;
    {$ENDIF}
    function isComposable: Boolean; cdecl;
    function isExportable: Boolean; cdecl;
    function isPlayable: Boolean; cdecl;
    function isReadable: Boolean; cdecl;
    function lyrics: NSString; cdecl;
    {$IFDEF OSX64}
    function mediaSelectionGroupForMediaCharacteristic(mediaCharacteristic: AVMediaCharacteristic): AVMediaSelectionGroup; cdecl;
    function metadata: NSArray; cdecl;
    {$ENDIF}
    function metadataForFormat(format: NSString): NSArray; cdecl;
    function naturalSize: CGSize; cdecl;
    {$IFDEF OSX64}
    function overallDurationHint: CMTime; cdecl;
    function preferredMediaSelection: AVMediaSelection; cdecl;
    {$ENDIF}
    function preferredRate: Single; cdecl;
    function preferredTransform: CGAffineTransform; cdecl;
    function preferredVolume: Single; cdecl;
    function providesPreciseDurationAndTiming: Boolean; cdecl;
    function referenceRestrictions: AVAssetReferenceRestrictions; cdecl;
    {$IFDEF OSX64}
    function trackGroups: NSArray; cdecl;
    {$ENDIF}
    function trackWithTrackID(trackID: CMPersistentTrackID): AVAssetTrack; cdecl;
    function tracks: NSArray; cdecl;
    function tracksWithMediaCharacteristic(mediaCharacteristic: NSString): NSArray; cdecl;
    function tracksWithMediaType(mediaType: NSString): NSArray; cdecl;
    function unusedTrackID: CMPersistentTrackID; cdecl;
  end;
  TAVAsset = class(TOCGenericImport<AVAssetClass, AVAsset>)  end;

  AVAssetImageGeneratorClass = interface(NSObjectClass)
    ['{4307A647-49A6-4446-A890-4E0B1EB3F2B6}']
    {class} function assetImageGeneratorWithAsset(asset: AVAsset): Pointer; cdecl;
  end;
  AVAssetImageGenerator = interface(NSObject)
    ['{07136C3F-968C-455D-A6BB-F9E45984B152}']
    function apertureMode: NSString; cdecl;
    function appliesPreferredTrackTransform: Boolean; cdecl;
    {$IFDEF OSX64}
    function asset: AVAsset; cdecl;
    {$ENDIF}
    procedure cancelAllCGImageGeneration; cdecl;
    {$IFDEF OSX64}
    [MethodName('copyCGImageAtTime:actualTime:error:')]
    {$ENDIF}
    function copyCGImageAtTime(requestedTime: CMTime; actualTime: PCMTime; error: NSError): CGImageRef; cdecl;
    {$IFDEF OSX64}
    function customVideoCompositor: Pointer; cdecl;
    [MethodName('generateCGImagesAsynchronouslyForTimes:completionHandler:')]
    {$ENDIF}
    procedure generateCGImagesAsynchronouslyForTimes(requestedTimes: NSArray; handler: Pointer{AVAssetImageGeneratorCompletionHandler}); cdecl;
    function initWithAsset(asset: AVAsset): Pointer; cdecl;
    function maximumSize: CGSize; cdecl;
    function requestedTimeToleranceAfter: CMTime; cdecl;
    function requestedTimeToleranceBefore: CMTime; cdecl;
    procedure setApertureMode(apertureMode: NSString); cdecl;
    procedure setAppliesPreferredTrackTransform(appliesPreferredTrackTransform: Boolean); cdecl;
    procedure setMaximumSize(maximumSize: CGSize); cdecl;
    procedure setRequestedTimeToleranceAfter(requestedTimeToleranceAfter: CMTime); cdecl;
    procedure setRequestedTimeToleranceBefore(requestedTimeToleranceBefore: CMTime); cdecl;
    procedure setVideoComposition(videoComposition: AVVideoComposition); cdecl;
    function videoComposition: AVVideoComposition; cdecl;
  end;
  TAVAssetImageGenerator = class(TOCGenericImport<AVAssetImageGeneratorClass, AVAssetImageGenerator>)  end;

  AVAssetReaderClass = interface(NSObjectClass)
    ['{36234DFD-5BC0-461C-9246-C2086ADE260E}']
    {$IFDEF OSX64}
    [MethodName('assetReaderWithAsset:error:')]
    {$ENDIF}
    {class} function assetReaderWithAsset(asset: AVAsset; error: NSError): Pointer; cdecl;
  end;
  AVAssetReader = interface(NSObject)
    ['{E4AF11A1-5622-4452-B60E-77BF333060BE}']
    procedure addOutput(output: AVAssetReaderOutput); cdecl;
    function asset: AVAsset; cdecl;
    function canAddOutput(output: AVAssetReaderOutput): Boolean; cdecl;
    procedure cancelReading; cdecl;
    function error: NSError; cdecl;
    {$IFDEF OSX64}
    [MethodName('initWithAsset:error:')]
    {$ENDIF}
    function initWithAsset(asset: AVAsset; error: NSError): Pointer; cdecl;
    function outputs: NSArray; cdecl;
    procedure setTimeRange(timeRange: CMTimeRange); cdecl;
    function startReading: Boolean; cdecl;
    function status: AVAssetReaderStatus; cdecl;
    function timeRange: CMTimeRange; cdecl;
  end;
  TAVAssetReader = class(TOCGenericImport<AVAssetReaderClass, AVAssetReader>)  end;

  AVCaptureAudioChannelClass = interface(NSObjectClass)
    ['{EC04C028-FC96-4ABC-B1E9-DFC9549FA794}']
  end;
  AVCaptureAudioChannel = interface(NSObject)
    ['{04242AC2-970F-4A59-8364-F1C19A92DE8A}']
    function averagePowerLevel: Single; cdecl;
    function isEnabled: Boolean; cdecl;
    function peakHoldLevel: Single; cdecl;
    procedure setEnabled(enabled: Boolean); cdecl;
    procedure setVolume(volume: Single); cdecl;
    function volume: Single; cdecl;
  end;
  TAVCaptureAudioChannel = class(TOCGenericImport<AVCaptureAudioChannelClass, AVCaptureAudioChannel>)  end;

  AVAudioRecorderClass = interface(NSObjectClass)
    ['{11F957EC-EE15-4E3A-BA8A-86865F9586AA}']
  end;
  AVAudioRecorder = interface(NSObject)
    ['{7E74B886-60D9-4CDB-9A2D-B75548F5ECC0}']
    function averagePowerForChannel(channelNumber: NSUInteger): Single; cdecl;
    function currentTime: NSTimeInterval; cdecl;
    function delegate: Pointer; cdecl;
    function deleteRecording: Boolean; cdecl;
    {$IFDEF OSX64}
    function deviceCurrentTime: NSTimeInterval; cdecl;
    function format: AVAudioFormat; cdecl;
    [MethodName('initWithURL:format:error:')]
    function initWithURL(url: NSURL; format: AVAudioFormat; error: NSError): Pointer; overload; cdecl;
    [MethodName('initWithURL:settings:error:')]
    {$ENDIF}
    function initWithURL(url: NSURL; settings: NSDictionary; error: NSError): Pointer; {$IFDEF OSX64}overload;{$ENDIF} cdecl;
    function isMeteringEnabled: Boolean; cdecl;
    function isRecording: Boolean; cdecl;
    procedure pause; cdecl;
    function peakPowerForChannel(channelNumber: NSUInteger): Single; cdecl;
    function prepareToRecord: Boolean; cdecl;
    function &record: Boolean; cdecl;
    {$IFDEF OSX64}
    function recordAtTime(time: NSTimeInterval): Boolean; overload; cdecl;
    [MethodName('recordAtTime:forDuration:')]
    function recordAtTime(time: NSTimeInterval; duration: NSTimeInterval): Boolean; overload; cdecl;
    {$ENDIF}
    function recordForDuration(duration: NSTimeInterval): Boolean; cdecl;
    procedure setDelegate(delegate: Pointer); cdecl;
    procedure setMeteringEnabled(meteringEnabled: Boolean); cdecl;
    function settings: NSDictionary; cdecl;
    procedure stop; cdecl;
    procedure updateMeters; cdecl;
    function url: NSURL; cdecl;
  end;
  TAVAudioRecorder = class(TOCGenericImport<AVAudioRecorderClass, AVAudioRecorder>)  end;

  AVVideoCompositionLayerInstructionClass = interface(NSObjectClass)
    ['{510F7D4B-4F0E-4DE5-96B7-103CD9B86C3A}']
  end;

  AVVideoCompositionLayerInstruction = interface(NSObject)
    ['{872B33B2-98D9-45DD-A67A-B3FE762FF7A6}']
    {$IFDEF OSX64}
    [MethodName('getCropRectangleRampForTime:startCropRectangle:endCropRectangle:timeRange:')]
    function getCropRectangleRampForTime(time: CMTime; startCropRectangle: PCGRect; endCropRectangle: PCGRect; timeRange: PCMTimeRange): Boolean; cdecl;
    [MethodName('getOpacityRampForTime:startOpacity:endOpacity:timeRange:')]
    function getOpacityRampForTime(time: CMTime; startOpacity: PSingle; endOpacity: PSingle; timeRange: PCMTimeRange): Boolean; cdecl;
    {$ELSE}
    function getOpacityRampForTime(time: CMTime; startOpacity: PSingle; endOpacity: PSingle; timeRange: CMTimeRange): Boolean; cdecl;
    {$ENDIF}
    {$IFDEF OSX64}
    [MethodName('getTransformRampForTime:startTransform:endTransform:timeRange:')]
    {$ENDIF}
    function getTransformRampForTime(time: CMTime; startTransform: CGAffineTransform; endTransform: CGAffineTransform; timeRange: CMTimeRange): Boolean; cdecl;
    function trackID: CMPersistentTrackID; cdecl;
  end;
  TAVVideoCompositionLayerInstruction = class(TOCGenericImport<AVVideoCompositionLayerInstructionClass, AVVideoCompositionLayerInstruction>)  end;

  AVVideoCompositionCoreAnimationToolClass = interface(NSObjectClass)
    ['{E18999C1-B694-48F9-891E-1EBCAD3CC515}']
    {$IFDEF OSX64}
    [MethodName('videoCompositionCoreAnimationToolWithAdditionalLayer:asTrackID:')]
    {$ENDIF}
    {class} function videoCompositionCoreAnimationToolWithAdditionalLayer(layer: CALayer; asTrackID: CMPersistentTrackID): Pointer; cdecl;
    {$IFDEF OSX64}
    [MethodName('videoCompositionCoreAnimationToolWithPostProcessingAsVideoLayer:inLayer:')]
    {$ENDIF}
    {class} function videoCompositionCoreAnimationToolWithPostProcessingAsVideoLayer(videoLayer: CALayer; inLayer: CALayer): Pointer; cdecl;
    {$IFDEF OSX64}
    [MethodName('videoCompositionCoreAnimationToolWithPostProcessingAsVideoLayers:inLayer:')]
    {class} function videoCompositionCoreAnimationToolWithPostProcessingAsVideoLayers(videoLayers: NSArray; animationLayer: CALayer): Pointer; cdecl;
    {$ENDIF}
  end;
  AVVideoCompositionCoreAnimationTool = interface(NSObject)
    ['{25A0AD80-FC9A-4A67-9B26-17C1CA70F810}']
  end;
  TAVVideoCompositionCoreAnimationTool = class(TOCGenericImport<AVVideoCompositionCoreAnimationToolClass, AVVideoCompositionCoreAnimationTool>)  end;

  AVVideoCompositionInstructionClass = interface(NSObjectClass)
    ['{F297F501-E56D-492A-BE81-BAEB9F0DE5E2}']
  end;
  AVVideoCompositionInstruction = interface(NSObject)
    ['{5641777A-806B-454B-BB7B-D3450A630D5F}']
    function backgroundColor: CGColorRef; cdecl;
    function enablePostProcessing: Boolean; cdecl;
    function layerInstructions: NSArray; cdecl;
    {$IFDEF OSX64}
    function passthroughTrackID: CMPersistentTrackID; cdecl;
    function requiredSourceTrackIDs: NSArray; cdecl;
    {$ENDIF}
    procedure setBackgroundColor(backgroundColor: CGColorRef); cdecl;
    function timeRange: CMTimeRange; cdecl;
  end;
  TAVVideoCompositionInstruction = class(TOCGenericImport<AVVideoCompositionInstructionClass, AVVideoCompositionInstruction>)  end;

  AVAudioPlayerClass = interface(NSObjectClass)
    ['{1D3E43F8-4679-4650-8998-D4665C6E9012}']
  end;
  AVAudioPlayer = interface(NSObject)
    ['{21D2CBC4-63C7-4CA7-AB4D-CE64B5647275}']
    function averagePowerForChannel(channelNumber: NSUInteger): Single; cdecl;
    {$IFDEF OSX64}
    function currentDevice: NSString; cdecl;
    {$ENDIF}
    function currentTime: NSTimeInterval; cdecl;
    function data: NSData; cdecl;
    function delegate: Pointer; cdecl;
    function deviceCurrentTime: NSTimeInterval; cdecl;
    function duration: NSTimeInterval; cdecl;
    {$IFDEF OSX64}
    function enableRate: Boolean; cdecl;
    function format: AVAudioFormat; cdecl;
    [MethodName('initWithContentsOfURL:error:')]
    {$ENDIF}
    function initWithContentsOfURL(url: NSURL; error: NSError): Pointer; {$IFDEF OSX64}overload;{$ENDIF} cdecl;
    {$IFDEF OSX64}
    [MethodName('initWithContentsOfURL:fileTypeHint:error:')]
    function initWithContentsOfURL(url: NSURL; utiString: NSString; outError: PNSError): Pointer; overload; cdecl;
    [MethodName('initWithData:fileTypeHint:error:')]
    function initWithData(data: NSData; utiString: NSString; outError: PNSError): Pointer; overload; cdecl;
    [MethodName('initWithData:error:')]
    {$ENDIF}
    function initWithData(data: NSData; error: NSError): Pointer; {$IFDEF OSX64}overload;{$ENDIF} cdecl;
    function isMeteringEnabled: Boolean; cdecl;
    function isPlaying: Boolean; cdecl;
    function numberOfChannels: NSUInteger; cdecl;
    function numberOfLoops: NSInteger; cdecl;
    function pan: Single; cdecl;
    procedure pause; cdecl;
    function peakPowerForChannel(channelNumber: NSUInteger): Single; cdecl;
    function play: Boolean; cdecl;
    function playAtTime(time: NSTimeInterval): Boolean; cdecl;
    function prepareToPlay: Boolean; cdecl;
    {$IFDEF OSX64}
    function rate: Single; cdecl;
    procedure setCurrentDevice(currentDevice: NSString); cdecl;
    {$ENDIF}
    procedure setCurrentTime(currentTime: NSTimeInterval); cdecl;
    procedure setDelegate(delegate: Pointer); cdecl;
    {$IFDEF OSX64}
    procedure setEnableRate(enableRate: Boolean); cdecl;
    {$ENDIF}
    procedure setMeteringEnabled(meteringEnabled: Boolean); cdecl;
    procedure setNumberOfLoops(numberOfLoops: NSInteger); cdecl;
    procedure setPan(pan: Single); cdecl;
    {$IFDEF OSX64}
    [MethodName('setVolume:fadeDuration:')]
    procedure setVolume(volume: Single; duration: NSTimeInterval); overload; cdecl;
    {$ENDIF}
    procedure setVolume(volume: Single); {$IFDEF OSX64}overload;{$ENDIF} cdecl;
    function settings: NSDictionary; cdecl;
    procedure stop; cdecl;
    procedure updateMeters; cdecl;
    function url: NSURL; cdecl;
    function volume: Single; cdecl;
  end;
  TAVAudioPlayer = class(TOCGenericImport<AVAudioPlayerClass, AVAudioPlayer>)  end;

  AVAssetWriterInputPixelBufferAdaptorClass = interface(NSObjectClass)
    ['{A79D8BCE-74D7-4EFE-A8B3-5C23951AA1D6}']
    {class} function assetWriterInputPixelBufferAdaptorWithAssetWriterInput(input: AVAssetWriterInput; sourcePixelBufferAttributes: NSDictionary): Pointer; cdecl;
  end;
  AVAssetWriterInputPixelBufferAdaptor = interface(NSObject)
    ['{034FE82B-621C-4A0C-BFB6-97125BD3B8C4}']
    function appendPixelBuffer(pixelBuffer: CVPixelBufferRef; withPresentationTime: CMTime): Boolean; cdecl;
    function assetWriterInput: AVAssetWriterInput; cdecl;
    function initWithAssetWriterInput(input: AVAssetWriterInput; sourcePixelBufferAttributes: NSDictionary): Pointer; cdecl;
    function pixelBufferPool: CVPixelBufferPoolRef; cdecl;
    function sourcePixelBufferAttributes: NSDictionary; cdecl;
  end;
  TAVAssetWriterInputPixelBufferAdaptor = class(TOCGenericImport<AVAssetWriterInputPixelBufferAdaptorClass, AVAssetWriterInputPixelBufferAdaptor>)  end;

  AVAssetWriterInputClass = interface(NSObjectClass)
    ['{10548B0A-E702-49D9-9E4A-1C724933E03F}']
    {$IFDEF OSX64}
    [MethodName('assetWriterInputWithMediaType:outputSettings:')]
    {$ENDIF}
    {class} function assetWriterInputWithMediaType(mediaType: NSString; outputSettings: NSDictionary): Pointer; {$IFDEF OSX64}overload;{$ENDIF} cdecl;
    {$IFDEF OSX64}
    [MethodName('assetWriterInputWithMediaType:outputSettings:sourceFormatHint:')]
    {class} function assetWriterInputWithMediaType(mediaType: AVMediaType; outputSettings: NSDictionary; sourceFormatHint: CMFormatDescriptionRef): Pointer; overload; cdecl;
    {$ENDIF}
  end;
  AVAssetWriterInput = interface(NSObject)
    ['{9E47C179-E1B8-4AF7-9D4A-B0A7174446E7}']
    {$IFDEF OSX64}
    [MethodName('addTrackAssociationWithTrackOfInput:type:')]
    procedure addTrackAssociationWithTrackOfInput(input: AVAssetWriterInput; trackAssociationType: NSString); cdecl;
    {$ENDIF}
    function appendSampleBuffer(sampleBuffer: CMSampleBufferRef): Boolean; cdecl;
    {$IFDEF OSX64}
    [MethodName('canAddTrackAssociationWithTrackOfInput:type:')]
    function canAddTrackAssociationWithTrackOfInput(input: AVAssetWriterInput; trackAssociationType: NSString): Boolean; cdecl;
    function canPerformMultiplePasses: Boolean; cdecl;
    function currentPassDescription: AVAssetWriterInputPassDescription; cdecl;
    {$ENDIF}
    function expectsMediaDataInRealTime: Boolean; cdecl;
    {$IFDEF OSX64}
    function extendedLanguageTag: NSString; cdecl;
    [MethodName('initWithMediaType:outputSettings:sourceFormatHint:')]
    function initWithMediaType(mediaType: AVMediaType; outputSettings: NSDictionary; sourceFormatHint: CMFormatDescriptionRef): Pointer; overload; cdecl;
    [MethodName('initWithMediaType:outputSettings:')]
    {$ENDIF}
    function initWithMediaType(mediaType: NSString; outputSettings: NSDictionary): Pointer; {$IFDEF OSX64}overload;{$ENDIF} cdecl;
    function isReadyForMoreMediaData: Boolean; cdecl;
    {$IFDEF OSX64}
    function languageCode: NSString; cdecl;
    {$ENDIF}
    procedure markAsFinished; cdecl;
    {$IFDEF OSX64}
    procedure markCurrentPassAsFinished; cdecl;
    function marksOutputTrackAsEnabled: Boolean; cdecl;
    function mediaDataLocation: AVAssetWriterInputMediaDataLocation; cdecl;
    {$ENDIF}
    function mediaTimeScale: CMTimeScale; cdecl;
    function mediaType: NSString; cdecl;
    function metadata: NSArray; cdecl;
    {$IFDEF OSX64}
    function naturalSize: CGSize; cdecl;
    {$ENDIF}
    function outputSettings: NSDictionary; cdecl;
    {$IFDEF OSX64}
    function performsMultiPassEncodingIfSupported: Boolean; cdecl;
    function preferredMediaChunkAlignment: NSInteger; cdecl;
    function preferredMediaChunkDuration: CMTime; cdecl;
    function preferredVolume: Single; cdecl;
    [MethodName('requestMediaDataWhenReadyOnQueue:usingBlock:')]
    procedure requestMediaDataWhenReadyOnQueue(queue: dispatch_queue_t; block: TAVAssetWriterInputBlockMethod1); cdecl;
    [MethodName('respondToEachPassDescriptionOnQueue:usingBlock:')]
    procedure respondToEachPassDescriptionOnQueue(queue: dispatch_queue_t; block: dispatch_block_t); cdecl;
    function sampleReferenceBaseURL: NSURL; cdecl;
    {$ENDIF}
    procedure setExpectsMediaDataInRealTime(expectsMediaDataInRealTime: Boolean); cdecl;
    {$IFDEF OSX64}
    procedure setExtendedLanguageTag(extendedLanguageTag: NSString); cdecl;
    procedure setLanguageCode(languageCode: NSString); cdecl;
    procedure setMarksOutputTrackAsEnabled(marksOutputTrackAsEnabled: Boolean); cdecl;
    procedure setMediaDataLocation(mediaDataLocation: AVAssetWriterInputMediaDataLocation); cdecl;
    {$ENDIF}
    procedure setMediaTimeScale(mediaTimeScale: CMTimeScale); cdecl;
    procedure setMetadata(metadata: NSArray); cdecl;
    {$IFDEF OSX64}
    procedure setNaturalSize(naturalSize: CGSize); cdecl;
    procedure setPerformsMultiPassEncodingIfSupported(performsMultiPassEncodingIfSupported: Boolean); cdecl;
    procedure setPreferredMediaChunkAlignment(preferredMediaChunkAlignment: NSInteger); cdecl;
    procedure setPreferredMediaChunkDuration(preferredMediaChunkDuration: CMTime); cdecl;
    procedure setPreferredVolume(preferredVolume: Single); cdecl;
    procedure setSampleReferenceBaseURL(sampleReferenceBaseURL: NSURL); cdecl;
    {$ENDIF}
    procedure setTransform(transform: CGAffineTransform); cdecl;
    {$IFDEF OSX64}
    function sourceFormatHint: CMFormatDescriptionRef; cdecl;
    {$ENDIF}
    function transform: CGAffineTransform; cdecl;
  end;
  TAVAssetWriterInput = class(TOCGenericImport<AVAssetWriterInputClass, AVAssetWriterInput>)  end;

  AVAudioMixClass = interface(NSObjectClass)
    ['{AF7C0F46-2350-4C91-BB4C-85392E4706CB}']
  end;
  AVAudioMix = interface(NSObject)
    ['{D7843019-6352-47E5-9532-9418F697B26C}']
    function inputParameters: NSArray; cdecl;
  end;
  TAVAudioMix = class(TOCGenericImport<AVAudioMixClass, AVAudioMix>)  end;

  AVAudioMixInputParametersClass = interface(NSObjectClass)
    ['{B9DF0690-71D0-4C7B-BAFA-5B70FE7B6DE8}']
  end;
  AVAudioMixInputParameters = interface(NSObject)
    ['{E2BB064F-A712-4989-B9BD-CD472757C525}']
    {$IFDEF OSX64}
    function audioTapProcessor: MTAudioProcessingTapRef; cdecl;
    function audioTimePitchAlgorithm: AVAudioTimePitchAlgorithm; cdecl;
    [MethodName('getVolumeRampForTime:startVolume:endVolume:timeRange:')]
    {$ENDIF}
    function getVolumeRampForTime(time: CMTime; startVolume: PSingle; endVolume: PSingle; timeRange: CMTimeRange): Boolean; cdecl;
    function trackID: CMPersistentTrackID; cdecl;
  end;
  TAVAudioMixInputParameters = class(TOCGenericImport<AVAudioMixInputParametersClass, AVAudioMixInputParameters>)  end;

  AVMutableVideoCompositionLayerInstructionClass = interface(AVVideoCompositionLayerInstructionClass)
    ['{52779534-C63D-40E6-94F4-59291AD44EE1}']
    {class} function videoCompositionLayerInstruction: Pointer; cdecl;
    {class} function videoCompositionLayerInstructionWithAssetTrack(track: AVAssetTrack): Pointer; cdecl;
  end;
  AVMutableVideoCompositionLayerInstruction = interface(AVVideoCompositionLayerInstruction)
    ['{AF8E63C9-54F2-4B18-BA34-A47BC7098CF5}']
    {$IFDEF OSX64}
    [MethodName('setCropRectangle:atTime:')]
    procedure setCropRectangle(cropRectangle: CGRect; time: CMTime); cdecl;
    [MethodName('setCropRectangleRampFromStartCropRectangle:toEndCropRectangle:timeRange:')]
    procedure setCropRectangleRampFromStartCropRectangle(startCropRectangle: CGRect; endCropRectangle: CGRect; timeRange: CMTimeRange); cdecl;
    [MethodName('setOpacity:atTime:')]
    {$ENDIF}
    procedure setOpacity(opacity: Single; atTime: CMTime); cdecl;
    {$IFDEF OSX64}
    [MethodName('setOpacityRampFromStartOpacity:toEndOpacity:timeRange:')]
    {$ENDIF}
    procedure setOpacityRampFromStartOpacity(startOpacity: Single; toEndOpacity: Single; timeRange: CMTimeRange); cdecl;
    procedure setTrackID(trackID: CMPersistentTrackID); cdecl;
    {$IFDEF OSX64}
    [MethodName('setTransform:atTime:')]
    {$ENDIF}
    procedure setTransform(transform: CGAffineTransform; atTime: CMTime); cdecl;
    {$IFDEF OSX64}
    [MethodName('setTransformRampFromStartTransform:toEndTransform:timeRange:')]
    {$ENDIF}
    procedure setTransformRampFromStartTransform(startTransform: CGAffineTransform; toEndTransform: CGAffineTransform; timeRange: CMTimeRange); cdecl;
    function trackID: CMPersistentTrackID; cdecl;
  end;
  TAVMutableVideoCompositionLayerInstruction = class(TOCGenericImport<AVMutableVideoCompositionLayerInstructionClass, AVMutableVideoCompositionLayerInstruction>)  end;

  AVMutableVideoCompositionInstructionClass = interface(AVVideoCompositionInstructionClass)
    ['{73851FFB-D014-49DC-886D-BC66BA072C7F}']
    {class} function videoCompositionInstruction: Pointer; cdecl;
  end;
  AVMutableVideoCompositionInstruction = interface(AVVideoCompositionInstruction)
    ['{243A4E34-1231-4F3C-A26E-2F9FB35E34CB}']
    function backgroundColor: CGColorRef; cdecl;
    function enablePostProcessing: Boolean; cdecl;
    function layerInstructions: NSArray; cdecl;
    procedure setBackgroundColor(backgroundColor: CGColorRef); cdecl;
    procedure setEnablePostProcessing(enablePostProcessing: Boolean); cdecl;
    procedure setLayerInstructions(layerInstructions: NSArray); cdecl;
    procedure setTimeRange(timeRange: CMTimeRange); cdecl;
    function timeRange: CMTimeRange; cdecl;
  end;
  TAVMutableVideoCompositionInstruction = class(TOCGenericImport<AVMutableVideoCompositionInstructionClass, AVMutableVideoCompositionInstruction>)  end;

  AVURLAssetClass = interface(AVAssetClass)
    ['{25F659C2-54FA-4F69-B353-86E057E6E953}']
    {$IFDEF OSX64}
    [MethodName('URLAssetWithURL:options:')]
    {$ENDIF}
    {class} function URLAssetWithURL(URL: NSURL; options: NSDictionary): Pointer; cdecl;
    {class} function audiovisualMIMETypes: NSArray; cdecl;
    {class} function audiovisualTypes: NSArray; cdecl;
    {class} function isPlayableExtendedMIMEType(extendedMIMEType: NSString): Boolean; cdecl;
  end;
  AVURLAsset = interface(AVAsset)
    ['{A4B68691-C443-4511-A88E-473E1860F3DE}']
    function URL: NSURL; cdecl;
    {$IFDEF OSX64}
    function assetCache: AVAssetCache; cdecl;
    {$ENDIF}
    function compatibleTrackForCompositionTrack(compositionTrack: AVCompositionTrack): AVAssetTrack; cdecl;
    {$IFDEF OSX64}
    [MethodName('initWithURL:options:')]
    {$ENDIF}
    function initWithURL(URL: NSURL; options: NSDictionary): Pointer; cdecl;
    {$IFDEF OSX64}
    function mayRequireContentKeysForMediaDataProcessing: Boolean; cdecl;
    function resourceLoader: AVAssetResourceLoader; cdecl;
    {$ENDIF}
  end;
  TAVURLAsset = class(TOCGenericImport<AVURLAssetClass, AVURLAsset>)  end;

  AVQueuePlayerClass = interface(AVPlayerClass)
    ['{8D04D7CB-AFD2-4E18-92B3-19602328299D}']
    {class} function queuePlayerWithItems(items: NSArray): Pointer; cdecl;
  end;
  AVQueuePlayer = interface(AVPlayer)
    ['{17187B77-EFC8-40B2-8D72-909A33E2CFEF}']
    procedure advanceToNextItem; cdecl;
    function canInsertItem(item: AVPlayerItem; afterItem: AVPlayerItem): Boolean; cdecl;
    function initWithItems(items: NSArray): Pointer; cdecl;
    procedure insertItem(item: AVPlayerItem; afterItem: AVPlayerItem); cdecl;
    function items: NSArray; cdecl;
    procedure removeAllItems; cdecl;
    procedure removeItem(item: AVPlayerItem); cdecl;
  end;
  TAVQueuePlayer = class(TOCGenericImport<AVQueuePlayerClass, AVQueuePlayer>)  end;

  AVMutableVideoCompositionClass = interface(AVVideoCompositionClass)
    ['{38CABEE6-916A-47B5-A192-CCDB4B4DEBC2}']
    {class} function videoComposition: Pointer; cdecl;
    {$IFDEF OSX64}
    [MethodName('videoCompositionWithAsset:applyingCIFiltersWithHandler:')]
    {class} function videoCompositionWithAsset(asset: AVAsset; applier: TAVMutableVideoCompositionBlockMethod1): AVMutableVideoComposition; cdecl;
    {class} function videoCompositionWithPropertiesOfAsset(asset: AVAsset): AVMutableVideoComposition; cdecl;
    {$ENDIF}
  end;
  AVMutableVideoComposition = interface(AVVideoComposition)
    ['{DE91B992-6718-4FB9-A5A8-9898816B25C9}']
    function animationTool: AVVideoCompositionCoreAnimationTool; cdecl;
    {$IFDEF OSX64}
    function colorPrimaries: NSString; cdecl;
    function colorTransferFunction: NSString; cdecl;
    function colorYCbCrMatrix: NSString; cdecl;
    // function customVideoCompositorClass: Class; cdecl; // https://developer.apple.com/documentation/avfoundation/avvideocomposition/1389622-customvideocompositorclass?language=objc
    {$ENDIF}
    function frameDuration: CMTime; cdecl;
    function instructions: NSArray; cdecl;
    {$IFDEF OSX64}
    function renderScale: Single; cdecl;
    {$ENDIF}
    function renderSize: CGSize; cdecl;
    procedure setAnimationTool(animationTool: AVVideoCompositionCoreAnimationTool); cdecl;
    {$IFDEF OSX64}
    procedure setColorPrimaries(colorPrimaries: NSString); cdecl;
    procedure setColorTransferFunction(colorTransferFunction: NSString); cdecl;
    procedure setColorYCbCrMatrix(colorYCbCrMatrix: NSString); cdecl;
    // procedure setCustomVideoCompositorClass(customVideoCompositorClass: Class); cdecl; // https://developer.apple.com/documentation/avfoundation/avvideocomposition/1389622-customvideocompositorclass?language=objc
    {$ENDIF}
    procedure setFrameDuration(frameDuration: CMTime); cdecl;
    procedure setInstructions(instructions: NSArray); cdecl;
    {$IFDEF OSX64}
    procedure setRenderScale(renderScale: Single); cdecl;
    {$ENDIF}
    procedure setRenderSize(renderSize: CGSize); cdecl;
    {$IFDEF OSX64}
    procedure setSourceTrackIDForFrameTiming(sourceTrackIDForFrameTiming: CMPersistentTrackID); cdecl;
    function sourceTrackIDForFrameTiming: CMPersistentTrackID; cdecl;
    {$ENDIF}
  end;
  TAVMutableVideoComposition = class(TOCGenericImport<AVMutableVideoCompositionClass, AVMutableVideoComposition>)  end;

  AVCaptureFileOutputClass = interface(AVCaptureOutputClass)
    ['{DCDBF7B2-D2DA-4474-9AB7-5ACAEE1DA2EB}']
  end;
  AVCaptureFileOutput = interface(AVCaptureOutput)
    ['{62009CD7-9AD2-4AE6-860C-4E1DC2A0A786}']
    function delegate: Pointer; cdecl;
    function isRecording: Boolean; cdecl;
    function isRecordingPaused: Boolean; cdecl;
    function maxRecordedDuration: CMTime; cdecl;
    function maxRecordedFileSize: Int64; cdecl;
    function minFreeDiskSpaceLimit: Int64; cdecl;
    function outputFileURL: NSURL; cdecl;
    procedure pauseRecording; cdecl;
    function recordedDuration: CMTime; cdecl;
    function recordedFileSize: Int64; cdecl;
    procedure resumeRecording; cdecl;
    procedure setDelegate(delegate: Pointer); cdecl;
    procedure setMaxRecordedDuration(maxRecordedDuration: CMTime); cdecl;
    procedure setMaxRecordedFileSize(maxRecordedFileSize: Int64); cdecl;
    procedure setMinFreeDiskSpaceLimit(minFreeDiskSpaceLimit: Int64); cdecl;
    procedure startRecordingToOutputFileURL(outputFileURL: NSURL; recordingDelegate: Pointer); cdecl;
    procedure stopRecording; cdecl;
  end;
  TAVCaptureFileOutput = class(TOCGenericImport<AVCaptureFileOutputClass, AVCaptureFileOutput>)  end;

  AVCaptureDeviceInputClass = interface(AVCaptureInputClass)
    ['{B7D833B4-8DD1-40A4-8CE4-4119F89899A3}']
    {class} function deviceInputWithDevice(device: AVCaptureDevice; error: PPointer): Pointer; cdecl;
  end;
  AVCaptureDeviceInput = interface(AVCaptureInput)
    ['{FC75F5FB-4A0D-4B6F-A33F-FEA293F095AA}']
    function device: AVCaptureDevice; cdecl;
    {$IFDEF OSX64}
    [MethodName('initWithDevice:error:')]
    {$ENDIF}
    function initWithDevice(device: AVCaptureDevice; error: PPointer): Pointer; cdecl;
    {$IFDEF OSX64}
    procedure setUnifiedAutoExposureDefaultsEnabled(unifiedAutoExposureDefaultsEnabled: Boolean); cdecl;
    function unifiedAutoExposureDefaultsEnabled: Boolean; cdecl;
    {$ENDIF}
  end;
  TAVCaptureDeviceInput = class(TOCGenericImport<AVCaptureDeviceInputClass, AVCaptureDeviceInput>)  end;

  AVCaptureStillImageOutputClass = interface(AVCaptureOutputClass)
    ['{EC9963DF-21AD-4E3E-AF8F-9D37F2A1B85F}']
    {class} function jpegStillImageNSDataRepresentation(jpegSampleBuffer: CMSampleBufferRef): NSData; cdecl;
  end;
  AVCaptureStillImageOutput = interface(AVCaptureOutput)
    ['{B0A799C7-1B33-4769-96B9-FB0AC92101FA}']
    {$IFDEF OSX64}
    function automaticallyEnablesStillImageStabilizationWhenAvailable: Boolean; cdecl;
    {$ENDIF}
    function availableImageDataCVPixelFormatTypes: NSArray; cdecl;
    function availableImageDataCodecTypes: NSArray; cdecl;
    {$IFDEF OSX64}
    [MethodName('captureStillImageAsynchronouslyFromConnection:completionHandler:')]
    procedure captureStillImageAsynchronouslyFromConnection(connection: AVCaptureConnection; handler: TAVCaptureStillImageOutputBlockMethod1); cdecl;
    [MethodName('captureStillImageBracketAsynchronouslyFromConnection:withSettingsArray:completionHandler:')]
    procedure captureStillImageBracketAsynchronouslyFromConnection(connection: AVCaptureConnection; settings: NSArray;
      handler: TAVCaptureStillImageOutputBlockMethod3); cdecl; // API_DEPRECATED("Use AVCapturePhotoOutput capturePhotoWithSettings:delegate: instead.", ios(8.0, 10.0))
    function isCapturingStillImage: Boolean; cdecl;
    function isHighResolutionStillImageOutputEnabled: Boolean; cdecl;
    function isLensStabilizationDuringBracketedCaptureEnabled: Boolean; cdecl; // API_DEPRECATED("Use AVCapturePhotoOutput with AVCapturePhotoBracketSettings instead.", ios(9.0, 10.0))
    function isLensStabilizationDuringBracketedCaptureSupported: Boolean; cdecl; // API_DEPRECATED("Use AVCapturePhotoOutput lensStabilizationDuringBracketedCaptureSupported instead.", ios(9.0, 10.0))
    function isStillImageStabilizationActive: Boolean; cdecl;
    function isStillImageStabilizationSupported: Boolean; cdecl;
    function maxBracketedCaptureStillImageCount: NSUInteger; cdecl; // API_DEPRECATED("Use AVCapturePhotoOutput maxBracketedCapturePhotoCount instead.", ios(8.0, 10.0))
    {$ENDIF}
    function outputSettings: NSDictionary; cdecl;
    {$IFDEF OSX64}
    [MethodName('prepareToCaptureStillImageBracketFromConnection:withSettingsArray:completionHandler:')]
    procedure prepareToCaptureStillImageBracketFromConnection(connection: AVCaptureConnection; settings: NSArray;
      handler: TAVCaptureStillImageOutputBlockMethod2); cdecl; // API_DEPRECATED("Use AVCapturePhotoOutput setPreparedPhotoSettingsArray:completionHandler: instead.", ios(8.0, 10.0))
    procedure setAutomaticallyEnablesStillImageStabilizationWhenAvailable(automaticallyEnablesStillImageStabilizationWhenAvailable: Boolean); cdecl;
    procedure setHighResolutionStillImageOutputEnabled(highResolutionStillImageOutputEnabled: Boolean); cdecl;
    procedure setLensStabilizationDuringBracketedCaptureEnabled(lensStabilizationDuringBracketedCaptureEnabled: Boolean); cdecl; // API_DEPRECATED("Use AVCapturePhotoOutput with AVCapturePhotoBracketSettings instead.", ios(9.0, 10.0))
    {$ENDIF}
    procedure setOutputSettings(outputSettings: NSDictionary); cdecl;
  end;
  TAVCaptureStillImageOutput = class(TOCGenericImport<AVCaptureStillImageOutputClass, AVCaptureStillImageOutput>)  end;

  AVCaptureScreenInputClass = interface(AVCaptureInputClass)
    ['{D24FE7E0-63CA-4639-9E27-960103CD56D9}']
  end;
  AVCaptureScreenInput = interface(AVCaptureInput)
    ['{257546AD-E27C-4709-B247-4BB3DECB5034}']
    {$IFDEF OSX64}
    function capturesCursor: Boolean; cdecl;
    {$ENDIF}
    function capturesMouseClicks: Boolean; cdecl;
    function cropRect: CGRect; cdecl;
    function initWithDisplayID(displayID: CGDirectDisplayID): Pointer; cdecl;
    function minFrameDuration: CMTime; cdecl;
    {$IFDEF OSX64}
    function removesDuplicateFrames: Boolean; cdecl; // API_DEPRECATED("No longer supported.", macos(10.8, 10.10))
    {$ENDIF}
    function scaleFactor: CGFloat; cdecl;
    {$IFDEF OSX64}
    procedure setCapturesCursor(capturesCursor: Boolean); cdecl;
    {$ENDIF}
    procedure setCapturesMouseClicks(capturesMouseClicks: Boolean); cdecl;
    procedure setCropRect(cropRect: CGRect); cdecl;
    procedure setMinFrameDuration(minFrameDuration: CMTime); cdecl;
    {$IFDEF OSX64}
    procedure setRemovesDuplicateFrames(removesDuplicateFrames: Boolean); cdecl; // API_DEPRECATED("No longer supported.", macos(10.8, 10.10))
    {$ENDIF}
    procedure setScaleFactor(scaleFactor: CGFloat); cdecl;
  end;
  TAVCaptureScreenInput = class(TOCGenericImport<AVCaptureScreenInputClass, AVCaptureScreenInput>)  end;

  AVCaptureAudioPreviewOutputClass = interface(AVCaptureOutputClass)
    ['{C6773DCE-6CC7-46CA-B2D2-8404F644494E}']
  end;
  AVCaptureAudioPreviewOutput = interface(AVCaptureOutput)
    ['{59009B8D-FA46-44EB-A5B8-96A7E9E73E66}']
    function outputDeviceUniqueID: NSString; cdecl;
    procedure setOutputDeviceUniqueID(outputDeviceUniqueID: NSString); cdecl;
    procedure setVolume(volume: Single); cdecl;
    function volume: Single; cdecl;
  end;
  TAVCaptureAudioPreviewOutput = class(TOCGenericImport<AVCaptureAudioPreviewOutputClass, AVCaptureAudioPreviewOutput>)  end;

  AVAssetReaderTrackOutputClass = interface(AVAssetReaderOutputClass)
    ['{BFFA2D74-C273-41A4-BEE8-E1BBA0DC836E}']
    {$IFDEF OSX64}
    [MethodName('assetReaderTrackOutputWithTrack:outputSettings:')]
    {$ENDIF}
    {class} function assetReaderTrackOutputWithTrack(track: AVAssetTrack; outputSettings: NSDictionary): Pointer; cdecl;
  end;
  AVAssetReaderTrackOutput = interface(AVAssetReaderOutput)
    ['{F54BBA0B-CE57-427E-AA15-9B06C09B8928}']
    {$IFDEF OSX64}
    function audioTimePitchAlgorithm: AVAudioTimePitchAlgorithm; cdecl;
    [MethodName('initWithTrack:outputSettings:')]
    {$ENDIF}
    function initWithTrack(track: AVAssetTrack; outputSettings: NSDictionary): Pointer; cdecl;
    function outputSettings: NSDictionary; cdecl;
    {$IFDEF OSX64}
    procedure setAudioTimePitchAlgorithm(audioTimePitchAlgorithm: AVAudioTimePitchAlgorithm); cdecl;
    {$ENDIF}
    function track: AVAssetTrack; cdecl;
  end;
  TAVAssetReaderTrackOutput = class(TOCGenericImport<AVAssetReaderTrackOutputClass, AVAssetReaderTrackOutput>)  end;

  AVAssetReaderAudioMixOutputClass = interface(AVAssetReaderOutputClass)
    ['{389C299A-8799-4E8B-A943-5BB2B90692B3}']
    {$IFDEF OSX64}
    [MethodName('assetReaderAudioMixOutputWithAudioTracks:audioSettings:')]
    {$ENDIF}
    {class} function assetReaderAudioMixOutputWithAudioTracks(audioTracks: NSArray; audioSettings: NSDictionary): Pointer; cdecl;
  end;
  AVAssetReaderAudioMixOutput = interface(AVAssetReaderOutput)
    ['{6CF376D8-FF50-459A-8705-7ED821FFCAF4}']
    function audioMix: AVAudioMix; cdecl;
    function audioSettings: NSDictionary; cdecl;
    {$IFDEF OSX64}
    function audioTimePitchAlgorithm: AVAudioTimePitchAlgorithm; cdecl;
    {$ENDIF}
    function audioTracks: NSArray; cdecl;
    {$IFDEF OSX64}
    [MethodName('initWithAudioTracks:audioSettings:')]
    {$ENDIF}
    function initWithAudioTracks(audioTracks: NSArray; audioSettings: NSDictionary): Pointer; cdecl;
    procedure setAudioMix(audioMix: AVAudioMix); cdecl;
    {$IFDEF OSX64}
    procedure setAudioTimePitchAlgorithm(audioTimePitchAlgorithm: AVAudioTimePitchAlgorithm); cdecl;
    {$ENDIF}
  end;
  TAVAssetReaderAudioMixOutput = class(TOCGenericImport<AVAssetReaderAudioMixOutputClass, AVAssetReaderAudioMixOutput>)  end;

  AVCaptureAudioDataOutputClass = interface(AVCaptureOutputClass)
    ['{3C857CDC-598C-4481-9F2E-D121A50773E0}']
  end;
  AVCaptureAudioDataOutput = interface(AVCaptureOutput)
    ['{B369D623-0083-4719-837B-6092284B599C}']
    function audioSettings: NSDictionary; cdecl;
    {$IFDEF OSX64}
    function recommendedAudioSettingsForAssetWriterWithOutputFileType(outputFileType: AVFileType): NSDictionary; cdecl;
    {$ENDIF}
    function sampleBufferCallbackQueue: dispatch_queue_t; cdecl;
    function sampleBufferDelegate: Pointer; cdecl;
    procedure setAudioSettings(audioSettings: NSDictionary); cdecl;
    {$IFDEF OSX64}
    [MethodName('setSampleBufferDelegate:queue:')]
    {$ENDIF}
    procedure setSampleBufferDelegate(sampleBufferDelegate: Pointer; queue: dispatch_queue_t); cdecl;
  end;
  TAVCaptureAudioDataOutput = class(TOCGenericImport<AVCaptureAudioDataOutputClass, AVCaptureAudioDataOutput>)  end;

  AVAssetReaderVideoCompositionOutputClass = interface(AVAssetReaderOutputClass)
    ['{768BB054-695D-4075-A31C-5EC1BAD1CDBE}']
    {$IFDEF OSX64}
    [MethodName('assetReaderVideoCompositionOutputWithVideoTracks:videoSettings:')]
    {$ENDIF}
    {class} function assetReaderVideoCompositionOutputWithVideoTracks(videoTracks: NSArray; videoSettings: NSDictionary): Pointer; cdecl;
  end;
  AVAssetReaderVideoCompositionOutput = interface(AVAssetReaderOutput)
    ['{557626FD-9BBE-4E87-BCB2-988C2B234658}']
    {$IFDEF OSX64}
    function customVideoCompositor: Pointer; cdecl;
    [MethodName('initWithVideoTracks:videoSettings:')]
    {$ENDIF}
    function initWithVideoTracks(videoTracks: NSArray; videoSettings: NSDictionary): Pointer; cdecl;
    procedure setVideoComposition(videoComposition: AVVideoComposition); cdecl;
    function videoComposition: AVVideoComposition; cdecl;
    function videoSettings: NSDictionary; cdecl;
    function videoTracks: NSArray; cdecl;
  end;
  TAVAssetReaderVideoCompositionOutput = class(TOCGenericImport<AVAssetReaderVideoCompositionOutputClass, AVAssetReaderVideoCompositionOutput>)  end;

  AVCaptureVideoDataOutputClass = interface(AVCaptureOutputClass)
    ['{CC77E863-9D14-4B5E-B61B-8D5B0372D8BF}']
  end;
  AVCaptureVideoDataOutput = interface(AVCaptureOutput)
    ['{8C626C87-D92C-4CB7-8A83-AF24ACAD00B1}']
    function alwaysDiscardsLateVideoFrames: Boolean; cdecl;
    function availableVideoCVPixelFormatTypes: NSArray; cdecl;
    function availableVideoCodecTypes: NSArray; cdecl;
    {$IFDEF OSX64}
    function availableVideoCodecTypesForAssetWriterWithOutputFileType(outputFileType: AVFileType): NSArray; cdecl;
    function minFrameDuration: CMTime; cdecl; // API_DEPRECATED("Use AVCaptureConnection's videoMinFrameDuration property instead.", ios(4.0, 5.0))
    function recommendedVideoSettingsForAssetWriterWithOutputFileType(outputFileType: AVFileType): NSDictionary; cdecl;
    [MethodName('recommendedVideoSettingsForVideoCodecType:assetWriterOutputFileType:')]
    function recommendedVideoSettingsForVideoCodecType(videoCodecType: AVVideoCodecType; outputFileType: AVFileType): NSDictionary; cdecl;
    {$ENDIF}
    function sampleBufferCallbackQueue: dispatch_queue_t; cdecl;
    function sampleBufferDelegate: Pointer; cdecl;
    procedure setAlwaysDiscardsLateVideoFrames(alwaysDiscardsLateVideoFrames: Boolean); cdecl;
    {$IFDEF OSX64}
    procedure setMinFrameDuration(minFrameDuration: CMTime); cdecl; // API_DEPRECATED("Use AVCaptureConnection's videoMinFrameDuration property instead.", ios(4.0, 5.0))
    [MethodName('setSampleBufferDelegate:queue:')]
    {$ENDIF}
    procedure setSampleBufferDelegate(sampleBufferDelegate: Pointer; queue: dispatch_queue_t); cdecl;
    procedure setVideoSettings(videoSettings: NSDictionary); cdecl;
    function videoSettings: NSDictionary; cdecl;
  end;
  TAVCaptureVideoDataOutput = class(TOCGenericImport<AVCaptureVideoDataOutputClass, AVCaptureVideoDataOutput>)  end;

  AVMutableAudioMixInputParametersClass = interface(AVAudioMixInputParametersClass)
    ['{C1E81455-5556-4895-9F07-5F652A6D90D2}']
    {class} function audioMixInputParameters: Pointer; cdecl;
    {class} function audioMixInputParametersWithTrack(track: AVAssetTrack): Pointer; cdecl;
  end;
  AVMutableAudioMixInputParameters = interface(AVAudioMixInputParameters)
    ['{22932840-393A-44E3-B1E9-79658973D4FB}']
    {$IFDEF OSX64}
    function audioTapProcessor: MTAudioProcessingTapRef; cdecl;
    function audioTimePitchAlgorithm: AVAudioTimePitchAlgorithm; cdecl;
    procedure setAudioTapProcessor(audioTapProcessor: MTAudioProcessingTapRef); cdecl;
    procedure setAudioTimePitchAlgorithm(audioTimePitchAlgorithm: AVAudioTimePitchAlgorithm); cdecl;
    {$ENDIF}
    procedure setTrackID(trackID: CMPersistentTrackID); cdecl;
    {$IFDEF OSX64}
    [MethodName('setVolume:atTime:')]
    {$ENDIF}
    procedure setVolume(volume: Single; atTime: CMTime); cdecl;
    {$IFDEF OSX64}
    [MethodName('setVolumeRampFromStartVolume:toEndVolume:timeRange:')]
    {$ENDIF}
    procedure setVolumeRampFromStartVolume(startVolume: Single; toEndVolume: Single; timeRange: CMTimeRange); cdecl;
    function trackID: CMPersistentTrackID; cdecl;
  end;
  TAVMutableAudioMixInputParameters = class(TOCGenericImport<AVMutableAudioMixInputParametersClass, AVMutableAudioMixInputParameters>)  end;

  AVMutableAudioMixClass = interface(AVAudioMixClass)
    ['{7C31FEAE-C5D9-4ED7-9619-792109261D55}']
    {class} function audioMix: Pointer; cdecl;
  end;
  AVMutableAudioMix = interface(AVAudioMix)
    ['{E895B36D-7BA2-4765-8E7F-DA726D162586}']
    function inputParameters: NSArray; cdecl;
    procedure setInputParameters(inputParameters: NSArray); cdecl;
  end;
  TAVMutableAudioMix = class(TOCGenericImport<AVMutableAudioMixClass, AVMutableAudioMix>)  end;

  AVMutableTimedMetadataGroupClass = interface(AVTimedMetadataGroupClass)
    ['{86D5EE41-070E-4EC0-9653-84788C4DBD0C}']
  end;
  AVMutableTimedMetadataGroup = interface(AVTimedMetadataGroup)
    ['{8B89626F-BC6E-4432-B999-8FEA79E8394F}']
    function items: NSArray; cdecl;
    procedure setItems(items: NSArray); cdecl;
    procedure setTimeRange(timeRange: CMTimeRange); cdecl;
    function timeRange: CMTimeRange; cdecl;
  end;
  TAVMutableTimedMetadataGroup = class(TOCGenericImport<AVMutableTimedMetadataGroupClass, AVMutableTimedMetadataGroup>)  end;

  AVMutableMetadataItemClass = interface(AVMetadataItemClass)
    ['{BB7C9E01-7C03-4D6C-A78B-CE20CBCA41C8}']
    {class} function metadataItem: Pointer; cdecl;
  end;
  AVMutableMetadataItem = interface(AVMetadataItem)
    ['{9E053DAE-CC77-46AB-8B3D-2BE5750C12B0}']
    {$IFDEF OSX64}
    function dataType: NSString; cdecl;
    {$ENDIF}
    function duration: CMTime; cdecl;
    {$IFDEF OSX64}
    function extendedLanguageTag: NSString; cdecl;
    {$ENDIF}
    function extraAttributes: NSDictionary; cdecl;
    {$IFDEF OSX64}
    function identifier: AVMetadataIdentifier; cdecl;
    {$ENDIF}
    function key: Pointer; cdecl;
    function keySpace: NSString; cdecl;
    function locale: NSLocale; cdecl;
    {$IFDEF OSX64}
    procedure setDataType(dataType: NSString); cdecl;
    {$ENDIF}
    procedure setDuration(duration: CMTime); cdecl;
    {$IFDEF OSX64}
    procedure setExtendedLanguageTag(extendedLanguageTag: NSString); cdecl;
    {$ENDIF}
    procedure setExtraAttributes(extraAttributes: NSDictionary); cdecl;
    {$IFDEF OSX64}
    procedure setIdentifier(identifier: AVMetadataIdentifier); cdecl;
    {$ENDIF}
    procedure setKey(key: Pointer); cdecl;
    procedure setKeySpace(keySpace: NSString); cdecl;
    procedure setLocale(locale: NSLocale); cdecl;
    {$IFDEF OSX64}
    procedure setStartDate(startDate: NSDate); cdecl;
    {$ENDIF}
    procedure setTime(time: CMTime); cdecl;
    procedure setValue(value: Pointer); cdecl;
    {$IFDEF OSX64}
    function startDate: NSDate; cdecl;
    {$ENDIF}
    function time: CMTime; cdecl;
    function value: Pointer; cdecl;
  end;
  TAVMutableMetadataItem = class(TOCGenericImport<AVMutableMetadataItemClass, AVMutableMetadataItem>)  end;

  AVCompositionTrackClass = interface(AVAssetTrackClass)
    ['{C7F9E3C3-12DD-4EFF-84BC-AA8E38E09D7E}']
  end;
  AVCompositionTrack = interface(AVAssetTrack)
    ['{922D8B8B-E5D6-4C01-88D9-523E8BB802D0}']
    {$IFDEF OSX64}
    function segmentForTrackTime(trackTime: CMTime): AVCompositionTrackSegment; cdecl;
    {$ENDIF}
    function segments: NSArray; cdecl;
  end;
  TAVCompositionTrack = class(TOCGenericImport<AVCompositionTrackClass, AVCompositionTrack>)  end;

  AVCompositionClass = interface(AVAssetClass)
    ['{52C4DB17-5FC5-4C92-BDE0-C159C78A670D}']
  end;
  AVComposition = interface(AVAsset)
    ['{08A40D61-2174-4828-AA31-0F9FEB2F2C0C}']
    {$IFDEF OSX64}
    function naturalSize: CGSize; cdecl;
    {$ENDIF}
    function tracks: NSArray; cdecl;
    {$IFDEF OSX64}
    function tracksWithMediaCharacteristic(mediaCharacteristic: AVMediaCharacteristic): NSArray; cdecl;
    function tracksWithMediaType(mediaType: AVMediaType): NSArray; cdecl;
    function trackWithTrackID(trackID: CMPersistentTrackID): AVCompositionTrack; cdecl;
    function URLAssetInitializationOptions: NSDictionary; cdecl;
    {$ENDIF}
  end;
  TAVComposition = class(TOCGenericImport<AVCompositionClass, AVComposition>)  end;

  AVCompositionTrackSegmentClass = interface(AVAssetTrackSegmentClass)
    ['{8970BDF7-67C5-4893-8C5A-A93977AAB9DF}']
    {class} function compositionTrackSegmentWithTimeRange(timeRange: CMTimeRange): Pointer; cdecl;
    {class} function compositionTrackSegmentWithURL(URL: NSURL; trackID: CMPersistentTrackID; sourceTimeRange: CMTimeRange; targetTimeRange: CMTimeRange): Pointer; cdecl;
  end;
  AVCompositionTrackSegment = interface(AVAssetTrackSegment)
    ['{AA355C96-A502-4460-BF62-1F2C604D19EB}']
    function initWithTimeRange(timeRange: CMTimeRange): Pointer; cdecl;
    function initWithURL(URL: NSURL; trackID: CMPersistentTrackID; sourceTimeRange: CMTimeRange; targetTimeRange: CMTimeRange): Pointer; cdecl;
    function isEmpty: Boolean; cdecl;
    function sourceTrackID: CMPersistentTrackID; cdecl;
    function sourceURL: NSURL; cdecl;
  end;
  TAVCompositionTrackSegment = class(TOCGenericImport<AVCompositionTrackSegmentClass, AVCompositionTrackSegment>)  end;

  AVMutableCompositionTrackClass = interface(AVCompositionTrackClass)
    ['{56E8147E-64A4-41D1-8022-4FD435488F35}']
  end;
  AVMutableCompositionTrack = interface(AVCompositionTrack)
    ['{070E3CC2-A32A-4072-83EB-FC21047B16E5}']
    {$IFDEF OSX64}
    [MethodName('addTrackAssociationToTrack:type:')]
    procedure addTrackAssociationToTrack(compositionTrack: AVCompositionTrack; trackAssociationType: AVTrackAssociationType); cdecl;
    {$ENDIF}
    function extendedLanguageTag: NSString; cdecl;
    procedure insertEmptyTimeRange(timeRange: CMTimeRange); cdecl;
    {$IFDEF OSX64}
    [MethodName('insertTimeRange:ofTrack:atTime:error:')]
    {$ENDIF}
    function insertTimeRange(timeRange: CMTimeRange; ofTrack: AVAssetTrack; atTime: CMTime; error: NSError): Boolean; cdecl;
    {$IFDEF OSX64}
    [MethodName('insertTimeRanges:ofTracks:atTime:error:')]
    function insertTimeRanges(timeRanges: NSArray; tracks: NSArray; startTime: CMTime; outError: PNSError): Boolean; cdecl;
    {$ENDIF}
    function languageCode: NSString; cdecl;
    function naturalTimeScale: CMTimeScale; cdecl;
    function preferredTransform: CGAffineTransform; cdecl;
    function preferredVolume: Single; cdecl;
    procedure removeTimeRange(timeRange: CMTimeRange); cdecl;
    {$IFDEF OSX64}
    [MethodName('removeTrackAssociationToTrack:type:')]
    procedure removeTrackAssociationToTrack(compositionTrack: AVCompositionTrack; trackAssociationType: AVTrackAssociationType); cdecl;
    [MethodName('scaleTimeRange:toDuration:')]
    {$ENDIF}
    procedure scaleTimeRange(timeRange: CMTimeRange; toDuration: CMTime); cdecl;
    function segments: NSArray; cdecl;
    procedure setExtendedLanguageTag(extendedLanguageTag: NSString); cdecl;
    procedure setLanguageCode(languageCode: NSString); cdecl;
    procedure setNaturalTimeScale(naturalTimeScale: CMTimeScale); cdecl;
    procedure setPreferredTransform(preferredTransform: CGAffineTransform); cdecl;
    procedure setPreferredVolume(preferredVolume: Single); cdecl;
    procedure setSegments(segments: NSArray); cdecl;
    {$IFDEF OSX64}
    [MethodName('validateTrackSegments:error:')]
    {$ENDIF}
    function validateTrackSegments(trackSegments: NSArray; error: NSError): Boolean; cdecl;
  end;
  TAVMutableCompositionTrack = class(TOCGenericImport<AVMutableCompositionTrackClass, AVMutableCompositionTrack>)  end;

  AVCaptureMovieFileOutputClass = interface(AVCaptureFileOutputClass)
    ['{9A6DCAB6-C5BF-4F05-8FC4-2D66E22B7923}']
  end;
  AVCaptureMovieFileOutput = interface(AVCaptureFileOutput)
    ['{B048C968-23FF-43D9-900D-16C460105762}']
    {$IFDEF OSX64}
    function availableVideoCodecTypes: NSArray; cdecl;
    {$ENDIF}
    function metadata: NSArray; cdecl;
    function movieFragmentInterval: CMTime; cdecl;
    function outputSettingsForConnection(connection: AVCaptureConnection): NSDictionary; cdecl;
    {$IFDEF OSX64}
    function recordsVideoOrientationAndMirroringChangesAsMetadataTrackForConnection(connection: AVCaptureConnection): Boolean; cdecl;
    {$ENDIF}
    procedure setMetadata(metadata: NSArray); cdecl;
    procedure setMovieFragmentInterval(movieFragmentInterval: CMTime); cdecl;
    {$IFDEF OSX64}
    [MethodName('setOutputSettings:forConnection:')]
    {$ENDIF}
    procedure setOutputSettings(outputSettings: NSDictionary; forConnection: AVCaptureConnection); cdecl;
    {$IFDEF OSX64}
    [MethodName('setRecordsVideoOrientationAndMirroringChanges:asMetadataTrackForConnection:')]
    procedure setRecordsVideoOrientationAndMirroringChanges(doRecordChanges: Boolean; connection: AVCaptureConnection); cdecl;
    function supportedOutputSettingsKeysForConnection(connection: AVCaptureConnection): NSArray; cdecl;
    {$ENDIF}
  end;
  TAVCaptureMovieFileOutput = class(TOCGenericImport<AVCaptureMovieFileOutputClass, AVCaptureMovieFileOutput>)  end;

  AVCaptureAudioFileOutputClass = interface(AVCaptureFileOutputClass)
    ['{3BC155FD-25C7-48ED-96FC-196F18F8B54D}']
    {class} function availableOutputFileTypes: NSArray; cdecl;
  end;
  AVCaptureAudioFileOutput = interface(AVCaptureFileOutput)
    ['{45F3E9FF-7A9D-41CC-AB0A-6357F71A618F}']
    function audioSettings: NSDictionary; cdecl;
    function metadata: NSArray; cdecl;
    procedure setAudioSettings(audioSettings: NSDictionary); cdecl;
    procedure setMetadata(metadata: NSArray); cdecl;
    procedure startRecordingToOutputFileURL(outputFileURL: NSURL; outputFileType: NSString; recordingDelegate: Pointer); cdecl;
  end;
  TAVCaptureAudioFileOutput = class(TOCGenericImport<AVCaptureAudioFileOutputClass, AVCaptureAudioFileOutput>)  end;

  AVMutableCompositionClass = interface(AVCompositionClass)
    ['{0B4D402A-8BE6-4631-AFC5-3E933BF2C538}']
    {class} function composition: Pointer; cdecl;
    {$IFDEF OSX64}
    {class} function compositionWithURLAssetInitializationOptions(URLAssetInitializationOptions: NSDictionary): Pointer; cdecl;
    {$ENDIF}
  end;
  AVMutableComposition = interface(AVComposition)
    ['{405EE9E5-F06F-4DEC-B82B-9CD5A372BA8D}']
    {$IFDEF OSX64}
    [MethodName('addMutableTrackWithMediaType:preferredTrackID:')]
    {$ENDIF}
    function addMutableTrackWithMediaType(mediaType: NSString; preferredTrackID: CMPersistentTrackID): AVMutableCompositionTrack; cdecl;
    procedure insertEmptyTimeRange(timeRange: CMTimeRange); cdecl;
    {$IFDEF OSX64}
    [MethodName('insertTimeRange:ofAsset:atTime:error:')]
    {$ENDIF}
    function insertTimeRange(timeRange: CMTimeRange; ofAsset: AVAsset; atTime: CMTime; error: NSError): Boolean; cdecl;
    function mutableTrackCompatibleWithTrack(track: AVAssetTrack): AVMutableCompositionTrack; cdecl;
    function naturalSize: CGSize; cdecl;
    procedure removeTimeRange(timeRange: CMTimeRange); cdecl;
    procedure removeTrack(track: AVCompositionTrack); cdecl;
    {$IFDEF OSX64}
    [MethodName('scaleTimeRange:toDuration:')]
    {$ENDIF}
    procedure scaleTimeRange(timeRange: CMTimeRange; toDuration: CMTime); cdecl;
    procedure setNaturalSize(naturalSize: CGSize); cdecl;
    function tracks: NSArray; cdecl;
    {$IFDEF OSX64}
    function tracksWithMediaCharacteristic(mediaCharacteristic: AVMediaCharacteristic): NSArray; cdecl;
    function tracksWithMediaType(mediaType: AVMediaType): NSArray; cdecl;
    function trackWithTrackID(trackID: CMPersistentTrackID): AVMutableCompositionTrack; cdecl;
    {$ENDIF}
  end;
  TAVMutableComposition = class(TOCGenericImport<AVMutableCompositionClass, AVMutableComposition>)  end;

  AVAudioBufferClass = interface(NSObjectClass)
    ['{78488CA5-9F34-4C8F-BDE5-ACA3C3C6A7D7}']
  end;

{$IFDEF OSX64}
  AVAudioBuffer = interface(NSObject)
    ['{5C7C3B31-2D64-485E-84C7-710CA2A65742}']
    function audioBufferList: PAudioBufferList; cdecl;
    function format: AVAudioFormat; cdecl;
    function mutableAudioBufferList: PAudioBufferList; cdecl;
  end;
  TAVAudioBuffer = class(TOCGenericImport<AVAudioBufferClass, AVAudioBuffer>) end;

  AVAudioPCMBufferClass = interface(AVAudioBufferClass)
    ['{077FAB76-0CAA-4270-8E56-71FF6B64701C}']
  end;

  AVAudioPCMBuffer = interface(AVAudioBuffer)
    ['{F269B6F0-198A-4C87-A699-7E12B7139AE8}']
    function floatChannelData: PPSingle; cdecl;
    function frameCapacity: AVAudioFrameCount; cdecl;
    function frameLength: AVAudioFrameCount; cdecl;
    [MethodName('initWithPCMFormat:frameCapacity:')]
    function initWithPCMFormat(format: AVAudioFormat; frameCapacity: AVAudioFrameCount): Pointer; cdecl;
    function int16ChannelData: PPInt16; cdecl;
    function int32ChannelData: PPInt32; cdecl;
    procedure setFrameLength(frameLength: AVAudioFrameCount); cdecl;
    function stride: NSUInteger; cdecl;
  end;
  TAVAudioPCMBuffer = class(TOCGenericImport<AVAudioPCMBufferClass, AVAudioPCMBuffer>) end;

  AVAudioCompressedBufferClass = interface(AVAudioBufferClass)
    ['{9D5F1DCF-A437-4585-93EE-5CC09A548A51}']
  end;

  AVAudioCompressedBuffer = interface(AVAudioBuffer)
    ['{C5336864-40AA-427A-84B1-28733879264A}']
    function byteCapacity: UInt32; cdecl;
    function byteLength: UInt32; cdecl;
    function data: Pointer; cdecl;
    [MethodName('initWithFormat:packetCapacity:maximumPacketSize:')]
    function initWithFormat(format: AVAudioFormat; packetCapacity: AVAudioPacketCount; maximumPacketSize: NSInteger): Pointer; overload; cdecl;
    [MethodName('initWithFormat:packetCapacity:')]
    function initWithFormat(format: AVAudioFormat; packetCapacity: AVAudioPacketCount): Pointer; overload; cdecl;
    function maximumPacketSize: NSInteger; cdecl;
    function packetCapacity: AVAudioPacketCount; cdecl;
    function packetCount: AVAudioPacketCount; cdecl;
    function packetDescriptions: PAudioStreamPacketDescription; cdecl;
    procedure setByteLength(byteLength: UInt32); cdecl;
    procedure setPacketCount(packetCount: AVAudioPacketCount); cdecl;
  end;
  TAVAudioCompressedBuffer = class(TOCGenericImport<AVAudioCompressedBufferClass, AVAudioCompressedBuffer>) end;

  AVAudioChannelLayoutClass = interface(NSObjectClass)
    ['{3860B099-07BD-4E3A-9C5F-D1736C33DA88}']
    {class} function layoutWithLayout(layout: PAudioChannelLayout): Pointer; cdecl;
    {class} function layoutWithLayoutTag(layoutTag: AudioChannelLayoutTag): Pointer; cdecl;
  end;

  AVAudioChannelLayout = interface(NSObject)
    ['{0C2119AC-CE36-4E74-A014-DC0AB28863D2}']
    function channelCount: AVAudioChannelCount; cdecl;
    function initWithLayout(layout: PAudioChannelLayout): Pointer; cdecl;
    function initWithLayoutTag(layoutTag: AudioChannelLayoutTag): Pointer; cdecl;
    function isEqual(&object: Pointer): Boolean; cdecl;
    function layout: PAudioChannelLayout; cdecl;
    function layoutTag: AudioChannelLayoutTag; cdecl;
  end;
  TAVAudioChannelLayout = class(TOCGenericImport<AVAudioChannelLayoutClass, AVAudioChannelLayout>) end;

  AVAudioConnectionPointClass = interface(NSObjectClass)
    ['{7F83FCB6-43A2-4FE4-B078-C2077FD48B6A}']
  end;

  AVAudioConnectionPoint = interface(NSObject)
    ['{A31B0C0C-0756-4018-A4CB-CA534D975535}']
    function bus: AVAudioNodeBus; cdecl;
    [MethodName('initWithNode:bus:')]
    function initWithNode(node: AVAudioNode; bus: AVAudioNodeBus): Pointer; cdecl;
    function node: AVAudioNode; cdecl;
  end;
  TAVAudioConnectionPoint = class(TOCGenericImport<AVAudioConnectionPointClass, AVAudioConnectionPoint>) end;

  AVAudioFormatClass = interface(NSObjectClass)
    ['{75FDAC9D-8CBC-41AB-97B1-B91999E63C0F}']
  end;

  AVAudioFormat = interface(NSObject)
    ['{9B981801-53DE-4773-81C0-DB93C9A8A141}']
    function channelCount: AVAudioChannelCount; cdecl;
    function channelLayout: AVAudioChannelLayout; cdecl;
    function commonFormat: AVAudioCommonFormat; cdecl;
    function formatDescription: CMAudioFormatDescriptionRef; cdecl;
    [MethodName('initStandardFormatWithSampleRate:channelLayout:')]
    function initStandardFormatWithSampleRate(sampleRate: Double; layout: AVAudioChannelLayout): Pointer; overload; cdecl;
    [MethodName('initStandardFormatWithSampleRate:channels:')]
    function initStandardFormatWithSampleRate(sampleRate: Double; channels: AVAudioChannelCount): Pointer; overload; cdecl;
    function initWithCMAudioFormatDescription(formatDescription: CMAudioFormatDescriptionRef): Pointer; cdecl;
    [MethodName('initWithCommonFormat:sampleRate:interleaved:channelLayout:')]
    function initWithCommonFormat(format: AVAudioCommonFormat; sampleRate: Double; interleaved: Boolean;
      layout: AVAudioChannelLayout): Pointer; overload; cdecl;
    [MethodName('initWithCommonFormat:sampleRate:channels:interleaved:')]
    function initWithCommonFormat(format: AVAudioCommonFormat; sampleRate: Double; channels: AVAudioChannelCount;
      interleaved: Boolean): Pointer; overload; cdecl;
    function initWithSettings(settings: NSDictionary): Pointer; cdecl;
    function initWithStreamDescription(asbd: PAudioStreamBasicDescription): Pointer; overload; cdecl;
    [MethodName('initWithStreamDescription:channelLayout:')]
    function initWithStreamDescription(asbd: PAudioStreamBasicDescription; layout: AVAudioChannelLayout): Pointer; overload; cdecl;
    function isEqual(&object: Pointer): Boolean; cdecl;
    function isInterleaved: Boolean; cdecl;
    function isStandard: Boolean; cdecl;
    function magicCookie: NSData; cdecl;
    function sampleRate: Double; cdecl;
    procedure setMagicCookie(magicCookie: NSData); cdecl;
    function settings: NSDictionary; cdecl;
    function streamDescription: PAudioStreamBasicDescription; cdecl;
  end;
  TAVAudioFormat = class(TOCGenericImport<AVAudioFormatClass, AVAudioFormat>) end;

  AVAudioConverterClass = interface(NSObjectClass)
    ['{229B8A20-01AA-4359-8C90-BCD57EA828E6}']
  end;

  AVAudioConverter = interface(NSObject)
    ['{321FDBB3-C236-42E4-916A-0156FF7E40C7}']
    function applicableEncodeBitRates: NSArray; cdecl;
    function applicableEncodeSampleRates: NSArray; cdecl;
    function availableEncodeBitRates: NSArray; cdecl;
    function availableEncodeChannelLayoutTags: NSArray; cdecl;
    function availableEncodeSampleRates: NSArray; cdecl;
    function bitRate: NSInteger; cdecl;
    function bitRateStrategy: NSString; cdecl;
    function channelMap: NSArray; cdecl;
    [MethodName('convertToBuffer:fromBuffer:error:')]
    function convertToBuffer(outputBuffer: AVAudioPCMBuffer; inputBuffer: AVAudioPCMBuffer; outError: PNSError): Boolean; overload; cdecl;
    [MethodName('convertToBuffer:error:withInputFromBlock:')]
    function convertToBuffer(outputBuffer: AVAudioBuffer; outError: PNSError;
      inputBlock: AVAudioConverterInputBlock): AVAudioConverterOutputStatus; overload; cdecl;
    function dither: Boolean; cdecl;
    function downmix: Boolean; cdecl;
    [MethodName('initFromFormat:toFormat:')]
    function initFromFormat(fromFormat: AVAudioFormat; toFormat: AVAudioFormat): Pointer; cdecl;
    function inputFormat: AVAudioFormat; cdecl;
    function magicCookie: NSData; cdecl;
    function maximumOutputPacketSize: NSInteger; cdecl;
    function outputFormat: AVAudioFormat; cdecl;
    function primeInfo: AVAudioConverterPrimeInfo; cdecl;
    function primeMethod: AVAudioConverterPrimeMethod; cdecl;
    procedure reset; cdecl;
    function sampleRateConverterAlgorithm: NSString; cdecl;
    function sampleRateConverterQuality: NSInteger; cdecl;
    procedure setBitRate(bitRate: NSInteger); cdecl;
    procedure setBitRateStrategy(bitRateStrategy: NSString); cdecl;
    procedure setChannelMap(channelMap: NSArray); cdecl;
    procedure setDither(dither: Boolean); cdecl;
    procedure setDownmix(downmix: Boolean); cdecl;
    procedure setMagicCookie(magicCookie: NSData); cdecl;
    procedure setPrimeInfo(primeInfo: AVAudioConverterPrimeInfo); cdecl;
    procedure setPrimeMethod(primeMethod: AVAudioConverterPrimeMethod); cdecl;
    procedure setSampleRateConverterAlgorithm(sampleRateConverterAlgorithm: NSString); cdecl;
    procedure setSampleRateConverterQuality(sampleRateConverterQuality: NSInteger); cdecl;
  end;
  TAVAudioConverter = class(TOCGenericImport<AVAudioConverterClass, AVAudioConverter>) end;

  AVAudioNodeClass = interface(NSObjectClass)
    ['{869DA31F-77B6-49CD-AA99-FCD96BBFBE58}']
  end;

  AVAudioNode = interface(NSObject)
    ['{DB7B92CB-C459-4B43-AEEB-A9684A26212C}']
    // [MethodName('AUAudioUnit:')]
    // function _AUAudioUnit: AUAudioUnit; cdecl; // Needs AudioToolbox
    function engine: AVAudioEngine; cdecl;
    function inputFormatForBus(bus: AVAudioNodeBus): AVAudioFormat; cdecl;
    [MethodName('installTapOnBus:bufferSize:format:block:')]
    procedure installTapOnBus(bus: AVAudioNodeBus; bufferSize: AVAudioFrameCount; format: AVAudioFormat; tapBlock: AVAudioNodeTapBlock); cdecl;
    function lastRenderTime: AVAudioTime; cdecl;
    function latency: NSTimeInterval; cdecl;
    function nameForInputBus(bus: AVAudioNodeBus): NSString; cdecl;
    function nameForOutputBus(bus: AVAudioNodeBus): NSString; cdecl;
    function numberOfInputs: NSUInteger; cdecl;
    function numberOfOutputs: NSUInteger; cdecl;
    function outputFormatForBus(bus: AVAudioNodeBus): AVAudioFormat; cdecl;
    function outputPresentationLatency: NSTimeInterval; cdecl;
    procedure removeTapOnBus(bus: AVAudioNodeBus); cdecl;
    procedure reset; cdecl;
  end;
  TAVAudioNode = class(TOCGenericImport<AVAudioNodeClass, AVAudioNode>) end;

  AVAudioMixing = interface(IObjectiveC)
    ['{9B30292C-5BC9-4BB6-B832-309DBF350193}']
    [MethodName('destinationForMixer:bus:')]
    function destinationForMixer(mixer: AVAudioNode; bus: AVAudioNodeBus): AVAudioMixingDestination; cdecl;
    procedure setVolume(volume: Single); cdecl;
    function volume: Single; cdecl;
  end;

  AVAudioStereoMixing = interface(IObjectiveC)
    ['{411A0FFE-63DA-4CCD-9EE9-9433D152CCA0}']
    function pan: Single; cdecl;
    procedure setPan(pan: Single); cdecl;
  end;

  AVAudio3DMixing = interface(IObjectiveC)
    ['{45EB06FE-691C-4374-8E1D-C1C48D30DD7C}']
    function obstruction: Single; cdecl;
    function occlusion: Single; cdecl;
    function position: AVAudio3DPoint; cdecl;
    function rate: Single; cdecl;
    function renderingAlgorithm: AVAudio3DMixingRenderingAlgorithm; cdecl;
    function reverbBlend: Single; cdecl;
    procedure setObstruction(obstruction: Single); cdecl;
    procedure setOcclusion(occlusion: Single); cdecl;
    procedure setPosition(position: AVAudio3DPoint); cdecl;
    procedure setRate(rate: Single); cdecl;
    procedure setRenderingAlgorithm(renderingAlgorithm: AVAudio3DMixingRenderingAlgorithm); cdecl;
    procedure setReverbBlend(reverbBlend: Single); cdecl;
  end;

  AVAudioMixingDestinationClass = interface(NSObjectClass)
    ['{DDF93710-C920-4078-959A-6A02B4C60E65}']
  end;

  AVAudioMixingDestination = interface(NSObject)
    ['{820F0950-0CAF-43A4-B886-182D4D85E493}']
    function connectionPoint: AVAudioConnectionPoint; cdecl;
  end;
  TAVAudioMixingDestination = class(TOCGenericImport<AVAudioMixingDestinationClass, AVAudioMixingDestination>) end;

  AVAudioIONodeClass = interface(AVAudioNodeClass)
    ['{01DD022C-75BA-41DE-A7EE-028D2BD349A5}']
  end;

  AVAudioIONode = interface(AVAudioNode)
    ['{B0F23B33-97EF-4FDF-8190-5D1D833B2CDC}']
    // function audioUnit: AudioUnit; cdecl; // Needs AudioToolbox
    function presentationLatency: NSTimeInterval; cdecl;
  end;
  TAVAudioIONode = class(TOCGenericImport<AVAudioIONodeClass, AVAudioIONode>) end;

  AVAudioInputNodeClass = interface(AVAudioIONodeClass)
    ['{BBDAC73D-65F2-47FD-8B0D-19AE16357F27}']
  end;

  AVAudioInputNode = interface(AVAudioIONode)
    ['{E052079B-CF6B-4CFA-8A7C-FE2842DAE40A}']
    [MethodName('setManualRenderingInputPCMFormat:inputBlock:')]
    function setManualRenderingInputPCMFormat(format: AVAudioFormat; block: AVAudioIONodeInputBlock): Boolean; cdecl;
  end;
  TAVAudioInputNode = class(TOCGenericImport<AVAudioInputNodeClass, AVAudioInputNode>) end;

  AVAudioOutputNodeClass = interface(AVAudioIONodeClass)
    ['{0C83DDA4-2CCC-4C35-9282-306273F67D88}']
  end;

  AVAudioOutputNode = interface(AVAudioIONode)
    ['{72BD40B8-F33B-498E-AD6E-05AEFBB63C55}']
  end;
  TAVAudioOutputNode = class(TOCGenericImport<AVAudioOutputNodeClass, AVAudioOutputNode>) end;

  AVAudioTimeClass = interface(NSObjectClass)
    ['{61641C60-EA42-4C1F-8410-FD5B51B4F150}']
    {class} function hostTimeForSeconds(seconds: NSTimeInterval): UInt64; cdecl;
    {class} function secondsForHostTime(hostTime: UInt64): NSTimeInterval; cdecl;
    [MethodName('timeWithAudioTimeStamp:sampleRate:')]
    {class} function timeWithAudioTimeStamp(ts: PAudioTimeStamp; sampleRate: Double): Pointer; cdecl;
    [MethodName('timeWithHostTime:sampleTime:atRate:')]
    {class} function timeWithHostTime(hostTime: UInt64; sampleTime: AVAudioFramePosition; sampleRate: Double): Pointer; overload; cdecl;
    {class} function timeWithHostTime(hostTime: UInt64): Pointer; overload; cdecl;
    [MethodName('timeWithSampleTime:atRate:')]
    {class} function timeWithSampleTime(sampleTime: AVAudioFramePosition; sampleRate: Double): Pointer; cdecl;
  end;

  AVAudioTime = interface(NSObject)
    ['{4D220809-DA15-47EA-B5D0-409701A166F3}']
    function audioTimeStamp: AudioTimeStamp; cdecl;
    function extrapolateTimeFromAnchor(anchorTime: AVAudioTime): AVAudioTime; cdecl;
    function hostTime: UInt64; cdecl;
    [MethodName('initWithAudioTimeStamp:sampleRate:')]
    function initWithAudioTimeStamp(ts: PAudioTimeStamp; sampleRate: Double): Pointer; cdecl;
    [MethodName('initWithHostTime:sampleTime:atRate:')]
    function initWithHostTime(hostTime: UInt64; sampleTime: AVAudioFramePosition; sampleRate: Double): Pointer; overload; cdecl;
    function initWithHostTime(hostTime: UInt64): Pointer; overload; cdecl;
    [MethodName('initWithSampleTime:atRate:')]
    function initWithSampleTime(sampleTime: AVAudioFramePosition; sampleRate: Double): Pointer; cdecl;
    function isHostTimeValid: Boolean; cdecl;
    function isSampleTimeValid: Boolean; cdecl;
    function sampleRate: Double; cdecl;
    function sampleTime: AVAudioFramePosition; cdecl;
  end;
  TAVAudioTime = class(TOCGenericImport<AVAudioTimeClass, AVAudioTime>) end;

  AVAudioEngineClass = interface(NSObjectClass)
    ['{EBF80CB1-FB75-44E4-897C-5790739B876D}']
  end;

  AVAudioEngine = interface(NSObject)
    ['{E840ABAF-E999-4A7B-9F4F-FA0473F59123}']
    procedure attachNode(node: AVAudioNode); cdecl;
    [MethodName('connect:toConnectionPoints:fromBus:format:')]
    procedure connect(sourceNode: AVAudioNode; destNodes: NSArray; sourceBus: AVAudioNodeBus; format: AVAudioFormat); overload; cdecl;
    [MethodName('connect:to:format:')]
    procedure connect(node1: AVAudioNode; node2: AVAudioNode; format: AVAudioFormat); overload; cdecl;
    [MethodName('connect:to:fromBus:toBus:format:')]
    procedure connect(node1: AVAudioNode; node2: AVAudioNode; bus1: AVAudioNodeBus; bus2: AVAudioNodeBus; format: AVAudioFormat); overload; cdecl;
    // [MethodName('connectMIDI:to:format:block:')]
    // procedure connectMIDI(sourceNode: AVAudioNode; destinationNode: AVAudioNode; format: AVAudioFormat;  // Needs AudioToolbox
    //   tapBlock: AUMIDIOutputEventBlock); overload; cdecl;
    // [MethodName('connectMIDI:toNodes:format:block:')]
    // procedure connectMIDI(sourceNode: AVAudioNode; destinationNodes: NSArray; format: AVAudioFormat; // Needs AudioToolbox
    //   tapBlock: AUMIDIOutputEventBlock); overload; cdecl;
    procedure detachNode(node: AVAudioNode); cdecl;
    procedure disableManualRenderingMode; cdecl;
    [MethodName('disconnectMIDI:from:')]
    procedure disconnectMIDI(sourceNode: AVAudioNode; destinationNode: AVAudioNode); overload; cdecl;
    [MethodName('disconnectMIDI:fromNodes:')]
    procedure disconnectMIDI(sourceNode: AVAudioNode; destinationNodes: NSArray); overload; cdecl;
    procedure disconnectMIDIInput(node: AVAudioNode); cdecl;
    procedure disconnectMIDIOutput(node: AVAudioNode); cdecl;
    procedure disconnectNodeInput(node: AVAudioNode); overload; cdecl;
    [MethodName('disconnectNodeInput:bus:')]
    procedure disconnectNodeInput(node: AVAudioNode; bus: AVAudioNodeBus); overload; cdecl;
    [MethodName('disconnectNodeOutput:bus:')]
    procedure disconnectNodeOutput(node: AVAudioNode; bus: AVAudioNodeBus); overload; cdecl;
    procedure disconnectNodeOutput(node: AVAudioNode); overload; cdecl;
    [MethodName('enableManualRenderingMode:format:maximumFrameCount:error:')]
    function enableManualRenderingMode(mode: AVAudioEngineManualRenderingMode; pcmFormat: AVAudioFormat; maximumFrameCount: AVAudioFrameCount;
      outError: PNSError): Boolean; cdecl;
    [MethodName('inputConnectionPointForNode:inputBus:')]
    function inputConnectionPointForNode(node: AVAudioNode; bus: AVAudioNodeBus): AVAudioConnectionPoint; cdecl;
    function inputNode: AVAudioInputNode; cdecl;
    function isAutoShutdownEnabled: Boolean; cdecl;
    function isInManualRenderingMode: Boolean; cdecl;
    function isRunning: Boolean; cdecl;
    function mainMixerNode: AVAudioMixerNode; cdecl;
    function manualRenderingBlock: AVAudioEngineManualRenderingBlock; cdecl;
    function manualRenderingFormat: AVAudioFormat; cdecl;
    function manualRenderingMaximumFrameCount: AVAudioFrameCount; cdecl;
    function manualRenderingMode: AVAudioEngineManualRenderingMode; cdecl;
    function manualRenderingSampleTime: AVAudioFramePosition; cdecl;
    // function musicSequence: MusicSequence; cdecl; // Needs AudioToolbox
    [MethodName('outputConnectionPointsForNode:outputBus:')]
    function outputConnectionPointsForNode(node: AVAudioNode; bus: AVAudioNodeBus): NSArray; cdecl;
    function outputNode: AVAudioOutputNode; cdecl;
    procedure pause; cdecl;
    procedure prepare; cdecl;
    [MethodName('renderOffline:toBuffer:error:')]
    function renderOffline(numberOfFrames: AVAudioFrameCount; buffer: AVAudioPCMBuffer; outError: PNSError): AVAudioEngineManualRenderingStatus; cdecl;
    procedure reset; cdecl;
    procedure setAutoShutdownEnabled(autoShutdownEnabled: Boolean); cdecl;
    // procedure setMusicSequence(musicSequence: MusicSequence); cdecl; // Needs AudioToolbox
    function startAndReturnError(outError: PNSError): Boolean; cdecl;
    procedure stop; cdecl;
  end;
  TAVAudioEngine = class(TOCGenericImport<AVAudioEngineClass, AVAudioEngine>) end;

  AVAudioUnitClass = interface(AVAudioNodeClass)
    ['{8EB92D33-0913-427F-8CCA-1427BFE26FC2}']
    // [MethodName('instantiateWithComponentDescription:options:completionHandler:')]
    // {class} procedure instantiateWithComponentDescription(audioComponentDescription: AudioComponentDescription; // Needs AudioToolbox
    //   options: AudioComponentInstantiationOptions; completionHandler: TAVAudioUnitBlockMethod1); cdecl;
  end;

  AVAudioUnit = interface(AVAudioNode)
    ['{90F68094-7E56-43F3-BAF1-D00F74B18B11}']
    // [MethodName('AUAudioUnit:')]
    // function _AUAudioUnit: AUAudioUnit; cdecl; // Needs AudioToolbox
    // function audioComponentDescription: AudioComponentDescription; cdecl; // Needs AudioToolbox
    // function audioUnit: AudioUnit; cdecl; // Needs AudioToolbox
    [MethodName('loadAudioUnitPresetAtURL:error:')]
    function loadAudioUnitPresetAtURL(url: NSURL; outError: PNSError): Boolean; cdecl;
    function manufacturerName: NSString; cdecl;
    function name: NSString; cdecl;
    function version: NSUInteger; cdecl;
  end;
  TAVAudioUnit = class(TOCGenericImport<AVAudioUnitClass, AVAudioUnit>) end;

  AVAudioUnitEffectClass = interface(AVAudioUnitClass)
    ['{140AF47F-0784-485A-9FEA-EF9EE159AEB3}']
  end;

  AVAudioUnitEffect = interface(AVAudioUnit)
    ['{C12F06C6-8D55-49D9-B128-2932B069DD3B}']
    function bypass: Boolean; cdecl;
    // function initWithAudioComponentDescription(audioComponentDescription: AudioComponentDescription): Pointer; cdecl; // Needs AudioToolbox
    procedure setBypass(bypass: Boolean); cdecl;
  end;
  TAVAudioUnitEffect = class(TOCGenericImport<AVAudioUnitEffectClass, AVAudioUnitEffect>) end;

  AVAudioUnitReverbClass = interface(AVAudioUnitEffectClass)
    ['{8E459056-8DC4-46D3-8C46-0A97DB64BDED}']
  end;

  AVAudioUnitReverb = interface(AVAudioUnitEffect)
    ['{8D2308BB-2C6B-470B-BD7C-229997D60792}']
    procedure loadFactoryPreset(preset: AVAudioUnitReverbPreset); cdecl;
    procedure setWetDryMix(wetDryMix: Single); cdecl;
    function wetDryMix: Single; cdecl;
  end;
  TAVAudioUnitReverb = class(TOCGenericImport<AVAudioUnitReverbClass, AVAudioUnitReverb>) end;

  AVAudioUnitEQFilterParametersClass = interface(NSObjectClass)
    ['{D62E44A3-A676-472D-92FA-661ECF735748}']
  end;

  AVAudioUnitEQFilterParameters = interface(NSObject)
    ['{BB184A1D-6BB9-4AF8-B74E-DD0904A8C67A}']
    function bandwidth: Single; cdecl;
    function bypass: Boolean; cdecl;
    function filterType: AVAudioUnitEQFilterType; cdecl;
    function frequency: Single; cdecl;
    function gain: Single; cdecl;
    procedure setBandwidth(bandwidth: Single); cdecl;
    procedure setBypass(bypass: Boolean); cdecl;
    procedure setFilterType(filterType: AVAudioUnitEQFilterType); cdecl;
    procedure setFrequency(frequency: Single); cdecl;
    procedure setGain(gain: Single); cdecl;
  end;
  TAVAudioUnitEQFilterParameters = class(TOCGenericImport<AVAudioUnitEQFilterParametersClass, AVAudioUnitEQFilterParameters>) end;

  AVAudioUnitEQClass = interface(AVAudioUnitEffectClass)
    ['{76E87DBA-A76E-4165-BA36-8A6E258219DF}']
  end;

  AVAudioUnitEQ = interface(AVAudioUnitEffect)
    ['{51529FCE-B178-4ECD-A57F-13A793C69F67}']
    function bands: NSArray; cdecl;
    function globalGain: Single; cdecl;
    function initWithNumberOfBands(numberOfBands: NSUInteger): Pointer; cdecl;
    procedure setGlobalGain(globalGain: Single); cdecl;
  end;
  TAVAudioUnitEQ = class(TOCGenericImport<AVAudioUnitEQClass, AVAudioUnitEQ>) end;

  AVAudioEnvironmentDistanceAttenuationParametersClass = interface(NSObjectClass)
    ['{C12E431C-B004-4A7B-A4BF-BF2DCA1BD8E4}']
  end;

  AVAudioEnvironmentDistanceAttenuationParameters = interface(NSObject)
    ['{DE8FCB49-B416-46F2-A80F-45CB4EA308A5}']
    function distanceAttenuationModel: AVAudioEnvironmentDistanceAttenuationModel; cdecl;
    function maximumDistance: Single; cdecl;
    function referenceDistance: Single; cdecl;
    function rolloffFactor: Single; cdecl;
    procedure setDistanceAttenuationModel(distanceAttenuationModel: AVAudioEnvironmentDistanceAttenuationModel); cdecl;
    procedure setMaximumDistance(maximumDistance: Single); cdecl;
    procedure setReferenceDistance(referenceDistance: Single); cdecl;
    procedure setRolloffFactor(rolloffFactor: Single); cdecl;
  end;
  TAVAudioEnvironmentDistanceAttenuationParameters = class(TOCGenericImport<AVAudioEnvironmentDistanceAttenuationParametersClass,
    AVAudioEnvironmentDistanceAttenuationParameters>) end;

  AVAudioEnvironmentReverbParametersClass = interface(NSObjectClass)
    ['{9FCD5117-817B-40CA-B4C4-58784B846346}']
  end;

  AVAudioEnvironmentReverbParameters = interface(NSObject)
    ['{2B39D506-38B7-4184-9467-D9AC1CFA90C0}']
    function enable: Boolean; cdecl;
    function filterParameters: AVAudioUnitEQFilterParameters; cdecl;
    function level: Single; cdecl;
    procedure loadFactoryReverbPreset(preset: AVAudioUnitReverbPreset); cdecl;
    procedure setEnable(enable: Boolean); cdecl;
    procedure setLevel(level: Single); cdecl;
  end;
  TAVAudioEnvironmentReverbParameters = class(TOCGenericImport<AVAudioEnvironmentReverbParametersClass, AVAudioEnvironmentReverbParameters>) end;

  AVAudioEnvironmentNodeClass = interface(AVAudioNodeClass)
    ['{CFC6DE75-879A-45FF-BA53-72B5A13C49A4}']
  end;

  AVAudioEnvironmentNode = interface(AVAudioNode)
    ['{36445671-4CE3-41BD-BD42-B9FCD8500D15}']
    function applicableRenderingAlgorithms: NSArray; cdecl;
    function distanceAttenuationParameters: AVAudioEnvironmentDistanceAttenuationParameters; cdecl;
    function listenerAngularOrientation: AVAudio3DAngularOrientation; cdecl;
    function listenerPosition: AVAudio3DPoint; cdecl;
    function listenerVectorOrientation: AVAudio3DVectorOrientation; cdecl;
    function nextAvailableInputBus: AVAudioNodeBus; cdecl;
    function outputVolume: Single; cdecl;
    function reverbParameters: AVAudioEnvironmentReverbParameters; cdecl;
    procedure setListenerAngularOrientation(listenerAngularOrientation: AVAudio3DAngularOrientation); cdecl;
    procedure setListenerPosition(listenerPosition: AVAudio3DPoint); cdecl;
    procedure setListenerVectorOrientation(listenerVectorOrientation: AVAudio3DVectorOrientation); cdecl;
    procedure setOutputVolume(outputVolume: Single); cdecl;
  end;
  TAVAudioEnvironmentNode = class(TOCGenericImport<AVAudioEnvironmentNodeClass, AVAudioEnvironmentNode>) end;

  AVAudioFileClass = interface(NSObjectClass)
    ['{05C814BD-8747-4AC6-9441-1E0FE663FD2C}']
  end;

  AVAudioFile = interface(NSObject)
    ['{81F5744A-B242-40E2-98AC-6855B6BD1467}']
    function fileFormat: AVAudioFormat; cdecl;
    function framePosition: AVAudioFramePosition; cdecl;
    [MethodName('initForReading:commonFormat:interleaved:error:')]
    function initForReading(fileURL: NSURL; format: AVAudioCommonFormat; interleaved: Boolean; outError: PNSError): Pointer; overload; cdecl;
    [MethodName('initForReading:error:')]
    function initForReading(fileURL: NSURL; outError: PNSError): Pointer; overload; cdecl;
    [MethodName('initForWriting:settings:commonFormat:interleaved:error:')]
    function initForWriting(fileURL: NSURL; settings: NSDictionary; format: AVAudioCommonFormat; interleaved: Boolean;
      outError: PNSError): Pointer; overload; cdecl;
    [MethodName('initForWriting:settings:error:')]
    function initForWriting(fileURL: NSURL; settings: NSDictionary; outError: PNSError): Pointer; overload; cdecl;
    function length: AVAudioFramePosition; cdecl;
    function processingFormat: AVAudioFormat; cdecl;
    [MethodName('readIntoBuffer:error:')]
    function readIntoBuffer(buffer: AVAudioPCMBuffer; outError: PNSError): Boolean; overload; cdecl;
    [MethodName('readIntoBuffer:frameCount:error:')]
    function readIntoBuffer(buffer: AVAudioPCMBuffer; frames: AVAudioFrameCount; outError: PNSError): Boolean; overload; cdecl;
    procedure setFramePosition(framePosition: AVAudioFramePosition); cdecl;
    function url: NSURL; cdecl;
    [MethodName('writeFromBuffer:error:')]
    function writeFromBuffer(buffer: AVAudioPCMBuffer; outError: PNSError): Boolean; cdecl;
  end;
  TAVAudioFile = class(TOCGenericImport<AVAudioFileClass, AVAudioFile>) end;

  AVAudioMixerNodeClass = interface(AVAudioNodeClass)
    ['{56250D12-7042-4D51-B99C-A378CCFC0290}']
  end;

  AVAudioMixerNode = interface(AVAudioNode)
    ['{F564162C-88C2-4B57-A6C0-6C93080D6F24}']
    function nextAvailableInputBus: AVAudioNodeBus; cdecl;
    function outputVolume: Single; cdecl;
    procedure setOutputVolume(outputVolume: Single); cdecl;
  end;
  TAVAudioMixerNode = class(TOCGenericImport<AVAudioMixerNodeClass, AVAudioMixerNode>) end;

  AVAudioPlayerNodeClass = interface(AVAudioNodeClass)
    ['{5FB83D53-0EE1-4649-9447-7097405E02A4}']
  end;

  AVAudioPlayerNode = interface(AVAudioNode)
    ['{1ECA917E-4D68-4E60-AB82-454ACCCECC2B}']
    function isPlaying: Boolean; cdecl;
    function nodeTimeForPlayerTime(playerTime: AVAudioTime): AVAudioTime; cdecl;
    procedure pause; cdecl;
    procedure play; cdecl;
    procedure playAtTime(when: AVAudioTime); cdecl;
    function playerTimeForNodeTime(nodeTime: AVAudioTime): AVAudioTime; cdecl;
    procedure prepareWithFrameCount(frameCount: AVAudioFrameCount); cdecl;
    [MethodName('scheduleBuffer:completionHandler:')]
    procedure scheduleBuffer(buffer: AVAudioPCMBuffer; completionHandler: AVAudioNodeCompletionHandler); overload; cdecl;
    [MethodName('scheduleBuffer:atTime:options:completionCallbackType:completionHandler:')]
    procedure scheduleBuffer(buffer: AVAudioPCMBuffer; when: AVAudioTime; options: AVAudioPlayerNodeBufferOptions;
      callbackType: AVAudioPlayerNodeCompletionCallbackType; completionHandler: AVAudioPlayerNodeCompletionHandler); overload; cdecl;
    [MethodName('scheduleBuffer:atTime:options:completionHandler:')]
    procedure scheduleBuffer(buffer: AVAudioPCMBuffer; when: AVAudioTime; options: AVAudioPlayerNodeBufferOptions;
      completionHandler: AVAudioNodeCompletionHandler); overload; cdecl;
    [MethodName('scheduleBuffer:completionCallbackType:completionHandler:')]
    procedure scheduleBuffer(buffer: AVAudioPCMBuffer; callbackType: AVAudioPlayerNodeCompletionCallbackType;
      completionHandler: AVAudioPlayerNodeCompletionHandler); overload; cdecl;
    [MethodName('scheduleFile:atTime:completionCallbackType:completionHandler:')]
    procedure scheduleFile(&file: AVAudioFile; when: AVAudioTime; callbackType: AVAudioPlayerNodeCompletionCallbackType;
      completionHandler: AVAudioPlayerNodeCompletionHandler); overload; cdecl;
    [MethodName('scheduleFile:atTime:completionHandler:')]
    procedure scheduleFile(&file: AVAudioFile; when: AVAudioTime; completionHandler: AVAudioNodeCompletionHandler); overload; cdecl;
    [MethodName('scheduleSegment:startingFrame:frameCount:atTime:completionHandler:')]
    procedure scheduleSegment(&file: AVAudioFile; startFrame: AVAudioFramePosition; numberFrames: AVAudioFrameCount; when: AVAudioTime;
      completionHandler: AVAudioNodeCompletionHandler); overload; cdecl;
    [MethodName('scheduleSegment:startingFrame:frameCount:atTime:completionCallbackType:completionHandler:')]
    procedure scheduleSegment(&file: AVAudioFile; startFrame: AVAudioFramePosition; numberFrames: AVAudioFrameCount; when: AVAudioTime;
      callbackType: AVAudioPlayerNodeCompletionCallbackType; completionHandler: AVAudioPlayerNodeCompletionHandler); overload; cdecl;
    procedure stop; cdecl;
  end;
  TAVAudioPlayerNode = class(TOCGenericImport<AVAudioPlayerNodeClass, AVAudioPlayerNode>) end;

  AVAudioSequencerClass = interface(NSObjectClass)
    ['{115299DE-0616-4AE7-BB6E-6B47759550D8}']
  end;

  AVAudioSequencer = interface(NSObject)
    ['{3E0B6B6F-5691-470E-97A4-CD788153046A}']
    [MethodName('beatsForHostTime:error:')]
    function beatsForHostTime(inHostTime: UInt64; outError: PNSError): AVMusicTimeStamp; cdecl;
    function beatsForSeconds(seconds: NSTimeInterval): AVMusicTimeStamp; cdecl;
    function currentPositionInBeats: NSTimeInterval; cdecl;
    function currentPositionInSeconds: NSTimeInterval; cdecl;
    [MethodName('dataWithSMPTEResolution:error:')]
    function dataWithSMPTEResolution(SMPTEResolution: NSInteger; outError: PNSError): NSData; cdecl;
    [MethodName('hostTimeForBeats:error:')]
    function hostTimeForBeats(inBeats: AVMusicTimeStamp; outError: PNSError): UInt64; cdecl;
    function initWithAudioEngine(engine: AVAudioEngine): Pointer; cdecl;
    function isPlaying: Boolean; cdecl;
    [MethodName('loadFromData:options:error:')]
    function loadFromData(data: NSData; options: AVMusicSequenceLoadOptions; outError: PNSError): Boolean; cdecl;
    [MethodName('loadFromURL:options:error:')]
    function loadFromURL(fileURL: NSURL; options: AVMusicSequenceLoadOptions; outError: PNSError): Boolean; cdecl;
    procedure prepareToPlay; cdecl;
    function rate: Single; cdecl;
    function secondsForBeats(beats: AVMusicTimeStamp): NSTimeInterval; cdecl;
    procedure setCurrentPositionInBeats(currentPositionInBeats: NSTimeInterval); cdecl;
    procedure setCurrentPositionInSeconds(currentPositionInSeconds: NSTimeInterval); cdecl;
    procedure setRate(rate: Single); cdecl;
    function startAndReturnError(outError: PNSError): Boolean; cdecl;
    procedure stop; cdecl;
    function tempoTrack: AVMusicTrack; cdecl;
    function tracks: NSArray; cdecl;
    function userInfo: NSDictionary; cdecl;
    [MethodName('writeToURL:SMPTEResolution:replaceExisting:error:')]
    function writeToURL(fileURL: NSURL; resolution: NSInteger; replace: Boolean; outError: PNSError): Boolean; cdecl;
  end;
  TAVAudioSequencer = class(TOCGenericImport<AVAudioSequencerClass, AVAudioSequencer>) end;

  AVMusicTrackClass = interface(NSObjectClass)
    ['{72532406-3D5D-4712-B1D6-04180E478776}']
  end;

  AVMusicTrack = interface(NSObject)
    ['{5D1042CC-4F03-472C-8F67-C3A744ACBCAD}']
    function destinationAudioUnit: AVAudioUnit; cdecl;
    function destinationMIDIEndpoint: MIDIEndpointRef; cdecl;
    function isLoopingEnabled: Boolean; cdecl;
    function isMuted: Boolean; cdecl;
    function isSoloed: Boolean; cdecl;
    function lengthInBeats: AVMusicTimeStamp; cdecl;
    function lengthInSeconds: NSTimeInterval; cdecl;
    function loopRange: AVBeatRange; cdecl;
    function numberOfLoops: NSInteger; cdecl;
    function offsetTime: AVMusicTimeStamp; cdecl;
    procedure setDestinationAudioUnit(destinationAudioUnit: AVAudioUnit); cdecl;
    procedure setDestinationMIDIEndpoint(destinationMIDIEndpoint: MIDIEndpointRef); cdecl;
    procedure setLengthInBeats(lengthInBeats: AVMusicTimeStamp); cdecl;
    procedure setLengthInSeconds(lengthInSeconds: NSTimeInterval); cdecl;
    procedure setLoopingEnabled(loopingEnabled: Boolean); cdecl;
    procedure setLoopRange(loopRange: AVBeatRange); cdecl;
    procedure setMuted(muted: Boolean); cdecl;
    procedure setNumberOfLoops(numberOfLoops: NSInteger); cdecl;
    procedure setOffsetTime(offsetTime: AVMusicTimeStamp); cdecl;
    procedure setSoloed(soloed: Boolean); cdecl;
    function timeResolution: NSUInteger; cdecl;
  end;
  TAVMusicTrack = class(TOCGenericImport<AVMusicTrackClass, AVMusicTrack>) end;

  AVAudioUnitComponentClass = interface(NSObjectClass)
    ['{A497BEC3-BE56-46FA-9489-6F4FB8F47192}']
  end;

  AVAudioUnitComponent = interface(NSObject)
    ['{21DFC11E-F9EB-43CD-BDD7-C450BEE9DF8F}']
    function allTagNames: NSArray; cdecl;
    // function audioComponent: AudioComponent; cdecl; // Needs AudioToolbox
    // function audioComponentDescription: AudioComponentDescription; cdecl; // Needs AudioToolbox
    function availableArchitectures: NSArray; cdecl;
    function componentURL: NSURL; cdecl;
    function configurationDictionary: NSDictionary; cdecl;
    function hasCustomView: Boolean; cdecl;
    function hasMIDIInput: Boolean; cdecl;
    function hasMIDIOutput: Boolean; cdecl;
    function icon: NSImage; cdecl;
    function iconURL: NSURL; cdecl;
    function isSandboxSafe: Boolean; cdecl;
    function localizedTypeName: NSString; cdecl;
    function manufacturerName: NSString; cdecl;
    function name: NSString; cdecl;
    function passesAUVal: Boolean; cdecl;
    procedure setUserTagNames(userTagNames: NSArray); cdecl;
    [MethodName('supportsNumberInputChannels:outputChannels:')]
    function supportsNumberInputChannels(numInputChannels: NSInteger; numOutputChannels: NSInteger): Boolean; cdecl;
    function typeName: NSString; cdecl;
    function userTagNames: NSArray; cdecl;
    function version: NSUInteger; cdecl;
    function versionString: NSString; cdecl;
  end;
  TAVAudioUnitComponent = class(TOCGenericImport<AVAudioUnitComponentClass, AVAudioUnitComponent>) end;

  AVAudioUnitComponentManagerClass = interface(NSObjectClass)
    ['{1242A3C9-5D46-497A-9A25-8E757A05BC63}']
    {class} function sharedAudioUnitComponentManager: Pointer; cdecl;
  end;

  AVAudioUnitComponentManager = interface(NSObject)
    ['{B6EF4AB9-6711-4BD0-B3B9-F3349B4921F9}']
    // function componentsMatchingDescription(desc: AudioComponentDescription): NSArray; cdecl; // Needs AudioToolbox
    function componentsMatchingPredicate(predicate: NSPredicate): NSArray; cdecl;
    function componentsPassingTest(testHandler: TAVAudioUnitComponentManagerBlockMethod1): NSArray; cdecl;
    function standardLocalizedTagNames: NSArray; cdecl;
    function tagNames: NSArray; cdecl;
  end;
  TAVAudioUnitComponentManager = class(TOCGenericImport<AVAudioUnitComponentManagerClass, AVAudioUnitComponentManager>) end;

  AVAudioUnitDelayClass = interface(AVAudioUnitEffectClass)
    ['{205F2E01-EB45-41BA-8B7B-C0200B148D92}']
  end;

  AVAudioUnitDelay = interface(AVAudioUnitEffect)
    ['{A34EC6D1-832C-453F-A438-783884D5C8E1}']
    function delayTime: NSTimeInterval; cdecl;
    function feedback: Single; cdecl;
    function lowPassCutoff: Single; cdecl;
    procedure setDelayTime(delayTime: NSTimeInterval); cdecl;
    procedure setFeedback(feedback: Single); cdecl;
    procedure setLowPassCutoff(lowPassCutoff: Single); cdecl;
    procedure setWetDryMix(wetDryMix: Single); cdecl;
    function wetDryMix: Single; cdecl;
  end;
  TAVAudioUnitDelay = class(TOCGenericImport<AVAudioUnitDelayClass, AVAudioUnitDelay>) end;

  AVAudioUnitDistortionClass = interface(AVAudioUnitEffectClass)
    ['{0231E489-55C7-4181-A40E-368559C07CD5}']
  end;

  AVAudioUnitDistortion = interface(AVAudioUnitEffect)
    ['{21B33658-4AF0-484E-BACD-0EE3318FB264}']
    procedure loadFactoryPreset(preset: AVAudioUnitDistortionPreset); cdecl;
    function preGain: Single; cdecl;
    procedure setPreGain(preGain: Single); cdecl;
    procedure setWetDryMix(wetDryMix: Single); cdecl;
    function wetDryMix: Single; cdecl;
  end;
  TAVAudioUnitDistortion = class(TOCGenericImport<AVAudioUnitDistortionClass, AVAudioUnitDistortion>) end;

  AVAudioUnitGeneratorClass = interface(AVAudioUnitClass)
    ['{A9B7C86C-8492-449C-9985-E412F086611E}']
  end;

  AVAudioUnitGenerator = interface(AVAudioUnit)
    ['{CDA4F5A9-C681-4848-8D67-69023A7BCA61}']
    function bypass: Boolean; cdecl;
    // function initWithAudioComponentDescription(audioComponentDescription: AudioComponentDescription): Pointer; cdecl; // Needs AudioToolbox
    procedure setBypass(bypass: Boolean); cdecl;
  end;
  TAVAudioUnitGenerator = class(TOCGenericImport<AVAudioUnitGeneratorClass, AVAudioUnitGenerator>) end;

  AVAudioUnitMIDIInstrumentClass = interface(AVAudioUnitClass)
    ['{AB583DE8-B600-409A-A0A9-BF577B067BCF}']
  end;

  AVAudioUnitMIDIInstrument = interface(AVAudioUnit)
    ['{34F8C45C-3C56-4DB4-BBC2-30420FC96B44}']
    // function initWithAudioComponentDescription(description: AudioComponentDescription): Pointer; cdecl; // Needs AudioToolbox
    [MethodName('sendController:withValue:onChannel:')]
    procedure sendController(controller: UInt8; value: UInt8; channel: UInt8); cdecl;
    [MethodName('sendMIDIEvent:data1:data2:')]
    procedure sendMIDIEvent(midiStatus: UInt8; data1: UInt8; data2: UInt8); overload; cdecl;
    [MethodName('sendMIDIEvent:data1:')]
    procedure sendMIDIEvent(midiStatus: UInt8; data1: UInt8); overload; cdecl;
    procedure sendMIDISysExEvent(midiData: NSData); cdecl;
    [MethodName('sendPitchBend:onChannel:')]
    procedure sendPitchBend(pitchbend: UInt16; channel: UInt8); cdecl;
    [MethodName('sendPressure:onChannel:')]
    procedure sendPressure(pressure: UInt8; channel: UInt8); cdecl;
    [MethodName('sendPressureForKey:withValue:onChannel:')]
    procedure sendPressureForKey(key: UInt8; value: UInt8; channel: UInt8); cdecl;
    [MethodName('sendProgramChange:bankMSB:bankLSB:onChannel:')]
    procedure sendProgramChange(&program: UInt8; bankMSB: UInt8; bankLSB: UInt8; channel: UInt8); overload; cdecl;
    [MethodName('sendProgramChange:onChannel:')]
    procedure sendProgramChange(&program: UInt8; channel: UInt8); overload; cdecl;
    [MethodName('startNote:withVelocity:onChannel:')]
    procedure startNote(note: UInt8; velocity: UInt8; channel: UInt8); cdecl;
    [MethodName('stopNote:onChannel:')]
    procedure stopNote(note: UInt8; channel: UInt8); cdecl;
  end;
  TAVAudioUnitMIDIInstrument = class(TOCGenericImport<AVAudioUnitMIDIInstrumentClass, AVAudioUnitMIDIInstrument>) end;

  AVAudioUnitSamplerClass = interface(AVAudioUnitMIDIInstrumentClass)
    ['{8CF929EC-1195-4650-A844-59F42C7698DA}']
  end;

  AVAudioUnitSampler = interface(AVAudioUnitMIDIInstrument)
    ['{A6A2418F-09AD-4A48-A781-E83C4EBF5D16}']
    function globalTuning: Single; cdecl;
    [MethodName('loadAudioFilesAtURLs:error:')]
    function loadAudioFilesAtURLs(audioFiles: NSArray; outError: PNSError): Boolean; cdecl;
    [MethodName('loadInstrumentAtURL:error:')]
    function loadInstrumentAtURL(instrumentURL: NSURL; outError: PNSError): Boolean; cdecl;
    [MethodName('loadSoundBankInstrumentAtURL:program:bankMSB:bankLSB:error:')]
    function loadSoundBankInstrumentAtURL(bankURL: NSURL; &program: UInt8; bankMSB: UInt8; bankLSB: UInt8; outError: PNSError): Boolean; cdecl;
    function masterGain: Single; cdecl;
    procedure setGlobalTuning(globalTuning: Single); cdecl;
    procedure setMasterGain(masterGain: Single); cdecl;
    procedure setStereoPan(stereoPan: Single); cdecl;
    function stereoPan: Single; cdecl;
  end;
  TAVAudioUnitSampler = class(TOCGenericImport<AVAudioUnitSamplerClass, AVAudioUnitSampler>) end;

  AVAudioUnitTimeEffectClass = interface(AVAudioUnitClass)
    ['{D77D00B4-1328-48EC-BBF9-3B556F91F54D}']
  end;

  AVAudioUnitTimeEffect = interface(AVAudioUnit)
    ['{C5D82D2C-A556-4CA3-9E88-D0447E175EEF}']
    function bypass: Boolean; cdecl;
    // function initWithAudioComponentDescription(audioComponentDescription: AudioComponentDescription): Pointer; cdecl; // Needs AudioToolbox
    procedure setBypass(bypass: Boolean); cdecl;
  end;
  TAVAudioUnitTimeEffect = class(TOCGenericImport<AVAudioUnitTimeEffectClass, AVAudioUnitTimeEffect>) end;

  AVAudioUnitTimePitchClass = interface(AVAudioUnitTimeEffectClass)
    ['{4228EE79-580F-4AAE-9076-3B4ABE6E1EBD}']
  end;

  AVAudioUnitTimePitch = interface(AVAudioUnitTimeEffect)
    ['{B57CA424-1FF6-4547-9CED-73CAEC9BF47A}']
    function overlap: Single; cdecl;
    function pitch: Single; cdecl;
    function rate: Single; cdecl;
    procedure setOverlap(overlap: Single); cdecl;
    procedure setPitch(pitch: Single); cdecl;
    procedure setRate(rate: Single); cdecl;
  end;
  TAVAudioUnitTimePitch = class(TOCGenericImport<AVAudioUnitTimePitchClass, AVAudioUnitTimePitch>) end;

  AVAudioUnitVarispeedClass = interface(AVAudioUnitTimeEffectClass)
    ['{E782B040-14A0-45FF-B3CB-56FE1A6D7D15}']
  end;

  AVAudioUnitVarispeed = interface(AVAudioUnitTimeEffect)
    ['{FEB4C267-FD4B-40E2-9563-5670196C93AC}']
    function rate: Single; cdecl;
    procedure setRate(rate: Single); cdecl;
  end;
  TAVAudioUnitVarispeed = class(TOCGenericImport<AVAudioUnitVarispeedClass, AVAudioUnitVarispeed>) end;

  AVMIDIPlayerClass = interface(NSObjectClass)
    ['{41DE35A9-71BA-408E-87AA-5B8AB2DADB6A}']
  end;

  AVMIDIPlayer = interface(NSObject)
    ['{1E635DBB-775D-481C-9EF3-68E1D3D79176}']
    function currentPosition: NSTimeInterval; cdecl;
    function duration: NSTimeInterval; cdecl;
    [MethodName('initWithContentsOfURL:soundBankURL:error:')]
    function initWithContentsOfURL(inURL: NSURL; bankURL: NSURL; outError: PNSError): Pointer; cdecl;
    [MethodName('initWithData:soundBankURL:error:')]
    function initWithData(data: NSData; bankURL: NSURL; outError: PNSError): Pointer; cdecl;
    function isPlaying: Boolean; cdecl;
    procedure play(completionHandler: AVMIDIPlayerCompletionHandler); cdecl;
    procedure prepareToPlay; cdecl;
    function rate: Single; cdecl;
    procedure setCurrentPosition(currentPosition: NSTimeInterval); cdecl;
    procedure setRate(rate: Single); cdecl;
    procedure stop; cdecl;
  end;
  TAVMIDIPlayer = class(TOCGenericImport<AVMIDIPlayerClass, AVMIDIPlayer>) end;

  AVSpeechSynthesisVoiceClass = interface(NSObjectClass)
    ['{19B464C9-B79C-4F90-863A-BEE391365F54}']
    {class} function currentLanguageCode: NSString; cdecl;
    {class} function speechVoices: NSArray; cdecl;
    {class} function voiceWithIdentifier(identifier: NSString): AVSpeechSynthesisVoice; cdecl;
    {class} function voiceWithLanguage(languageCode: NSString): AVSpeechSynthesisVoice; cdecl;
  end;

  AVSpeechSynthesisVoice = interface(NSObject)
    ['{96A6AE61-71E9-4E73-9F9E-7274D8B2DC59}']
    function identifier: NSString; cdecl;
    function language: NSString; cdecl;
    function name: NSString; cdecl;
    function quality: AVSpeechSynthesisVoiceQuality; cdecl;
  end;
  TAVSpeechSynthesisVoice = class(TOCGenericImport<AVSpeechSynthesisVoiceClass, AVSpeechSynthesisVoice>) end;

  AVSpeechUtteranceClass = interface(NSObjectClass)
    ['{0F8BC819-91C8-4949-973E-E0B7C99A984C}']
    {class} function speechUtteranceWithAttributedString(&string: NSAttributedString): Pointer; cdecl;
    {class} function speechUtteranceWithString(&string: NSString): Pointer; cdecl;
  end;

  AVSpeechUtterance = interface(NSObject)
    ['{21B6CCA6-C064-48CB-8554-7639007D22EA}']
    function attributedSpeechString: NSAttributedString; cdecl;
    function initWithAttributedString(&string: NSAttributedString): Pointer; cdecl;
    function initWithString(&string: NSString): Pointer; cdecl;
    function pitchMultiplier: Single; cdecl;
    function postUtteranceDelay: NSTimeInterval; cdecl;
    function preUtteranceDelay: NSTimeInterval; cdecl;
    function rate: Single; cdecl;
    procedure setPitchMultiplier(pitchMultiplier: Single); cdecl;
    procedure setPostUtteranceDelay(postUtteranceDelay: NSTimeInterval); cdecl;
    procedure setPreUtteranceDelay(preUtteranceDelay: NSTimeInterval); cdecl;
    procedure setRate(rate: Single); cdecl;
    procedure setVoice(voice: AVSpeechSynthesisVoice); cdecl;
    procedure setVolume(volume: Single); cdecl;
    function speechString: NSString; cdecl;
    function voice: AVSpeechSynthesisVoice; cdecl;
    function volume: Single; cdecl;
  end;
  TAVSpeechUtterance = class(TOCGenericImport<AVSpeechUtteranceClass, AVSpeechUtterance>) end;

  AVSpeechSynthesizerClass = interface(NSObjectClass)
    ['{771708D5-6B77-4AEF-97AB-47C9B2234030}']
  end;

  AVSpeechSynthesizer = interface(NSObject)
    ['{41D28B25-81D2-4BD7-B2CA-66A6B7338CD0}']
    function continueSpeaking: Boolean; cdecl;
    function delegate: Pointer; cdecl;
    function isPaused: Boolean; cdecl;
    function isSpeaking: Boolean; cdecl;
    function outputChannels: NSArray; cdecl;
    function pauseSpeakingAtBoundary(boundary: AVSpeechBoundary): Boolean; cdecl;
    procedure setDelegate(delegate: Pointer); cdecl;
    procedure setOutputChannels(outputChannels: NSArray); cdecl;
    procedure speakUtterance(utterance: AVSpeechUtterance); cdecl;
    function stopSpeakingAtBoundary(boundary: AVSpeechBoundary): Boolean; cdecl;
  end;
  TAVSpeechSynthesizer = class(TOCGenericImport<AVSpeechSynthesizerClass, AVSpeechSynthesizer>) end;

  AVSpeechSynthesizerDelegate = interface(IObjectiveC)
    ['{D3433DD7-6822-45CB-84B2-06CBFF541B6C}']
    [MethodName('speechSynthesizer:willSpeakRangeOfSpeechString:utterance:')]
    procedure speechSynthesizer(synthesizer: AVSpeechSynthesizer; characterRange: NSRange; utterance: AVSpeechUtterance); overload; cdecl;
    [MethodName('speechSynthesizer:didStartSpeechUtterance:')]
    procedure speechSynthesizer(synthesizer: AVSpeechSynthesizer; utterance: AVSpeechUtterance); overload; cdecl;
    [MethodName('speechSynthesizer:didCancelSpeechUtterance:')]
    procedure speechSynthesizerDidCancelSpeechUtterance(synthesizer: AVSpeechSynthesizer; utterance: AVSpeechUtterance); cdecl;
    [MethodName('speechSynthesizer:didContinueSpeechUtterance:')]
    procedure speechSynthesizerDidContinueSpeechUtterance(synthesizer: AVSpeechSynthesizer; utterance: AVSpeechUtterance); cdecl;
    [MethodName('speechSynthesizer:didFinishSpeechUtterance:')]
    procedure speechSynthesizerDidFinishSpeechUtterance(synthesizer: AVSpeechSynthesizer; utterance: AVSpeechUtterance); cdecl;
    [MethodName('speechSynthesizer:didPauseSpeechUtterance:')]
    procedure speechSynthesizerDidPauseSpeechUtterance(synthesizer: AVSpeechSynthesizer; utterance: AVSpeechUtterance); cdecl;
  end;

  AVContentKeySessionClass = interface(NSObjectClass)
    ['{ADEE9E08-9207-4060-A13C-88AF2DED67AB}']
    [MethodName('contentKeySessionWithKeySystem:storageDirectoryAtURL:')]
    {class} function contentKeySessionWithKeySystem(keySystem: AVContentKeySystem; storageURL: NSURL): Pointer; overload; cdecl;
    {class} function contentKeySessionWithKeySystem(keySystem: AVContentKeySystem): Pointer; overload; cdecl;
    [MethodName('pendingExpiredSessionReportsWithAppIdentifier:storageDirectoryAtURL:')]
    {class} function pendingExpiredSessionReportsWithAppIdentifier(appIdentifier: NSData; storageURL: NSURL): NSArray; cdecl;
    [MethodName('removePendingExpiredSessionReports:withAppIdentifier:storageDirectoryAtURL:')]
    {class} procedure removePendingExpiredSessionReports(expiredSessionReports: NSArray; appIdentifier: NSData; storageURL: NSURL); cdecl;
  end;

  AVContentKeySession = interface(NSObject)
    ['{3BE6B4D1-16CD-40A4-ADDE-79D43B280C20}']
    procedure addContentKeyRecipient(recipient: Pointer); cdecl;
    function contentKeyRecipients: NSArray; cdecl;
    function contentProtectionSessionIdentifier: NSData; cdecl;
    function delegate: Pointer; cdecl;
    function delegateQueue: dispatch_queue_t; cdecl;
    procedure expire; cdecl;
    function keySystem: AVContentKeySystem; cdecl;
    [MethodName('makeSecureTokenForExpirationDateOfPersistableContentKey:completionHandler:')]
    procedure makeSecureTokenForExpirationDateOfPersistableContentKey(persistableContentKeyData: NSData;
      handler: TAVContentKeySessionBlockMethod1); cdecl;
    [MethodName('processContentKeyRequestWithIdentifier:initializationData:options:')]
    procedure processContentKeyRequestWithIdentifier(identifier: Pointer; initializationData: NSData; options: NSDictionary); cdecl;
    procedure removeContentKeyRecipient(recipient: Pointer); cdecl;
    procedure renewExpiringResponseDataForContentKeyRequest(contentKeyRequest: AVContentKeyRequest); cdecl;
    [MethodName('setDelegate:queue:')]
    procedure setDelegate(delegate: Pointer; delegateQueue: dispatch_queue_t); cdecl;
    function storageURL: NSURL; cdecl;
  end;
  TAVContentKeySession = class(TOCGenericImport<AVContentKeySessionClass, AVContentKeySession>) end;

  AVContentKeySessionDelegate = interface(IObjectiveC)
    ['{3066C8DB-B31C-4339-A49D-912BA193660C}']
    [MethodName('contentKeySession:didUpdatePersistableContentKey:forContentKeyIdentifier:')]
    procedure contentKeySession(session: AVContentKeySession; persistableContentKey: NSData; keyIdentifier: Pointer); overload; cdecl;
    [MethodName('contentKeySession:contentKeyRequest:didFailWithError:')]
    procedure contentKeySession(session: AVContentKeySession; keyRequest: AVContentKeyRequest; err: NSError); overload; cdecl;
    [MethodName('contentKeySession:shouldRetryContentKeyRequest:reason:')]
    function contentKeySession(session: AVContentKeySession; keyRequest: AVContentKeyRequest;
      retryReason: AVContentKeyRequestRetryReason): Boolean; overload; cdecl;
    [MethodName('contentKeySession:didProvideContentKeyRequest:')]
    procedure contentKeySession(session: AVContentKeySession; keyRequest: AVContentKeyRequest); overload; cdecl;
    [MethodName('contentKeySession:didProvidePersistableContentKeyRequest:')]
    procedure contentKeySession(session: AVContentKeySession; keyRequest: AVPersistableContentKeyRequest); overload; cdecl;
    [MethodName('contentKeySession:contentKeyRequestDidSucceed:')]
    procedure contentKeySessionContentKeyRequestDidSucceed(session: AVContentKeySession; keyRequest: AVContentKeyRequest); cdecl;
    procedure contentKeySessionContentProtectionSessionIdentifierDidChange(session: AVContentKeySession); cdecl;
    procedure contentKeySessionDidGenerateExpiredSessionReport(session: AVContentKeySession); cdecl;
    [MethodName('contentKeySession:didProvideRenewingContentKeyRequest:')]
    procedure contentKeySessionDidProvideRenewingContentKeyRequest(session: AVContentKeySession; keyRequest: AVContentKeyRequest); cdecl;
  end;

  AVContentKeyRequestClass = interface(NSObjectClass)
    ['{C104EC91-D77F-44F7-86D7-7A1A7D263A7D}']
  end;

  AVContentKeyRequest = interface(NSObject)
    ['{C8B7119A-F57E-449C-BAAE-332410F7A82B}']
    function canProvidePersistableContentKey: Boolean; cdecl;
    function error: NSError; cdecl;
    function identifier: Pointer; cdecl;
    function initializationData: NSData; cdecl;
    [MethodName('makeStreamingContentKeyRequestDataForApp:contentIdentifier:options:completionHandler:')]
    procedure makeStreamingContentKeyRequestDataForApp(appIdentifier: NSData; contentIdentifier: NSData; options: NSDictionary;
      handler: TAVContentKeyRequestBlockMethod1); cdecl;
    procedure processContentKeyResponse(keyResponse: AVContentKeyResponse); cdecl;
    procedure processContentKeyResponseError(error: NSError); cdecl;
    function renewsExpiringResponseData: Boolean; cdecl;
    procedure respondByRequestingPersistableContentKeyRequest; cdecl; // API_DEPRECATED("Use respondByRequestingPersistableContentKeyRequestAndReturnError: instead.", ios(10.3, 11.2))
    function respondByRequestingPersistableContentKeyRequestAndReturnError(outError: PNSError): Boolean; cdecl;
    function status: AVContentKeyRequestStatus; cdecl;
  end;
  TAVContentKeyRequest = class(TOCGenericImport<AVContentKeyRequestClass, AVContentKeyRequest>) end;

  AVPersistableContentKeyRequestClass = interface(AVContentKeyRequestClass)
    ['{0CA76E01-1EA8-46F7-B9D6-E2261B034406}']
  end;

  AVPersistableContentKeyRequest = interface(AVContentKeyRequest)
    ['{61428E1C-9602-4A22-806F-23F86589F0F8}']
    [MethodName('persistableContentKeyFromKeyVendorResponse:options:error:')]
    function persistableContentKeyFromKeyVendorResponse(keyVendorResponse: NSData; options: NSDictionary; outError: PNSError): NSData; cdecl;
  end;
  TAVPersistableContentKeyRequest = class(TOCGenericImport<AVPersistableContentKeyRequestClass, AVPersistableContentKeyRequest>) end;

  AVContentKeyResponseClass = interface(NSObjectClass)
    ['{167E2D6C-F6AC-4ADA-9E36-291FFD87318E}']
    [MethodName('contentKeyResponseWithClearKeyData:initializationVector:')]
    {class} function contentKeyResponseWithClearKeyData(keyData: NSData; initializationVector: NSData): Pointer; cdecl;
    {class} function contentKeyResponseWithFairPlayStreamingKeyResponseData(keyResponseData: NSData): Pointer; cdecl;
  end;

  AVContentKeyResponse = interface(NSObject)
    ['{E35A844E-E011-4DBC-B564-6AE7E8CD40DA}']
  end;
  TAVContentKeyResponse = class(TOCGenericImport<AVContentKeyResponseClass, AVContentKeyResponse>) end;

  AVContentKeyRecipient = interface(IObjectiveC)
    ['{B635AB13-608C-4881-A89A-0FADCAEB8989}']
    function mayRequireContentKeysForMediaDataProcessing: Boolean; cdecl;
  end;

  AVFragmentMinding = interface(IObjectiveC)
    ['{A2DFA7C4-6D8D-4D07-96C4-14A9496EFC17}']
    function isAssociatedWithFragmentMinder: Boolean; cdecl;
  end;

  AVFragmentedAssetClass = interface(AVURLAssetClass)
    ['{3DB92E10-F30F-4166-B3EE-230A814622FB}']
    [MethodName('fragmentedAssetWithURL:options:')]
    {class} function fragmentedAssetWithURL(URL: NSURL; options: NSDictionary): Pointer; cdecl;
  end;

  AVFragmentedAsset = interface(AVURLAsset)
    ['{0355C405-376F-4097-8F81-65B72EB09FA5}']
    function tracks: NSArray; cdecl;
    function tracksWithMediaCharacteristic(mediaCharacteristic: AVMediaCharacteristic): NSArray; cdecl;
    function tracksWithMediaType(mediaType: AVMediaType): NSArray; cdecl;
    function trackWithTrackID(trackID: CMPersistentTrackID): AVFragmentedAssetTrack; cdecl;
  end;
  TAVFragmentedAsset = class(TOCGenericImport<AVFragmentedAssetClass, AVFragmentedAsset>) end;

  AVFragmentedAssetMinderClass = interface(NSObjectClass)
    ['{4FC6CDE3-8F66-494F-BD91-DAFDACA3785E}']
    [MethodName('fragmentedAssetMinderWithAsset:mindingInterval:')]
    {class} function fragmentedAssetMinderWithAsset(asset: AVAsset; mindingInterval: NSTimeInterval): Pointer; cdecl;
  end;

  AVFragmentedAssetMinder = interface(NSObject)
    ['{CDAC1F05-3FB0-4EEC-A987-7DC26736F9B9}']
    procedure addFragmentedAsset(asset: AVAsset); cdecl;
    function assets: NSArray; cdecl;
    [MethodName('initWithAsset:mindingInterval:')]
    function initWithAsset(asset: AVAsset; mindingInterval: NSTimeInterval): Pointer; cdecl;
    function mindingInterval: NSTimeInterval; cdecl;
    procedure removeFragmentedAsset(asset: AVAsset); cdecl;
    procedure setMindingInterval(mindingInterval: NSTimeInterval); cdecl;
  end;
  TAVFragmentedAssetMinder = class(TOCGenericImport<AVFragmentedAssetMinderClass, AVFragmentedAssetMinder>) end;

  AVAssetCacheClass = interface(NSObjectClass)
    ['{4773B56E-2875-4F30-A85A-65DEC6A57BE0}']
  end;

  AVAssetCache = interface(NSObject)
    ['{31A9ADB4-9FF2-48EC-AA8B-BB06850D8A1B}']
    function isPlayableOffline: Boolean; cdecl;
    function mediaSelectionOptionsInMediaSelectionGroup(mediaSelectionGroup: AVMediaSelectionGroup): NSArray; cdecl;
  end;
  TAVAssetCache = class(TOCGenericImport<AVAssetCacheClass, AVAssetCache>) end;

  AVVideoCompositionRenderContextClass = interface(NSObjectClass)
    ['{3B4C6A1E-68A8-4D84-85A2-0B1E7EB03BC8}']
  end;

  AVVideoCompositionRenderContext = interface(NSObject)
    ['{1892D09B-61ED-41BD-A480-A11398D25959}']
    function edgeWidths: AVEdgeWidths; cdecl;
    function highQualityRendering: Boolean; cdecl;
    function newPixelBuffer: CVPixelBufferRef; cdecl;
    function pixelAspectRatio: AVPixelAspectRatio; cdecl;
    function renderScale: Single; cdecl;
    function renderTransform: CGAffineTransform; cdecl;
    function size: CGSize; cdecl;
    function videoComposition: AVVideoComposition; cdecl;
  end;
  TAVVideoCompositionRenderContext = class(TOCGenericImport<AVVideoCompositionRenderContextClass, AVVideoCompositionRenderContext>) end;

  AVVideoCompositing = interface(IObjectiveC)
    ['{5362EA74-7BBC-43B2-A411-DED6A37FD6CE}']
    procedure cancelAllPendingVideoCompositionRequests; cdecl;
    procedure renderContextChanged(newRenderContext: AVVideoCompositionRenderContext); cdecl;
    function requiredPixelBufferAttributesForRenderContext: NSDictionary; cdecl;
    function sourcePixelBufferAttributes: NSDictionary; cdecl;
    procedure startVideoCompositionRequest(asyncVideoCompositionRequest: AVAsynchronousVideoCompositionRequest); cdecl;
    function supportsWideColorSourceFrames: Boolean; cdecl;
  end;

  AVAsynchronousVideoCompositionRequestClass = interface(NSObjectClass)
    ['{0D1B5F8F-678F-4E66-A812-A135487027E2}']
  end;

  AVAsynchronousVideoCompositionRequest = interface(NSObject)
    ['{E4F83A65-C7B6-4216-886C-5EA5D21FA495}']
    function compositionTime: CMTime; cdecl;
    procedure finishCancelledRequest; cdecl;
    procedure finishWithComposedVideoFrame(composedVideoFrame: CVPixelBufferRef); cdecl;
    procedure finishWithError(error: NSError); cdecl;
    function renderContext: AVVideoCompositionRenderContext; cdecl;
    function sourceFrameByTrackID(trackID: CMPersistentTrackID): CVPixelBufferRef; cdecl;
    function sourceTrackIDs: NSArray; cdecl;
    function videoCompositionInstruction: Pointer; cdecl;
  end;
  TAVAsynchronousVideoCompositionRequest = class(TOCGenericImport<AVAsynchronousVideoCompositionRequestClass, AVAsynchronousVideoCompositionRequest>) end;

  AVAsynchronousCIImageFilteringRequestClass = interface(NSObjectClass)
    ['{4BE8EDB2-C087-480D-A628-F15E51C6895D}']
  end;

  AVAsynchronousCIImageFilteringRequest = interface(NSObject)
    ['{FC40526A-9C61-495F-A9A9-3343C18097BE}']
    function compositionTime: CMTime; cdecl;
    procedure finishWithError(error: NSError); cdecl;
    [MethodName('finishWithImage:context:')]
    procedure finishWithImage(filteredImage: CIImage; context: CIContext); cdecl;
    function renderSize: CGSize; cdecl;
    function sourceImage: CIImage; cdecl;
  end;
  TAVAsynchronousCIImageFilteringRequest = class(TOCGenericImport<AVAsynchronousCIImageFilteringRequestClass, AVAsynchronousCIImageFilteringRequest>) end;

  // Needs review - A class exists with an identical name as this protocol.
  (*
  AVVideoCompositionInstruction = interface(IObjectiveC)
    ['{AAB05EB2-C6FD-4499-B9CF-EA854BF6E0DB}']
    function containsTweening: Boolean; cdecl;
    function enablePostProcessing: Boolean; cdecl;
    function passthroughTrackID: CMPersistentTrackID; cdecl;
    function requiredSourceTrackIDs: NSArray; cdecl;
    function timeRange: CMTimeRange; cdecl;
  end;
  *)

  AVVideoCompositionValidationHandling = interface(IObjectiveC)
    ['{74DC7256-E3C1-47AB-9DD0-5B94D63E6E9F}']
    [MethodName('videoComposition:shouldContinueValidatingAfterFindingInvalidTrackIDInInstruction:layerInstruction:asset:')]
    function videoComposition(videoComposition: AVVideoComposition; videoCompositionInstruction: Pointer;
      layerInstruction: AVVideoCompositionLayerInstruction; asset: AVAsset): Boolean; overload; cdecl;
    [MethodName('videoComposition:shouldContinueValidatingAfterFindingInvalidTimeRangeInInstruction:')]
    function videoComposition(videoComposition: AVVideoComposition; videoCompositionInstruction: Pointer): Boolean; overload; cdecl;
    [MethodName('videoComposition:shouldContinueValidatingAfterFindingEmptyTimeRange:')]
    function videoComposition(videoComposition: AVVideoComposition; timeRange: CMTimeRange): Boolean; overload; cdecl;
    [MethodName('videoComposition:shouldContinueValidatingAfterFindingInvalidValueForKey:')]
    function videoComposition(videoComposition: AVVideoComposition; key: NSString): Boolean; overload; cdecl;
  end;

  AVAssetReaderOutputMetadataAdaptorClass = interface(NSObjectClass)
    ['{C5B844F1-1666-4542-BF19-DB68A6A6A48A}']
    {class} function assetReaderOutputMetadataAdaptorWithAssetReaderTrackOutput(trackOutput: AVAssetReaderTrackOutput): Pointer; cdecl;
  end;

  AVAssetReaderOutputMetadataAdaptor = interface(NSObject)
    ['{49A7A131-B103-4EA6-8947-60805FBE27E9}']
    function assetReaderTrackOutput: AVAssetReaderTrackOutput; cdecl;
    function initWithAssetReaderTrackOutput(trackOutput: AVAssetReaderTrackOutput): Pointer; cdecl;
    function nextTimedMetadataGroup: AVTimedMetadataGroup; cdecl;
  end;
  TAVAssetReaderOutputMetadataAdaptor = class(TOCGenericImport<AVAssetReaderOutputMetadataAdaptorClass, AVAssetReaderOutputMetadataAdaptor>) end;

  AVAssetReaderSampleReferenceOutputClass = interface(AVAssetReaderOutputClass)
    ['{F262BBBC-9D12-44A8-94FD-51FB1F859C3F}']
    {class} function assetReaderSampleReferenceOutputWithTrack(track: AVAssetTrack): Pointer; cdecl;
  end;

  AVAssetReaderSampleReferenceOutput = interface(AVAssetReaderOutput)
    ['{98351FF7-5245-4581-92DA-0F68B7F3AC92}']
    function initWithTrack(track: AVAssetTrack): Pointer; cdecl;
    function track: AVAssetTrack; cdecl;
  end;
  TAVAssetReaderSampleReferenceOutput = class(TOCGenericImport<AVAssetReaderSampleReferenceOutputClass, AVAssetReaderSampleReferenceOutput>) end;

  AVAssetResourceLoaderClass = interface(NSObjectClass)
    ['{530672E4-0DD6-4050-86AC-3F448486D310}']
  end;

  AVAssetResourceLoader = interface(NSObject)
    ['{3B33A8A5-E021-4999-921C-479E1CB83314}']
    function delegate: Pointer; cdecl;
    function delegateQueue: dispatch_queue_t; cdecl;
    function preloadsEligibleContentKeys: Boolean; cdecl;
    [MethodName('setDelegate:queue:')]
    procedure setDelegate(delegate: Pointer; delegateQueue: dispatch_queue_t); cdecl;
    procedure setPreloadsEligibleContentKeys(preloadsEligibleContentKeys: Boolean); cdecl;
  end;
  TAVAssetResourceLoader = class(TOCGenericImport<AVAssetResourceLoaderClass, AVAssetResourceLoader>) end;

  AVAssetResourceLoaderDelegate = interface(IObjectiveC)
    ['{231C2849-682C-41D5-A49A-3B07E6DCCFBA}']
    [MethodName('resourceLoader:didCancelAuthenticationChallenge:')]
    procedure resourceLoaderDidCancelAuthenticationChallenge(resourceLoader: AVAssetResourceLoader; authenticationChallenge: NSURLAuthenticationChallenge); cdecl;
    [MethodName('resourceLoader:didCancelLoadingRequest:')]
    procedure resourceLoaderDidCancelLoadingRequest(resourceLoader: AVAssetResourceLoader; loadingRequest: AVAssetResourceLoadingRequest); cdecl;
    [MethodName('resourceLoader:shouldWaitForLoadingOfRequestedResource:')]
    function resourceLoaderShouldWaitForLoadingOfRequestedResource(resourceLoader: AVAssetResourceLoader; loadingRequest: AVAssetResourceLoadingRequest): Boolean; cdecl;
    [MethodName('resourceLoader:shouldWaitForRenewalOfRequestedResource:')]
    function resourceLoaderShouldWaitForRenewalOfRequestedResource(resourceLoader: AVAssetResourceLoader; renewalRequest: AVAssetResourceRenewalRequest): Boolean; cdecl;
    [MethodName('resourceLoader:shouldWaitForResponseToAuthenticationChallenge:')]
    function resourceLoaderShouldWaitForResponseToAuthenticationChallenge(resourceLoader: AVAssetResourceLoader; authenticationChallenge: NSURLAuthenticationChallenge): Boolean; cdecl;
  end;

  AVAssetResourceLoadingRequestorClass = interface(NSObjectClass)
    ['{D24FCFC6-C4F1-4C9E-AB5C-FAF5E9F5ED2A}']
  end;

  AVAssetResourceLoadingRequestor = interface(NSObject)
    ['{E4F7356A-183A-40D7-B74F-1B846AF46C27}']
    function providesExpiredSessionReports: Boolean; cdecl;
  end;
  TAVAssetResourceLoadingRequestor = class(TOCGenericImport<AVAssetResourceLoadingRequestorClass, AVAssetResourceLoadingRequestor>) end;

  AVAssetResourceLoadingRequestClass = interface(NSObjectClass)
    ['{CEBDD021-AD56-4DF0-82B9-18A35951086A}']
  end;

  AVAssetResourceLoadingRequest = interface(NSObject)
    ['{1552B30B-5E8F-45F2-BDD8-7E74A713FC09}']
    function contentInformationRequest: AVAssetResourceLoadingContentInformationRequest; cdecl;
    function dataRequest: AVAssetResourceLoadingDataRequest; cdecl;
    procedure finishLoading; cdecl;
    procedure finishLoadingWithError(error: NSError); cdecl;
    [MethodName('finishLoadingWithResponse:data:redirect:')]
    procedure finishLoadingWithResponse(response: NSURLResponse; data: NSData; redirect: NSURLRequest); cdecl;
    function isCancelled: Boolean; cdecl;
    function isFinished: Boolean; cdecl;
    [MethodName('persistentContentKeyFromKeyVendorResponse:options:error:')]
    function persistentContentKeyFromKeyVendorResponse(keyVendorResponse: NSData; options: NSDictionary; outError: PNSError): NSData; cdecl;
    function redirect: NSURLRequest; cdecl;
    function request: NSURLRequest; cdecl;
    function requestor: AVAssetResourceLoadingRequestor; cdecl;
    function response: NSURLResponse; cdecl;
    procedure setRedirect(redirect: NSURLRequest); cdecl;
    procedure setResponse(response: NSURLResponse); cdecl;
    [MethodName('streamingContentKeyRequestDataForApp:contentIdentifier:options:error:')]
    function streamingContentKeyRequestDataForApp(appIdentifier: NSData; contentIdentifier: NSData; options: NSDictionary; outError: PNSError): NSData; cdecl;
  end;
  TAVAssetResourceLoadingRequest = class(TOCGenericImport<AVAssetResourceLoadingRequestClass, AVAssetResourceLoadingRequest>) end;

  AVAssetResourceRenewalRequestClass = interface(AVAssetResourceLoadingRequestClass)
    ['{2F61D710-7F0F-4B44-A2D4-E487878D10E8}']
  end;

  AVAssetResourceRenewalRequest = interface(AVAssetResourceLoadingRequest)
    ['{E60BF8E4-725F-45E6-A510-C4EA96505D57}']
  end;
  TAVAssetResourceRenewalRequest = class(TOCGenericImport<AVAssetResourceRenewalRequestClass, AVAssetResourceRenewalRequest>) end;

  AVAssetResourceLoadingContentInformationRequestClass = interface(NSObjectClass)
    ['{FE29EE64-33EC-497B-A029-69ECB2E45EEB}']
  end;

  AVAssetResourceLoadingContentInformationRequest = interface(NSObject)
    ['{60B1C907-972B-4056-BE49-E2019759AB75}']
    function allowedContentTypes: NSArray; cdecl;
    function contentLength: Int64; cdecl;
    function contentType: NSString; cdecl;
    function isByteRangeAccessSupported: Boolean; cdecl;
    function renewalDate: NSDate; cdecl;
    procedure setByteRangeAccessSupported(byteRangeAccessSupported: Boolean); cdecl;
    procedure setContentLength(contentLength: Int64); cdecl;
    procedure setContentType(contentType: NSString); cdecl;
    procedure setRenewalDate(renewalDate: NSDate); cdecl;
  end;
  TAVAssetResourceLoadingContentInformationRequest = class(TOCGenericImport<AVAssetResourceLoadingContentInformationRequestClass, AVAssetResourceLoadingContentInformationRequest>) end;

  AVAssetResourceLoadingDataRequestClass = interface(NSObjectClass)
    ['{CD9E07A3-1925-4D43-93D5-AD34E6FE0BBF}']
  end;

  AVAssetResourceLoadingDataRequest = interface(NSObject)
    ['{C73D73C7-2AFF-4CBF-8FFB-B9D2A3501C02}']
    function currentOffset: Int64; cdecl;
    function requestedLength: NSInteger; cdecl;
    function requestedOffset: Int64; cdecl;
    function requestsAllDataToEndOfResource: Boolean; cdecl;
    procedure respondWithData(data: NSData); cdecl;
  end;
  TAVAssetResourceLoadingDataRequest = class(TOCGenericImport<AVAssetResourceLoadingDataRequestClass, AVAssetResourceLoadingDataRequest>) end;

  AVFragmentedAssetTrackClass = interface(AVAssetTrackClass)
    ['{6DF8D71D-9EB0-495C-93AE-A657FE85DEA9}']
  end;

  AVFragmentedAssetTrack = interface(AVAssetTrack)
    ['{62DAF9F3-06BF-41DD-BECE-C8E274CEB9B0}']
  end;
  TAVFragmentedAssetTrack = class(TOCGenericImport<AVFragmentedAssetTrackClass, AVFragmentedAssetTrack>) end;

  AVAssetTrackGroupClass = interface(NSObjectClass)
    ['{C47AADDD-3003-49F7-9B8F-43152C19EC29}']
  end;

  AVAssetTrackGroup = interface(NSObject)
    ['{292E1708-BD1F-4C98-9B40-7C737B62FFD8}']
    function trackIDs: NSArray; cdecl;
  end;
  TAVAssetTrackGroup = class(TOCGenericImport<AVAssetTrackGroupClass, AVAssetTrackGroup>) end;

  AVMediaSelectionGroupClass = interface(NSObjectClass)
    ['{CAD8C9CD-08CC-47D1-A602-A142CFF57E3D}']
    [MethodName('mediaSelectionOptionsFromArray:withLocale:')]
    {class} function mediaSelectionOptionsFromArray(mediaSelectionOptions: NSArray; locale: NSLocale): NSArray; overload; cdecl;
    [MethodName('mediaSelectionOptionsFromArray:filteredAndSortedAccordingToPreferredLanguages:')]
    {class} function mediaSelectionOptionsFromArray(mediaSelectionOptions: NSArray; preferredLanguages: NSArray): NSArray; overload; cdecl;
    [MethodName('mediaSelectionOptionsFromArray:withMediaCharacteristics:')]
    {class} function mediaSelectionOptionsFromArrayWithMediaCharacteristics(mediaSelectionOptions: NSArray; mediaCharacteristics: NSArray): NSArray; cdecl;
    [MethodName('mediaSelectionOptionsFromArray:withoutMediaCharacteristics:')]
    {class} function mediaSelectionOptionsFromArrayWithoutMediaCharacteristics(mediaSelectionOptions: NSArray; mediaCharacteristics: NSArray): NSArray; cdecl;
    {class} function playableMediaSelectionOptionsFromArray(mediaSelectionOptions: NSArray): NSArray; cdecl;
  end;

  AVMediaSelectionGroup = interface(NSObject)
    ['{6755F937-32E0-4143-9BD9-CEAAF792B663}']
    function allowsEmptySelection: Boolean; cdecl;
    function defaultOption: AVMediaSelectionOption; cdecl;
    function mediaSelectionOptionWithPropertyList(plist: Pointer): AVMediaSelectionOption; cdecl;
    function options: NSArray; cdecl;
  end;
  TAVMediaSelectionGroup = class(TOCGenericImport<AVMediaSelectionGroupClass, AVMediaSelectionGroup>) end;

  AVMediaSelectionOptionClass = interface(NSObjectClass)
    ['{8C15BF19-BDF8-4017-99FC-3FBB80ADF9F0}']
  end;

  AVMediaSelectionOption = interface(NSObject)
    ['{D9D63979-2685-43FB-9D51-345F3FCE5EBC}']
    function associatedMediaSelectionOptionInMediaSelectionGroup(mediaSelectionGroup: AVMediaSelectionGroup): AVMediaSelectionOption; cdecl;
    function availableMetadataFormats: NSArray; cdecl;
    function commonMetadata: NSArray; cdecl;
    function displayName: NSString; cdecl;
    function displayNameWithLocale(locale: NSLocale): NSString; cdecl;
    function extendedLanguageTag: NSString; cdecl;
    function hasMediaCharacteristic(mediaCharacteristic: AVMediaCharacteristic): Boolean; cdecl;
    function isPlayable: Boolean; cdecl;
    function locale: NSLocale; cdecl;
    function mediaSubTypes: NSArray; cdecl;
    function mediaType: AVMediaType; cdecl;
    function metadataForFormat(format: NSString): NSArray; cdecl;
    function propertyList: Pointer; cdecl;
  end;
  TAVMediaSelectionOption = class(TOCGenericImport<AVMediaSelectionOptionClass, AVMediaSelectionOption>) end;

  AVAssetWriterInputGroupClass = interface(AVMediaSelectionGroupClass)
    ['{FE7712B0-A5E5-4E2B-8AC2-2A607AD14C0B}']
    [MethodName('assetWriterInputGroupWithInputs:defaultInput:')]
    {class} function assetWriterInputGroupWithInputs(inputs: NSArray; defaultInput: AVAssetWriterInput): Pointer; cdecl;
  end;

  AVAssetWriterInputGroup = interface(AVMediaSelectionGroup)
    ['{9E584F93-772F-402A-9785-E94B579F0B9A}']
    function defaultInput: AVAssetWriterInput; cdecl;
    [MethodName('initWithInputs:defaultInput:')]
    function initWithInputs(inputs: NSArray; defaultInput: AVAssetWriterInput): Pointer; cdecl;
    function inputs: NSArray; cdecl;
  end;
  TAVAssetWriterInputGroup = class(TOCGenericImport<AVAssetWriterInputGroupClass, AVAssetWriterInputGroup>) end;

  AVAssetWriterInputPassDescriptionClass = interface(NSObjectClass)
    ['{144EF2F0-BCFC-41F4-A48B-78433F8441EA}']
  end;

  AVAssetWriterInputPassDescription = interface(NSObject)
    ['{763BA741-B514-48F4-A3CE-5F7EA8359367}']
    function sourceTimeRanges: NSArray; cdecl;
  end;
  TAVAssetWriterInputPassDescription = class(TOCGenericImport<AVAssetWriterInputPassDescriptionClass, AVAssetWriterInputPassDescription>) end;

  AVAssetWriterInputMetadataAdaptorClass = interface(NSObjectClass)
    ['{A5BF439E-54AE-4437-A4D7-5D4A4CF917F2}']
    {class} function assetWriterInputMetadataAdaptorWithAssetWriterInput(input: AVAssetWriterInput): Pointer; cdecl;
  end;

  AVAssetWriterInputMetadataAdaptor = interface(NSObject)
    ['{B8D00CBE-5EC5-43C8-9D5B-0E8E4537FAAC}']
    function appendTimedMetadataGroup(timedMetadataGroup: AVTimedMetadataGroup): Boolean; cdecl;
    function assetWriterInput: AVAssetWriterInput; cdecl;
    function initWithAssetWriterInput(input: AVAssetWriterInput): Pointer; cdecl;
  end;
  TAVAssetWriterInputMetadataAdaptor = class(TOCGenericImport<AVAssetWriterInputMetadataAdaptorClass, AVAssetWriterInputMetadataAdaptor>) end;

  AVCameraCalibrationDataClass = interface(NSObjectClass)
    ['{1B012B32-81AC-4D61-9363-B8D92E8D95CA}']
  end;

  AVCameraCalibrationData = interface(NSObject)
    ['{5E2EF09D-08C3-4B2B-993F-8D212C1E60A9}']
    // function extrinsicMatrix: matrix_float4x3; cdecl;  // Needs Accelerate
    // function intrinsicMatrix: matrix_float3x3; cdecl; // Needs Accelerate
    function intrinsicMatrixReferenceDimensions: CGSize; cdecl;
    function inverseLensDistortionLookupTable: NSData; cdecl;
    function lensDistortionCenter: CGPoint; cdecl;
    function lensDistortionLookupTable: NSData; cdecl;
    function pixelSize: Single; cdecl;
  end;
  TAVCameraCalibrationData = class(TOCGenericImport<AVCameraCalibrationDataClass, AVCameraCalibrationData>) end;

  AVCaptureDeviceDiscoverySessionClass = interface(NSObjectClass)
    ['{FFBC95FD-2C61-41C0-A7B4-B3530E49B84A}']
    [MethodName('discoverySessionWithDeviceTypes:mediaType:position:')]
    {class} function discoverySessionWithDeviceTypes(deviceTypes: NSArray; mediaType: AVMediaType; position: AVCaptureDevicePosition): Pointer; cdecl;
  end;

  AVCaptureDeviceDiscoverySession = interface(NSObject)
    ['{A0D14A76-31BA-4C5F-B7A6-C3D865B1F67A}']
    function devices: NSArray; cdecl;
  end;
  TAVCaptureDeviceDiscoverySession = class(TOCGenericImport<AVCaptureDeviceDiscoverySessionClass, AVCaptureDeviceDiscoverySession>) end;

  AVCaptureDepthDataOutputClass = interface(AVCaptureOutputClass)
    ['{081BD591-DEBA-4041-B616-C69BCB4A813B}']
  end;

  AVCaptureDepthDataOutput = interface(AVCaptureOutput)
    ['{D3E72BB4-95D0-4536-AA67-D46EB38F1F4D}']
    function alwaysDiscardsLateDepthData: Boolean; cdecl;
    function delegate: Pointer; cdecl;
    function delegateCallbackQueue: dispatch_queue_t; cdecl;
    function isFilteringEnabled: Boolean; cdecl;
    procedure setAlwaysDiscardsLateDepthData(alwaysDiscardsLateDepthData: Boolean); cdecl;
    [MethodName('setDelegate:callbackQueue:')]
    procedure setDelegate(delegate: Pointer; callbackQueue: dispatch_queue_t); cdecl;
    procedure setFilteringEnabled(filteringEnabled: Boolean); cdecl;
  end;
  TAVCaptureDepthDataOutput = class(TOCGenericImport<AVCaptureDepthDataOutputClass, AVCaptureDepthDataOutput>) end;

  AVCaptureDepthDataOutputDelegate = interface(IObjectiveC)
    ['{E5E7D09A-017B-4BF0-AD02-B8120FCF981A}']
    [MethodName('depthDataOutput:didOutputDepthData:timestamp:connection:')]
    procedure depthDataOutput(output: AVCaptureDepthDataOutput; depthData: AVDepthData; timestamp: CMTime;
      connection: AVCaptureConnection); overload; cdecl;
    [MethodName('depthDataOutput:didDropDepthData:timestamp:connection:reason:')]
    procedure depthDataOutput(output: AVCaptureDepthDataOutput; depthData: AVDepthData; timestamp: CMTime; connection: AVCaptureConnection;
      reason: AVCaptureOutputDataDroppedReason); overload; cdecl;
  end;

  AVMetadataObjectClass = interface(NSObjectClass)
    ['{B888FFEC-B3EE-449E-8115-CFA6CAB08DF9}']
  end;

  AVMetadataObject = interface(NSObject)
    ['{5FA9B972-F2F8-40E7-9DCA-B03590696F8A}']
    function &type: AVMetadataObjectType; cdecl;
    function bounds: CGRect; cdecl;
    function duration: CMTime; cdecl;
    function time: CMTime; cdecl;
  end;
  TAVMetadataObject = class(TOCGenericImport<AVMetadataObjectClass, AVMetadataObject>) end;

  AVMetadataFaceObjectClass = interface(AVMetadataObjectClass)
    ['{94EDFB4B-16F2-4702-86F4-0C33F9895621}']
  end;

  AVMetadataFaceObject = interface(AVMetadataObject)
    ['{B8A38B74-DD6A-4902-8C99-58617EB2BF7C}']
    function faceID: NSInteger; cdecl;
    function hasRollAngle: Boolean; cdecl;
    function hasYawAngle: Boolean; cdecl;
    function rollAngle: CGFloat; cdecl;
    function yawAngle: CGFloat; cdecl;
  end;
  TAVMetadataFaceObject = class(TOCGenericImport<AVMetadataFaceObjectClass, AVMetadataFaceObject>) end;

  AVMetadataMachineReadableCodeObjectClass = interface(AVMetadataObjectClass)
    ['{5AC13010-FBD2-4322-904E-9CD80ECAD344}']
  end;

  AVMetadataMachineReadableCodeObject = interface(AVMetadataObject)
    ['{B14CBF0B-A2CA-4FC2-ACCA-5174A1C7102F}']
    function corners: NSArray; cdecl;
    // function descriptor: CIBarcodeDescriptor; cdecl; // Needs CIBarcodeDescriptor to be defined in CoreImage
    function stringValue: NSString; cdecl;
  end;
  TAVMetadataMachineReadableCodeObject = class(TOCGenericImport<AVMetadataMachineReadableCodeObjectClass, AVMetadataMachineReadableCodeObject>) end;

  AVCaptureMetadataOutputClass = interface(AVCaptureOutputClass)
    ['{CD1D8EE2-1D6C-4C4B-A2F6-EB9BEFA1E656}']
  end;

  AVCaptureMetadataOutput = interface(AVCaptureOutput)
    ['{2AAA694C-C8DD-438C-A1C1-8DC8456DFC16}']
    function availableMetadataObjectTypes: NSArray; cdecl;
    function metadataObjectsCallbackQueue: dispatch_queue_t; cdecl;
    function metadataObjectsDelegate: Pointer; cdecl;
    function metadataObjectTypes: NSArray; cdecl;
    function rectOfInterest: CGRect; cdecl;
    [MethodName('setMetadataObjectsDelegate:queue:')]
    procedure setMetadataObjectsDelegate(objectsDelegate: Pointer; objectsCallbackQueue: dispatch_queue_t); cdecl;
    procedure setMetadataObjectTypes(metadataObjectTypes: NSArray); cdecl;
    procedure setRectOfInterest(rectOfInterest: CGRect); cdecl;
  end;
  TAVCaptureMetadataOutput = class(TOCGenericImport<AVCaptureMetadataOutputClass, AVCaptureMetadataOutput>) end;

  AVCaptureMetadataOutputObjectsDelegate = interface(IObjectiveC)
    ['{F267F741-1BE5-483D-B92B-B32B8141AE88}']
    [MethodName('captureOutput:didOutputMetadataObjects:fromConnection:')]
    procedure captureOutput(output: AVCaptureOutput; metadataObjects: NSArray; connection: AVCaptureConnection); cdecl;
  end;

  AVCapturePhotoOutputClass = interface(AVCaptureOutputClass)
    ['{90FC45F3-1D57-4512-8731-A3696A51D478}']
    [MethodName('DNGPhotoDataRepresentationForRawSampleBuffer:previewPhotoSampleBuffer:')]
    {class} function DNGPhotoDataRepresentationForRawSampleBuffer(rawSampleBuffer: CMSampleBufferRef;
      previewPhotoSampleBuffer: CMSampleBufferRef): NSData; cdecl; // API_DEPRECATED("Use -[AVCapturePhoto fileDataRepresentation] instead.", ios(10.0, 11.0))
    [MethodName('JPEGPhotoDataRepresentationForJPEGSampleBuffer:previewPhotoSampleBuffer:')]
    {class} function JPEGPhotoDataRepresentationForJPEGSampleBuffer(JPEGSampleBuffer: CMSampleBufferRef;
      previewPhotoSampleBuffer: CMSampleBufferRef): NSData; cdecl; // API_DEPRECATED("Use -[AVCapturePhoto fileDataRepresentation] instead.", ios(10.0, 11.0))
  end;

  AVCapturePhotoOutput = interface(AVCaptureOutput)
    ['{D6296E85-6B35-4A47-80BA-B36D6888EBDC}']
    function availableLivePhotoVideoCodecTypes: NSArray; cdecl;
    function availablePhotoCodecTypes: NSArray; cdecl;
    function availablePhotoFileTypes: NSArray; cdecl;
    function availablePhotoPixelFormatTypes: NSArray; cdecl;
    function availableRawPhotoFileTypes: NSArray; cdecl;
    function availableRawPhotoPixelFormatTypes: NSArray; cdecl;
    [MethodName('capturePhotoWithSettings:delegate:')]
    procedure capturePhotoWithSettings(settings: AVCapturePhotoSettings; delegate: Pointer); cdecl;
    function isAutoRedEyeReductionSupported: Boolean; cdecl;
    function isCameraCalibrationDataDeliverySupported: Boolean; cdecl;
    function isDepthDataDeliveryEnabled: Boolean; cdecl;
    function isDepthDataDeliverySupported: Boolean; cdecl;
    function isDualCameraDualPhotoDeliveryEnabled: Boolean; cdecl;
    function isDualCameraDualPhotoDeliverySupported: Boolean; cdecl;
    function isDualCameraFusionSupported: Boolean; cdecl;
    function isFlashScene: Boolean; cdecl;
    function isHighResolutionCaptureEnabled: Boolean; cdecl;
    function isLensStabilizationDuringBracketedCaptureSupported: Boolean; cdecl;
    function isLivePhotoAutoTrimmingEnabled: Boolean; cdecl;
    function isLivePhotoCaptureEnabled: Boolean; cdecl;
    function isLivePhotoCaptureSupported: Boolean; cdecl;
    function isLivePhotoCaptureSuspended: Boolean; cdecl;
    function isPortraitEffectsMatteDeliveryEnabled: Boolean; cdecl;
    function isPortraitEffectsMatteDeliverySupported: Boolean; cdecl;
    function isStillImageStabilizationScene: Boolean; cdecl;
    function isStillImageStabilizationSupported: Boolean; cdecl;
    function maxBracketedCapturePhotoCount: NSUInteger; cdecl;
    function photoSettingsForSceneMonitoring: AVCapturePhotoSettings; cdecl;
    function preparedPhotoSettingsArray: NSArray; cdecl;
    procedure setDepthDataDeliveryEnabled(depthDataDeliveryEnabled: Boolean); cdecl;
    procedure setDualCameraDualPhotoDeliveryEnabled(dualCameraDualPhotoDeliveryEnabled: Boolean); cdecl;
    procedure setHighResolutionCaptureEnabled(highResolutionCaptureEnabled: Boolean); cdecl;
    procedure setLivePhotoAutoTrimmingEnabled(livePhotoAutoTrimmingEnabled: Boolean); cdecl;
    procedure setLivePhotoCaptureEnabled(livePhotoCaptureEnabled: Boolean); cdecl;
    procedure setLivePhotoCaptureSuspended(livePhotoCaptureSuspended: Boolean); cdecl;
    procedure setPhotoSettingsForSceneMonitoring(photoSettingsForSceneMonitoring: AVCapturePhotoSettings); cdecl;
    procedure setPortraitEffectsMatteDeliveryEnabled(portraitEffectsMatteDeliveryEnabled: Boolean); cdecl;
    [MethodName('setPreparedPhotoSettingsArray:completionHandler:')]
    procedure setPreparedPhotoSettingsArray(preparedPhotoSettingsArray: NSArray; completionHandler: TAVCapturePhotoOutputBlockMethod1); cdecl;
    function supportedFlashModes: NSArray; cdecl;
    function supportedPhotoCodecTypesForFileType(fileType: AVFileType): NSArray; cdecl;
    function supportedPhotoPixelFormatTypesForFileType(fileType: AVFileType): NSArray; cdecl;
    function supportedRawPhotoPixelFormatTypesForFileType(fileType: AVFileType): NSArray; cdecl;
  end;
  TAVCapturePhotoOutput = class(TOCGenericImport<AVCapturePhotoOutputClass, AVCapturePhotoOutput>) end;

  AVCapturePhotoCaptureDelegate = interface(IObjectiveC)
    ['{658BCAD8-CA2E-49D5-8F3D-50A486FEA196}']
    [MethodName('captureOutput:didFinishProcessingPhotoSampleBuffer:previewPhotoSampleBuffer:resolvedSettings:bracketSettings:error:')]
    procedure captureOutput(output: AVCapturePhotoOutput; photoSampleBuffer: CMSampleBufferRef; previewPhotoSampleBuffer: CMSampleBufferRef;
      resolvedSettings: AVCaptureResolvedPhotoSettings; bracketSettings: AVCaptureBracketedStillImageSettings; error: NSError); overload; cdecl; // API_DEPRECATED("Use -captureOutput:didFinishProcessingPhoto:error: instead.", ios(10.0, 11.0))
    [MethodName('captureOutput:didFinishRecordingLivePhotoMovieForEventualFileAtURL:resolvedSettings:')]
    procedure captureOutput(output: AVCapturePhotoOutput; outputFileURL: NSURL; resolvedSettings: AVCaptureResolvedPhotoSettings); overload; cdecl;
    [MethodName('captureOutput:didFinishProcessingLivePhotoToMovieFileAtURL:duration:photoDisplayTime:resolvedSettings:error:')]
    procedure captureOutput(output: AVCapturePhotoOutput; outputFileURL: NSURL; duration: CMTime; photoDisplayTime: CMTime;
      resolvedSettings: AVCaptureResolvedPhotoSettings; error: NSError); overload; cdecl;
    [MethodName('captureOutput:didFinishCaptureForResolvedSettings:error:')]
    procedure captureOutput(output: AVCapturePhotoOutput; resolvedSettings: AVCaptureResolvedPhotoSettings; error: NSError); overload; cdecl;
    [MethodName('captureOutput:didFinishProcessingPhoto:error:')]
    procedure captureOutput(output: AVCapturePhotoOutput; photo: AVCapturePhoto; error: NSError); overload; cdecl;
    [MethodName('captureOutput:willBeginCaptureForResolvedSettings:')]
    procedure captureOutput(output: AVCapturePhotoOutput; resolvedSettings: AVCaptureResolvedPhotoSettings); overload; cdecl;
    [MethodName('captureOutput:didCapturePhotoForResolvedSettings:')]
    procedure captureOutputDidCapturePhotoForResolvedSettings(output: AVCapturePhotoOutput; resolvedSettings: AVCaptureResolvedPhotoSettings); cdecl;
    [MethodName('captureOutput:didFinishProcessingRawPhotoSampleBuffer:previewPhotoSampleBuffer:resolvedSettings:bracketSettings:error:')]
    procedure captureOutputDidFinishProcessingRawPhotoSampleBuffer(output: AVCapturePhotoOutput; rawSampleBuffer: CMSampleBufferRef;
      previewPhotoSampleBuffer: CMSampleBufferRef; resolvedSettings: AVCaptureResolvedPhotoSettings;
      bracketSettings: AVCaptureBracketedStillImageSettings; error: NSError); cdecl; // API_DEPRECATED("Use -captureOutput:didFinishProcessingPhoto:error: instead.", ios(10.0, 11.0))
    [MethodName('captureOutput:willCapturePhotoForResolvedSettings:')]
    procedure captureOutputWillCapturePhotoForResolvedSettings(output: AVCapturePhotoOutput; resolvedSettings: AVCaptureResolvedPhotoSettings); cdecl;
  end;

  AVCapturePhotoSettingsClass = interface(NSObjectClass)
    ['{6844F96F-64EE-4886-992F-9DCEB7908FE1}']
    {class} function photoSettings: Pointer; cdecl;
    {class} function photoSettingsFromPhotoSettings(photoSettings: AVCapturePhotoSettings): Pointer; cdecl;
    {class} function photoSettingsWithFormat(format: NSDictionary): Pointer; cdecl;
    [MethodName('photoSettingsWithRawPixelFormatType:rawFileType:processedFormat:processedFileType:')]
    {class} function photoSettingsWithRawPixelFormatType(rawPixelFormatType: OSType; rawFileType: AVFileType; processedFormat: NSDictionary;
      processedFileType: AVFileType): Pointer; overload; cdecl;
    [MethodName('photoSettingsWithRawPixelFormatType:processedFormat:')]
    {class} function photoSettingsWithRawPixelFormatType(rawPixelFormatType: OSType; processedFormat: NSDictionary): Pointer; overload; cdecl;
    {class} function photoSettingsWithRawPixelFormatType(rawPixelFormatType: OSType): Pointer; overload; cdecl;
  end;

  AVCapturePhotoSettings = interface(NSObject)
    ['{5F3C4019-BF18-4DF7-9E2F-A20771931C7C}']
    function availableEmbeddedThumbnailPhotoCodecTypes: NSArray; cdecl;
    function availablePreviewPhotoPixelFormatTypes: NSArray; cdecl;
    function availableRawEmbeddedThumbnailPhotoCodecTypes: NSArray; cdecl;
    function embeddedThumbnailPhotoFormat: NSDictionary; cdecl;
    function embedsDepthDataInPhoto: Boolean; cdecl;
    function embedsPortraitEffectsMatteInPhoto: Boolean; cdecl;
    function flashMode: AVCaptureFlashMode; cdecl;
    function format: NSDictionary; cdecl;
    function isAutoDualCameraFusionEnabled: Boolean; cdecl;
    function isAutoRedEyeReductionEnabled: Boolean; cdecl;
    function isAutoStillImageStabilizationEnabled: Boolean; cdecl;
    function isCameraCalibrationDataDeliveryEnabled: Boolean; cdecl;
    function isDepthDataDeliveryEnabled: Boolean; cdecl;
    function isDepthDataFiltered: Boolean; cdecl;
    function isDualCameraDualPhotoDeliveryEnabled: Boolean; cdecl;
    function isHighResolutionPhotoEnabled: Boolean; cdecl;
    function isPortraitEffectsMatteDeliveryEnabled: Boolean; cdecl;
    function livePhotoMovieFileURL: NSURL; cdecl;
    function livePhotoMovieMetadata: NSArray; cdecl;
    function livePhotoVideoCodecType: AVVideoCodecType; cdecl;
    function metadata: NSDictionary; cdecl;
    function previewPhotoFormat: NSDictionary; cdecl;
    function processedFileType: AVFileType; cdecl;
    function rawEmbeddedThumbnailPhotoFormat: NSDictionary; cdecl;
    function rawFileType: AVFileType; cdecl;
    function rawPhotoPixelFormatType: OSType; cdecl;
    procedure setAutoDualCameraFusionEnabled(autoDualCameraFusionEnabled: Boolean); cdecl;
    procedure setAutoRedEyeReductionEnabled(autoRedEyeReductionEnabled: Boolean); cdecl;
    procedure setAutoStillImageStabilizationEnabled(autoStillImageStabilizationEnabled: Boolean); cdecl;
    procedure setCameraCalibrationDataDeliveryEnabled(cameraCalibrationDataDeliveryEnabled: Boolean); cdecl;
    procedure setDepthDataDeliveryEnabled(depthDataDeliveryEnabled: Boolean); cdecl;
    procedure setDepthDataFiltered(depthDataFiltered: Boolean); cdecl;
    procedure setDualCameraDualPhotoDeliveryEnabled(dualCameraDualPhotoDeliveryEnabled: Boolean); cdecl;
    procedure setEmbeddedThumbnailPhotoFormat(embeddedThumbnailPhotoFormat: NSDictionary); cdecl;
    procedure setEmbedsDepthDataInPhoto(embedsDepthDataInPhoto: Boolean); cdecl;
    procedure setEmbedsPortraitEffectsMatteInPhoto(embedsPortraitEffectsMatteInPhoto: Boolean); cdecl;
    procedure setFlashMode(flashMode: AVCaptureFlashMode); cdecl;
    procedure setHighResolutionPhotoEnabled(highResolutionPhotoEnabled: Boolean); cdecl;
    procedure setLivePhotoMovieFileURL(livePhotoMovieFileURL: NSURL); cdecl;
    procedure setLivePhotoMovieMetadata(livePhotoMovieMetadata: NSArray); cdecl;
    procedure setLivePhotoVideoCodecType(livePhotoVideoCodecType: AVVideoCodecType); cdecl;
    procedure setMetadata(metadata: NSDictionary); cdecl;
    procedure setPortraitEffectsMatteDeliveryEnabled(portraitEffectsMatteDeliveryEnabled: Boolean); cdecl;
    procedure setPreviewPhotoFormat(previewPhotoFormat: NSDictionary); cdecl;
    procedure setRawEmbeddedThumbnailPhotoFormat(rawEmbeddedThumbnailPhotoFormat: NSDictionary); cdecl;
    function uniqueID: Int64; cdecl;
  end;
  TAVCapturePhotoSettings = class(TOCGenericImport<AVCapturePhotoSettingsClass, AVCapturePhotoSettings>) end;

  AVCapturePhotoBracketSettingsClass = interface(AVCapturePhotoSettingsClass)
    ['{AD4313F4-3126-4E10-85F6-97204615EA38}']
    [MethodName('photoBracketSettingsWithRawPixelFormatType:processedFormat:bracketedSettings:')]
    {class} function photoBracketSettingsWithRawPixelFormatType(rawPixelFormatType: OSType; processedFormat: NSDictionary;
      bracketedSettings: NSArray): Pointer; overload; cdecl;
    [MethodName('photoBracketSettingsWithRawPixelFormatType:rawFileType:processedFormat:processedFileType:bracketedSettings:')]
    {class} function photoBracketSettingsWithRawPixelFormatType(rawPixelFormatType: OSType; rawFileType: AVFileType; processedFormat: NSDictionary;
      processedFileType: AVFileType; bracketedSettings: NSArray): Pointer; overload; cdecl;
  end;

  AVCapturePhotoBracketSettings = interface(AVCapturePhotoSettings)
    ['{1EE2B0FD-C31B-467A-8B91-B394BB412ACD}']
    function bracketedSettings: NSArray; cdecl;
    function isLensStabilizationEnabled: Boolean; cdecl;
    procedure setLensStabilizationEnabled(lensStabilizationEnabled: Boolean); cdecl;
  end;
  TAVCapturePhotoBracketSettings = class(TOCGenericImport<AVCapturePhotoBracketSettingsClass, AVCapturePhotoBracketSettings>) end;

  AVCaptureResolvedPhotoSettingsClass = interface(NSObjectClass)
    ['{36B197AA-541E-4A88-98CD-B09C3586A8EE}']
  end;

  AVCaptureResolvedPhotoSettings = interface(NSObject)
    ['{CB97EEBE-4C7C-425C-A4B2-0C3728D5150B}']
    function embeddedThumbnailDimensions: CMVideoDimensions; cdecl;
    function expectedPhotoCount: NSUInteger; cdecl;
    function isDualCameraFusionEnabled: Boolean; cdecl;
    function isFlashEnabled: Boolean; cdecl;
    function isRedEyeReductionEnabled: Boolean; cdecl;
    function isStillImageStabilizationEnabled: Boolean; cdecl;
    function livePhotoMovieDimensions: CMVideoDimensions; cdecl;
    function photoDimensions: CMVideoDimensions; cdecl;
    function portraitEffectsMatteDimensions: CMVideoDimensions; cdecl;
    function previewDimensions: CMVideoDimensions; cdecl;
    function rawEmbeddedThumbnailDimensions: CMVideoDimensions; cdecl;
    function rawPhotoDimensions: CMVideoDimensions; cdecl;
    function uniqueID: Int64; cdecl;
  end;
  TAVCaptureResolvedPhotoSettings = class(TOCGenericImport<AVCaptureResolvedPhotoSettingsClass, AVCaptureResolvedPhotoSettings>) end;

  AVCapturePhotoClass = interface(NSObjectClass)
    ['{D2F89F6B-5A1E-4F4D-8AA2-DF9F8ED8499E}']
  end;

  AVCapturePhoto = interface(NSObject)
    ['{A85AF8D7-5CA0-49AA-B16F-04EAE0DEE5B8}']
    function bracketSettings: AVCaptureBracketedStillImageSettings; cdecl;
    function cameraCalibrationData: AVCameraCalibrationData; cdecl;
    function CGImageRepresentation: CGImageRef; cdecl;
    function depthData: AVDepthData; cdecl;
    function embeddedThumbnailPhotoFormat: NSDictionary; cdecl;
    function fileDataRepresentation: NSData; cdecl;
    function fileDataRepresentationWithCustomizer(customizer: Pointer): NSData; cdecl;
    [MethodName('fileDataRepresentationWithReplacementMetadata:replacementEmbeddedThumbnailPhotoFormat:replacementEmbeddedThumbnailPixelBuffer:replacementDepthData:')]
    function fileDataRepresentationWithReplacementMetadata(replacementMetadata: NSDictionary; replacementEmbeddedThumbnailPhotoFormat: NSDictionary;
      replacementEmbeddedThumbnailPixelBuffer: CVPixelBufferRef; replacementDepthData: AVDepthData): NSData; cdecl; // API_DEPRECATED("Use fileDataRepresentationWithCustomizer: instead", ios(11.0, 12.0))
    function isRawPhoto: Boolean; cdecl;
    function lensStabilizationStatus: AVCaptureLensStabilizationStatus; cdecl;
    function metadata: NSDictionary; cdecl;
    function photoCount: NSInteger; cdecl;
    function pixelBuffer: CVPixelBufferRef; cdecl;
    function portraitEffectsMatte: AVPortraitEffectsMatte; cdecl;
    function previewCGImageRepresentation: CGImageRef; cdecl;
    function previewPixelBuffer: CVPixelBufferRef; cdecl;
    function resolvedSettings: AVCaptureResolvedPhotoSettings; cdecl;
    function sequenceCount: NSInteger; cdecl;
    function sourceDeviceType: AVCaptureDeviceType; cdecl;
    function timestamp: CMTime; cdecl;
  end;
  TAVCapturePhoto = class(TOCGenericImport<AVCapturePhotoClass, AVCapturePhoto>) end;

  AVCapturePhotoFileDataRepresentationCustomizer = interface(IObjectiveC)
    ['{FB59445B-DA0D-4328-88F7-703BBE26B8BF}']
    function replacementDepthDataForPhoto(photo: AVCapturePhoto): AVDepthData; cdecl;
    [MethodName('replacementEmbeddedThumbnailPixelBufferWithPhotoFormat:forPhoto:')]
    function replacementEmbeddedThumbnailPixelBufferWithPhotoFormat(replacementEmbeddedThumbnailPhotoFormatOut: PNSDictionary;
      photo: AVCapturePhoto): CVPixelBufferRef; cdecl;
    function replacementMetadataForPhoto(photo: AVCapturePhoto): NSDictionary; cdecl;
    function replacementPortraitEffectsMatteForPhoto(photo: AVCapturePhoto): AVPortraitEffectsMatte; cdecl;
  end;

  AVCaptureBracketedStillImageSettingsClass = interface(NSObjectClass)
    ['{B1A8337E-9919-40DD-95CC-A152FC7F4183}']
  end;

  AVCaptureBracketedStillImageSettings = interface(NSObject)
    ['{68A8CD97-AA8F-4ED0-8B9A-C41406B915B7}']
  end;
  TAVCaptureBracketedStillImageSettings = class(TOCGenericImport<AVCaptureBracketedStillImageSettingsClass, AVCaptureBracketedStillImageSettings>) end;

  AVCaptureManualExposureBracketedStillImageSettingsClass = interface(AVCaptureBracketedStillImageSettingsClass)
    ['{6113B719-D854-4ACE-B668-80920243D149}']
    [MethodName('manualExposureSettingsWithExposureDuration:ISO:')]
    {class} function manualExposureSettingsWithExposureDuration(duration: CMTime; ISO: Single): Pointer; cdecl;
  end;

  AVCaptureManualExposureBracketedStillImageSettings = interface(AVCaptureBracketedStillImageSettings)
    ['{06F2D6ED-1515-421B-B88E-623C97909A31}']
    function exposureDuration: CMTime; cdecl;
    function ISO: Single; cdecl;
  end;
  TAVCaptureManualExposureBracketedStillImageSettings = class(TOCGenericImport<AVCaptureManualExposureBracketedStillImageSettingsClass,
    AVCaptureManualExposureBracketedStillImageSettings>) end;

  AVCaptureAutoExposureBracketedStillImageSettingsClass = interface(AVCaptureBracketedStillImageSettingsClass)
    ['{3EFC424A-7CE7-4F39-8FE3-C5D406479E31}']
    {class} function autoExposureSettingsWithExposureTargetBias(exposureTargetBias: Single): Pointer; cdecl;
  end;

  AVCaptureAutoExposureBracketedStillImageSettings = interface(AVCaptureBracketedStillImageSettings)
    ['{F1BD1D63-6B4E-42B5-9B09-1B59A5939841}']
    function exposureTargetBias: Single; cdecl;
  end;
  TAVCaptureAutoExposureBracketedStillImageSettings = class(TOCGenericImport<AVCaptureAutoExposureBracketedStillImageSettingsClass,
    AVCaptureAutoExposureBracketedStillImageSettings>) end;

  AVCaptureDataOutputSynchronizerClass = interface(NSObjectClass)
    ['{BDDEC72D-55BF-4730-9CB6-AE6CA74682D5}']
  end;

  AVCaptureDataOutputSynchronizer = interface(NSObject)
    ['{114E0632-5973-4EF5-8C8E-FBD83536278C}']
    function dataOutputs: NSArray; cdecl;
    function delegate: Pointer; cdecl;
    function delegateCallbackQueue: dispatch_queue_t; cdecl;
    function initWithDataOutputs(dataOutputs: NSArray): Pointer; cdecl;
    [MethodName('setDelegate:queue:')]
    procedure setDelegate(delegate: Pointer; delegateCallbackQueue: dispatch_queue_t); cdecl;
  end;
  TAVCaptureDataOutputSynchronizer = class(TOCGenericImport<AVCaptureDataOutputSynchronizerClass, AVCaptureDataOutputSynchronizer>) end;

  AVCaptureDataOutputSynchronizerDelegate = interface(IObjectiveC)
    ['{781AC1CD-51CC-49D6-93DF-BDC3B5568DFD}']
    [MethodName('dataOutputSynchronizer:didOutputSynchronizedDataCollection:')]
    procedure dataOutputSynchronizer(synchronizer: AVCaptureDataOutputSynchronizer;
      synchronizedDataCollection: AVCaptureSynchronizedDataCollection); cdecl;
  end;

  AVCaptureSynchronizedDataCollectionClass = interface(NSObjectClass)
    ['{0F162823-2918-4C27-BA3B-FE36CCEBC0F8}']
  end;

  AVCaptureSynchronizedDataCollection = interface(NSObject)
    ['{31288B9C-7E5E-4166-AF5C-806C33DBB76A}']
    function count: NSUInteger; cdecl;
    function objectForKeyedSubscript(key: AVCaptureOutput): AVCaptureSynchronizedData; cdecl;
    function synchronizedDataForCaptureOutput(captureOutput: AVCaptureOutput): AVCaptureSynchronizedData; cdecl;
  end;
  TAVCaptureSynchronizedDataCollection = class(TOCGenericImport<AVCaptureSynchronizedDataCollectionClass, AVCaptureSynchronizedDataCollection>) end;

  AVCaptureSynchronizedDataClass = interface(NSObjectClass)
    ['{CA760F81-AD1A-4427-BF4C-87B4F8C68878}']
  end;

  AVCaptureSynchronizedData = interface(NSObject)
    ['{99A4CDCE-9C1F-4F80-9D46-923DD70371B9}']
    function timestamp: CMTime; cdecl;
  end;
  TAVCaptureSynchronizedData = class(TOCGenericImport<AVCaptureSynchronizedDataClass, AVCaptureSynchronizedData>) end;

  AVCaptureSynchronizedSampleBufferDataClass = interface(AVCaptureSynchronizedDataClass)
    ['{B1C916AA-CFAD-4A7C-A808-E8731735340C}']
  end;

  AVCaptureSynchronizedSampleBufferData = interface(AVCaptureSynchronizedData)
    ['{2C8D561B-EE3B-4CD9-B001-DAC4D9E9D8C3}']
    function droppedReason: AVCaptureOutputDataDroppedReason; cdecl;
    function sampleBuffer: CMSampleBufferRef; cdecl;
    function sampleBufferWasDropped: Boolean; cdecl;
  end;
  TAVCaptureSynchronizedSampleBufferData = class(TOCGenericImport<AVCaptureSynchronizedSampleBufferDataClass,
    AVCaptureSynchronizedSampleBufferData>) end;

  AVCaptureSynchronizedMetadataObjectDataClass = interface(AVCaptureSynchronizedDataClass)
    ['{3B7AE51F-750E-4824-9779-6C9AC33497E7}']
  end;

  AVCaptureSynchronizedMetadataObjectData = interface(AVCaptureSynchronizedData)
    ['{DD4C95D7-7884-453C-80E5-4F388B227EB8}']
    function metadataObjects: NSArray; cdecl;
  end;
  TAVCaptureSynchronizedMetadataObjectData = class(TOCGenericImport<AVCaptureSynchronizedMetadataObjectDataClass,
    AVCaptureSynchronizedMetadataObjectData>) end;

  AVCaptureSynchronizedDepthDataClass = interface(AVCaptureSynchronizedDataClass)
    ['{88749EED-2E60-4E66-AD26-2A13A4507CAE}']
  end;

  AVCaptureSynchronizedDepthData = interface(AVCaptureSynchronizedData)
    ['{C2CB7748-FBE2-41BE-9254-AEAE15A2CB7F}']
    function depthData: AVDepthData; cdecl;
    function depthDataWasDropped: Boolean; cdecl;
    function droppedReason: AVCaptureOutputDataDroppedReason; cdecl;
  end;
  TAVCaptureSynchronizedDepthData = class(TOCGenericImport<AVCaptureSynchronizedDepthDataClass, AVCaptureSynchronizedDepthData>) end;

  AVCaptureMetadataInputClass = interface(AVCaptureInputClass)
    ['{07631965-B1D2-442D-A6B7-2AF258A47C40}']
    [MethodName('metadataInputWithFormatDescription:clock:')]
    {class} function metadataInputWithFormatDescription(desc: CMMetadataFormatDescriptionRef; clock: CMClockRef): Pointer; cdecl;
  end;

  AVCaptureMetadataInput = interface(AVCaptureInput)
    ['{66EED8D5-2405-4160-8FBB-9D38B8327C66}']
    [MethodName('appendTimedMetadataGroup:error:')]
    function appendTimedMetadataGroup(metadata: AVTimedMetadataGroup; outError: PNSError): Boolean; cdecl;
    [MethodName('initWithFormatDescription:clock:')]
    function initWithFormatDescription(desc: CMMetadataFormatDescriptionRef; clock: CMClockRef): Pointer; cdecl;
  end;
  TAVCaptureMetadataInput = class(TOCGenericImport<AVCaptureMetadataInputClass, AVCaptureMetadataInput>) end;

  AVCaptureSystemPressureStateClass = interface(NSObjectClass)
    ['{1DD196A4-9BA3-446D-8CA2-A996F5697405}']
  end;

  AVCaptureSystemPressureState = interface(NSObject)
    ['{EE8C7D6A-5DF0-4112-BB04-732B007D2B13}']
    function factors: AVCaptureSystemPressureFactors; cdecl;
    function level: AVCaptureSystemPressureLevel; cdecl;
  end;
  TAVCaptureSystemPressureState = class(TOCGenericImport<AVCaptureSystemPressureStateClass, AVCaptureSystemPressureState>) end;

  AVDepthDataClass = interface(NSObjectClass)
    ['{EAE92A1B-6063-4E29-816C-9BBE5361C104}']
    [MethodName('depthDataFromDictionaryRepresentation:error:')]
    {class} function depthDataFromDictionaryRepresentation(imageSourceAuxDataInfoDictionary: NSDictionary; outError: PNSError): Pointer; cdecl;
  end;

  AVDepthData = interface(NSObject)
    ['{4B10037F-94E0-446A-9BFE-6348CF9C09CC}']
    function availableDepthDataTypes: NSArray; cdecl;
    function cameraCalibrationData: AVCameraCalibrationData; cdecl;
    function depthDataAccuracy: AVDepthDataAccuracy; cdecl;
    function depthDataByApplyingExifOrientation(exifOrientation: CGImagePropertyOrientation): Pointer; cdecl;
    function depthDataByConvertingToDepthDataType(depthDataType: OSType): Pointer; cdecl;
    [MethodName('depthDataByReplacingDepthDataMapWithPixelBuffer:error:')]
    function depthDataByReplacingDepthDataMapWithPixelBuffer(pixelBuffer: CVPixelBufferRef; outError: PNSError): Pointer; cdecl;
    function depthDataMap: CVPixelBufferRef; cdecl;
    function depthDataQuality: AVDepthDataQuality; cdecl;
    function depthDataType: OSType; cdecl;
    function dictionaryRepresentationForAuxiliaryDataType(outAuxDataType: PNSString): NSDictionary; cdecl;
    function isDepthDataFiltered: Boolean; cdecl;
  end;
  TAVDepthData = class(TOCGenericImport<AVDepthDataClass, AVDepthData>) end;

  AVPortraitEffectsMatteClass = interface(NSObjectClass)
    ['{9451F45B-AE59-47B5-B5AE-3541DB23314D}']
    [MethodName('portraitEffectsMatteFromDictionaryRepresentation:error:')]
    {class} function portraitEffectsMatteFromDictionaryRepresentation(imageSourceAuxDataInfoDictionary: NSDictionary; outError: PNSError): Pointer; cdecl;
  end;

  AVPortraitEffectsMatte = interface(NSObject)
    ['{B0D8D28A-817E-485F-92DA-E2F921681206}']
    function dictionaryRepresentationForAuxiliaryDataType(outAuxDataType: PNSString): NSDictionary; cdecl;
    function mattingImage: CVPixelBufferRef; cdecl;
    function pixelFormatType: OSType; cdecl;
    function portraitEffectsMatteByApplyingExifOrientation(exifOrientation: CGImagePropertyOrientation): Pointer; cdecl;
    [MethodName('portraitEffectsMatteByReplacingPortraitEffectsMatteWithPixelBuffer:error:')]
    function portraitEffectsMatteByReplacingPortraitEffectsMatteWithPixelBuffer(pixelBuffer: CVPixelBufferRef; outError: PNSError): Pointer; cdecl;
  end;
  TAVPortraitEffectsMatte = class(TOCGenericImport<AVPortraitEffectsMatteClass, AVPortraitEffectsMatte>) end;

  AVMediaSelectionClass = interface(NSObjectClass)
    ['{F84A85C8-4941-4D4B-8BA0-7CC6ACCF5B75}']
  end;

  AVMediaSelection = interface(NSObject)
    ['{BAD67CF8-A3BB-4E8F-97B3-8AE6A183AC69}']
    function asset: AVAsset; cdecl;
    function mediaSelectionCriteriaCanBeAppliedAutomaticallyToMediaSelectionGroup(mediaSelectionGroup: AVMediaSelectionGroup): Boolean; cdecl;
    function selectedMediaOptionInMediaSelectionGroup(mediaSelectionGroup: AVMediaSelectionGroup): AVMediaSelectionOption; cdecl;
  end;
  TAVMediaSelection = class(TOCGenericImport<AVMediaSelectionClass, AVMediaSelection>) end;

  AVMutableMediaSelectionClass = interface(AVMediaSelectionClass)
    ['{36A9FA7E-A524-4C9C-A9D3-E921988A79B1}']
  end;

  AVMutableMediaSelection = interface(AVMediaSelection)
    ['{E32CA091-7EF7-4BDE-B8C8-B2B8576BFA4C}']
    [MethodName('selectMediaOption:inMediaSelectionGroup:')]
    procedure selectMediaOption(mediaSelectionOption: AVMediaSelectionOption; mediaSelectionGroup: AVMediaSelectionGroup); cdecl;
  end;
  TAVMutableMediaSelection = class(TOCGenericImport<AVMutableMediaSelectionClass, AVMutableMediaSelection>) end;

  AVMetadataItemValueRequestClass = interface(NSObjectClass)
    ['{69381B1F-40CB-407E-A708-C5C34B2D6FDE}']
  end;

  AVMetadataItemValueRequest = interface(NSObject)
    ['{476297FB-948B-4C9A-A704-35CB5DB747ED}']
    function metadataItem: AVMetadataItem; cdecl;
    procedure respondWithError(error: NSError); cdecl;
    procedure respondWithValue(value: Pointer); cdecl;
  end;
  TAVMetadataItemValueRequest = class(TOCGenericImport<AVMetadataItemValueRequestClass, AVMetadataItemValueRequest>) end;

  AVMetadataItemFilterClass = interface(NSObjectClass)
    ['{D77B77B4-D7CA-4D73-9D40-DD92698EA4A4}']
    {class} function metadataItemFilterForSharing: AVMetadataItemFilter; cdecl;
  end;

  AVMetadataItemFilter = interface(NSObject)
    ['{6A72B8FB-A729-4387-8DCD-F03219EEA79E}']
  end;
  TAVMetadataItemFilter = class(TOCGenericImport<AVMetadataItemFilterClass, AVMetadataItemFilter>) end;

  AVMovieTrackClass = interface(AVAssetTrackClass)
    ['{E8BE0FD2-C214-4108-B9E4-3CEBAB7FB273}']
  end;

  AVMovieTrack = interface(AVAssetTrack)
    ['{2B08ACDC-0ABD-4F25-8FCF-1BF7CECF8101}']
    function alternateGroupID: NSInteger; cdecl;
    function mediaDataStorage: AVMediaDataStorage; cdecl;
    function mediaDecodeTimeRange: CMTimeRange; cdecl;
    function mediaPresentationTimeRange: CMTimeRange; cdecl;
  end;
  TAVMovieTrack = class(TOCGenericImport<AVMovieTrackClass, AVMovieTrack>) end;

  AVMutableMovieTrackClass = interface(AVMovieTrackClass)
    ['{F122C1FB-6553-4067-9B87-2D1A202E190F}']
  end;

  AVMutableMovieTrack = interface(AVMovieTrack)
    ['{9EA86BDD-4B8C-46EE-8977-1E8FB0C3A894}']
    [MethodName('addTrackAssociationToTrack:type:')]
    procedure addTrackAssociationToTrack(movieTrack: AVMovieTrack; trackAssociationType: AVTrackAssociationType); cdecl;
    function alternateGroupID: NSInteger; cdecl;
    [MethodName('appendSampleBuffer:decodeTime:presentationTime:error:')]
    function appendSampleBuffer(sampleBuffer: CMSampleBufferRef; outDecodeTime: PCMTime; outPresentationTime: PCMTime; outError: PNSError): Boolean; cdecl;
    function cleanApertureDimensions: CGSize; cdecl;
    function encodedPixelsDimensions: CGSize; cdecl;
    function extendedLanguageTag: NSString; cdecl;
    function hasProtectedContent: Boolean; cdecl;
    procedure insertEmptyTimeRange(timeRange: CMTimeRange); cdecl;
    [MethodName('insertMediaTimeRange:intoTimeRange:')]
    function insertMediaTimeRange(mediaTimeRange: CMTimeRange; trackTimeRange: CMTimeRange): Boolean; cdecl;
    [MethodName('insertTimeRange:ofTrack:atTime:copySampleData:error:')]
    function insertTimeRange(timeRange: CMTimeRange; track: AVAssetTrack; startTime: CMTime; copySampleData: Boolean; outError: PNSError): Boolean; cdecl;
    function isEnabled: Boolean; cdecl;
    function isModified: Boolean; cdecl;
    function languageCode: NSString; cdecl;
    function layer: NSInteger; cdecl;
    function mediaDataStorage: AVMediaDataStorage; cdecl;
    function metadata: NSArray; cdecl;
    function naturalSize: CGSize; cdecl;
    function preferredMediaChunkAlignment: NSInteger; cdecl;
    function preferredMediaChunkDuration: CMTime; cdecl;
    function preferredMediaChunkSize: NSInteger; cdecl;
    function preferredTransform: CGAffineTransform; cdecl;
    function preferredVolume: Single; cdecl;
    function productionApertureDimensions: CGSize; cdecl;
    procedure removeTimeRange(timeRange: CMTimeRange); cdecl;
    [MethodName('removeTrackAssociationToTrack:type:')]
    procedure removeTrackAssociationToTrack(movieTrack: AVMovieTrack; trackAssociationType: AVTrackAssociationType); cdecl;
    [MethodName('replaceFormatDescription:withFormatDescription:')]
    procedure replaceFormatDescription(formatDescription: CMFormatDescriptionRef; newFormatDescription: CMFormatDescriptionRef); cdecl;
    function sampleReferenceBaseURL: NSURL; cdecl;
    [MethodName('scaleTimeRange:toDuration:')]
    procedure scaleTimeRange(timeRange: CMTimeRange; duration: CMTime); cdecl;
    procedure setAlternateGroupID(alternateGroupID: NSInteger); cdecl;
    procedure setCleanApertureDimensions(cleanApertureDimensions: CGSize); cdecl;
    procedure setEnabled(enabled: Boolean); cdecl;
    procedure setEncodedPixelsDimensions(encodedPixelsDimensions: CGSize); cdecl;
    procedure setExtendedLanguageTag(extendedLanguageTag: NSString); cdecl;
    procedure setLanguageCode(languageCode: NSString); cdecl;
    procedure setLayer(layer: NSInteger); cdecl;
    procedure setMediaDataStorage(mediaDataStorage: AVMediaDataStorage); cdecl;
    procedure setMetadata(metadata: NSArray); cdecl;
    procedure setModified(modified: Boolean); cdecl;
    procedure setNaturalSize(naturalSize: CGSize); cdecl;
    procedure setPreferredMediaChunkAlignment(preferredMediaChunkAlignment: NSInteger); cdecl;
    procedure setPreferredMediaChunkDuration(preferredMediaChunkDuration: CMTime); cdecl;
    procedure setPreferredMediaChunkSize(preferredMediaChunkSize: NSInteger); cdecl;
    procedure setPreferredTransform(preferredTransform: CGAffineTransform); cdecl;
    procedure setPreferredVolume(preferredVolume: Single); cdecl;
    procedure setProductionApertureDimensions(productionApertureDimensions: CGSize); cdecl;
    procedure setSampleReferenceBaseURL(sampleReferenceBaseURL: NSURL); cdecl;
    procedure setTimescale(timescale: CMTimeScale); cdecl;
    function timescale: CMTimeScale; cdecl;
  end;
  TAVMutableMovieTrack = class(TOCGenericImport<AVMutableMovieTrackClass, AVMutableMovieTrack>) end;

  AVFragmentedMovieTrackClass = interface(AVMovieTrackClass)
    ['{6B2241C5-97A5-44AC-BBD8-E719178914BF}']
  end;

  AVFragmentedMovieTrack = interface(AVMovieTrack)
    ['{51A8F0BB-7E2E-4034-AF74-A075313AD811}']
  end;
  TAVFragmentedMovieTrack = class(TOCGenericImport<AVFragmentedMovieTrackClass, AVFragmentedMovieTrack>) end;

  AVMovieClass = interface(AVAssetClass)
    ['{692457A6-B782-4916-8B81-D0AE9C20B388}']
    {class} function movieTypes: NSArray; cdecl;
    [MethodName('movieWithData:options:')]
    {class} function movieWithData(data: NSData; options: NSDictionary): Pointer; cdecl;
    [MethodName('movieWithURL:options:')]
    {class} function movieWithURL(URL: NSURL; options: NSDictionary): Pointer; cdecl;
  end;

  AVMovie = interface(AVAsset)
    ['{4993C4D0-2032-45CA-B41E-5A19017225E0}']
    function canContainMovieFragments: Boolean; cdecl;
    function containsMovieFragments: Boolean; cdecl;
    function data: NSData; cdecl;
    function defaultMediaDataStorage: AVMediaDataStorage; cdecl;
    [MethodName('initWithData:options:')]
    function initWithData(data: NSData; options: NSDictionary): Pointer; cdecl;
    [MethodName('initWithURL:options:')]
    function initWithURL(URL: NSURL; options: NSDictionary): Pointer; cdecl;
    function isCompatibleWithFileType(fileType: AVFileType): Boolean; cdecl;
    [MethodName('movieHeaderWithFileType:error:')]
    function movieHeaderWithFileType(fileType: AVFileType; outError: PNSError): NSData; cdecl;
    function tracks: NSArray; cdecl;
    function tracksWithMediaCharacteristic(mediaCharacteristic: AVMediaCharacteristic): NSArray; cdecl;
    function tracksWithMediaType(mediaType: AVMediaType): NSArray; cdecl;
    function trackWithTrackID(trackID: CMPersistentTrackID): AVMovieTrack; cdecl;
    function URL: NSURL; cdecl;
    [MethodName('writeMovieHeaderToURL:fileType:options:error:')]
    function writeMovieHeaderToURL(URL: NSURL; fileType: AVFileType; options: AVMovieWritingOptions; outError: PNSError): Boolean; cdecl;
  end;
  TAVMovie = class(TOCGenericImport<AVMovieClass, AVMovie>) end;

  AVMutableMovieClass = interface(AVMovieClass)
    ['{9651F07F-2DBD-4CA2-89DE-03349B9E2B6B}']
    [MethodName('movieWithData:options:error:')]
    {class} function movieWithData(data: NSData; options: NSDictionary; outError: PNSError): Pointer; cdecl;
    [MethodName('movieWithSettingsFromMovie:options:error:')]
    {class} function movieWithSettingsFromMovie(movie: AVMovie; options: NSDictionary; outError: PNSError): Pointer; cdecl;
    [MethodName('movieWithURL:options:error:')]
    {class} function movieWithURL(URL: NSURL; options: NSDictionary; outError: PNSError): Pointer; cdecl;
  end;

  AVMutableMovie = interface(AVMovie)
    ['{D66DC775-6159-4596-9239-F6B9BA2E3575}']
    [MethodName('addMutableTracksCopyingSettingsFromTracks:options:')]
    function addMutableTracksCopyingSettingsFromTracks(existingTracks: NSArray; options: NSDictionary): NSArray; cdecl;
    [MethodName('addMutableTrackWithMediaType:copySettingsFromTrack:options:')]
    function addMutableTrackWithMediaType(mediaType: AVMediaType; track: AVAssetTrack; options: NSDictionary): AVMutableMovieTrack; cdecl;
    function defaultMediaDataStorage: AVMediaDataStorage; cdecl;
    [MethodName('initWithData:options:error:')]
    function initWithData(data: NSData; options: NSDictionary; outError: PNSError): Pointer; cdecl;
    [MethodName('initWithSettingsFromMovie:options:error:')]
    function initWithSettingsFromMovie(movie: AVMovie; options: NSDictionary; outError: PNSError): Pointer; cdecl;
    [MethodName('initWithURL:options:error:')]
    function initWithURL(URL: NSURL; options: NSDictionary; outError: PNSError): Pointer; cdecl;
    procedure insertEmptyTimeRange(timeRange: CMTimeRange); cdecl;
    [MethodName('insertTimeRange:ofAsset:atTime:copySampleData:error:')]
    function insertTimeRange(timeRange: CMTimeRange; asset: AVAsset; startTime: CMTime; copySampleData: Boolean; outError: PNSError): Boolean; cdecl;
    function interleavingPeriod: CMTime; cdecl;
    function isModified: Boolean; cdecl;
    function metadata: NSArray; cdecl;
    function mutableTrackCompatibleWithTrack(track: AVAssetTrack): AVMutableMovieTrack; cdecl;
    function preferredRate: Single; cdecl;
    function preferredTransform: CGAffineTransform; cdecl;
    function preferredVolume: Single; cdecl;
    procedure removeTimeRange(timeRange: CMTimeRange); cdecl;
    procedure removeTrack(track: AVMovieTrack); cdecl;
    [MethodName('scaleTimeRange:toDuration:')]
    procedure scaleTimeRange(timeRange: CMTimeRange; duration: CMTime); cdecl;
    procedure setDefaultMediaDataStorage(defaultMediaDataStorage: AVMediaDataStorage); cdecl;
    procedure setInterleavingPeriod(interleavingPeriod: CMTime); cdecl;
    procedure setMetadata(metadata: NSArray); cdecl;
    procedure setModified(modified: Boolean); cdecl;
    procedure setPreferredRate(preferredRate: Single); cdecl;
    procedure setPreferredTransform(preferredTransform: CGAffineTransform); cdecl;
    procedure setPreferredVolume(preferredVolume: Single); cdecl;
    procedure setTimescale(timescale: CMTimeScale); cdecl;
    function timescale: CMTimeScale; cdecl;
    function tracks: NSArray; cdecl;
    function tracksWithMediaCharacteristic(mediaCharacteristic: AVMediaCharacteristic): NSArray; cdecl;
    function tracksWithMediaType(mediaType: AVMediaType): NSArray; cdecl;
    function trackWithTrackID(trackID: CMPersistentTrackID): AVMutableMovieTrack; cdecl;
  end;
  TAVMutableMovie = class(TOCGenericImport<AVMutableMovieClass, AVMutableMovie>) end;

  AVMediaDataStorageClass = interface(NSObjectClass)
    ['{DE5D59D6-F3BF-421B-A6D1-87A421A9EBC6}']
  end;

  AVMediaDataStorage = interface(NSObject)
    ['{62FF64EE-6B94-4EA8-A7DA-1470B1D6C573}']
    [MethodName('initWithURL:options:')]
    function initWithURL(URL: NSURL; options: NSDictionary): Pointer; cdecl;
    function URL: NSURL; cdecl;
  end;
  TAVMediaDataStorage = class(TOCGenericImport<AVMediaDataStorageClass, AVMediaDataStorage>) end;

  AVFragmentedMovieClass = interface(AVMovieClass)
    ['{6871D3C5-78AE-4ADD-B18E-7E076FD71FBE}']
  end;

  AVFragmentedMovie = interface(AVMovie)
    ['{30D6C735-9DFA-4878-84AD-963F0B648010}']
    function tracks: NSArray; cdecl;
    function tracksWithMediaCharacteristic(mediaCharacteristic: AVMediaCharacteristic): NSArray; cdecl;
    function tracksWithMediaType(mediaType: AVMediaType): NSArray; cdecl;
    function trackWithTrackID(trackID: CMPersistentTrackID): AVFragmentedMovieTrack; cdecl;
  end;
  TAVFragmentedMovie = class(TOCGenericImport<AVFragmentedMovieClass, AVFragmentedMovie>) end;

  AVFragmentedMovieMinderClass = interface(AVFragmentedAssetMinderClass)
    ['{0A2EC806-F535-4A85-BE8F-8EEAB032FCC7}']
    [MethodName('fragmentedMovieMinderWithMovie:mindingInterval:')]
    {class} function fragmentedMovieMinderWithMovie(movie: AVFragmentedMovie; mindingInterval: NSTimeInterval): Pointer; cdecl;
  end;

  AVFragmentedMovieMinder = interface(AVFragmentedAssetMinder)
    ['{F3D6C03D-824E-4FE6-9FF8-3A2C548D20FA}']
    procedure addFragmentedMovie(movie: AVFragmentedMovie); cdecl;
    [MethodName('initWithMovie:mindingInterval:')]
    function initWithMovie(movie: AVFragmentedMovie; mindingInterval: NSTimeInterval): Pointer; cdecl;
    function mindingInterval: NSTimeInterval; cdecl;
    function movies: NSArray; cdecl;
    procedure removeFragmentedMovie(movie: AVFragmentedMovie); cdecl;
    procedure setMindingInterval(mindingInterval: NSTimeInterval); cdecl;
  end;
  TAVFragmentedMovieMinder = class(TOCGenericImport<AVFragmentedMovieMinderClass, AVFragmentedMovieMinder>) end;

  AVOutputSettingsAssistantClass = interface(NSObjectClass)
    ['{387A02FD-90BA-4B4C-B204-4FB5F04A72D5}']
    {class} function availableOutputSettingsPresets: NSArray; cdecl;
    {class} function outputSettingsAssistantWithPreset(presetIdentifier: AVOutputSettingsPreset): Pointer; cdecl;
  end;

  AVOutputSettingsAssistant = interface(NSObject)
    ['{3E9FE971-9CB1-415E-8348-4BC066323479}']
    function audioSettings: NSDictionary; cdecl;
    function outputFileType: AVFileType; cdecl;
    procedure setSourceAudioFormat(sourceAudioFormat: CMAudioFormatDescriptionRef); cdecl;
    procedure setSourceVideoAverageFrameDuration(sourceVideoAverageFrameDuration: CMTime); cdecl;
    procedure setSourceVideoFormat(sourceVideoFormat: CMVideoFormatDescriptionRef); cdecl;
    procedure setSourceVideoMinFrameDuration(sourceVideoMinFrameDuration: CMTime); cdecl;
    function sourceAudioFormat: CMAudioFormatDescriptionRef; cdecl;
    function sourceVideoAverageFrameDuration: CMTime; cdecl;
    function sourceVideoFormat: CMVideoFormatDescriptionRef; cdecl;
    function sourceVideoMinFrameDuration: CMTime; cdecl;
    function videoSettings: NSDictionary; cdecl;
  end;
  TAVOutputSettingsAssistant = class(TOCGenericImport<AVOutputSettingsAssistantClass, AVOutputSettingsAssistant>) end;

  AVPlayerItemMediaDataCollectorClass = interface(NSObjectClass)
    ['{5F8F9A84-D031-44DB-8715-29624449FBCB}']
  end;

  AVPlayerItemMediaDataCollector = interface(NSObject)
    ['{47562E68-F9BA-4D03-A5FA-18B5061221EC}']
  end;
  TAVPlayerItemMediaDataCollector = class(TOCGenericImport<AVPlayerItemMediaDataCollectorClass, AVPlayerItemMediaDataCollector>) end;

  AVPlayerItemMetadataCollectorClass = interface(AVPlayerItemMediaDataCollectorClass)
    ['{9A1D52F3-ACCB-4075-A02D-C8F9B2669056}']
  end;

  AVPlayerItemMetadataCollector = interface(AVPlayerItemMediaDataCollector)
    ['{7DB96598-35E3-4DFC-9629-CBE52A882A88}']
    function delegate: Pointer; cdecl;
    function delegateQueue: dispatch_queue_t; cdecl;
    [MethodName('initWithIdentifiers:classifyingLabels:')]
    function initWithIdentifiers(identifiers: NSArray; classifyingLabels: NSArray): Pointer; cdecl;
    [MethodName('setDelegate:queue:')]
    procedure setDelegate(delegate: Pointer; delegateQueue: dispatch_queue_t); cdecl;
  end;
  TAVPlayerItemMetadataCollector = class(TOCGenericImport<AVPlayerItemMetadataCollectorClass, AVPlayerItemMetadataCollector>) end;

  AVPlayerItemMetadataCollectorPushDelegate = interface(IObjectiveC)
    ['{FDEE111D-D19A-403B-98B6-A0B9D4A08A44}']
    [MethodName('metadataCollector:didCollectDateRangeMetadataGroups:indexesOfNewGroups:indexesOfModifiedGroups:')]
    procedure metadataCollector(metadataCollector: AVPlayerItemMetadataCollector; metadataGroups: NSArray; indexesOfNewGroups: NSIndexSet; indexesOfModifiedGroups: NSIndexSet); cdecl;
  end;

  AVPlayerItemOutputClass = interface(NSObjectClass)
    ['{333AEFA4-8543-4189-98D1-6150919AED9A}']
  end;

  AVPlayerItemOutput = interface(NSObject)
    ['{3BE5B70D-9703-4486-A2CC-8115B6BF0EB7}']
    function itemTimeForCVTimeStamp(timestamp: CVTimeStamp): CMTime; cdecl;
    function itemTimeForHostTime(hostTimeInSeconds: CFTimeInterval): CMTime; cdecl;
    function itemTimeForMachAbsoluteTime(machAbsoluteTime: Int64): CMTime; cdecl;
    procedure setSuppressesPlayerRendering(suppressesPlayerRendering: Boolean); cdecl;
    function suppressesPlayerRendering: Boolean; cdecl;
  end;
  TAVPlayerItemOutput = class(TOCGenericImport<AVPlayerItemOutputClass, AVPlayerItemOutput>) end;

  AVPlayerItemVideoOutputClass = interface(AVPlayerItemOutputClass)
    ['{7D663593-D334-4262-9BD2-132A9B47F9B9}']
  end;

  AVPlayerItemVideoOutput = interface(AVPlayerItemOutput)
    ['{D3F97672-F758-468F-968C-90ADEF1D04E2}']
    [MethodName('copyPixelBufferForItemTime:itemTimeForDisplay:')]
    function copyPixelBufferForItemTime(itemTime: CMTime; outItemTimeForDisplay: PCMTime): CVPixelBufferRef; cdecl;
    function delegate: Pointer; cdecl;
    function delegateQueue: dispatch_queue_t; cdecl;
    function hasNewPixelBufferForItemTime(itemTime: CMTime): Boolean; cdecl;
    function initWithOutputSettings(outputSettings: NSDictionary): Pointer; cdecl;
    function initWithPixelBufferAttributes(pixelBufferAttributes: NSDictionary): Pointer; cdecl;
    procedure requestNotificationOfMediaDataChangeWithAdvanceInterval(interval: NSTimeInterval); cdecl;
    [MethodName('setDelegate:queue:')]
    procedure setDelegate(delegate: Pointer; delegateQueue: dispatch_queue_t); cdecl;
  end;
  TAVPlayerItemVideoOutput = class(TOCGenericImport<AVPlayerItemVideoOutputClass, AVPlayerItemVideoOutput>) end;

  AVPlayerItemOutputPullDelegate = interface(IObjectiveC)
    ['{DE4BF4ED-A92D-4527-B39B-29F6641F2CCD}']
    procedure outputMediaDataWillChange(sender: AVPlayerItemOutput); cdecl;
    procedure outputSequenceWasFlushed(output: AVPlayerItemOutput); cdecl;
  end;

  AVPlayerItemLegibleOutputClass = interface(AVPlayerItemOutputClass)
    ['{868347FC-4451-4FBE-A5B4-9C5EF1A68A86}']
  end;

  AVPlayerItemLegibleOutput = interface(AVPlayerItemOutput)
    ['{3EC3B69B-540D-47B5-937E-D3B3F54233CA}']
    function advanceIntervalForDelegateInvocation: NSTimeInterval; cdecl;
    function delegate: Pointer; cdecl;
    function delegateQueue: dispatch_queue_t; cdecl;
    function initWithMediaSubtypesForNativeRepresentation(subtypes: NSArray): Pointer; cdecl;
    procedure setAdvanceIntervalForDelegateInvocation(advanceIntervalForDelegateInvocation: NSTimeInterval); cdecl;
    [MethodName('setDelegate:queue:')]
    procedure setDelegate(delegate: Pointer; delegateQueue: dispatch_queue_t); cdecl;
    procedure setTextStylingResolution(textStylingResolution: AVPlayerItemLegibleOutputTextStylingResolution); cdecl;
    function textStylingResolution: AVPlayerItemLegibleOutputTextStylingResolution; cdecl;
  end;
  TAVPlayerItemLegibleOutput = class(TOCGenericImport<AVPlayerItemLegibleOutputClass, AVPlayerItemLegibleOutput>) end;

  AVPlayerItemLegibleOutputPushDelegate = interface(IObjectiveC)
    ['{ED3D53A1-ED67-47DA-899B-A5DAAD0DC4FC}']
    [MethodName('legibleOutput:didOutputAttributedStrings:nativeSampleBuffers:forItemTime:')]
    procedure legibleOutput(output: AVPlayerItemLegibleOutput; strings: NSArray; nativeSamples: NSArray; itemTime: CMTime); cdecl;
  end;

  AVPlayerItemOutputPushDelegate = interface(IObjectiveC)
    ['{5AF71192-211A-4555-807E-159299F273BE}']
    procedure outputSequenceWasFlushed(output: AVPlayerItemOutput); cdecl;
  end;

  AVPlayerItemMetadataOutputClass = interface(AVPlayerItemOutputClass)
    ['{5372E436-3AAC-4F64-AF87-7BBE0AD753B2}']
  end;

  AVPlayerItemMetadataOutput = interface(AVPlayerItemOutput)
    ['{7AFA2CD9-D249-44A6-8DA7-71EA60AB9C89}']
    function advanceIntervalForDelegateInvocation: NSTimeInterval; cdecl;
    function delegate: Pointer; cdecl;
    function delegateQueue: dispatch_queue_t; cdecl;
    function initWithIdentifiers(identifiers: NSArray): Pointer; cdecl;
    procedure setAdvanceIntervalForDelegateInvocation(advanceIntervalForDelegateInvocation: NSTimeInterval); cdecl;
    [MethodName('setDelegate:queue:')]
    procedure setDelegate(delegate: Pointer; delegateQueue: dispatch_queue_t); cdecl;
  end;
  TAVPlayerItemMetadataOutput = class(TOCGenericImport<AVPlayerItemMetadataOutputClass, AVPlayerItemMetadataOutput>) end;

  AVPlayerItemMetadataOutputPushDelegate = interface(IObjectiveC)
    ['{54399118-CB2D-480D-AC13-C98E411C0978}']
    [MethodName('metadataOutput:didOutputTimedMetadataGroups:fromPlayerItemTrack:')]
    procedure metadataOutput(output: AVPlayerItemMetadataOutput; groups: NSArray; track: AVPlayerItemTrack); cdecl;
  end;

  AVPlayerLooperClass = interface(NSObjectClass)
    ['{A2BD6C01-8FB6-4ECE-81F4-69D900F76077}']
    [MethodName('playerLooperWithPlayer:templateItem:')]
    {class} function playerLooperWithPlayer(player: AVQueuePlayer; itemToLoop: AVPlayerItem): Pointer; overload; cdecl;
    [MethodName('playerLooperWithPlayer:templateItem:timeRange:')]
    {class} function playerLooperWithPlayer(player: AVQueuePlayer; itemToLoop: AVPlayerItem; loopRange: CMTimeRange): Pointer; overload; cdecl;
  end;

  AVPlayerLooper = interface(NSObject)
    ['{3497B55B-0E47-49DF-94DF-E3818752C623}']
    procedure disableLooping; cdecl;
    function error: NSError; cdecl;
    [MethodName('initWithPlayer:templateItem:timeRange:')]
    function initWithPlayer(player: AVQueuePlayer; itemToLoop: AVPlayerItem; loopRange: CMTimeRange): Pointer; cdecl;
    function loopCount: NSInteger; cdecl;
    function loopingPlayerItems: NSArray; cdecl;
    function status: AVPlayerLooperStatus; cdecl;
  end;
  TAVPlayerLooper = class(TOCGenericImport<AVPlayerLooperClass, AVPlayerLooper>) end;

  AVPlayerMediaSelectionCriteriaClass = interface(NSObjectClass)
    ['{C38BDC6D-40A2-4CE6-B1B3-9D180B28BE77}']
  end;

  AVPlayerMediaSelectionCriteria = interface(NSObject)
    ['{F6166E4F-F596-4B02-9485-E711A385FE07}']
    [MethodName('initWithPreferredLanguages:preferredMediaCharacteristics:')]
    function initWithPreferredLanguages(preferredLanguages: NSArray; preferredMediaCharacteristics: NSArray): Pointer; cdecl;
    function preferredLanguages: NSArray; cdecl;
    function preferredMediaCharacteristics: NSArray; cdecl;
  end;
  TAVPlayerMediaSelectionCriteria = class(TOCGenericImport<AVPlayerMediaSelectionCriteriaClass, AVPlayerMediaSelectionCriteria>) end;

  AVQueuedSampleBufferRendering = interface(IObjectiveC)
    ['{1514F72A-4837-4528-8230-9D81EF391555}']
    procedure enqueueSampleBuffer(sampleBuffer: CMSampleBufferRef); cdecl;
    procedure flush; cdecl;
    function isReadyForMoreMediaData: Boolean; cdecl;
    [MethodName('requestMediaDataWhenReadyOnQueue:usingBlock:')]
    procedure requestMediaDataWhenReadyOnQueue(queue: dispatch_queue_t; block: TAVQueuedSampleBufferRenderingBlockMethod1); cdecl;
    procedure stopRequestingMediaData; cdecl;
    function timebase: CMTimebaseRef; cdecl;
  end;

  AVRouteDetectorClass = interface(NSObjectClass)
    ['{93BC8EB7-660C-41C8-890A-72F1ED8501F9}']
  end;

  AVRouteDetector = interface(NSObject)
    ['{523BF2CE-56F0-4ABC-833B-505A69F11726}']
    function isRouteDetectionEnabled: Boolean; cdecl;
    function multipleRoutesDetected: Boolean; cdecl;
    procedure setRouteDetectionEnabled(routeDetectionEnabled: Boolean); cdecl;
  end;
  TAVRouteDetector = class(TOCGenericImport<AVRouteDetectorClass, AVRouteDetector>) end;

  AVSampleBufferAudioRendererClass = interface(NSObjectClass)
    ['{8C3FD66C-844C-4650-ADE9-B401E2721FD8}']
  end;

  AVSampleBufferAudioRenderer = interface(NSObject)
    ['{4D21DD78-97E8-466B-8352-0E248773B89F}']
    function audioOutputDeviceUniqueID: NSString; cdecl;
    function audioTimePitchAlgorithm: AVAudioTimePitchAlgorithm; cdecl;
    function error: NSError; cdecl;
    [MethodName('flushFromSourceTime:completionHandler:')]
    procedure flushFromSourceTime(time: CMTime; completionHandler: TAVSampleBufferAudioRendererBlockMethod1); cdecl;
    function isMuted: Boolean; cdecl;
    procedure setAudioOutputDeviceUniqueID(audioOutputDeviceUniqueID: NSString); cdecl;
    procedure setAudioTimePitchAlgorithm(audioTimePitchAlgorithm: AVAudioTimePitchAlgorithm); cdecl;
    procedure setMuted(muted: Boolean); cdecl;
    procedure setVolume(volume: Single); cdecl;
    function status: AVQueuedSampleBufferRenderingStatus; cdecl;
    function volume: Single; cdecl;
  end;
  TAVSampleBufferAudioRenderer = class(TOCGenericImport<AVSampleBufferAudioRendererClass, AVSampleBufferAudioRenderer>) end;

  AVSampleBufferDisplayLayerClass = interface(CALayerClass)
    ['{D0FB0FEF-DD48-4A2E-98F4-549589633B35}']
  end;

  AVSampleBufferDisplayLayer = interface(CALayer)
    ['{28D00EBE-1D06-42CB-959C-172E98BB1A85}']
    function controlTimebase: CMTimebaseRef; cdecl;
    procedure enqueueSampleBuffer(sampleBuffer: CMSampleBufferRef); cdecl;
    function error: NSError; cdecl;
    procedure flush; cdecl;
    procedure flushAndRemoveImage; cdecl;
    function isReadyForMoreMediaData: Boolean; cdecl;
    [MethodName('requestMediaDataWhenReadyOnQueue:usingBlock:')]
    procedure requestMediaDataWhenReadyOnQueue(queue: dispatch_queue_t; block: TAVSampleBufferDisplayLayerBlockMethod1); cdecl;
    procedure setControlTimebase(controlTimebase: CMTimebaseRef); cdecl;
    procedure setVideoGravity(videoGravity: AVLayerVideoGravity); cdecl;
    function status: AVQueuedSampleBufferRenderingStatus; cdecl;
    procedure stopRequestingMediaData; cdecl;
    function videoGravity: AVLayerVideoGravity; cdecl;
  end;
  TAVSampleBufferDisplayLayer = class(TOCGenericImport<AVSampleBufferDisplayLayerClass, AVSampleBufferDisplayLayer>) end;

  AVSampleBufferRenderSynchronizerClass = interface(NSObjectClass)
    ['{458AC427-34E8-4719-A847-2231F9654407}']
  end;

  AVSampleBufferRenderSynchronizer = interface(NSObject)
    ['{4CF16C87-DB83-4E8D-89C2-3733311FCB75}']
    [MethodName('addBoundaryTimeObserverForTimes:queue:usingBlock:')]
    function addBoundaryTimeObserverForTimes(times: NSArray; queue: dispatch_queue_t; block: TAVSampleBufferRenderSynchronizerBlockMethod3): Pointer; cdecl;
    [MethodName('addPeriodicTimeObserverForInterval:queue:usingBlock:')]
    function addPeriodicTimeObserverForInterval(interval: CMTime; queue: dispatch_queue_t; block: TAVSampleBufferRenderSynchronizerBlockMethod2): Pointer; cdecl;
    procedure addRenderer(renderer: Pointer); cdecl;
    function currentTime: CMTime; cdecl;
    function rate: Single; cdecl;
    [MethodName('removeRenderer:atTime:completionHandler:')]
    procedure removeRenderer(renderer: Pointer; time: CMTime; completionHandler: TAVSampleBufferRenderSynchronizerBlockMethod1); cdecl;
    procedure removeTimeObserver(observer: Pointer); cdecl;
    function renderers: NSArray; cdecl;
    procedure setRate(rate: Single); overload; cdecl;
    [MethodName('setRate:time:')]
    procedure setRate(rate: Single; time: CMTime); overload; cdecl;
    function timebase: CMTimebaseRef; cdecl;
  end;
  TAVSampleBufferRenderSynchronizer = class(TOCGenericImport<AVSampleBufferRenderSynchronizerClass, AVSampleBufferRenderSynchronizer>) end;

  AVSampleCursorClass = interface(NSObjectClass)
    ['{26B7CB4B-91E7-4CB3-B902-4BBAB060895D}']
  end;

  AVSampleCursor = interface(NSObject)
    ['{2C587992-9A29-4876-988D-FEE82EC754C1}']
    function comparePositionInDecodeOrderWithPositionOfCursor(cursor: AVSampleCursor): NSComparisonResult; cdecl;
    function copyCurrentSampleFormatDescription: CMFormatDescriptionRef; cdecl;
    function currentChunkInfo: AVSampleCursorChunkInfo; cdecl;
    function currentChunkStorageRange: AVSampleCursorStorageRange; cdecl;
    function currentChunkStorageURL: NSURL; cdecl;
    function currentSampleDependencyInfo: AVSampleCursorDependencyInfo; cdecl;
    function currentSampleDuration: CMTime; cdecl;
    function currentSampleIndexInChunk: Int64; cdecl;
    function currentSampleStorageRange: AVSampleCursorStorageRange; cdecl;
    function currentSampleSyncInfo: AVSampleCursorSyncInfo; cdecl;
    function decodeTimeStamp: CMTime; cdecl;
    function presentationTimeStamp: CMTime; cdecl;
    function samplesRequiredForDecoderRefresh: NSInteger; cdecl;
    function samplesWithEarlierDecodeTimeStampsMayHaveLaterPresentationTimeStampsThanCursor(cursor: AVSampleCursor): Boolean; cdecl;
    function samplesWithLaterDecodeTimeStampsMayHaveEarlierPresentationTimeStampsThanCursor(cursor: AVSampleCursor): Boolean; cdecl;
    [MethodName('stepByDecodeTime:wasPinned:')]
    function stepByDecodeTime(deltaDecodeTime: CMTime; outWasPinned: PBoolean): CMTime; cdecl;
    [MethodName('stepByPresentationTime:wasPinned:')]
    function stepByPresentationTime(deltaPresentationTime: CMTime; outWasPinned: PBoolean): CMTime; cdecl;
    function stepInDecodeOrderByCount(stepCount: Int64): Int64; cdecl;
    function stepInPresentationOrderByCount(stepCount: Int64): Int64; cdecl;
  end;
  TAVSampleCursor = class(TOCGenericImport<AVSampleCursorClass, AVSampleCursor>) end;

  AVSampleBufferGeneratorClass = interface(NSObjectClass)
    ['{B631D1C0-7BEB-4BD4-B658-81FDE186217A}']
    [MethodName('notifyOfDataReadyForSampleBuffer:completionHandler:')]
    {class} procedure notifyOfDataReadyForSampleBuffer(sbuf: CMSampleBufferRef; completionHandler: TAVSampleBufferGeneratorBlockMethod1); cdecl;
  end;

  AVSampleBufferGenerator = interface(NSObject)
    ['{4601D01D-435C-442F-A406-679063961924}']
    function createSampleBufferForRequest(request: AVSampleBufferRequest): CMSampleBufferRef; cdecl;
    [MethodName('initWithAsset:timebase:')]
    function initWithAsset(asset: AVAsset; timebase: CMTimebaseRef): Pointer; cdecl;
  end;
  TAVSampleBufferGenerator = class(TOCGenericImport<AVSampleBufferGeneratorClass, AVSampleBufferGenerator>) end;

  AVSampleBufferRequestClass = interface(NSObjectClass)
    ['{ADBD1D32-4839-438F-863E-989294B4F5C8}']
  end;

  AVSampleBufferRequest = interface(NSObject)
    ['{2542297E-191D-428F-829A-87D88644B5C7}']
    function direction: AVSampleBufferRequestDirection; cdecl;
    function initWithStartCursor(startCursor: AVSampleCursor): Pointer; cdecl;
    function limitCursor: AVSampleCursor; cdecl;
    function maxSampleCount: NSInteger; cdecl;
    function mode: AVSampleBufferRequestMode; cdecl;
    function overrideTime: CMTime; cdecl;
    function preferredMinSampleCount: NSInteger; cdecl;
    procedure setDirection(direction: AVSampleBufferRequestDirection); cdecl;
    procedure setLimitCursor(limitCursor: AVSampleCursor); cdecl;
    procedure setMaxSampleCount(maxSampleCount: NSInteger); cdecl;
    procedure setMode(mode: AVSampleBufferRequestMode); cdecl;
    procedure setOverrideTime(overrideTime: CMTime); cdecl;
    procedure setPreferredMinSampleCount(preferredMinSampleCount: NSInteger); cdecl;
    function startCursor: AVSampleCursor; cdecl;
  end;
  TAVSampleBufferRequest = class(TOCGenericImport<AVSampleBufferRequestClass, AVSampleBufferRequest>) end;

  AVTextStyleRuleClass = interface(NSObjectClass)
    ['{C969612B-D040-40BA-B5DA-2FE64BDF1D11}']
    {class} function propertyListForTextStyleRules(textStyleRules: NSArray): Pointer; cdecl;
    {class} function textStyleRulesFromPropertyList(plist: Pointer): NSArray; cdecl;
    {class} function textStyleRuleWithTextMarkupAttributes(textMarkupAttributes: NSDictionary): AVTextStyleRule; overload; cdecl;
    [MethodName('textStyleRuleWithTextMarkupAttributes:textSelector:')]
    {class} function textStyleRuleWithTextMarkupAttributes(textMarkupAttributes: NSDictionary; textSelector: NSString): AVTextStyleRule; overload; cdecl;
  end;

  AVTextStyleRule = interface(NSObject)
    ['{D098B0B4-9D16-4F54-936B-D6FDBBCAD6A1}']
    [MethodName('initWithTextMarkupAttributes:textSelector:')]
    function initWithTextMarkupAttributes(textMarkupAttributes: NSDictionary; textSelector: NSString): Pointer; overload; cdecl;
    function initWithTextMarkupAttributes(textMarkupAttributes: NSDictionary): Pointer; overload; cdecl;
    function textMarkupAttributes: NSDictionary; cdecl;
    function textSelector: NSString; cdecl;
  end;
  TAVTextStyleRule = class(TOCGenericImport<AVTextStyleRuleClass, AVTextStyleRule>) end;

  AVMetadataGroupClass = interface(NSObjectClass)
    ['{0FE77492-8D32-478E-B709-53481A0B6EFC}']
  end;

  AVMetadataGroup = interface(NSObject)
    ['{0A6FEE7B-15BB-4B24-AF81-B04D277177DB}']
    function classifyingLabel: NSString; cdecl;
    function items: NSArray; cdecl;
    function uniqueID: NSString; cdecl;
  end;
  TAVMetadataGroup = class(TOCGenericImport<AVMetadataGroupClass, AVMetadataGroup>) end;

  AVDateRangeMetadataGroupClass = interface(AVMetadataGroupClass)
    ['{E9529544-5CD3-455E-97BA-0AF12AE51DB3}']
  end;

  AVDateRangeMetadataGroup = interface(AVMetadataGroup)
    ['{F3E1CC33-EEDD-4643-A10B-00D1096D71D7}']
    function endDate: NSDate; cdecl;
    [MethodName('initWithItems:startDate:endDate:')]
    function initWithItems(items: NSArray; startDate: NSDate; endDate: NSDate): Pointer; cdecl;
    function items: NSArray; cdecl;
    function startDate: NSDate; cdecl;
  end;
  TAVDateRangeMetadataGroup = class(TOCGenericImport<AVDateRangeMetadataGroupClass, AVDateRangeMetadataGroup>) end;

  AVMutableDateRangeMetadataGroupClass = interface(AVDateRangeMetadataGroupClass)
    ['{59C1D458-81D0-45D8-B5E5-16C2D5C6A91E}']
  end;

  AVMutableDateRangeMetadataGroup = interface(AVDateRangeMetadataGroup)
    ['{941CE722-FB23-4D03-A227-F6EC516D848D}']
    function endDate: NSDate; cdecl;
    function items: NSArray; cdecl;
    procedure setEndDate(endDate: NSDate); cdecl;
    procedure setItems(items: NSArray); cdecl;
    procedure setStartDate(startDate: NSDate); cdecl;
    function startDate: NSDate; cdecl;
  end;
  TAVMutableDateRangeMetadataGroup = class(TOCGenericImport<AVMutableDateRangeMetadataGroupClass, AVMutableDateRangeMetadataGroup>) end;
{$ENDIF}

// exported string consts

function AVMediaTypeAudio: NSString;
function AVMediaTypeVideo: NSString;

function AVCaptureSessionPresetPhoto: NSString;
function AVCaptureSessionPresetHigh: NSString;
function AVCaptureSessionPresetMedium: NSString;
function AVCaptureSessionPresetLow: NSString;
function AVCaptureSessionPreset320x240: NSString;
function AVCaptureSessionPreset352x288: NSString;
function AVCaptureSessionPreset640x480: NSString;
function AVCaptureSessionPreset960x540: NSString;
function AVCaptureSessionPreset1280x720: NSString;
function AVCaptureSessionPresetInputPriority: NSString;

function AVFileTypeWAVE: NSString;

function AVFormatIDKey: NSString;
function AVSampleRateKey: NSString;
function AVNumberOfChannelsKey: NSString;

{$IFDEF OSX64}
function AVAudioEngineConfigurationChangeNotification: NSString;
function AVLinearPCMBitDepthKey: NSString;
function AVLinearPCMIsBigEndianKey: NSString;
function AVLinearPCMIsFloatKey: NSString;
function AVLinearPCMIsNonInterleavedKey: NSString;
function AVAudioFileTypeKey: NSString;
function AVEncoderAudioQualityKey: NSString;
function AVEncoderAudioQualityForVBRKey: NSString;
function AVEncoderBitRateKey: NSString;
function AVEncoderBitRatePerChannelKey: NSString;
function AVEncoderBitRateStrategyKey: NSString;
function AVEncoderBitDepthHintKey: NSString;
function AVSampleRateConverterAlgorithmKey: NSString;
function AVSampleRateConverterAudioQualityKey: NSString;
function AVChannelLayoutKey: NSString;
function AVAudioBitRateStrategy_Constant: NSString;
function AVAudioBitRateStrategy_LongTermAverage: NSString;
function AVAudioBitRateStrategy_VariableConstrained: NSString;
function AVAudioBitRateStrategy_Variable: NSString;
function AVSampleRateConverterAlgorithm_Normal: NSString;
function AVSampleRateConverterAlgorithm_Mastering: NSString;
function AVSampleRateConverterAlgorithm_MinimumPhase: NSString;
function AVAudioUnitTypeOutput: NSString;
function AVAudioUnitTypeMusicDevice: NSString;
function AVAudioUnitTypeMusicEffect: NSString;
function AVAudioUnitTypeFormatConverter: NSString;
function AVAudioUnitTypeEffect: NSString;
function AVAudioUnitTypeMixer: NSString;
function AVAudioUnitTypePanner: NSString;
function AVAudioUnitTypeGenerator: NSString;
function AVAudioUnitTypeOfflineEffect: NSString;
function AVAudioUnitTypeMIDIProcessor: NSString;
function AVAudioUnitManufacturerNameApple: NSString;
function AVAudioUnitComponentTagsDidChangeNotification: NSString;
function AVSpeechUtteranceMinimumSpeechRate: Single;
function AVSpeechUtteranceMaximumSpeechRate: Single;
function AVSpeechUtteranceDefaultSpeechRate: Single;
function AVSpeechSynthesisVoiceIdentifierAlex: NSString;
function AVSpeechSynthesisIPANotationAttribute: NSString;
function AVCoreAnimationBeginTimeAtZero: CFTimeInterval;
function AVLayerVideoGravityResizeAspect: AVLayerVideoGravity;
function AVLayerVideoGravityResizeAspectFill: AVLayerVideoGravity;
function AVLayerVideoGravityResize: AVLayerVideoGravity;
function AVContentKeySystemFairPlayStreaming: AVContentKeySystem;
function AVContentKeySystemClearKey: AVContentKeySystem;
function AVContentKeyRequestRetryReasonTimedOut: AVContentKeyRequestRetryReason;
function AVContentKeyRequestRetryReasonReceivedResponseWithExpiredLease: AVContentKeyRequestRetryReason;
function AVContentKeyRequestRetryReasonReceivedObsoleteContentKey: AVContentKeyRequestRetryReason;
function AVContentKeyRequestProtocolVersionsKey: NSString;
function AVMediaTypeText: AVMediaType;
function AVMediaTypeClosedCaption: AVMediaType;
function AVMediaTypeSubtitle: AVMediaType;
function AVMediaTypeTimecode: AVMediaType;
function AVMediaTypeMetadata: AVMediaType;
function AVMediaTypeMuxed: AVMediaType;
function AVMediaTypeMetadataObject: AVMediaType;
function AVMediaTypeDepthData: AVMediaType;
function AVMediaCharacteristicVisual: AVMediaCharacteristic;
function AVMediaCharacteristicAudible: AVMediaCharacteristic;
function AVMediaCharacteristicLegible: AVMediaCharacteristic;
function AVMediaCharacteristicFrameBased: AVMediaCharacteristic;
function AVMediaCharacteristicUsesWideGamutColorSpace: AVMediaCharacteristic;
function AVMediaCharacteristicIsMainProgramContent: AVMediaCharacteristic;
function AVMediaCharacteristicIsAuxiliaryContent: AVMediaCharacteristic;
function AVMediaCharacteristicContainsOnlyForcedSubtitles: AVMediaCharacteristic;
function AVMediaCharacteristicTranscribesSpokenDialogForAccessibility: AVMediaCharacteristic;
function AVMediaCharacteristicDescribesMusicAndSoundForAccessibility: AVMediaCharacteristic;
function AVMediaCharacteristicEasyToRead: AVMediaCharacteristic;
function AVMediaCharacteristicDescribesVideoForAccessibility: AVMediaCharacteristic;
function AVMediaCharacteristicLanguageTranslation: AVMediaCharacteristic;
function AVMediaCharacteristicDubbedTranslation: AVMediaCharacteristic;
function AVMediaCharacteristicVoiceOverTranslation: AVMediaCharacteristic;
function AVFileTypeQuickTimeMovie: AVFileType;
function AVFileTypeMPEG4: AVFileType;
function AVFileTypeAppleM4V: AVFileType;
function AVFileTypeAppleM4A: AVFileType;
function AVFileType3GPP: AVFileType;
function AVFileType3GPP2: AVFileType;
function AVFileTypeCoreAudioFormat: AVFileType;
function AVFileTypeAIFF: AVFileType;
function AVFileTypeAIFC: AVFileType;
function AVFileTypeAMR: AVFileType;
function AVFileTypeMPEGLayer3: AVFileType;
function AVFileTypeSunAU: AVFileType;
function AVFileTypeAC3: AVFileType;
function AVFileTypeEnhancedAC3: AVFileType;
function AVFileTypeJPEG: AVFileType;
function AVFileTypeDNG: AVFileType;
function AVFileTypeHEIC: AVFileType;
function AVFileTypeAVCI: AVFileType;
function AVFileTypeHEIF: AVFileType;
function AVFileTypeTIFF: AVFileType;
function AVStreamingKeyDeliveryContentKeyType: NSString;
function AVStreamingKeyDeliveryPersistentContentKeyType: NSString;
function AVMetadataKeySpaceCommon: AVMetadataKeySpace;
function AVMetadataCommonKeyTitle: AVMetadataKey;
function AVMetadataCommonKeyCreator: AVMetadataKey;
function AVMetadataCommonKeySubject: AVMetadataKey;
function AVMetadataCommonKeyDescription: AVMetadataKey;
function AVMetadataCommonKeyPublisher: AVMetadataKey;
function AVMetadataCommonKeyContributor: AVMetadataKey;
function AVMetadataCommonKeyCreationDate: AVMetadataKey;
function AVMetadataCommonKeyLastModifiedDate: AVMetadataKey;
function AVMetadataCommonKeyType: AVMetadataKey;
function AVMetadataCommonKeyFormat: AVMetadataKey;
function AVMetadataCommonKeyIdentifier: AVMetadataKey;
function AVMetadataCommonKeySource: AVMetadataKey;
function AVMetadataCommonKeyLanguage: AVMetadataKey;
function AVMetadataCommonKeyRelation: AVMetadataKey;
function AVMetadataCommonKeyLocation: AVMetadataKey;
function AVMetadataCommonKeyCopyrights: AVMetadataKey;
function AVMetadataCommonKeyAlbumName: AVMetadataKey;
function AVMetadataCommonKeyAuthor: AVMetadataKey;
function AVMetadataCommonKeyArtist: AVMetadataKey;
function AVMetadataCommonKeyArtwork: AVMetadataKey;
function AVMetadataCommonKeyMake: AVMetadataKey;
function AVMetadataCommonKeyModel: AVMetadataKey;
function AVMetadataCommonKeySoftware: AVMetadataKey;
function AVMetadataFormatQuickTimeUserData: AVMetadataFormat;
function AVMetadataKeySpaceQuickTimeUserData: AVMetadataKeySpace;
function AVMetadataQuickTimeUserDataKeyAlbum: AVMetadataKey;
function AVMetadataQuickTimeUserDataKeyArranger: AVMetadataKey;
function AVMetadataQuickTimeUserDataKeyArtist: AVMetadataKey;
function AVMetadataQuickTimeUserDataKeyAuthor: AVMetadataKey;
function AVMetadataQuickTimeUserDataKeyChapter: AVMetadataKey;
function AVMetadataQuickTimeUserDataKeyComment: AVMetadataKey;
function AVMetadataQuickTimeUserDataKeyComposer: AVMetadataKey;
function AVMetadataQuickTimeUserDataKeyCopyright: AVMetadataKey;
function AVMetadataQuickTimeUserDataKeyCreationDate: AVMetadataKey;
function AVMetadataQuickTimeUserDataKeyDescription: AVMetadataKey;
function AVMetadataQuickTimeUserDataKeyDirector: AVMetadataKey;
function AVMetadataQuickTimeUserDataKeyDisclaimer: AVMetadataKey;
function AVMetadataQuickTimeUserDataKeyEncodedBy: AVMetadataKey;
function AVMetadataQuickTimeUserDataKeyFullName: AVMetadataKey;
function AVMetadataQuickTimeUserDataKeyGenre: AVMetadataKey;
function AVMetadataQuickTimeUserDataKeyHostComputer: AVMetadataKey;
function AVMetadataQuickTimeUserDataKeyInformation: AVMetadataKey;
function AVMetadataQuickTimeUserDataKeyKeywords: AVMetadataKey;
function AVMetadataQuickTimeUserDataKeyMake: AVMetadataKey;
function AVMetadataQuickTimeUserDataKeyModel: AVMetadataKey;
function AVMetadataQuickTimeUserDataKeyOriginalArtist: AVMetadataKey;
function AVMetadataQuickTimeUserDataKeyOriginalFormat: AVMetadataKey;
function AVMetadataQuickTimeUserDataKeyOriginalSource: AVMetadataKey;
function AVMetadataQuickTimeUserDataKeyPerformers: AVMetadataKey;
function AVMetadataQuickTimeUserDataKeyProducer: AVMetadataKey;
function AVMetadataQuickTimeUserDataKeyPublisher: AVMetadataKey;
function AVMetadataQuickTimeUserDataKeyProduct: AVMetadataKey;
function AVMetadataQuickTimeUserDataKeySoftware: AVMetadataKey;
function AVMetadataQuickTimeUserDataKeySpecialPlaybackRequirements: AVMetadataKey;
function AVMetadataQuickTimeUserDataKeyTrack: AVMetadataKey;
function AVMetadataQuickTimeUserDataKeyWarning: AVMetadataKey;
function AVMetadataQuickTimeUserDataKeyWriter: AVMetadataKey;
function AVMetadataQuickTimeUserDataKeyURLLink: AVMetadataKey;
function AVMetadataQuickTimeUserDataKeyLocationISO6709: AVMetadataKey;
function AVMetadataQuickTimeUserDataKeyTrackName: AVMetadataKey;
function AVMetadataQuickTimeUserDataKeyCredits: AVMetadataKey;
function AVMetadataQuickTimeUserDataKeyPhonogramRights: AVMetadataKey;
function AVMetadataQuickTimeUserDataKeyTaggedCharacteristic: AVMetadataKey;
function AVMetadataFormatISOUserData: AVMetadataFormat;
function AVMetadataKeySpaceISOUserData: AVMetadataKeySpace;
function AVMetadataISOUserDataKeyCopyright: AVMetadataKey;
function AVMetadataISOUserDataKeyTaggedCharacteristic: AVMetadataKey;
function AVMetadataISOUserDataKeyDate: AVMetadataKey;
function AVMetadata3GPUserDataKeyCopyright: AVMetadataKey;
function AVMetadata3GPUserDataKeyAuthor: AVMetadataKey;
function AVMetadata3GPUserDataKeyPerformer: AVMetadataKey;
function AVMetadata3GPUserDataKeyGenre: AVMetadataKey;
function AVMetadata3GPUserDataKeyRecordingYear: AVMetadataKey;
function AVMetadata3GPUserDataKeyLocation: AVMetadataKey;
function AVMetadata3GPUserDataKeyTitle: AVMetadataKey;
function AVMetadata3GPUserDataKeyDescription: AVMetadataKey;
function AVMetadata3GPUserDataKeyCollection: AVMetadataKey;
function AVMetadata3GPUserDataKeyUserRating: AVMetadataKey;
function AVMetadata3GPUserDataKeyThumbnail: AVMetadataKey;
function AVMetadata3GPUserDataKeyAlbumAndTrack: AVMetadataKey;
function AVMetadata3GPUserDataKeyKeywordList: AVMetadataKey;
function AVMetadata3GPUserDataKeyMediaClassification: AVMetadataKey;
function AVMetadata3GPUserDataKeyMediaRating: AVMetadataKey;
function AVMetadataFormatQuickTimeMetadata: AVMetadataFormat;
function AVMetadataKeySpaceQuickTimeMetadata: AVMetadataKeySpace;
function AVMetadataQuickTimeMetadataKeyAuthor: AVMetadataKey;
function AVMetadataQuickTimeMetadataKeyComment: AVMetadataKey;
function AVMetadataQuickTimeMetadataKeyCopyright: AVMetadataKey;
function AVMetadataQuickTimeMetadataKeyCreationDate: AVMetadataKey;
function AVMetadataQuickTimeMetadataKeyDirector: AVMetadataKey;
function AVMetadataQuickTimeMetadataKeyDisplayName: AVMetadataKey;
function AVMetadataQuickTimeMetadataKeyInformation: AVMetadataKey;
function AVMetadataQuickTimeMetadataKeyKeywords: AVMetadataKey;
function AVMetadataQuickTimeMetadataKeyProducer: AVMetadataKey;
function AVMetadataQuickTimeMetadataKeyPublisher: AVMetadataKey;
function AVMetadataQuickTimeMetadataKeyAlbum: AVMetadataKey;
function AVMetadataQuickTimeMetadataKeyArtist: AVMetadataKey;
function AVMetadataQuickTimeMetadataKeyArtwork: AVMetadataKey;
function AVMetadataQuickTimeMetadataKeyDescription: AVMetadataKey;
function AVMetadataQuickTimeMetadataKeySoftware: AVMetadataKey;
function AVMetadataQuickTimeMetadataKeyYear: AVMetadataKey;
function AVMetadataQuickTimeMetadataKeyGenre: AVMetadataKey;
function AVMetadataQuickTimeMetadataKeyiXML: AVMetadataKey;
function AVMetadataQuickTimeMetadataKeyLocationISO6709: AVMetadataKey;
function AVMetadataQuickTimeMetadataKeyMake: AVMetadataKey;
function AVMetadataQuickTimeMetadataKeyModel: AVMetadataKey;
function AVMetadataQuickTimeMetadataKeyArranger: AVMetadataKey;
function AVMetadataQuickTimeMetadataKeyEncodedBy: AVMetadataKey;
function AVMetadataQuickTimeMetadataKeyOriginalArtist: AVMetadataKey;
function AVMetadataQuickTimeMetadataKeyPerformer: AVMetadataKey;
function AVMetadataQuickTimeMetadataKeyComposer: AVMetadataKey;
function AVMetadataQuickTimeMetadataKeyCredits: AVMetadataKey;
function AVMetadataQuickTimeMetadataKeyPhonogramRights: AVMetadataKey;
function AVMetadataQuickTimeMetadataKeyCameraIdentifier: AVMetadataKey;
function AVMetadataQuickTimeMetadataKeyCameraFrameReadoutTime: AVMetadataKey;
function AVMetadataQuickTimeMetadataKeyTitle: AVMetadataKey;
function AVMetadataQuickTimeMetadataKeyCollectionUser: AVMetadataKey;
function AVMetadataQuickTimeMetadataKeyRatingUser: AVMetadataKey;
function AVMetadataQuickTimeMetadataKeyLocationName: AVMetadataKey;
function AVMetadataQuickTimeMetadataKeyLocationBody: AVMetadataKey;
function AVMetadataQuickTimeMetadataKeyLocationNote: AVMetadataKey;
function AVMetadataQuickTimeMetadataKeyLocationRole: AVMetadataKey;
function AVMetadataQuickTimeMetadataKeyLocationDate: AVMetadataKey;
function AVMetadataQuickTimeMetadataKeyDirectionFacing: AVMetadataKey;
function AVMetadataQuickTimeMetadataKeyDirectionMotion: AVMetadataKey;
function AVMetadataQuickTimeMetadataKeyContentIdentifier: AVMetadataKey;
function AVMetadataFormatiTunesMetadata: AVMetadataFormat;
function AVMetadataKeySpaceiTunes: AVMetadataKeySpace;
function AVMetadataiTunesMetadataKeyAlbum: AVMetadataKey;
function AVMetadataiTunesMetadataKeyArtist: AVMetadataKey;
function AVMetadataiTunesMetadataKeyUserComment: AVMetadataKey;
function AVMetadataiTunesMetadataKeyCoverArt: AVMetadataKey;
function AVMetadataiTunesMetadataKeyCopyright: AVMetadataKey;
function AVMetadataiTunesMetadataKeyReleaseDate: AVMetadataKey;
function AVMetadataiTunesMetadataKeyEncodedBy: AVMetadataKey;
function AVMetadataiTunesMetadataKeyPredefinedGenre: AVMetadataKey;
function AVMetadataiTunesMetadataKeyUserGenre: AVMetadataKey;
function AVMetadataiTunesMetadataKeySongName: AVMetadataKey;
function AVMetadataiTunesMetadataKeyTrackSubTitle: AVMetadataKey;
function AVMetadataiTunesMetadataKeyEncodingTool: AVMetadataKey;
function AVMetadataiTunesMetadataKeyComposer: AVMetadataKey;
function AVMetadataiTunesMetadataKeyAlbumArtist: AVMetadataKey;
function AVMetadataiTunesMetadataKeyAccountKind: AVMetadataKey;
function AVMetadataiTunesMetadataKeyAppleID: AVMetadataKey;
function AVMetadataiTunesMetadataKeyArtistID: AVMetadataKey;
function AVMetadataiTunesMetadataKeySongID: AVMetadataKey;
function AVMetadataiTunesMetadataKeyDiscCompilation: AVMetadataKey;
function AVMetadataiTunesMetadataKeyDiscNumber: AVMetadataKey;
function AVMetadataiTunesMetadataKeyGenreID: AVMetadataKey;
function AVMetadataiTunesMetadataKeyGrouping: AVMetadataKey;
function AVMetadataiTunesMetadataKeyPlaylistID: AVMetadataKey;
function AVMetadataiTunesMetadataKeyContentRating: AVMetadataKey;
function AVMetadataiTunesMetadataKeyBeatsPerMin: AVMetadataKey;
function AVMetadataiTunesMetadataKeyTrackNumber: AVMetadataKey;
function AVMetadataiTunesMetadataKeyArtDirector: AVMetadataKey;
function AVMetadataiTunesMetadataKeyArranger: AVMetadataKey;
function AVMetadataiTunesMetadataKeyAuthor: AVMetadataKey;
function AVMetadataiTunesMetadataKeyLyrics: AVMetadataKey;
function AVMetadataiTunesMetadataKeyAcknowledgement: AVMetadataKey;
function AVMetadataiTunesMetadataKeyConductor: AVMetadataKey;
function AVMetadataiTunesMetadataKeyDescription: AVMetadataKey;
function AVMetadataiTunesMetadataKeyDirector: AVMetadataKey;
function AVMetadataiTunesMetadataKeyEQ: AVMetadataKey;
function AVMetadataiTunesMetadataKeyLinerNotes: AVMetadataKey;
function AVMetadataiTunesMetadataKeyRecordCompany: AVMetadataKey;
function AVMetadataiTunesMetadataKeyOriginalArtist: AVMetadataKey;
function AVMetadataiTunesMetadataKeyPhonogramRights: AVMetadataKey;
function AVMetadataiTunesMetadataKeyProducer: AVMetadataKey;
function AVMetadataiTunesMetadataKeyPerformer: AVMetadataKey;
function AVMetadataiTunesMetadataKeyPublisher: AVMetadataKey;
function AVMetadataiTunesMetadataKeySoundEngineer: AVMetadataKey;
function AVMetadataiTunesMetadataKeySoloist: AVMetadataKey;
function AVMetadataiTunesMetadataKeyCredits: AVMetadataKey;
function AVMetadataiTunesMetadataKeyThanks: AVMetadataKey;
function AVMetadataiTunesMetadataKeyOnlineExtras: AVMetadataKey;
function AVMetadataiTunesMetadataKeyExecProducer: AVMetadataKey;
function AVMetadataFormatID3Metadata: AVMetadataFormat;
function AVMetadataKeySpaceID3: AVMetadataKeySpace;
function AVMetadataID3MetadataKeyAudioEncryption: AVMetadataKey;
function AVMetadataID3MetadataKeyAttachedPicture: AVMetadataKey;
function AVMetadataID3MetadataKeyAudioSeekPointIndex: AVMetadataKey;
function AVMetadataID3MetadataKeyComments: AVMetadataKey;
function AVMetadataID3MetadataKeyCommercial: AVMetadataKey;
function AVMetadataID3MetadataKeyCommerical: AVMetadataKey;
function AVMetadataID3MetadataKeyEncryption: AVMetadataKey;
function AVMetadataID3MetadataKeyEqualization: AVMetadataKey;
function AVMetadataID3MetadataKeyEqualization2: AVMetadataKey;
function AVMetadataID3MetadataKeyEventTimingCodes: AVMetadataKey;
function AVMetadataID3MetadataKeyGeneralEncapsulatedObject: AVMetadataKey;
function AVMetadataID3MetadataKeyGroupIdentifier: AVMetadataKey;
function AVMetadataID3MetadataKeyInvolvedPeopleList_v23: AVMetadataKey;
function AVMetadataID3MetadataKeyLink: AVMetadataKey;
function AVMetadataID3MetadataKeyMusicCDIdentifier: AVMetadataKey;
function AVMetadataID3MetadataKeyMPEGLocationLookupTable: AVMetadataKey;
function AVMetadataID3MetadataKeyOwnership: AVMetadataKey;
function AVMetadataID3MetadataKeyPrivate: AVMetadataKey;
function AVMetadataID3MetadataKeyPlayCounter: AVMetadataKey;
function AVMetadataID3MetadataKeyPopularimeter: AVMetadataKey;
function AVMetadataID3MetadataKeyPositionSynchronization: AVMetadataKey;
function AVMetadataID3MetadataKeyRecommendedBufferSize: AVMetadataKey;
function AVMetadataID3MetadataKeyRelativeVolumeAdjustment: AVMetadataKey;
function AVMetadataID3MetadataKeyRelativeVolumeAdjustment2: AVMetadataKey;
function AVMetadataID3MetadataKeyReverb: AVMetadataKey;
function AVMetadataID3MetadataKeySeek: AVMetadataKey;
function AVMetadataID3MetadataKeySignature: AVMetadataKey;
function AVMetadataID3MetadataKeySynchronizedLyric: AVMetadataKey;
function AVMetadataID3MetadataKeySynchronizedTempoCodes: AVMetadataKey;
function AVMetadataID3MetadataKeyAlbumTitle: AVMetadataKey;
function AVMetadataID3MetadataKeyBeatsPerMinute: AVMetadataKey;
function AVMetadataID3MetadataKeyComposer: AVMetadataKey;
function AVMetadataID3MetadataKeyContentType: AVMetadataKey;
function AVMetadataID3MetadataKeyCopyright: AVMetadataKey;
function AVMetadataID3MetadataKeyDate: AVMetadataKey;
function AVMetadataID3MetadataKeyEncodingTime: AVMetadataKey;
function AVMetadataID3MetadataKeyPlaylistDelay: AVMetadataKey;
function AVMetadataID3MetadataKeyOriginalReleaseTime: AVMetadataKey;
function AVMetadataID3MetadataKeyRecordingTime: AVMetadataKey;
function AVMetadataID3MetadataKeyReleaseTime: AVMetadataKey;
function AVMetadataID3MetadataKeyTaggingTime: AVMetadataKey;
function AVMetadataID3MetadataKeyEncodedBy: AVMetadataKey;
function AVMetadataID3MetadataKeyLyricist: AVMetadataKey;
function AVMetadataID3MetadataKeyFileType: AVMetadataKey;
function AVMetadataID3MetadataKeyTime: AVMetadataKey;
function AVMetadataID3MetadataKeyInvolvedPeopleList_v24: AVMetadataKey;
function AVMetadataID3MetadataKeyContentGroupDescription: AVMetadataKey;
function AVMetadataID3MetadataKeyTitleDescription: AVMetadataKey;
function AVMetadataID3MetadataKeySubTitle: AVMetadataKey;
function AVMetadataID3MetadataKeyInitialKey: AVMetadataKey;
function AVMetadataID3MetadataKeyLanguage: AVMetadataKey;
function AVMetadataID3MetadataKeyLength: AVMetadataKey;
function AVMetadataID3MetadataKeyMusicianCreditsList: AVMetadataKey;
function AVMetadataID3MetadataKeyMediaType: AVMetadataKey;
function AVMetadataID3MetadataKeyMood: AVMetadataKey;
function AVMetadataID3MetadataKeyOriginalAlbumTitle: AVMetadataKey;
function AVMetadataID3MetadataKeyOriginalFilename: AVMetadataKey;
function AVMetadataID3MetadataKeyOriginalLyricist: AVMetadataKey;
function AVMetadataID3MetadataKeyOriginalArtist: AVMetadataKey;
function AVMetadataID3MetadataKeyOriginalReleaseYear: AVMetadataKey;
function AVMetadataID3MetadataKeyFileOwner: AVMetadataKey;
function AVMetadataID3MetadataKeyLeadPerformer: AVMetadataKey;
function AVMetadataID3MetadataKeyBand: AVMetadataKey;
function AVMetadataID3MetadataKeyConductor: AVMetadataKey;
function AVMetadataID3MetadataKeyModifiedBy: AVMetadataKey;
function AVMetadataID3MetadataKeyPartOfASet: AVMetadataKey;
function AVMetadataID3MetadataKeyProducedNotice: AVMetadataKey;
function AVMetadataID3MetadataKeyPublisher: AVMetadataKey;
function AVMetadataID3MetadataKeyTrackNumber: AVMetadataKey;
function AVMetadataID3MetadataKeyRecordingDates: AVMetadataKey;
function AVMetadataID3MetadataKeyInternetRadioStationName: AVMetadataKey;
function AVMetadataID3MetadataKeyInternetRadioStationOwner: AVMetadataKey;
function AVMetadataID3MetadataKeySize: AVMetadataKey;
function AVMetadataID3MetadataKeyAlbumSortOrder: AVMetadataKey;
function AVMetadataID3MetadataKeyPerformerSortOrder: AVMetadataKey;
function AVMetadataID3MetadataKeyTitleSortOrder: AVMetadataKey;
function AVMetadataID3MetadataKeyInternationalStandardRecordingCode: AVMetadataKey;
function AVMetadataID3MetadataKeyEncodedWith: AVMetadataKey;
function AVMetadataID3MetadataKeySetSubtitle: AVMetadataKey;
function AVMetadataID3MetadataKeyYear: AVMetadataKey;
function AVMetadataID3MetadataKeyUserText: AVMetadataKey;
function AVMetadataID3MetadataKeyUniqueFileIdentifier: AVMetadataKey;
function AVMetadataID3MetadataKeyTermsOfUse: AVMetadataKey;
function AVMetadataID3MetadataKeyUnsynchronizedLyric: AVMetadataKey;
function AVMetadataID3MetadataKeyCommercialInformation: AVMetadataKey;
function AVMetadataID3MetadataKeyCopyrightInformation: AVMetadataKey;
function AVMetadataID3MetadataKeyOfficialAudioFileWebpage: AVMetadataKey;
function AVMetadataID3MetadataKeyOfficialArtistWebpage: AVMetadataKey;
function AVMetadataID3MetadataKeyOfficialAudioSourceWebpage: AVMetadataKey;
function AVMetadataID3MetadataKeyOfficialInternetRadioStationHomepage: AVMetadataKey;
function AVMetadataID3MetadataKeyPayment: AVMetadataKey;
function AVMetadataID3MetadataKeyOfficialPublisherWebpage: AVMetadataKey;
function AVMetadataID3MetadataKeyUserURL: AVMetadataKey;
function AVMetadataKeySpaceIcy: AVMetadataKeySpace;
function AVMetadataIcyMetadataKeyStreamTitle: AVMetadataKey;
function AVMetadataIcyMetadataKeyStreamURL: AVMetadataKey;
function AVMetadataFormatHLSMetadata: AVMetadataFormat;
function AVMetadataKeySpaceHLSDateRange: AVMetadataKeySpace;
function AVMetadataKeySpaceAudioFile: AVMetadataKeySpace;
function AVMetadataFormatUnknown: AVMetadataFormat;
function AVMetadataExtraAttributeValueURIKey: AVMetadataExtraAttributeKey;
function AVMetadataExtraAttributeBaseURIKey: AVMetadataExtraAttributeKey;
function AVMetadataExtraAttributeInfoKey: AVMetadataExtraAttributeKey;
function AVURLAssetPreferPreciseDurationAndTimingKey: NSString;
function AVURLAssetReferenceRestrictionsKey: NSString;
function AVURLAssetHTTPCookiesKey: NSString;
function AVURLAssetAllowsCellularAccessKey: NSString;
function AVAssetDurationDidChangeNotification: NSString;
function AVAssetContainsFragmentsDidChangeNotification: NSString;
function AVAssetWasDefragmentedNotification: NSString;
function AVAssetChapterMetadataGroupsDidChangeNotification: NSString;
function AVAssetMediaSelectionGroupsDidChangeNotification: NSString;
function AVAudioTimePitchAlgorithmLowQualityZeroLatency: AVAudioTimePitchAlgorithm;
function AVAudioTimePitchAlgorithmTimeDomain: AVAudioTimePitchAlgorithm;
function AVAudioTimePitchAlgorithmSpectral: AVAudioTimePitchAlgorithm;
function AVAudioTimePitchAlgorithmVarispeed: AVAudioTimePitchAlgorithm;
function AVAssetExportPresetLowQuality: NSString;
function AVAssetExportPresetMediumQuality: NSString;
function AVAssetExportPresetHighestQuality: NSString;
function AVAssetExportPresetHEVCHighestQuality: NSString;
function AVAssetExportPreset640x480: NSString;
function AVAssetExportPreset960x540: NSString;
function AVAssetExportPreset1280x720: NSString;
function AVAssetExportPreset1920x1080: NSString;
function AVAssetExportPreset3840x2160: NSString;
function AVAssetExportPresetHEVC1920x1080: NSString;
function AVAssetExportPresetHEVC3840x2160: NSString;
function AVAssetExportPresetAppleM4A: NSString;
function AVAssetExportPresetPassthrough: NSString;
function AVAssetExportPresetAppleM4VCellular: NSString;
function AVAssetExportPresetAppleM4ViPod: NSString;
function AVAssetExportPresetAppleM4V480pSD: NSString;
function AVAssetExportPresetAppleM4VAppleTV: NSString;
function AVAssetExportPresetAppleM4VWiFi: NSString;
function AVAssetExportPresetAppleM4V720pHD: NSString;
function AVAssetExportPresetAppleM4V1080pHD: NSString;
function AVAssetExportPresetAppleProRes422LPCM: NSString;
function AVAssetImageGeneratorApertureModeCleanAperture: AVAssetImageGeneratorApertureMode;
function AVAssetImageGeneratorApertureModeProductionAperture: AVAssetImageGeneratorApertureMode;
function AVAssetImageGeneratorApertureModeEncodedPixels: AVAssetImageGeneratorApertureMode;
function AVAssetResourceLoadingRequestStreamingContentKeyRequestRequiresPersistentKey: NSString;
function AVTrackAssociationTypeAudioFallback: AVTrackAssociationType;
function AVTrackAssociationTypeChapterList: AVTrackAssociationType;
function AVTrackAssociationTypeForcedSubtitlesOnly: AVTrackAssociationType;
function AVTrackAssociationTypeSelectionFollower: AVTrackAssociationType;
function AVTrackAssociationTypeTimecode: AVTrackAssociationType;
function AVTrackAssociationTypeMetadataReferent: AVTrackAssociationType;
function AVAssetTrackTimeRangeDidChangeNotification: NSString;
function AVAssetTrackSegmentsDidChangeNotification: NSString;
function AVAssetTrackTrackAssociationsDidChangeNotification: NSString;
function AVAssetWriterInputMediaDataLocationInterleavedWithMainMediaData: AVAssetWriterInputMediaDataLocation;
function AVAssetWriterInputMediaDataLocationBeforeMainMediaDataNotInterleaved: AVAssetWriterInputMediaDataLocation;
function AVCaptureSessionPreset1920x1080: AVCaptureSessionPreset;
function AVCaptureSessionPreset3840x2160: AVCaptureSessionPreset;
function AVCaptureSessionPresetiFrame960x540: AVCaptureSessionPreset;
function AVCaptureSessionPresetiFrame1280x720: AVCaptureSessionPreset;
function AVCaptureDeviceWasConnectedNotification: NSString;
function AVCaptureDeviceWasDisconnectedNotification: NSString;
function AVCaptureDeviceSubjectAreaDidChangeNotification: NSString;
function AVCaptureDeviceTypeBuiltInMicrophone: AVCaptureDeviceType;
function AVCaptureDeviceTypeBuiltInWideAngleCamera: AVCaptureDeviceType;
function AVCaptureDeviceTypeBuiltInTelephotoCamera: AVCaptureDeviceType;
function AVCaptureDeviceTypeBuiltInDualCamera: AVCaptureDeviceType;
function AVCaptureDeviceTypeBuiltInTrueDepthCamera: AVCaptureDeviceType;
function AVCaptureDeviceTypeBuiltInDuoCamera: AVCaptureDeviceType;
function AVCaptureMaxAvailableTorchLevel: Single;
function AVCaptureLensPositionCurrent: Single;
// Exported const AVCaptureExposureDurationCurrent has an unsupported type: const CMTime
function AVCaptureISOCurrent: Single;
function AVCaptureExposureTargetBiasCurrent: Single;
// Exported const AVCaptureWhiteBalanceGainsCurrent has an unsupported type: const AVCaptureWhiteBalanceGains
function AVCaptureSessionRuntimeErrorNotification: NSString;
function AVCaptureSessionErrorKey: NSString;
function AVCaptureSessionDidStartRunningNotification: NSString;
function AVCaptureSessionDidStopRunningNotification: NSString;
function AVCaptureSessionWasInterruptedNotification: NSString;
function AVCaptureSessionInterruptionReasonKey: NSString;
function AVCaptureSessionInterruptionSystemPressureStateKey: NSString;
function AVCaptureSessionInterruptionEndedNotification: NSString;
function AVVideoCodecKey: NSString;
function AVVideoCodecTypeHEVC: AVVideoCodecType;
function AVVideoCodecTypeH264: AVVideoCodecType;
function AVVideoCodecTypeJPEG: AVVideoCodecType;
function AVVideoCodecTypeAppleProRes4444: AVVideoCodecType;
function AVVideoCodecTypeAppleProRes422: AVVideoCodecType;
function AVVideoCodecHEVC: NSString;
function AVVideoCodecH264: NSString;
function AVVideoCodecJPEG: NSString;
function AVVideoCodecAppleProRes4444: NSString;
function AVVideoCodecAppleProRes422: NSString;
function AVVideoWidthKey: NSString;
function AVVideoHeightKey: NSString;
function AVVideoPixelAspectRatioKey: NSString;
function AVVideoPixelAspectRatioHorizontalSpacingKey: NSString;
function AVVideoPixelAspectRatioVerticalSpacingKey: NSString;
function AVVideoCleanApertureKey: NSString;
function AVVideoCleanApertureWidthKey: NSString;
function AVVideoCleanApertureHeightKey: NSString;
function AVVideoCleanApertureHorizontalOffsetKey: NSString;
function AVVideoCleanApertureVerticalOffsetKey: NSString;
function AVVideoScalingModeKey: NSString;
function AVVideoScalingModeFit: NSString;
function AVVideoScalingModeResize: NSString;
function AVVideoScalingModeResizeAspect: NSString;
function AVVideoScalingModeResizeAspectFill: NSString;
function AVVideoColorPropertiesKey: NSString;
function AVVideoColorPrimariesKey: NSString;
function AVVideoColorPrimaries_ITU_R_709_2: NSString;
function AVVideoColorPrimaries_EBU_3213: NSString;
function AVVideoColorPrimaries_SMPTE_C: NSString;
function AVVideoColorPrimaries_P3_D65: NSString;
function AVVideoColorPrimaries_ITU_R_2020: NSString;
function AVVideoTransferFunctionKey: NSString;
function AVVideoTransferFunction_ITU_R_709_2: NSString;
function AVVideoTransferFunction_SMPTE_240M_1995: NSString;
function AVVideoTransferFunction_SMPTE_ST_2084_PQ: NSString;
function AVVideoTransferFunction_ITU_R_2100_HLG: NSString;
function AVVideoYCbCrMatrixKey: NSString;
function AVVideoYCbCrMatrix_ITU_R_709_2: NSString;
function AVVideoYCbCrMatrix_ITU_R_601_4: NSString;
function AVVideoYCbCrMatrix_SMPTE_240M_1995: NSString;
function AVVideoYCbCrMatrix_ITU_R_2020: NSString;
function AVVideoAllowWideColorKey: NSString;
function AVVideoCompressionPropertiesKey: NSString;
function AVVideoAverageBitRateKey: NSString;
function AVVideoQualityKey: NSString;
function AVVideoMaxKeyFrameIntervalKey: NSString;
function AVVideoMaxKeyFrameIntervalDurationKey: NSString;
function AVVideoAllowFrameReorderingKey: NSString;
function AVVideoProfileLevelKey: NSString;
function AVVideoProfileLevelH264Baseline30: NSString;
function AVVideoProfileLevelH264Baseline31: NSString;
function AVVideoProfileLevelH264Baseline41: NSString;
function AVVideoProfileLevelH264BaselineAutoLevel: NSString;
function AVVideoProfileLevelH264Main30: NSString;
function AVVideoProfileLevelH264Main31: NSString;
function AVVideoProfileLevelH264Main32: NSString;
function AVVideoProfileLevelH264Main41: NSString;
function AVVideoProfileLevelH264MainAutoLevel: NSString;
function AVVideoProfileLevelH264High40: NSString;
function AVVideoProfileLevelH264High41: NSString;
function AVVideoProfileLevelH264HighAutoLevel: NSString;
function AVVideoH264EntropyModeKey: NSString;
function AVVideoH264EntropyModeCAVLC: NSString;
function AVVideoH264EntropyModeCABAC: NSString;
function AVVideoExpectedSourceFrameRateKey: NSString;
function AVVideoAverageNonDroppableFrameRateKey: NSString;
function AVVideoDecompressionPropertiesKey: NSString;
function AVVideoEncoderSpecificationKey: NSString;
function AVVideoApertureModeCleanAperture: AVVideoApertureMode;
function AVVideoApertureModeProductionAperture: AVVideoApertureMode;
function AVVideoApertureModeEncodedPixels: AVVideoApertureMode;
function AVMetadataObjectTypeFace: AVMetadataObjectType;
function AVMetadataObjectTypeUPCECode: AVMetadataObjectType;
function AVMetadataObjectTypeCode39Code: AVMetadataObjectType;
function AVMetadataObjectTypeCode39Mod43Code: AVMetadataObjectType;
function AVMetadataObjectTypeEAN13Code: AVMetadataObjectType;
function AVMetadataObjectTypeEAN8Code: AVMetadataObjectType;
function AVMetadataObjectTypeCode93Code: AVMetadataObjectType;
function AVMetadataObjectTypeCode128Code: AVMetadataObjectType;
function AVMetadataObjectTypePDF417Code: AVMetadataObjectType;
function AVMetadataObjectTypeQRCode: AVMetadataObjectType;
function AVMetadataObjectTypeAztecCode: AVMetadataObjectType;
function AVMetadataObjectTypeInterleaved2of5Code: AVMetadataObjectType;
function AVMetadataObjectTypeITF14Code: AVMetadataObjectType;
function AVMetadataObjectTypeDataMatrixCode: AVMetadataObjectType;
function AVCaptureInputPortFormatDescriptionDidChangeNotification: NSString;
function AVCaptureSystemPressureLevelNominal: AVCaptureSystemPressureLevel;
function AVCaptureSystemPressureLevelFair: AVCaptureSystemPressureLevel;
function AVCaptureSystemPressureLevelSerious: AVCaptureSystemPressureLevel;
function AVCaptureSystemPressureLevelCritical: AVCaptureSystemPressureLevel;
function AVCaptureSystemPressureLevelShutdown: AVCaptureSystemPressureLevel;
function AVFoundationErrorDomain: NSErrorDomain;
function AVErrorDeviceKey: NSString;
function AVErrorTimeKey: NSString;
function AVErrorFileSizeKey: NSString;
function AVErrorPIDKey: NSString;
function AVErrorRecordingSuccessfullyFinishedKey: NSString;
function AVErrorMediaTypeKey: NSString;
function AVErrorMediaSubTypeKey: NSString;
function AVErrorPresentationTimeStampKey: NSString;
function AVErrorPersistentTrackIDKey: NSString;
function AVErrorFileTypeKey: NSString;
function AVErrorDiscontinuityFlagsKey: NSString;
function AVMetadataCommonIdentifierTitle: AVMetadataIdentifier;
function AVMetadataCommonIdentifierCreator: AVMetadataIdentifier;
function AVMetadataCommonIdentifierSubject: AVMetadataIdentifier;
function AVMetadataCommonIdentifierDescription: AVMetadataIdentifier;
function AVMetadataCommonIdentifierPublisher: AVMetadataIdentifier;
function AVMetadataCommonIdentifierContributor: AVMetadataIdentifier;
function AVMetadataCommonIdentifierCreationDate: AVMetadataIdentifier;
function AVMetadataCommonIdentifierLastModifiedDate: AVMetadataIdentifier;
function AVMetadataCommonIdentifierType: AVMetadataIdentifier;
function AVMetadataCommonIdentifierFormat: AVMetadataIdentifier;
function AVMetadataCommonIdentifierAssetIdentifier: AVMetadataIdentifier;
function AVMetadataCommonIdentifierSource: AVMetadataIdentifier;
function AVMetadataCommonIdentifierLanguage: AVMetadataIdentifier;
function AVMetadataCommonIdentifierRelation: AVMetadataIdentifier;
function AVMetadataCommonIdentifierLocation: AVMetadataIdentifier;
function AVMetadataCommonIdentifierCopyrights: AVMetadataIdentifier;
function AVMetadataCommonIdentifierAlbumName: AVMetadataIdentifier;
function AVMetadataCommonIdentifierAuthor: AVMetadataIdentifier;
function AVMetadataCommonIdentifierArtist: AVMetadataIdentifier;
function AVMetadataCommonIdentifierArtwork: AVMetadataIdentifier;
function AVMetadataCommonIdentifierMake: AVMetadataIdentifier;
function AVMetadataCommonIdentifierModel: AVMetadataIdentifier;
function AVMetadataCommonIdentifierSoftware: AVMetadataIdentifier;
function AVMetadataIdentifierQuickTimeUserDataAlbum: AVMetadataIdentifier;
function AVMetadataIdentifierQuickTimeUserDataArranger: AVMetadataIdentifier;
function AVMetadataIdentifierQuickTimeUserDataArtist: AVMetadataIdentifier;
function AVMetadataIdentifierQuickTimeUserDataAuthor: AVMetadataIdentifier;
function AVMetadataIdentifierQuickTimeUserDataChapter: AVMetadataIdentifier;
function AVMetadataIdentifierQuickTimeUserDataComment: AVMetadataIdentifier;
function AVMetadataIdentifierQuickTimeUserDataComposer: AVMetadataIdentifier;
function AVMetadataIdentifierQuickTimeUserDataCopyright: AVMetadataIdentifier;
function AVMetadataIdentifierQuickTimeUserDataCreationDate: AVMetadataIdentifier;
function AVMetadataIdentifierQuickTimeUserDataDescription: AVMetadataIdentifier;
function AVMetadataIdentifierQuickTimeUserDataDirector: AVMetadataIdentifier;
function AVMetadataIdentifierQuickTimeUserDataDisclaimer: AVMetadataIdentifier;
function AVMetadataIdentifierQuickTimeUserDataEncodedBy: AVMetadataIdentifier;
function AVMetadataIdentifierQuickTimeUserDataFullName: AVMetadataIdentifier;
function AVMetadataIdentifierQuickTimeUserDataGenre: AVMetadataIdentifier;
function AVMetadataIdentifierQuickTimeUserDataHostComputer: AVMetadataIdentifier;
function AVMetadataIdentifierQuickTimeUserDataInformation: AVMetadataIdentifier;
function AVMetadataIdentifierQuickTimeUserDataKeywords: AVMetadataIdentifier;
function AVMetadataIdentifierQuickTimeUserDataMake: AVMetadataIdentifier;
function AVMetadataIdentifierQuickTimeUserDataModel: AVMetadataIdentifier;
function AVMetadataIdentifierQuickTimeUserDataOriginalArtist: AVMetadataIdentifier;
function AVMetadataIdentifierQuickTimeUserDataOriginalFormat: AVMetadataIdentifier;
function AVMetadataIdentifierQuickTimeUserDataOriginalSource: AVMetadataIdentifier;
function AVMetadataIdentifierQuickTimeUserDataPerformers: AVMetadataIdentifier;
function AVMetadataIdentifierQuickTimeUserDataProducer: AVMetadataIdentifier;
function AVMetadataIdentifierQuickTimeUserDataPublisher: AVMetadataIdentifier;
function AVMetadataIdentifierQuickTimeUserDataProduct: AVMetadataIdentifier;
function AVMetadataIdentifierQuickTimeUserDataSoftware: AVMetadataIdentifier;
function AVMetadataIdentifierQuickTimeUserDataSpecialPlaybackRequirements: AVMetadataIdentifier;
function AVMetadataIdentifierQuickTimeUserDataTrack: AVMetadataIdentifier;
function AVMetadataIdentifierQuickTimeUserDataWarning: AVMetadataIdentifier;
function AVMetadataIdentifierQuickTimeUserDataWriter: AVMetadataIdentifier;
function AVMetadataIdentifierQuickTimeUserDataURLLink: AVMetadataIdentifier;
function AVMetadataIdentifierQuickTimeUserDataLocationISO6709: AVMetadataIdentifier;
function AVMetadataIdentifierQuickTimeUserDataTrackName: AVMetadataIdentifier;
function AVMetadataIdentifierQuickTimeUserDataCredits: AVMetadataIdentifier;
function AVMetadataIdentifierQuickTimeUserDataPhonogramRights: AVMetadataIdentifier;
function AVMetadataIdentifierQuickTimeUserDataTaggedCharacteristic: AVMetadataIdentifier;
function AVMetadataIdentifierISOUserDataCopyright: AVMetadataIdentifier;
function AVMetadataIdentifierISOUserDataDate: AVMetadataIdentifier;
function AVMetadataIdentifierISOUserDataTaggedCharacteristic: AVMetadataIdentifier;
function AVMetadataIdentifier3GPUserDataCopyright: AVMetadataIdentifier;
function AVMetadataIdentifier3GPUserDataAuthor: AVMetadataIdentifier;
function AVMetadataIdentifier3GPUserDataPerformer: AVMetadataIdentifier;
function AVMetadataIdentifier3GPUserDataGenre: AVMetadataIdentifier;
function AVMetadataIdentifier3GPUserDataRecordingYear: AVMetadataIdentifier;
function AVMetadataIdentifier3GPUserDataLocation: AVMetadataIdentifier;
function AVMetadataIdentifier3GPUserDataTitle: AVMetadataIdentifier;
function AVMetadataIdentifier3GPUserDataDescription: AVMetadataIdentifier;
function AVMetadataIdentifier3GPUserDataCollection: AVMetadataIdentifier;
function AVMetadataIdentifier3GPUserDataUserRating: AVMetadataIdentifier;
function AVMetadataIdentifier3GPUserDataThumbnail: AVMetadataIdentifier;
function AVMetadataIdentifier3GPUserDataAlbumAndTrack: AVMetadataIdentifier;
function AVMetadataIdentifier3GPUserDataKeywordList: AVMetadataIdentifier;
function AVMetadataIdentifier3GPUserDataMediaClassification: AVMetadataIdentifier;
function AVMetadataIdentifier3GPUserDataMediaRating: AVMetadataIdentifier;
function AVMetadataIdentifierQuickTimeMetadataAuthor: AVMetadataIdentifier;
function AVMetadataIdentifierQuickTimeMetadataComment: AVMetadataIdentifier;
function AVMetadataIdentifierQuickTimeMetadataCopyright: AVMetadataIdentifier;
function AVMetadataIdentifierQuickTimeMetadataCreationDate: AVMetadataIdentifier;
function AVMetadataIdentifierQuickTimeMetadataDirector: AVMetadataIdentifier;
function AVMetadataIdentifierQuickTimeMetadataDisplayName: AVMetadataIdentifier;
function AVMetadataIdentifierQuickTimeMetadataInformation: AVMetadataIdentifier;
function AVMetadataIdentifierQuickTimeMetadataKeywords: AVMetadataIdentifier;
function AVMetadataIdentifierQuickTimeMetadataProducer: AVMetadataIdentifier;
function AVMetadataIdentifierQuickTimeMetadataPublisher: AVMetadataIdentifier;
function AVMetadataIdentifierQuickTimeMetadataAlbum: AVMetadataIdentifier;
function AVMetadataIdentifierQuickTimeMetadataArtist: AVMetadataIdentifier;
function AVMetadataIdentifierQuickTimeMetadataArtwork: AVMetadataIdentifier;
function AVMetadataIdentifierQuickTimeMetadataDescription: AVMetadataIdentifier;
function AVMetadataIdentifierQuickTimeMetadataSoftware: AVMetadataIdentifier;
function AVMetadataIdentifierQuickTimeMetadataYear: AVMetadataIdentifier;
function AVMetadataIdentifierQuickTimeMetadataGenre: AVMetadataIdentifier;
function AVMetadataIdentifierQuickTimeMetadataiXML: AVMetadataIdentifier;
function AVMetadataIdentifierQuickTimeMetadataLocationISO6709: AVMetadataIdentifier;
function AVMetadataIdentifierQuickTimeMetadataMake: AVMetadataIdentifier;
function AVMetadataIdentifierQuickTimeMetadataModel: AVMetadataIdentifier;
function AVMetadataIdentifierQuickTimeMetadataArranger: AVMetadataIdentifier;
function AVMetadataIdentifierQuickTimeMetadataEncodedBy: AVMetadataIdentifier;
function AVMetadataIdentifierQuickTimeMetadataOriginalArtist: AVMetadataIdentifier;
function AVMetadataIdentifierQuickTimeMetadataPerformer: AVMetadataIdentifier;
function AVMetadataIdentifierQuickTimeMetadataComposer: AVMetadataIdentifier;
function AVMetadataIdentifierQuickTimeMetadataCredits: AVMetadataIdentifier;
function AVMetadataIdentifierQuickTimeMetadataPhonogramRights: AVMetadataIdentifier;
function AVMetadataIdentifierQuickTimeMetadataCameraIdentifier: AVMetadataIdentifier;
function AVMetadataIdentifierQuickTimeMetadataCameraFrameReadoutTime: AVMetadataIdentifier;
function AVMetadataIdentifierQuickTimeMetadataTitle: AVMetadataIdentifier;
function AVMetadataIdentifierQuickTimeMetadataCollectionUser: AVMetadataIdentifier;
function AVMetadataIdentifierQuickTimeMetadataRatingUser: AVMetadataIdentifier;
function AVMetadataIdentifierQuickTimeMetadataLocationName: AVMetadataIdentifier;
function AVMetadataIdentifierQuickTimeMetadataLocationBody: AVMetadataIdentifier;
function AVMetadataIdentifierQuickTimeMetadataLocationNote: AVMetadataIdentifier;
function AVMetadataIdentifierQuickTimeMetadataLocationRole: AVMetadataIdentifier;
function AVMetadataIdentifierQuickTimeMetadataLocationDate: AVMetadataIdentifier;
function AVMetadataIdentifierQuickTimeMetadataDirectionFacing: AVMetadataIdentifier;
function AVMetadataIdentifierQuickTimeMetadataDirectionMotion: AVMetadataIdentifier;
function AVMetadataIdentifierQuickTimeMetadataPreferredAffineTransform: AVMetadataIdentifier;
function AVMetadataIdentifierQuickTimeMetadataDetectedFace: AVMetadataIdentifier;
function AVMetadataIdentifierQuickTimeMetadataVideoOrientation: AVMetadataIdentifier;
function AVMetadataIdentifierQuickTimeMetadataContentIdentifier: AVMetadataIdentifier;
function AVMetadataIdentifieriTunesMetadataAlbum: AVMetadataIdentifier;
function AVMetadataIdentifieriTunesMetadataArtist: AVMetadataIdentifier;
function AVMetadataIdentifieriTunesMetadataUserComment: AVMetadataIdentifier;
function AVMetadataIdentifieriTunesMetadataCoverArt: AVMetadataIdentifier;
function AVMetadataIdentifieriTunesMetadataCopyright: AVMetadataIdentifier;
function AVMetadataIdentifieriTunesMetadataReleaseDate: AVMetadataIdentifier;
function AVMetadataIdentifieriTunesMetadataEncodedBy: AVMetadataIdentifier;
function AVMetadataIdentifieriTunesMetadataPredefinedGenre: AVMetadataIdentifier;
function AVMetadataIdentifieriTunesMetadataUserGenre: AVMetadataIdentifier;
function AVMetadataIdentifieriTunesMetadataSongName: AVMetadataIdentifier;
function AVMetadataIdentifieriTunesMetadataTrackSubTitle: AVMetadataIdentifier;
function AVMetadataIdentifieriTunesMetadataEncodingTool: AVMetadataIdentifier;
function AVMetadataIdentifieriTunesMetadataComposer: AVMetadataIdentifier;
function AVMetadataIdentifieriTunesMetadataAlbumArtist: AVMetadataIdentifier;
function AVMetadataIdentifieriTunesMetadataAccountKind: AVMetadataIdentifier;
function AVMetadataIdentifieriTunesMetadataAppleID: AVMetadataIdentifier;
function AVMetadataIdentifieriTunesMetadataArtistID: AVMetadataIdentifier;
function AVMetadataIdentifieriTunesMetadataSongID: AVMetadataIdentifier;
function AVMetadataIdentifieriTunesMetadataDiscCompilation: AVMetadataIdentifier;
function AVMetadataIdentifieriTunesMetadataDiscNumber: AVMetadataIdentifier;
function AVMetadataIdentifieriTunesMetadataGenreID: AVMetadataIdentifier;
function AVMetadataIdentifieriTunesMetadataGrouping: AVMetadataIdentifier;
function AVMetadataIdentifieriTunesMetadataPlaylistID: AVMetadataIdentifier;
function AVMetadataIdentifieriTunesMetadataContentRating: AVMetadataIdentifier;
function AVMetadataIdentifieriTunesMetadataBeatsPerMin: AVMetadataIdentifier;
function AVMetadataIdentifieriTunesMetadataTrackNumber: AVMetadataIdentifier;
function AVMetadataIdentifieriTunesMetadataArtDirector: AVMetadataIdentifier;
function AVMetadataIdentifieriTunesMetadataArranger: AVMetadataIdentifier;
function AVMetadataIdentifieriTunesMetadataAuthor: AVMetadataIdentifier;
function AVMetadataIdentifieriTunesMetadataLyrics: AVMetadataIdentifier;
function AVMetadataIdentifieriTunesMetadataAcknowledgement: AVMetadataIdentifier;
function AVMetadataIdentifieriTunesMetadataConductor: AVMetadataIdentifier;
function AVMetadataIdentifieriTunesMetadataDescription: AVMetadataIdentifier;
function AVMetadataIdentifieriTunesMetadataDirector: AVMetadataIdentifier;
function AVMetadataIdentifieriTunesMetadataEQ: AVMetadataIdentifier;
function AVMetadataIdentifieriTunesMetadataLinerNotes: AVMetadataIdentifier;
function AVMetadataIdentifieriTunesMetadataRecordCompany: AVMetadataIdentifier;
function AVMetadataIdentifieriTunesMetadataOriginalArtist: AVMetadataIdentifier;
function AVMetadataIdentifieriTunesMetadataPhonogramRights: AVMetadataIdentifier;
function AVMetadataIdentifieriTunesMetadataProducer: AVMetadataIdentifier;
function AVMetadataIdentifieriTunesMetadataPerformer: AVMetadataIdentifier;
function AVMetadataIdentifieriTunesMetadataPublisher: AVMetadataIdentifier;
function AVMetadataIdentifieriTunesMetadataSoundEngineer: AVMetadataIdentifier;
function AVMetadataIdentifieriTunesMetadataSoloist: AVMetadataIdentifier;
function AVMetadataIdentifieriTunesMetadataCredits: AVMetadataIdentifier;
function AVMetadataIdentifieriTunesMetadataThanks: AVMetadataIdentifier;
function AVMetadataIdentifieriTunesMetadataOnlineExtras: AVMetadataIdentifier;
function AVMetadataIdentifieriTunesMetadataExecProducer: AVMetadataIdentifier;
function AVMetadataIdentifierID3MetadataAudioEncryption: AVMetadataIdentifier;
function AVMetadataIdentifierID3MetadataAttachedPicture: AVMetadataIdentifier;
function AVMetadataIdentifierID3MetadataAudioSeekPointIndex: AVMetadataIdentifier;
function AVMetadataIdentifierID3MetadataComments: AVMetadataIdentifier;
function AVMetadataIdentifierID3MetadataCommercial: AVMetadataIdentifier;
function AVMetadataIdentifierID3MetadataCommerical: AVMetadataIdentifier;
function AVMetadataIdentifierID3MetadataEncryption: AVMetadataIdentifier;
function AVMetadataIdentifierID3MetadataEqualization: AVMetadataIdentifier;
function AVMetadataIdentifierID3MetadataEqualization2: AVMetadataIdentifier;
function AVMetadataIdentifierID3MetadataEventTimingCodes: AVMetadataIdentifier;
function AVMetadataIdentifierID3MetadataGeneralEncapsulatedObject: AVMetadataIdentifier;
function AVMetadataIdentifierID3MetadataGroupIdentifier: AVMetadataIdentifier;
function AVMetadataIdentifierID3MetadataInvolvedPeopleList_v23: AVMetadataIdentifier;
function AVMetadataIdentifierID3MetadataLink: AVMetadataIdentifier;
function AVMetadataIdentifierID3MetadataMusicCDIdentifier: AVMetadataIdentifier;
function AVMetadataIdentifierID3MetadataMPEGLocationLookupTable: AVMetadataIdentifier;
function AVMetadataIdentifierID3MetadataOwnership: AVMetadataIdentifier;
function AVMetadataIdentifierID3MetadataPrivate: AVMetadataIdentifier;
function AVMetadataIdentifierID3MetadataPlayCounter: AVMetadataIdentifier;
function AVMetadataIdentifierID3MetadataPopularimeter: AVMetadataIdentifier;
function AVMetadataIdentifierID3MetadataPositionSynchronization: AVMetadataIdentifier;
function AVMetadataIdentifierID3MetadataRecommendedBufferSize: AVMetadataIdentifier;
function AVMetadataIdentifierID3MetadataRelativeVolumeAdjustment: AVMetadataIdentifier;
function AVMetadataIdentifierID3MetadataRelativeVolumeAdjustment2: AVMetadataIdentifier;
function AVMetadataIdentifierID3MetadataReverb: AVMetadataIdentifier;
function AVMetadataIdentifierID3MetadataSeek: AVMetadataIdentifier;
function AVMetadataIdentifierID3MetadataSignature: AVMetadataIdentifier;
function AVMetadataIdentifierID3MetadataSynchronizedLyric: AVMetadataIdentifier;
function AVMetadataIdentifierID3MetadataSynchronizedTempoCodes: AVMetadataIdentifier;
function AVMetadataIdentifierID3MetadataAlbumTitle: AVMetadataIdentifier;
function AVMetadataIdentifierID3MetadataBeatsPerMinute: AVMetadataIdentifier;
function AVMetadataIdentifierID3MetadataComposer: AVMetadataIdentifier;
function AVMetadataIdentifierID3MetadataContentType: AVMetadataIdentifier;
function AVMetadataIdentifierID3MetadataCopyright: AVMetadataIdentifier;
function AVMetadataIdentifierID3MetadataDate: AVMetadataIdentifier;
function AVMetadataIdentifierID3MetadataEncodingTime: AVMetadataIdentifier;
function AVMetadataIdentifierID3MetadataPlaylistDelay: AVMetadataIdentifier;
function AVMetadataIdentifierID3MetadataOriginalReleaseTime: AVMetadataIdentifier;
function AVMetadataIdentifierID3MetadataRecordingTime: AVMetadataIdentifier;
function AVMetadataIdentifierID3MetadataReleaseTime: AVMetadataIdentifier;
function AVMetadataIdentifierID3MetadataTaggingTime: AVMetadataIdentifier;
function AVMetadataIdentifierID3MetadataEncodedBy: AVMetadataIdentifier;
function AVMetadataIdentifierID3MetadataLyricist: AVMetadataIdentifier;
function AVMetadataIdentifierID3MetadataFileType: AVMetadataIdentifier;
function AVMetadataIdentifierID3MetadataTime: AVMetadataIdentifier;
function AVMetadataIdentifierID3MetadataInvolvedPeopleList_v24: AVMetadataIdentifier;
function AVMetadataIdentifierID3MetadataContentGroupDescription: AVMetadataIdentifier;
function AVMetadataIdentifierID3MetadataTitleDescription: AVMetadataIdentifier;
function AVMetadataIdentifierID3MetadataSubTitle: AVMetadataIdentifier;
function AVMetadataIdentifierID3MetadataInitialKey: AVMetadataIdentifier;
function AVMetadataIdentifierID3MetadataLanguage: AVMetadataIdentifier;
function AVMetadataIdentifierID3MetadataLength: AVMetadataIdentifier;
function AVMetadataIdentifierID3MetadataMusicianCreditsList: AVMetadataIdentifier;
function AVMetadataIdentifierID3MetadataMediaType: AVMetadataIdentifier;
function AVMetadataIdentifierID3MetadataMood: AVMetadataIdentifier;
function AVMetadataIdentifierID3MetadataOriginalAlbumTitle: AVMetadataIdentifier;
function AVMetadataIdentifierID3MetadataOriginalFilename: AVMetadataIdentifier;
function AVMetadataIdentifierID3MetadataOriginalLyricist: AVMetadataIdentifier;
function AVMetadataIdentifierID3MetadataOriginalArtist: AVMetadataIdentifier;
function AVMetadataIdentifierID3MetadataOriginalReleaseYear: AVMetadataIdentifier;
function AVMetadataIdentifierID3MetadataFileOwner: AVMetadataIdentifier;
function AVMetadataIdentifierID3MetadataLeadPerformer: AVMetadataIdentifier;
function AVMetadataIdentifierID3MetadataBand: AVMetadataIdentifier;
function AVMetadataIdentifierID3MetadataConductor: AVMetadataIdentifier;
function AVMetadataIdentifierID3MetadataModifiedBy: AVMetadataIdentifier;
function AVMetadataIdentifierID3MetadataPartOfASet: AVMetadataIdentifier;
function AVMetadataIdentifierID3MetadataProducedNotice: AVMetadataIdentifier;
function AVMetadataIdentifierID3MetadataPublisher: AVMetadataIdentifier;
function AVMetadataIdentifierID3MetadataTrackNumber: AVMetadataIdentifier;
function AVMetadataIdentifierID3MetadataRecordingDates: AVMetadataIdentifier;
function AVMetadataIdentifierID3MetadataInternetRadioStationName: AVMetadataIdentifier;
function AVMetadataIdentifierID3MetadataInternetRadioStationOwner: AVMetadataIdentifier;
function AVMetadataIdentifierID3MetadataSize: AVMetadataIdentifier;
function AVMetadataIdentifierID3MetadataAlbumSortOrder: AVMetadataIdentifier;
function AVMetadataIdentifierID3MetadataPerformerSortOrder: AVMetadataIdentifier;
function AVMetadataIdentifierID3MetadataTitleSortOrder: AVMetadataIdentifier;
function AVMetadataIdentifierID3MetadataInternationalStandardRecordingCode: AVMetadataIdentifier;
function AVMetadataIdentifierID3MetadataEncodedWith: AVMetadataIdentifier;
function AVMetadataIdentifierID3MetadataSetSubtitle: AVMetadataIdentifier;
function AVMetadataIdentifierID3MetadataYear: AVMetadataIdentifier;
function AVMetadataIdentifierID3MetadataUserText: AVMetadataIdentifier;
function AVMetadataIdentifierID3MetadataUniqueFileIdentifier: AVMetadataIdentifier;
function AVMetadataIdentifierID3MetadataTermsOfUse: AVMetadataIdentifier;
function AVMetadataIdentifierID3MetadataUnsynchronizedLyric: AVMetadataIdentifier;
function AVMetadataIdentifierID3MetadataCommercialInformation: AVMetadataIdentifier;
function AVMetadataIdentifierID3MetadataCopyrightInformation: AVMetadataIdentifier;
function AVMetadataIdentifierID3MetadataOfficialAudioFileWebpage: AVMetadataIdentifier;
function AVMetadataIdentifierID3MetadataOfficialArtistWebpage: AVMetadataIdentifier;
function AVMetadataIdentifierID3MetadataOfficialAudioSourceWebpage: AVMetadataIdentifier;
function AVMetadataIdentifierID3MetadataOfficialInternetRadioStationHomepage: AVMetadataIdentifier;
function AVMetadataIdentifierID3MetadataPayment: AVMetadataIdentifier;
function AVMetadataIdentifierID3MetadataOfficialPublisherWebpage: AVMetadataIdentifier;
function AVMetadataIdentifierID3MetadataUserURL: AVMetadataIdentifier;
function AVMetadataIdentifierIcyMetadataStreamTitle: AVMetadataIdentifier;
function AVMetadataIdentifierIcyMetadataStreamURL: AVMetadataIdentifier;
function AVFragmentedMovieTrackTimeRangeDidChangeNotification: NSString;
function AVFragmentedMovieTrackSegmentsDidChangeNotification: NSString;
function AVFragmentedMovieTrackTotalSampleDataLengthDidChangeNotification: NSString;
function AVMovieReferenceRestrictionsKey: NSString;
function AVFragmentedMovieContainsMovieFragmentsDidChangeNotification: NSString;
function AVFragmentedMovieDurationDidChangeNotification: NSString;
function AVFragmentedMovieWasDefragmentedNotification: NSString;
function AVOutputSettingsPreset640x480: AVOutputSettingsPreset;
function AVOutputSettingsPreset960x540: AVOutputSettingsPreset;
function AVOutputSettingsPreset1280x720: AVOutputSettingsPreset;
function AVOutputSettingsPreset1920x1080: AVOutputSettingsPreset;
function AVOutputSettingsPreset3840x2160: AVOutputSettingsPreset;
function AVOutputSettingsPresetHEVC1920x1080: AVOutputSettingsPreset;
function AVOutputSettingsPresetHEVC3840x2160: AVOutputSettingsPreset;
function AVPlayerWaitingToMinimizeStallsReason: AVPlayerWaitingReason;
function AVPlayerWaitingWhileEvaluatingBufferingRateReason: AVPlayerWaitingReason;
function AVPlayerWaitingWithNoItemToPlayReason: AVPlayerWaitingReason;
function AVPlayerAvailableHDRModesDidChangeNotification: NSNotificationName;
function AVPlayerItemTimeJumpedNotification: NSString;
function AVPlayerItemDidPlayToEndTimeNotification: NSString;
function AVPlayerItemFailedToPlayToEndTimeNotification: NSString;
function AVPlayerItemPlaybackStalledNotification: NSString;
function AVPlayerItemNewAccessLogEntryNotification: NSString;
function AVPlayerItemNewErrorLogEntryNotification: NSString;
function AVPlayerItemFailedToPlayToEndTimeErrorKey: NSString;
function AVPlayerItemLegibleOutputTextStylingResolutionDefault: AVPlayerItemLegibleOutputTextStylingResolution;
function AVPlayerItemLegibleOutputTextStylingResolutionSourceAndRulesOnly: AVPlayerItemLegibleOutputTextStylingResolution;
function AVPlayerItemTrackVideoFieldModeDeinterlaceFields: NSString;
function AVRouteDetectorMultipleRoutesDetectedDidChangeNotification: NSNotificationName;
function AVSampleBufferAudioRendererWasFlushedAutomaticallyNotification: NSNotificationName;
function AVSampleBufferAudioRendererFlushTimeKey: NSString;
function AVSampleBufferDisplayLayerFailedToDecodeNotification: NSString;
function AVSampleBufferDisplayLayerFailedToDecodeNotificationErrorKey: NSString;
function AVSampleBufferRenderSynchronizerRateDidChangeNotification: NSNotificationName;
{$ENDIF}

implementation

function AVMediaTypeAudio: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMediaTypeAudio');
end;

function AVMediaTypeVideo: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMediaTypeVideo');
end;

function AVCaptureSessionPresetPhoto: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVCaptureSessionPresetPhoto');
end;

function AVCaptureSessionPresetHigh: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVCaptureSessionPresetHigh');
end;

function AVCaptureSessionPresetMedium: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVCaptureSessionPresetMedium');
end;

function AVCaptureSessionPresetLow: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVCaptureSessionPresetLow');
end;

function AVCaptureSessionPreset320x240: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVCaptureSessionPreset320x240');
end;

function AVCaptureSessionPreset352x288: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVCaptureSessionPreset352x288');
end;

function AVCaptureSessionPreset640x480: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVCaptureSessionPreset640x480');
end;

function AVCaptureSessionPreset960x540: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVCaptureSessionPreset960x540');
end;

function AVCaptureSessionPreset1280x720: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVCaptureSessionPreset1280x720');
end;

function AVCaptureSessionPresetInputPriority: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVCaptureSessionPresetInputPriority');
end;

function AVCaptureSessionPresetiFrame960x540: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVCaptureSessionPresetiFrame960x540');
end;

function AVCaptureSessionPresetiFrame1280x720: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVCaptureSessionPresetiFrame1280x720');
end;

function AVFileTypeWAVE: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVFileTypeWAVE');
end;

function AVFormatIDKey: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVFormatIDKey');
end;

function AVSampleRateKey: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVSampleRateKey');
end;

function AVNumberOfChannelsKey: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVNumberOfChannelsKey');
end;

{$IFDEF OSX64}
function AVAudioEngineConfigurationChangeNotification: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVAudioEngineConfigurationChangeNotification');
end;

function AVLinearPCMBitDepthKey: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVLinearPCMBitDepthKey');
end;

function AVLinearPCMIsBigEndianKey: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVLinearPCMIsBigEndianKey');
end;

function AVLinearPCMIsFloatKey: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVLinearPCMIsFloatKey');
end;

function AVLinearPCMIsNonInterleavedKey: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVLinearPCMIsNonInterleaved');
end;

function AVAudioFileTypeKey: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVAudioFileTypeKey');
end;

function AVEncoderAudioQualityKey: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVEncoderAudioQualityKey');
end;

function AVEncoderAudioQualityForVBRKey: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVEncoderAudioQualityForVBRKey');
end;

function AVEncoderBitRateKey: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVEncoderBitRateKey');
end;

function AVEncoderBitRatePerChannelKey: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVEncoderBitRatePerChannelKey');
end;

function AVEncoderBitRateStrategyKey: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVEncoderBitRateStrategyKey');
end;

function AVEncoderBitDepthHintKey: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVEncoderBitDepthHintKey');
end;

function AVSampleRateConverterAlgorithmKey: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVSampleRateConverterAlgorithmKey');
end;

function AVSampleRateConverterAudioQualityKey: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVSampleRateConverterAudioQualityKey');
end;

function AVChannelLayoutKey: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVChannelLayoutKey');
end;

function AVAudioBitRateStrategy_Constant: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVAudioBitRateStrategy_Constant');
end;

function AVAudioBitRateStrategy_LongTermAverage: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVAudioBitRateStrategy_LongTermAverage');
end;

function AVAudioBitRateStrategy_VariableConstrained: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVAudioBitRateStrategy_VariableConstrained');
end;

function AVAudioBitRateStrategy_Variable: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVAudioBitRateStrategy_Variable');
end;

function AVSampleRateConverterAlgorithm_Normal: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVSampleRateConverterAlgorithm_Normal');
end;

function AVSampleRateConverterAlgorithm_Mastering: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVSampleRateConverterAlgorithm_Mastering');
end;

function AVSampleRateConverterAlgorithm_MinimumPhase: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVSampleRateConverterAlgorithm_MinimumPhase');
end;

function AVAudioUnitTypeOutput: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVAudioUnitTypeOutput');
end;

function AVAudioUnitTypeMusicDevice: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVAudioUnitTypeMusicDevice');
end;

function AVAudioUnitTypeMusicEffect: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVAudioUnitTypeMusicEffect');
end;

function AVAudioUnitTypeFormatConverter: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVAudioUnitTypeFormatConverter');
end;

function AVAudioUnitTypeEffect: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVAudioUnitTypeEffect');
end;

function AVAudioUnitTypeMixer: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVAudioUnitTypeMixer');
end;

function AVAudioUnitTypePanner: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVAudioUnitTypePanner');
end;

function AVAudioUnitTypeGenerator: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVAudioUnitTypeGenerator');
end;

function AVAudioUnitTypeOfflineEffect: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVAudioUnitTypeOfflineEffect');
end;

function AVAudioUnitTypeMIDIProcessor: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVAudioUnitTypeMIDIProcessor');
end;

function AVAudioUnitManufacturerNameApple: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVAudioUnitManufacturerNameApple');
end;

function AVAudioUnitComponentTagsDidChangeNotification: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVAudioUnitComponentTagsDidChangeNotification');
end;

function AVSpeechUtteranceMinimumSpeechRate: Single;
begin
  Result := CocoaSingleConst(libAVFoundation, 'AVSpeechUtteranceMinimumSpeechRate');
end;

function AVSpeechUtteranceMaximumSpeechRate: Single;
begin
  Result := CocoaSingleConst(libAVFoundation, 'AVSpeechUtteranceMaximumSpeechRate');
end;

function AVSpeechUtteranceDefaultSpeechRate: Single;
begin
  Result := CocoaSingleConst(libAVFoundation, 'AVSpeechUtteranceDefaultSpeechRate');
end;

function AVSpeechSynthesisVoiceIdentifierAlex: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVSpeechSynthesisVoiceIdentifierAlex');
end;

function AVSpeechSynthesisIPANotationAttribute: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVSpeechSynthesisIPANotationAttribute');
end;

function AVCoreAnimationBeginTimeAtZero: CFTimeInterval;
begin
  Result := CocoaDoubleConst(libAVFoundation, 'AVCoreAnimationBeginTimeAtZero');
end;

function AVLayerVideoGravityResizeAspect: AVLayerVideoGravity;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVLayerVideoGravityResizeAspect');
end;

function AVLayerVideoGravityResizeAspectFill: AVLayerVideoGravity;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVLayerVideoGravityResizeAspectFill');
end;

function AVLayerVideoGravityResize: AVLayerVideoGravity;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVLayerVideoGravityResize');
end;

function AVContentKeySystemFairPlayStreaming: AVContentKeySystem;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVContentKeySystemFairPlayStreaming');
end;

function AVContentKeySystemClearKey: AVContentKeySystem;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVContentKeySystemClearKey');
end;

function AVContentKeyRequestRetryReasonTimedOut: AVContentKeyRequestRetryReason;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVContentKeyRequestRetryReasonTimedOut');
end;

function AVContentKeyRequestRetryReasonReceivedResponseWithExpiredLease: AVContentKeyRequestRetryReason;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVContentKeyRequestRetryReasonReceivedResponseWithExpiredLease');
end;

function AVContentKeyRequestRetryReasonReceivedObsoleteContentKey: AVContentKeyRequestRetryReason;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVContentKeyRequestRetryReasonReceivedObsoleteContentKey');
end;

function AVContentKeyRequestProtocolVersionsKey: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVContentKeyRequestProtocolVersionsKey');
end;

function AVMediaTypeText: AVMediaType;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMediaTypeText');
end;

function AVMediaTypeClosedCaption: AVMediaType;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMediaTypeClosedCaption');
end;

function AVMediaTypeSubtitle: AVMediaType;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMediaTypeSubtitle');
end;

function AVMediaTypeTimecode: AVMediaType;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMediaTypeTimecode');
end;

function AVMediaTypeMetadata: AVMediaType;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMediaTypeMetadata');
end;

function AVMediaTypeMuxed: AVMediaType;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMediaTypeMuxed');
end;

function AVMediaTypeMetadataObject: AVMediaType;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMediaTypeMetadataObject');
end;

function AVMediaTypeDepthData: AVMediaType;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMediaTypeDepthData');
end;

function AVMediaCharacteristicVisual: AVMediaCharacteristic;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMediaCharacteristicVisual');
end;

function AVMediaCharacteristicAudible: AVMediaCharacteristic;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMediaCharacteristicAudible');
end;

function AVMediaCharacteristicLegible: AVMediaCharacteristic;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMediaCharacteristicLegible');
end;

function AVMediaCharacteristicFrameBased: AVMediaCharacteristic;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMediaCharacteristicFrameBased');
end;

function AVMediaCharacteristicUsesWideGamutColorSpace: AVMediaCharacteristic;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMediaCharacteristicUsesWideGamutColorSpace');
end;

function AVMediaCharacteristicIsMainProgramContent: AVMediaCharacteristic;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMediaCharacteristicIsMainProgramContent');
end;

function AVMediaCharacteristicIsAuxiliaryContent: AVMediaCharacteristic;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMediaCharacteristicIsAuxiliaryContent');
end;

function AVMediaCharacteristicContainsOnlyForcedSubtitles: AVMediaCharacteristic;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMediaCharacteristicContainsOnlyForcedSubtitles');
end;

function AVMediaCharacteristicTranscribesSpokenDialogForAccessibility: AVMediaCharacteristic;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMediaCharacteristicTranscribesSpokenDialogForAccessibility');
end;

function AVMediaCharacteristicDescribesMusicAndSoundForAccessibility: AVMediaCharacteristic;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMediaCharacteristicDescribesMusicAndSoundForAccessibility');
end;

function AVMediaCharacteristicEasyToRead: AVMediaCharacteristic;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMediaCharacteristicEasyToRead');
end;

function AVMediaCharacteristicDescribesVideoForAccessibility: AVMediaCharacteristic;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMediaCharacteristicDescribesVideoForAccessibility');
end;

function AVMediaCharacteristicLanguageTranslation: AVMediaCharacteristic;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMediaCharacteristicLanguageTranslation');
end;

function AVMediaCharacteristicDubbedTranslation: AVMediaCharacteristic;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMediaCharacteristicDubbedTranslation');
end;

function AVMediaCharacteristicVoiceOverTranslation: AVMediaCharacteristic;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMediaCharacteristicVoiceOverTranslation');
end;

function AVFileTypeQuickTimeMovie: AVFileType;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVFileTypeQuickTimeMovie');
end;

function AVFileTypeMPEG4: AVFileType;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVFileTypeMPEG4');
end;

function AVFileTypeAppleM4V: AVFileType;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVFileTypeAppleM4V');
end;

function AVFileTypeAppleM4A: AVFileType;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVFileTypeAppleM4A');
end;

function AVFileType3GPP: AVFileType;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVFileType3GPP');
end;

function AVFileType3GPP2: AVFileType;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVFileType3GPP2');
end;

function AVFileTypeCoreAudioFormat: AVFileType;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVFileTypeCoreAudioFormat');
end;

function AVFileTypeAIFF: AVFileType;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVFileTypeAIFF');
end;

function AVFileTypeAIFC: AVFileType;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVFileTypeAIFC');
end;

function AVFileTypeAMR: AVFileType;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVFileTypeAMR');
end;

function AVFileTypeMPEGLayer3: AVFileType;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVFileTypeMPEGLayer3');
end;

function AVFileTypeSunAU: AVFileType;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVFileTypeSunAU');
end;

function AVFileTypeAC3: AVFileType;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVFileTypeAC3');
end;

function AVFileTypeEnhancedAC3: AVFileType;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVFileTypeEnhancedAC3');
end;

function AVFileTypeJPEG: AVFileType;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVFileTypeJPEG');
end;

function AVFileTypeDNG: AVFileType;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVFileTypeDNG');
end;

function AVFileTypeHEIC: AVFileType;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVFileTypeHEIC');
end;

function AVFileTypeAVCI: AVFileType;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVFileTypeAVCI');
end;

function AVFileTypeHEIF: AVFileType;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVFileTypeHEIF');
end;

function AVFileTypeTIFF: AVFileType;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVFileTypeTIFF');
end;

function AVStreamingKeyDeliveryContentKeyType: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVStreamingKeyDeliveryContentKeyType');
end;

function AVStreamingKeyDeliveryPersistentContentKeyType: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVStreamingKeyDeliveryPersistentContentKeyType');
end;

function AVMetadataKeySpaceCommon: AVMetadataKeySpace;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataKeySpaceCommon');
end;

function AVMetadataCommonKeyTitle: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataCommonKeyTitle');
end;

function AVMetadataCommonKeyCreator: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataCommonKeyCreator');
end;

function AVMetadataCommonKeySubject: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataCommonKeySubject');
end;

function AVMetadataCommonKeyDescription: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataCommonKeyDescription');
end;

function AVMetadataCommonKeyPublisher: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataCommonKeyPublisher');
end;

function AVMetadataCommonKeyContributor: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataCommonKeyContributor');
end;

function AVMetadataCommonKeyCreationDate: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataCommonKeyCreationDate');
end;

function AVMetadataCommonKeyLastModifiedDate: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataCommonKeyLastModifiedDate');
end;

function AVMetadataCommonKeyType: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataCommonKeyType');
end;

function AVMetadataCommonKeyFormat: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataCommonKeyFormat');
end;

function AVMetadataCommonKeyIdentifier: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataCommonKeyIdentifier');
end;

function AVMetadataCommonKeySource: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataCommonKeySource');
end;

function AVMetadataCommonKeyLanguage: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataCommonKeyLanguage');
end;

function AVMetadataCommonKeyRelation: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataCommonKeyRelation');
end;

function AVMetadataCommonKeyLocation: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataCommonKeyLocation');
end;

function AVMetadataCommonKeyCopyrights: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataCommonKeyCopyrights');
end;

function AVMetadataCommonKeyAlbumName: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataCommonKeyAlbumName');
end;

function AVMetadataCommonKeyAuthor: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataCommonKeyAuthor');
end;

function AVMetadataCommonKeyArtist: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataCommonKeyArtist');
end;

function AVMetadataCommonKeyArtwork: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataCommonKeyArtwork');
end;

function AVMetadataCommonKeyMake: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataCommonKeyMake');
end;

function AVMetadataCommonKeyModel: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataCommonKeyModel');
end;

function AVMetadataCommonKeySoftware: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataCommonKeySoftware');
end;

function AVMetadataFormatQuickTimeUserData: AVMetadataFormat;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataFormatQuickTimeUserData');
end;

function AVMetadataKeySpaceQuickTimeUserData: AVMetadataKeySpace;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataKeySpaceQuickTimeUserData');
end;

function AVMetadataQuickTimeUserDataKeyAlbum: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataQuickTimeUserDataKeyAlbum');
end;

function AVMetadataQuickTimeUserDataKeyArranger: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataQuickTimeUserDataKeyArranger');
end;

function AVMetadataQuickTimeUserDataKeyArtist: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataQuickTimeUserDataKeyArtist');
end;

function AVMetadataQuickTimeUserDataKeyAuthor: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataQuickTimeUserDataKeyAuthor');
end;

function AVMetadataQuickTimeUserDataKeyChapter: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataQuickTimeUserDataKeyChapter');
end;

function AVMetadataQuickTimeUserDataKeyComment: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataQuickTimeUserDataKeyComment');
end;

function AVMetadataQuickTimeUserDataKeyComposer: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataQuickTimeUserDataKeyComposer');
end;

function AVMetadataQuickTimeUserDataKeyCopyright: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataQuickTimeUserDataKeyCopyright');
end;

function AVMetadataQuickTimeUserDataKeyCreationDate: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataQuickTimeUserDataKeyCreationDate');
end;

function AVMetadataQuickTimeUserDataKeyDescription: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataQuickTimeUserDataKeyDescription');
end;

function AVMetadataQuickTimeUserDataKeyDirector: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataQuickTimeUserDataKeyDirector');
end;

function AVMetadataQuickTimeUserDataKeyDisclaimer: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataQuickTimeUserDataKeyDisclaimer');
end;

function AVMetadataQuickTimeUserDataKeyEncodedBy: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataQuickTimeUserDataKeyEncodedBy');
end;

function AVMetadataQuickTimeUserDataKeyFullName: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataQuickTimeUserDataKeyFullName');
end;

function AVMetadataQuickTimeUserDataKeyGenre: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataQuickTimeUserDataKeyGenre');
end;

function AVMetadataQuickTimeUserDataKeyHostComputer: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataQuickTimeUserDataKeyHostComputer');
end;

function AVMetadataQuickTimeUserDataKeyInformation: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataQuickTimeUserDataKeyInformation');
end;

function AVMetadataQuickTimeUserDataKeyKeywords: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataQuickTimeUserDataKeyKeywords');
end;

function AVMetadataQuickTimeUserDataKeyMake: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataQuickTimeUserDataKeyMake');
end;

function AVMetadataQuickTimeUserDataKeyModel: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataQuickTimeUserDataKeyModel');
end;

function AVMetadataQuickTimeUserDataKeyOriginalArtist: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataQuickTimeUserDataKeyOriginalArtist');
end;

function AVMetadataQuickTimeUserDataKeyOriginalFormat: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataQuickTimeUserDataKeyOriginalFormat');
end;

function AVMetadataQuickTimeUserDataKeyOriginalSource: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataQuickTimeUserDataKeyOriginalSource');
end;

function AVMetadataQuickTimeUserDataKeyPerformers: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataQuickTimeUserDataKeyPerformers');
end;

function AVMetadataQuickTimeUserDataKeyProducer: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataQuickTimeUserDataKeyProducer');
end;

function AVMetadataQuickTimeUserDataKeyPublisher: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataQuickTimeUserDataKeyPublisher');
end;

function AVMetadataQuickTimeUserDataKeyProduct: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataQuickTimeUserDataKeyProduct');
end;

function AVMetadataQuickTimeUserDataKeySoftware: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataQuickTimeUserDataKeySoftware');
end;

function AVMetadataQuickTimeUserDataKeySpecialPlaybackRequirements: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataQuickTimeUserDataKeySpecialPlaybackRequirements');
end;

function AVMetadataQuickTimeUserDataKeyTrack: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataQuickTimeUserDataKeyTrack');
end;

function AVMetadataQuickTimeUserDataKeyWarning: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataQuickTimeUserDataKeyWarning');
end;

function AVMetadataQuickTimeUserDataKeyWriter: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataQuickTimeUserDataKeyWriter');
end;

function AVMetadataQuickTimeUserDataKeyURLLink: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataQuickTimeUserDataKeyURLLink');
end;

function AVMetadataQuickTimeUserDataKeyLocationISO6709: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataQuickTimeUserDataKeyLocationISO6709');
end;

function AVMetadataQuickTimeUserDataKeyTrackName: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataQuickTimeUserDataKeyTrackName');
end;

function AVMetadataQuickTimeUserDataKeyCredits: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataQuickTimeUserDataKeyCredits');
end;

function AVMetadataQuickTimeUserDataKeyPhonogramRights: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataQuickTimeUserDataKeyPhonogramRights');
end;

function AVMetadataQuickTimeUserDataKeyTaggedCharacteristic: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataQuickTimeUserDataKeyTaggedCharacteristic');
end;

function AVMetadataFormatISOUserData: AVMetadataFormat;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataFormatISOUserData');
end;

function AVMetadataKeySpaceISOUserData: AVMetadataKeySpace;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataKeySpaceISOUserData');
end;

function AVMetadataISOUserDataKeyCopyright: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataISOUserDataKeyCopyright');
end;

function AVMetadataISOUserDataKeyTaggedCharacteristic: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataISOUserDataKeyTaggedCharacteristic');
end;

function AVMetadataISOUserDataKeyDate: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataISOUserDataKeyDate');
end;

function AVMetadata3GPUserDataKeyCopyright: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadata3GPUserDataKeyCopyright');
end;

function AVMetadata3GPUserDataKeyAuthor: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadata3GPUserDataKeyAuthor');
end;

function AVMetadata3GPUserDataKeyPerformer: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadata3GPUserDataKeyPerformer');
end;

function AVMetadata3GPUserDataKeyGenre: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadata3GPUserDataKeyGenre');
end;

function AVMetadata3GPUserDataKeyRecordingYear: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadata3GPUserDataKeyRecordingYear');
end;

function AVMetadata3GPUserDataKeyLocation: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadata3GPUserDataKeyLocation');
end;

function AVMetadata3GPUserDataKeyTitle: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadata3GPUserDataKeyTitle');
end;

function AVMetadata3GPUserDataKeyDescription: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadata3GPUserDataKeyDescription');
end;

function AVMetadata3GPUserDataKeyCollection: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadata3GPUserDataKeyCollection');
end;

function AVMetadata3GPUserDataKeyUserRating: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadata3GPUserDataKeyUserRating');
end;

function AVMetadata3GPUserDataKeyThumbnail: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadata3GPUserDataKeyThumbnail');
end;

function AVMetadata3GPUserDataKeyAlbumAndTrack: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadata3GPUserDataKeyAlbumAndTrack');
end;

function AVMetadata3GPUserDataKeyKeywordList: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadata3GPUserDataKeyKeywordList');
end;

function AVMetadata3GPUserDataKeyMediaClassification: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadata3GPUserDataKeyMediaClassification');
end;

function AVMetadata3GPUserDataKeyMediaRating: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadata3GPUserDataKeyMediaRating');
end;

function AVMetadataFormatQuickTimeMetadata: AVMetadataFormat;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataFormatQuickTimeMetadata');
end;

function AVMetadataKeySpaceQuickTimeMetadata: AVMetadataKeySpace;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataKeySpaceQuickTimeMetadata');
end;

function AVMetadataQuickTimeMetadataKeyAuthor: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataQuickTimeMetadataKeyAuthor');
end;

function AVMetadataQuickTimeMetadataKeyComment: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataQuickTimeMetadataKeyComment');
end;

function AVMetadataQuickTimeMetadataKeyCopyright: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataQuickTimeMetadataKeyCopyright');
end;

function AVMetadataQuickTimeMetadataKeyCreationDate: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataQuickTimeMetadataKeyCreationDate');
end;

function AVMetadataQuickTimeMetadataKeyDirector: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataQuickTimeMetadataKeyDirector');
end;

function AVMetadataQuickTimeMetadataKeyDisplayName: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataQuickTimeMetadataKeyDisplayName');
end;

function AVMetadataQuickTimeMetadataKeyInformation: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataQuickTimeMetadataKeyInformation');
end;

function AVMetadataQuickTimeMetadataKeyKeywords: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataQuickTimeMetadataKeyKeywords');
end;

function AVMetadataQuickTimeMetadataKeyProducer: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataQuickTimeMetadataKeyProducer');
end;

function AVMetadataQuickTimeMetadataKeyPublisher: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataQuickTimeMetadataKeyPublisher');
end;

function AVMetadataQuickTimeMetadataKeyAlbum: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataQuickTimeMetadataKeyAlbum');
end;

function AVMetadataQuickTimeMetadataKeyArtist: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataQuickTimeMetadataKeyArtist');
end;

function AVMetadataQuickTimeMetadataKeyArtwork: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataQuickTimeMetadataKeyArtwork');
end;

function AVMetadataQuickTimeMetadataKeyDescription: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataQuickTimeMetadataKeyDescription');
end;

function AVMetadataQuickTimeMetadataKeySoftware: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataQuickTimeMetadataKeySoftware');
end;

function AVMetadataQuickTimeMetadataKeyYear: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataQuickTimeMetadataKeyYear');
end;

function AVMetadataQuickTimeMetadataKeyGenre: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataQuickTimeMetadataKeyGenre');
end;

function AVMetadataQuickTimeMetadataKeyiXML: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataQuickTimeMetadataKeyiXML');
end;

function AVMetadataQuickTimeMetadataKeyLocationISO6709: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataQuickTimeMetadataKeyLocationISO6709');
end;

function AVMetadataQuickTimeMetadataKeyMake: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataQuickTimeMetadataKeyMake');
end;

function AVMetadataQuickTimeMetadataKeyModel: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataQuickTimeMetadataKeyModel');
end;

function AVMetadataQuickTimeMetadataKeyArranger: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataQuickTimeMetadataKeyArranger');
end;

function AVMetadataQuickTimeMetadataKeyEncodedBy: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataQuickTimeMetadataKeyEncodedBy');
end;

function AVMetadataQuickTimeMetadataKeyOriginalArtist: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataQuickTimeMetadataKeyOriginalArtist');
end;

function AVMetadataQuickTimeMetadataKeyPerformer: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataQuickTimeMetadataKeyPerformer');
end;

function AVMetadataQuickTimeMetadataKeyComposer: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataQuickTimeMetadataKeyComposer');
end;

function AVMetadataQuickTimeMetadataKeyCredits: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataQuickTimeMetadataKeyCredits');
end;

function AVMetadataQuickTimeMetadataKeyPhonogramRights: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataQuickTimeMetadataKeyPhonogramRights');
end;

function AVMetadataQuickTimeMetadataKeyCameraIdentifier: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataQuickTimeMetadataKeyCameraIdentifier');
end;

function AVMetadataQuickTimeMetadataKeyCameraFrameReadoutTime: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataQuickTimeMetadataKeyCameraFrameReadoutTime');
end;

function AVMetadataQuickTimeMetadataKeyTitle: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataQuickTimeMetadataKeyTitle');
end;

function AVMetadataQuickTimeMetadataKeyCollectionUser: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataQuickTimeMetadataKeyCollectionUser');
end;

function AVMetadataQuickTimeMetadataKeyRatingUser: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataQuickTimeMetadataKeyRatingUser');
end;

function AVMetadataQuickTimeMetadataKeyLocationName: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataQuickTimeMetadataKeyLocationName');
end;

function AVMetadataQuickTimeMetadataKeyLocationBody: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataQuickTimeMetadataKeyLocationBody');
end;

function AVMetadataQuickTimeMetadataKeyLocationNote: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataQuickTimeMetadataKeyLocationNote');
end;

function AVMetadataQuickTimeMetadataKeyLocationRole: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataQuickTimeMetadataKeyLocationRole');
end;

function AVMetadataQuickTimeMetadataKeyLocationDate: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataQuickTimeMetadataKeyLocationDate');
end;

function AVMetadataQuickTimeMetadataKeyDirectionFacing: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataQuickTimeMetadataKeyDirectionFacing');
end;

function AVMetadataQuickTimeMetadataKeyDirectionMotion: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataQuickTimeMetadataKeyDirectionMotion');
end;

function AVMetadataQuickTimeMetadataKeyContentIdentifier: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataQuickTimeMetadataKeyContentIdentifier');
end;

function AVMetadataFormatiTunesMetadata: AVMetadataFormat;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataFormatiTunesMetadata');
end;

function AVMetadataKeySpaceiTunes: AVMetadataKeySpace;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataKeySpaceiTunes');
end;

function AVMetadataiTunesMetadataKeyAlbum: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataiTunesMetadataKeyAlbum');
end;

function AVMetadataiTunesMetadataKeyArtist: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataiTunesMetadataKeyArtist');
end;

function AVMetadataiTunesMetadataKeyUserComment: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataiTunesMetadataKeyUserComment');
end;

function AVMetadataiTunesMetadataKeyCoverArt: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataiTunesMetadataKeyCoverArt');
end;

function AVMetadataiTunesMetadataKeyCopyright: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataiTunesMetadataKeyCopyright');
end;

function AVMetadataiTunesMetadataKeyReleaseDate: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataiTunesMetadataKeyReleaseDate');
end;

function AVMetadataiTunesMetadataKeyEncodedBy: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataiTunesMetadataKeyEncodedBy');
end;

function AVMetadataiTunesMetadataKeyPredefinedGenre: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataiTunesMetadataKeyPredefinedGenre');
end;

function AVMetadataiTunesMetadataKeyUserGenre: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataiTunesMetadataKeyUserGenre');
end;

function AVMetadataiTunesMetadataKeySongName: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataiTunesMetadataKeySongName');
end;

function AVMetadataiTunesMetadataKeyTrackSubTitle: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataiTunesMetadataKeyTrackSubTitle');
end;

function AVMetadataiTunesMetadataKeyEncodingTool: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataiTunesMetadataKeyEncodingTool');
end;

function AVMetadataiTunesMetadataKeyComposer: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataiTunesMetadataKeyComposer');
end;

function AVMetadataiTunesMetadataKeyAlbumArtist: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataiTunesMetadataKeyAlbumArtist');
end;

function AVMetadataiTunesMetadataKeyAccountKind: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataiTunesMetadataKeyAccountKind');
end;

function AVMetadataiTunesMetadataKeyAppleID: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataiTunesMetadataKeyAppleID');
end;

function AVMetadataiTunesMetadataKeyArtistID: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataiTunesMetadataKeyArtistID');
end;

function AVMetadataiTunesMetadataKeySongID: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataiTunesMetadataKeySongID');
end;

function AVMetadataiTunesMetadataKeyDiscCompilation: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataiTunesMetadataKeyDiscCompilation');
end;

function AVMetadataiTunesMetadataKeyDiscNumber: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataiTunesMetadataKeyDiscNumber');
end;

function AVMetadataiTunesMetadataKeyGenreID: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataiTunesMetadataKeyGenreID');
end;

function AVMetadataiTunesMetadataKeyGrouping: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataiTunesMetadataKeyGrouping');
end;

function AVMetadataiTunesMetadataKeyPlaylistID: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataiTunesMetadataKeyPlaylistID');
end;

function AVMetadataiTunesMetadataKeyContentRating: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataiTunesMetadataKeyContentRating');
end;

function AVMetadataiTunesMetadataKeyBeatsPerMin: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataiTunesMetadataKeyBeatsPerMin');
end;

function AVMetadataiTunesMetadataKeyTrackNumber: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataiTunesMetadataKeyTrackNumber');
end;

function AVMetadataiTunesMetadataKeyArtDirector: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataiTunesMetadataKeyArtDirector');
end;

function AVMetadataiTunesMetadataKeyArranger: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataiTunesMetadataKeyArranger');
end;

function AVMetadataiTunesMetadataKeyAuthor: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataiTunesMetadataKeyAuthor');
end;

function AVMetadataiTunesMetadataKeyLyrics: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataiTunesMetadataKeyLyrics');
end;

function AVMetadataiTunesMetadataKeyAcknowledgement: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataiTunesMetadataKeyAcknowledgement');
end;

function AVMetadataiTunesMetadataKeyConductor: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataiTunesMetadataKeyConductor');
end;

function AVMetadataiTunesMetadataKeyDescription: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataiTunesMetadataKeyDescription');
end;

function AVMetadataiTunesMetadataKeyDirector: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataiTunesMetadataKeyDirector');
end;

function AVMetadataiTunesMetadataKeyEQ: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataiTunesMetadataKeyEQ');
end;

function AVMetadataiTunesMetadataKeyLinerNotes: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataiTunesMetadataKeyLinerNotes');
end;

function AVMetadataiTunesMetadataKeyRecordCompany: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataiTunesMetadataKeyRecordCompany');
end;

function AVMetadataiTunesMetadataKeyOriginalArtist: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataiTunesMetadataKeyOriginalArtist');
end;

function AVMetadataiTunesMetadataKeyPhonogramRights: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataiTunesMetadataKeyPhonogramRights');
end;

function AVMetadataiTunesMetadataKeyProducer: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataiTunesMetadataKeyProducer');
end;

function AVMetadataiTunesMetadataKeyPerformer: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataiTunesMetadataKeyPerformer');
end;

function AVMetadataiTunesMetadataKeyPublisher: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataiTunesMetadataKeyPublisher');
end;

function AVMetadataiTunesMetadataKeySoundEngineer: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataiTunesMetadataKeySoundEngineer');
end;

function AVMetadataiTunesMetadataKeySoloist: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataiTunesMetadataKeySoloist');
end;

function AVMetadataiTunesMetadataKeyCredits: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataiTunesMetadataKeyCredits');
end;

function AVMetadataiTunesMetadataKeyThanks: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataiTunesMetadataKeyThanks');
end;

function AVMetadataiTunesMetadataKeyOnlineExtras: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataiTunesMetadataKeyOnlineExtras');
end;

function AVMetadataiTunesMetadataKeyExecProducer: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataiTunesMetadataKeyExecProducer');
end;

function AVMetadataFormatID3Metadata: AVMetadataFormat;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataFormatID3Metadata');
end;

function AVMetadataKeySpaceID3: AVMetadataKeySpace;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataKeySpaceID3');
end;

function AVMetadataID3MetadataKeyAudioEncryption: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataID3MetadataKeyAudioEncryption');
end;

function AVMetadataID3MetadataKeyAttachedPicture: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataID3MetadataKeyAttachedPicture');
end;

function AVMetadataID3MetadataKeyAudioSeekPointIndex: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataID3MetadataKeyAudioSeekPointIndex');
end;

function AVMetadataID3MetadataKeyComments: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataID3MetadataKeyComments');
end;

function AVMetadataID3MetadataKeyCommercial: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataID3MetadataKeyCommercial');
end;

function AVMetadataID3MetadataKeyCommerical: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataID3MetadataKeyCommerical');
end;

function AVMetadataID3MetadataKeyEncryption: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataID3MetadataKeyEncryption');
end;

function AVMetadataID3MetadataKeyEqualization: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataID3MetadataKeyEqualization');
end;

function AVMetadataID3MetadataKeyEqualization2: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataID3MetadataKeyEqualization2');
end;

function AVMetadataID3MetadataKeyEventTimingCodes: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataID3MetadataKeyEventTimingCodes');
end;

function AVMetadataID3MetadataKeyGeneralEncapsulatedObject: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataID3MetadataKeyGeneralEncapsulatedObject');
end;

function AVMetadataID3MetadataKeyGroupIdentifier: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataID3MetadataKeyGroupIdentifier');
end;

function AVMetadataID3MetadataKeyInvolvedPeopleList_v23: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataID3MetadataKeyInvolvedPeopleList_v23');
end;

function AVMetadataID3MetadataKeyLink: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataID3MetadataKeyLink');
end;

function AVMetadataID3MetadataKeyMusicCDIdentifier: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataID3MetadataKeyMusicCDIdentifier');
end;

function AVMetadataID3MetadataKeyMPEGLocationLookupTable: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataID3MetadataKeyMPEGLocationLookupTable');
end;

function AVMetadataID3MetadataKeyOwnership: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataID3MetadataKeyOwnership');
end;

function AVMetadataID3MetadataKeyPrivate: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataID3MetadataKeyPrivate');
end;

function AVMetadataID3MetadataKeyPlayCounter: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataID3MetadataKeyPlayCounter');
end;

function AVMetadataID3MetadataKeyPopularimeter: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataID3MetadataKeyPopularimeter');
end;

function AVMetadataID3MetadataKeyPositionSynchronization: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataID3MetadataKeyPositionSynchronization');
end;

function AVMetadataID3MetadataKeyRecommendedBufferSize: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataID3MetadataKeyRecommendedBufferSize');
end;

function AVMetadataID3MetadataKeyRelativeVolumeAdjustment: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataID3MetadataKeyRelativeVolumeAdjustment');
end;

function AVMetadataID3MetadataKeyRelativeVolumeAdjustment2: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataID3MetadataKeyRelativeVolumeAdjustment2');
end;

function AVMetadataID3MetadataKeyReverb: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataID3MetadataKeyReverb');
end;

function AVMetadataID3MetadataKeySeek: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataID3MetadataKeySeek');
end;

function AVMetadataID3MetadataKeySignature: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataID3MetadataKeySignature');
end;

function AVMetadataID3MetadataKeySynchronizedLyric: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataID3MetadataKeySynchronizedLyric');
end;

function AVMetadataID3MetadataKeySynchronizedTempoCodes: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataID3MetadataKeySynchronizedTempoCodes');
end;

function AVMetadataID3MetadataKeyAlbumTitle: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataID3MetadataKeyAlbumTitle');
end;

function AVMetadataID3MetadataKeyBeatsPerMinute: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataID3MetadataKeyBeatsPerMinute');
end;

function AVMetadataID3MetadataKeyComposer: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataID3MetadataKeyComposer');
end;

function AVMetadataID3MetadataKeyContentType: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataID3MetadataKeyContentType');
end;

function AVMetadataID3MetadataKeyCopyright: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataID3MetadataKeyCopyright');
end;

function AVMetadataID3MetadataKeyDate: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataID3MetadataKeyDate');
end;

function AVMetadataID3MetadataKeyEncodingTime: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataID3MetadataKeyEncodingTime');
end;

function AVMetadataID3MetadataKeyPlaylistDelay: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataID3MetadataKeyPlaylistDelay');
end;

function AVMetadataID3MetadataKeyOriginalReleaseTime: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataID3MetadataKeyOriginalReleaseTime');
end;

function AVMetadataID3MetadataKeyRecordingTime: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataID3MetadataKeyRecordingTime');
end;

function AVMetadataID3MetadataKeyReleaseTime: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataID3MetadataKeyReleaseTime');
end;

function AVMetadataID3MetadataKeyTaggingTime: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataID3MetadataKeyTaggingTime');
end;

function AVMetadataID3MetadataKeyEncodedBy: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataID3MetadataKeyEncodedBy');
end;

function AVMetadataID3MetadataKeyLyricist: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataID3MetadataKeyLyricist');
end;

function AVMetadataID3MetadataKeyFileType: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataID3MetadataKeyFileType');
end;

function AVMetadataID3MetadataKeyTime: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataID3MetadataKeyTime');
end;

function AVMetadataID3MetadataKeyInvolvedPeopleList_v24: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataID3MetadataKeyInvolvedPeopleList_v24');
end;

function AVMetadataID3MetadataKeyContentGroupDescription: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataID3MetadataKeyContentGroupDescription');
end;

function AVMetadataID3MetadataKeyTitleDescription: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataID3MetadataKeyTitleDescription');
end;

function AVMetadataID3MetadataKeySubTitle: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataID3MetadataKeySubTitle');
end;

function AVMetadataID3MetadataKeyInitialKey: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataID3MetadataKeyInitialKey');
end;

function AVMetadataID3MetadataKeyLanguage: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataID3MetadataKeyLanguage');
end;

function AVMetadataID3MetadataKeyLength: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataID3MetadataKeyLength');
end;

function AVMetadataID3MetadataKeyMusicianCreditsList: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataID3MetadataKeyMusicianCreditsList');
end;

function AVMetadataID3MetadataKeyMediaType: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataID3MetadataKeyMediaType');
end;

function AVMetadataID3MetadataKeyMood: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataID3MetadataKeyMood');
end;

function AVMetadataID3MetadataKeyOriginalAlbumTitle: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataID3MetadataKeyOriginalAlbumTitle');
end;

function AVMetadataID3MetadataKeyOriginalFilename: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataID3MetadataKeyOriginalFilename');
end;

function AVMetadataID3MetadataKeyOriginalLyricist: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataID3MetadataKeyOriginalLyricist');
end;

function AVMetadataID3MetadataKeyOriginalArtist: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataID3MetadataKeyOriginalArtist');
end;

function AVMetadataID3MetadataKeyOriginalReleaseYear: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataID3MetadataKeyOriginalReleaseYear');
end;

function AVMetadataID3MetadataKeyFileOwner: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataID3MetadataKeyFileOwner');
end;

function AVMetadataID3MetadataKeyLeadPerformer: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataID3MetadataKeyLeadPerformer');
end;

function AVMetadataID3MetadataKeyBand: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataID3MetadataKeyBand');
end;

function AVMetadataID3MetadataKeyConductor: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataID3MetadataKeyConductor');
end;

function AVMetadataID3MetadataKeyModifiedBy: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataID3MetadataKeyModifiedBy');
end;

function AVMetadataID3MetadataKeyPartOfASet: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataID3MetadataKeyPartOfASet');
end;

function AVMetadataID3MetadataKeyProducedNotice: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataID3MetadataKeyProducedNotice');
end;

function AVMetadataID3MetadataKeyPublisher: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataID3MetadataKeyPublisher');
end;

function AVMetadataID3MetadataKeyTrackNumber: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataID3MetadataKeyTrackNumber');
end;

function AVMetadataID3MetadataKeyRecordingDates: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataID3MetadataKeyRecordingDates');
end;

function AVMetadataID3MetadataKeyInternetRadioStationName: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataID3MetadataKeyInternetRadioStationName');
end;

function AVMetadataID3MetadataKeyInternetRadioStationOwner: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataID3MetadataKeyInternetRadioStationOwner');
end;

function AVMetadataID3MetadataKeySize: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataID3MetadataKeySize');
end;

function AVMetadataID3MetadataKeyAlbumSortOrder: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataID3MetadataKeyAlbumSortOrder');
end;

function AVMetadataID3MetadataKeyPerformerSortOrder: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataID3MetadataKeyPerformerSortOrder');
end;

function AVMetadataID3MetadataKeyTitleSortOrder: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataID3MetadataKeyTitleSortOrder');
end;

function AVMetadataID3MetadataKeyInternationalStandardRecordingCode: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataID3MetadataKeyInternationalStandardRecordingCode');
end;

function AVMetadataID3MetadataKeyEncodedWith: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataID3MetadataKeyEncodedWith');
end;

function AVMetadataID3MetadataKeySetSubtitle: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataID3MetadataKeySetSubtitle');
end;

function AVMetadataID3MetadataKeyYear: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataID3MetadataKeyYear');
end;

function AVMetadataID3MetadataKeyUserText: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataID3MetadataKeyUserText');
end;

function AVMetadataID3MetadataKeyUniqueFileIdentifier: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataID3MetadataKeyUniqueFileIdentifier');
end;

function AVMetadataID3MetadataKeyTermsOfUse: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataID3MetadataKeyTermsOfUse');
end;

function AVMetadataID3MetadataKeyUnsynchronizedLyric: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataID3MetadataKeyUnsynchronizedLyric');
end;

function AVMetadataID3MetadataKeyCommercialInformation: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataID3MetadataKeyCommercialInformation');
end;

function AVMetadataID3MetadataKeyCopyrightInformation: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataID3MetadataKeyCopyrightInformation');
end;

function AVMetadataID3MetadataKeyOfficialAudioFileWebpage: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataID3MetadataKeyOfficialAudioFileWebpage');
end;

function AVMetadataID3MetadataKeyOfficialArtistWebpage: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataID3MetadataKeyOfficialArtistWebpage');
end;

function AVMetadataID3MetadataKeyOfficialAudioSourceWebpage: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataID3MetadataKeyOfficialAudioSourceWebpage');
end;

function AVMetadataID3MetadataKeyOfficialInternetRadioStationHomepage: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataID3MetadataKeyOfficialInternetRadioStationHomepage');
end;

function AVMetadataID3MetadataKeyPayment: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataID3MetadataKeyPayment');
end;

function AVMetadataID3MetadataKeyOfficialPublisherWebpage: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataID3MetadataKeyOfficialPublisherWebpage');
end;

function AVMetadataID3MetadataKeyUserURL: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataID3MetadataKeyUserURL');
end;

function AVMetadataKeySpaceIcy: AVMetadataKeySpace;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataKeySpaceIcy');
end;

function AVMetadataIcyMetadataKeyStreamTitle: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIcyMetadataKeyStreamTitle');
end;

function AVMetadataIcyMetadataKeyStreamURL: AVMetadataKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIcyMetadataKeyStreamURL');
end;

function AVMetadataFormatHLSMetadata: AVMetadataFormat;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataFormatHLSMetadata');
end;

function AVMetadataKeySpaceHLSDateRange: AVMetadataKeySpace;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataKeySpaceHLSDateRange');
end;

function AVMetadataKeySpaceAudioFile: AVMetadataKeySpace;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataKeySpaceAudioFile');
end;

function AVMetadataFormatUnknown: AVMetadataFormat;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataFormatUnknown');
end;

function AVMetadataExtraAttributeValueURIKey: AVMetadataExtraAttributeKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataExtraAttributeValueURIKey');
end;

function AVMetadataExtraAttributeBaseURIKey: AVMetadataExtraAttributeKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataExtraAttributeBaseURIKey');
end;

function AVMetadataExtraAttributeInfoKey: AVMetadataExtraAttributeKey;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataExtraAttributeInfoKey');
end;

function AVURLAssetPreferPreciseDurationAndTimingKey: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVURLAssetPreferPreciseDurationAndTimingKey');
end;

function AVURLAssetReferenceRestrictionsKey: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVURLAssetReferenceRestrictionsKey');
end;

function AVURLAssetHTTPCookiesKey: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVURLAssetHTTPCookiesKey');
end;

function AVURLAssetAllowsCellularAccessKey: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVURLAssetAllowsCellularAccessKey');
end;

function AVAssetDurationDidChangeNotification: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVAssetDurationDidChangeNotification');
end;

function AVAssetContainsFragmentsDidChangeNotification: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVAssetContainsFragmentsDidChangeNotification');
end;

function AVAssetWasDefragmentedNotification: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVAssetWasDefragmentedNotification');
end;

function AVAssetChapterMetadataGroupsDidChangeNotification: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVAssetChapterMetadataGroupsDidChangeNotification');
end;

function AVAssetMediaSelectionGroupsDidChangeNotification: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVAssetMediaSelectionGroupsDidChangeNotification');
end;

function AVAudioTimePitchAlgorithmLowQualityZeroLatency: AVAudioTimePitchAlgorithm;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVAudioTimePitchAlgorithmLowQualityZeroLatency');
end;

function AVAudioTimePitchAlgorithmTimeDomain: AVAudioTimePitchAlgorithm;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVAudioTimePitchAlgorithmTimeDomain');
end;

function AVAudioTimePitchAlgorithmSpectral: AVAudioTimePitchAlgorithm;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVAudioTimePitchAlgorithmSpectral');
end;

function AVAudioTimePitchAlgorithmVarispeed: AVAudioTimePitchAlgorithm;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVAudioTimePitchAlgorithmVarispeed');
end;

function AVAssetExportPresetLowQuality: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVAssetExportPresetLowQuality');
end;

function AVAssetExportPresetMediumQuality: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVAssetExportPresetMediumQuality');
end;

function AVAssetExportPresetHighestQuality: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVAssetExportPresetHighestQuality');
end;

function AVAssetExportPresetHEVCHighestQuality: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVAssetExportPresetHEVCHighestQuality');
end;

function AVAssetExportPreset640x480: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVAssetExportPreset640x480');
end;

function AVAssetExportPreset960x540: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVAssetExportPreset960x540');
end;

function AVAssetExportPreset1280x720: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVAssetExportPreset1280x720');
end;

function AVAssetExportPreset1920x1080: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVAssetExportPreset1920x1080');
end;

function AVAssetExportPreset3840x2160: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVAssetExportPreset3840x2160');
end;

function AVAssetExportPresetHEVC1920x1080: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVAssetExportPresetHEVC1920x1080');
end;

function AVAssetExportPresetHEVC3840x2160: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVAssetExportPresetHEVC3840x2160');
end;

function AVAssetExportPresetAppleM4A: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVAssetExportPresetAppleM4A');
end;

function AVAssetExportPresetPassthrough: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVAssetExportPresetPassthrough');
end;

function AVAssetExportPresetAppleM4VCellular: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVAssetExportPresetAppleM4VCellular');
end;

function AVAssetExportPresetAppleM4ViPod: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVAssetExportPresetAppleM4ViPod');
end;

function AVAssetExportPresetAppleM4V480pSD: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVAssetExportPresetAppleM4V480pSD');
end;

function AVAssetExportPresetAppleM4VAppleTV: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVAssetExportPresetAppleM4VAppleTV');
end;

function AVAssetExportPresetAppleM4VWiFi: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVAssetExportPresetAppleM4VWiFi');
end;

function AVAssetExportPresetAppleM4V720pHD: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVAssetExportPresetAppleM4V720pHD');
end;

function AVAssetExportPresetAppleM4V1080pHD: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVAssetExportPresetAppleM4V1080pHD');
end;

function AVAssetExportPresetAppleProRes422LPCM: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVAssetExportPresetAppleProRes422LPCM');
end;

function AVAssetImageGeneratorApertureModeCleanAperture: AVAssetImageGeneratorApertureMode;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVAssetImageGeneratorApertureModeCleanAperture');
end;

function AVAssetImageGeneratorApertureModeProductionAperture: AVAssetImageGeneratorApertureMode;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVAssetImageGeneratorApertureModeProductionAperture');
end;

function AVAssetImageGeneratorApertureModeEncodedPixels: AVAssetImageGeneratorApertureMode;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVAssetImageGeneratorApertureModeEncodedPixels');
end;

function AVAssetResourceLoadingRequestStreamingContentKeyRequestRequiresPersistentKey: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVAssetResourceLoadingRequestStreamingContentKeyRequestRequiresPersistentKey');
end;

function AVTrackAssociationTypeAudioFallback: AVTrackAssociationType;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVTrackAssociationTypeAudioFallback');
end;

function AVTrackAssociationTypeChapterList: AVTrackAssociationType;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVTrackAssociationTypeChapterList');
end;

function AVTrackAssociationTypeForcedSubtitlesOnly: AVTrackAssociationType;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVTrackAssociationTypeForcedSubtitlesOnly');
end;

function AVTrackAssociationTypeSelectionFollower: AVTrackAssociationType;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVTrackAssociationTypeSelectionFollower');
end;

function AVTrackAssociationTypeTimecode: AVTrackAssociationType;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVTrackAssociationTypeTimecode');
end;

function AVTrackAssociationTypeMetadataReferent: AVTrackAssociationType;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVTrackAssociationTypeMetadataReferent');
end;

function AVAssetTrackTimeRangeDidChangeNotification: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVAssetTrackTimeRangeDidChangeNotification');
end;

function AVAssetTrackSegmentsDidChangeNotification: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVAssetTrackSegmentsDidChangeNotification');
end;

function AVAssetTrackTrackAssociationsDidChangeNotification: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVAssetTrackTrackAssociationsDidChangeNotification');
end;

function AVAssetWriterInputMediaDataLocationInterleavedWithMainMediaData: AVAssetWriterInputMediaDataLocation;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVAssetWriterInputMediaDataLocationInterleavedWithMainMediaData');
end;

function AVAssetWriterInputMediaDataLocationBeforeMainMediaDataNotInterleaved: AVAssetWriterInputMediaDataLocation;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVAssetWriterInputMediaDataLocationBeforeMainMediaDataNotInterleaved');
end;

function AVCaptureSessionPreset1920x1080: AVCaptureSessionPreset;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVCaptureSessionPreset1920x1080');
end;

function AVCaptureSessionPreset3840x2160: AVCaptureSessionPreset;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVCaptureSessionPreset3840x2160');
end;

function AVCaptureDeviceWasConnectedNotification: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVCaptureDeviceWasConnectedNotification');
end;

function AVCaptureDeviceWasDisconnectedNotification: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVCaptureDeviceWasDisconnectedNotification');
end;

function AVCaptureDeviceSubjectAreaDidChangeNotification: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVCaptureDeviceSubjectAreaDidChangeNotification');
end;

function AVCaptureDeviceTypeBuiltInMicrophone: AVCaptureDeviceType;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVCaptureDeviceTypeBuiltInMicrophone');
end;

function AVCaptureDeviceTypeBuiltInWideAngleCamera: AVCaptureDeviceType;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVCaptureDeviceTypeBuiltInWideAngleCamera');
end;

function AVCaptureDeviceTypeBuiltInTelephotoCamera: AVCaptureDeviceType;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVCaptureDeviceTypeBuiltInTelephotoCamera');
end;

function AVCaptureDeviceTypeBuiltInDualCamera: AVCaptureDeviceType;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVCaptureDeviceTypeBuiltInDualCamera');
end;

function AVCaptureDeviceTypeBuiltInTrueDepthCamera: AVCaptureDeviceType;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVCaptureDeviceTypeBuiltInTrueDepthCamera');
end;

function AVCaptureDeviceTypeBuiltInDuoCamera: AVCaptureDeviceType;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVCaptureDeviceTypeBuiltInDuoCamera');
end;

function AVCaptureMaxAvailableTorchLevel: Single;
begin
  Result := CocoaSingleConst(libAVFoundation, 'AVCaptureMaxAvailableTorchLevel');
end;

function AVCaptureLensPositionCurrent: Single;
begin
  Result := CocoaSingleConst(libAVFoundation, 'AVCaptureLensPositionCurrent');
end;

function AVCaptureISOCurrent: Single;
begin
  Result := CocoaSingleConst(libAVFoundation, 'AVCaptureISOCurrent');
end;

function AVCaptureExposureTargetBiasCurrent: Single;
begin
  Result := CocoaSingleConst(libAVFoundation, 'AVCaptureExposureTargetBiasCurrent');
end;

function AVCaptureSessionRuntimeErrorNotification: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVCaptureSessionRuntimeErrorNotification');
end;

function AVCaptureSessionErrorKey: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVCaptureSessionErrorKey');
end;

function AVCaptureSessionDidStartRunningNotification: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVCaptureSessionDidStartRunningNotification');
end;

function AVCaptureSessionDidStopRunningNotification: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVCaptureSessionDidStopRunningNotification');
end;

function AVCaptureSessionWasInterruptedNotification: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVCaptureSessionWasInterruptedNotification');
end;

function AVCaptureSessionInterruptionReasonKey: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVCaptureSessionInterruptionReasonKey');
end;

function AVCaptureSessionInterruptionSystemPressureStateKey: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVCaptureSessionInterruptionSystemPressureStateKey');
end;

function AVCaptureSessionInterruptionEndedNotification: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVCaptureSessionInterruptionEndedNotification');
end;

function AVVideoCodecKey: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVVideoCodecKey');
end;

function AVVideoCodecTypeHEVC: AVVideoCodecType;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVVideoCodecTypeHEVC');
end;

function AVVideoCodecTypeH264: AVVideoCodecType;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVVideoCodecTypeH264');
end;

function AVVideoCodecTypeJPEG: AVVideoCodecType;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVVideoCodecTypeJPEG');
end;

function AVVideoCodecTypeAppleProRes4444: AVVideoCodecType;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVVideoCodecTypeAppleProRes4444');
end;

function AVVideoCodecTypeAppleProRes422: AVVideoCodecType;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVVideoCodecTypeAppleProRes422');
end;

function AVVideoCodecHEVC: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVVideoCodecHEVC');
end;

function AVVideoCodecH264: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVVideoCodecH264');
end;

function AVVideoCodecJPEG: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVVideoCodecJPEG');
end;

function AVVideoCodecAppleProRes4444: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVVideoCodecAppleProRes4444');
end;

function AVVideoCodecAppleProRes422: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVVideoCodecAppleProRes422');
end;

function AVVideoWidthKey: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVVideoWidthKey');
end;

function AVVideoHeightKey: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVVideoHeightKey');
end;

function AVVideoPixelAspectRatioKey: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVVideoPixelAspectRatioKey');
end;

function AVVideoPixelAspectRatioHorizontalSpacingKey: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVVideoPixelAspectRatioHorizontalSpacingKey');
end;

function AVVideoPixelAspectRatioVerticalSpacingKey: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVVideoPixelAspectRatioVerticalSpacingKey');
end;

function AVVideoCleanApertureKey: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVVideoCleanApertureKey');
end;

function AVVideoCleanApertureWidthKey: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVVideoCleanApertureWidthKey');
end;

function AVVideoCleanApertureHeightKey: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVVideoCleanApertureHeightKey');
end;

function AVVideoCleanApertureHorizontalOffsetKey: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVVideoCleanApertureHorizontalOffsetKey');
end;

function AVVideoCleanApertureVerticalOffsetKey: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVVideoCleanApertureVerticalOffsetKey');
end;

function AVVideoScalingModeKey: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVVideoScalingModeKey');
end;

function AVVideoScalingModeFit: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVVideoScalingModeFit');
end;

function AVVideoScalingModeResize: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVVideoScalingModeResize');
end;

function AVVideoScalingModeResizeAspect: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVVideoScalingModeResizeAspect');
end;

function AVVideoScalingModeResizeAspectFill: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVVideoScalingModeResizeAspectFill');
end;

function AVVideoColorPropertiesKey: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVVideoColorPropertiesKey');
end;

function AVVideoColorPrimariesKey: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVVideoColorPrimariesKey');
end;

function AVVideoColorPrimaries_ITU_R_709_2: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVVideoColorPrimaries_ITU_R_709_2');
end;

function AVVideoColorPrimaries_EBU_3213: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVVideoColorPrimaries_EBU_3213');
end;

function AVVideoColorPrimaries_SMPTE_C: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVVideoColorPrimaries_SMPTE_C');
end;

function AVVideoColorPrimaries_P3_D65: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVVideoColorPrimaries_P3_D65');
end;

function AVVideoColorPrimaries_ITU_R_2020: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVVideoColorPrimaries_ITU_R_2020');
end;

function AVVideoTransferFunctionKey: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVVideoTransferFunctionKey');
end;

function AVVideoTransferFunction_ITU_R_709_2: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVVideoTransferFunction_ITU_R_709_2');
end;

function AVVideoTransferFunction_SMPTE_240M_1995: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVVideoTransferFunction_SMPTE_240M_1995');
end;

function AVVideoTransferFunction_SMPTE_ST_2084_PQ: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVVideoTransferFunction_SMPTE_ST_2084_PQ');
end;

function AVVideoTransferFunction_ITU_R_2100_HLG: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVVideoTransferFunction_ITU_R_2100_HLG');
end;

function AVVideoYCbCrMatrixKey: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVVideoYCbCrMatrixKey');
end;

function AVVideoYCbCrMatrix_ITU_R_709_2: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVVideoYCbCrMatrix_ITU_R_709_2');
end;

function AVVideoYCbCrMatrix_ITU_R_601_4: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVVideoYCbCrMatrix_ITU_R_601_4');
end;

function AVVideoYCbCrMatrix_SMPTE_240M_1995: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVVideoYCbCrMatrix_SMPTE_240M_1995');
end;

function AVVideoYCbCrMatrix_ITU_R_2020: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVVideoYCbCrMatrix_ITU_R_2020');
end;

function AVVideoAllowWideColorKey: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVVideoAllowWideColorKey');
end;

function AVVideoCompressionPropertiesKey: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVVideoCompressionPropertiesKey');
end;

function AVVideoAverageBitRateKey: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVVideoAverageBitRateKey');
end;

function AVVideoQualityKey: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVVideoQualityKey');
end;

function AVVideoMaxKeyFrameIntervalKey: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVVideoMaxKeyFrameIntervalKey');
end;

function AVVideoMaxKeyFrameIntervalDurationKey: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVVideoMaxKeyFrameIntervalDurationKey');
end;

function AVVideoAllowFrameReorderingKey: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVVideoAllowFrameReorderingKey');
end;

function AVVideoProfileLevelKey: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVVideoProfileLevelKey');
end;

function AVVideoProfileLevelH264Baseline30: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVVideoProfileLevelH264Baseline30');
end;

function AVVideoProfileLevelH264Baseline31: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVVideoProfileLevelH264Baseline31');
end;

function AVVideoProfileLevelH264Baseline41: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVVideoProfileLevelH264Baseline41');
end;

function AVVideoProfileLevelH264BaselineAutoLevel: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVVideoProfileLevelH264BaselineAutoLevel');
end;

function AVVideoProfileLevelH264Main30: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVVideoProfileLevelH264Main30');
end;

function AVVideoProfileLevelH264Main31: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVVideoProfileLevelH264Main31');
end;

function AVVideoProfileLevelH264Main32: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVVideoProfileLevelH264Main32');
end;

function AVVideoProfileLevelH264Main41: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVVideoProfileLevelH264Main41');
end;

function AVVideoProfileLevelH264MainAutoLevel: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVVideoProfileLevelH264MainAutoLevel');
end;

function AVVideoProfileLevelH264High40: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVVideoProfileLevelH264High40');
end;

function AVVideoProfileLevelH264High41: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVVideoProfileLevelH264High41');
end;

function AVVideoProfileLevelH264HighAutoLevel: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVVideoProfileLevelH264HighAutoLevel');
end;

function AVVideoH264EntropyModeKey: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVVideoH264EntropyModeKey');
end;

function AVVideoH264EntropyModeCAVLC: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVVideoH264EntropyModeCAVLC');
end;

function AVVideoH264EntropyModeCABAC: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVVideoH264EntropyModeCABAC');
end;

function AVVideoExpectedSourceFrameRateKey: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVVideoExpectedSourceFrameRateKey');
end;

function AVVideoAverageNonDroppableFrameRateKey: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVVideoAverageNonDroppableFrameRateKey');
end;

function AVVideoDecompressionPropertiesKey: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVVideoDecompressionPropertiesKey');
end;

function AVVideoEncoderSpecificationKey: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVVideoEncoderSpecificationKey');
end;

function AVVideoApertureModeCleanAperture: AVVideoApertureMode;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVVideoApertureModeCleanAperture');
end;

function AVVideoApertureModeProductionAperture: AVVideoApertureMode;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVVideoApertureModeProductionAperture');
end;

function AVVideoApertureModeEncodedPixels: AVVideoApertureMode;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVVideoApertureModeEncodedPixels');
end;

function AVMetadataObjectTypeFace: AVMetadataObjectType;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataObjectTypeFace');
end;

function AVMetadataObjectTypeUPCECode: AVMetadataObjectType;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataObjectTypeUPCECode');
end;

function AVMetadataObjectTypeCode39Code: AVMetadataObjectType;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataObjectTypeCode39Code');
end;

function AVMetadataObjectTypeCode39Mod43Code: AVMetadataObjectType;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataObjectTypeCode39Mod43Code');
end;

function AVMetadataObjectTypeEAN13Code: AVMetadataObjectType;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataObjectTypeEAN13Code');
end;

function AVMetadataObjectTypeEAN8Code: AVMetadataObjectType;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataObjectTypeEAN8Code');
end;

function AVMetadataObjectTypeCode93Code: AVMetadataObjectType;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataObjectTypeCode93Code');
end;

function AVMetadataObjectTypeCode128Code: AVMetadataObjectType;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataObjectTypeCode128Code');
end;

function AVMetadataObjectTypePDF417Code: AVMetadataObjectType;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataObjectTypePDF417Code');
end;

function AVMetadataObjectTypeQRCode: AVMetadataObjectType;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataObjectTypeQRCode');
end;

function AVMetadataObjectTypeAztecCode: AVMetadataObjectType;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataObjectTypeAztecCode');
end;

function AVMetadataObjectTypeInterleaved2of5Code: AVMetadataObjectType;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataObjectTypeInterleaved2of5Code');
end;

function AVMetadataObjectTypeITF14Code: AVMetadataObjectType;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataObjectTypeITF14Code');
end;

function AVMetadataObjectTypeDataMatrixCode: AVMetadataObjectType;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataObjectTypeDataMatrixCode');
end;

function AVCaptureInputPortFormatDescriptionDidChangeNotification: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVCaptureInputPortFormatDescriptionDidChangeNotification');
end;

function AVCaptureSystemPressureLevelNominal: AVCaptureSystemPressureLevel;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVCaptureSystemPressureLevelNominal');
end;

function AVCaptureSystemPressureLevelFair: AVCaptureSystemPressureLevel;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVCaptureSystemPressureLevelFair');
end;

function AVCaptureSystemPressureLevelSerious: AVCaptureSystemPressureLevel;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVCaptureSystemPressureLevelSerious');
end;

function AVCaptureSystemPressureLevelCritical: AVCaptureSystemPressureLevel;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVCaptureSystemPressureLevelCritical');
end;

function AVCaptureSystemPressureLevelShutdown: AVCaptureSystemPressureLevel;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVCaptureSystemPressureLevelShutdown');
end;

function AVFoundationErrorDomain: NSErrorDomain;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVFoundationErrorDomain');
end;

function AVErrorDeviceKey: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVErrorDeviceKey');
end;

function AVErrorTimeKey: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVErrorTimeKey');
end;

function AVErrorFileSizeKey: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVErrorFileSizeKey');
end;

function AVErrorPIDKey: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVErrorPIDKey');
end;

function AVErrorRecordingSuccessfullyFinishedKey: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVErrorRecordingSuccessfullyFinishedKey');
end;

function AVErrorMediaTypeKey: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVErrorMediaTypeKey');
end;

function AVErrorMediaSubTypeKey: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVErrorMediaSubTypeKey');
end;

function AVErrorPresentationTimeStampKey: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVErrorPresentationTimeStampKey');
end;

function AVErrorPersistentTrackIDKey: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVErrorPersistentTrackIDKey');
end;

function AVErrorFileTypeKey: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVErrorFileTypeKey');
end;

function AVErrorDiscontinuityFlagsKey: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVErrorDiscontinuityFlagsKey');
end;

function AVMetadataCommonIdentifierTitle: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataCommonIdentifierTitle');
end;

function AVMetadataCommonIdentifierCreator: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataCommonIdentifierCreator');
end;

function AVMetadataCommonIdentifierSubject: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataCommonIdentifierSubject');
end;

function AVMetadataCommonIdentifierDescription: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataCommonIdentifierDescription');
end;

function AVMetadataCommonIdentifierPublisher: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataCommonIdentifierPublisher');
end;

function AVMetadataCommonIdentifierContributor: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataCommonIdentifierContributor');
end;

function AVMetadataCommonIdentifierCreationDate: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataCommonIdentifierCreationDate');
end;

function AVMetadataCommonIdentifierLastModifiedDate: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataCommonIdentifierLastModifiedDate');
end;

function AVMetadataCommonIdentifierType: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataCommonIdentifierType');
end;

function AVMetadataCommonIdentifierFormat: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataCommonIdentifierFormat');
end;

function AVMetadataCommonIdentifierAssetIdentifier: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataCommonIdentifierAssetIdentifier');
end;

function AVMetadataCommonIdentifierSource: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataCommonIdentifierSource');
end;

function AVMetadataCommonIdentifierLanguage: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataCommonIdentifierLanguage');
end;

function AVMetadataCommonIdentifierRelation: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataCommonIdentifierRelation');
end;

function AVMetadataCommonIdentifierLocation: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataCommonIdentifierLocation');
end;

function AVMetadataCommonIdentifierCopyrights: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataCommonIdentifierCopyrights');
end;

function AVMetadataCommonIdentifierAlbumName: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataCommonIdentifierAlbumName');
end;

function AVMetadataCommonIdentifierAuthor: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataCommonIdentifierAuthor');
end;

function AVMetadataCommonIdentifierArtist: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataCommonIdentifierArtist');
end;

function AVMetadataCommonIdentifierArtwork: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataCommonIdentifierArtwork');
end;

function AVMetadataCommonIdentifierMake: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataCommonIdentifierMake');
end;

function AVMetadataCommonIdentifierModel: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataCommonIdentifierModel');
end;

function AVMetadataCommonIdentifierSoftware: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataCommonIdentifierSoftware');
end;

function AVMetadataIdentifierQuickTimeUserDataAlbum: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifierQuickTimeUserDataAlbum');
end;

function AVMetadataIdentifierQuickTimeUserDataArranger: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifierQuickTimeUserDataArranger');
end;

function AVMetadataIdentifierQuickTimeUserDataArtist: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifierQuickTimeUserDataArtist');
end;

function AVMetadataIdentifierQuickTimeUserDataAuthor: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifierQuickTimeUserDataAuthor');
end;

function AVMetadataIdentifierQuickTimeUserDataChapter: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifierQuickTimeUserDataChapter');
end;

function AVMetadataIdentifierQuickTimeUserDataComment: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifierQuickTimeUserDataComment');
end;

function AVMetadataIdentifierQuickTimeUserDataComposer: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifierQuickTimeUserDataComposer');
end;

function AVMetadataIdentifierQuickTimeUserDataCopyright: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifierQuickTimeUserDataCopyright');
end;

function AVMetadataIdentifierQuickTimeUserDataCreationDate: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifierQuickTimeUserDataCreationDate');
end;

function AVMetadataIdentifierQuickTimeUserDataDescription: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifierQuickTimeUserDataDescription');
end;

function AVMetadataIdentifierQuickTimeUserDataDirector: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifierQuickTimeUserDataDirector');
end;

function AVMetadataIdentifierQuickTimeUserDataDisclaimer: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifierQuickTimeUserDataDisclaimer');
end;

function AVMetadataIdentifierQuickTimeUserDataEncodedBy: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifierQuickTimeUserDataEncodedBy');
end;

function AVMetadataIdentifierQuickTimeUserDataFullName: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifierQuickTimeUserDataFullName');
end;

function AVMetadataIdentifierQuickTimeUserDataGenre: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifierQuickTimeUserDataGenre');
end;

function AVMetadataIdentifierQuickTimeUserDataHostComputer: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifierQuickTimeUserDataHostComputer');
end;

function AVMetadataIdentifierQuickTimeUserDataInformation: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifierQuickTimeUserDataInformation');
end;

function AVMetadataIdentifierQuickTimeUserDataKeywords: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifierQuickTimeUserDataKeywords');
end;

function AVMetadataIdentifierQuickTimeUserDataMake: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifierQuickTimeUserDataMake');
end;

function AVMetadataIdentifierQuickTimeUserDataModel: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifierQuickTimeUserDataModel');
end;

function AVMetadataIdentifierQuickTimeUserDataOriginalArtist: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifierQuickTimeUserDataOriginalArtist');
end;

function AVMetadataIdentifierQuickTimeUserDataOriginalFormat: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifierQuickTimeUserDataOriginalFormat');
end;

function AVMetadataIdentifierQuickTimeUserDataOriginalSource: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifierQuickTimeUserDataOriginalSource');
end;

function AVMetadataIdentifierQuickTimeUserDataPerformers: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifierQuickTimeUserDataPerformers');
end;

function AVMetadataIdentifierQuickTimeUserDataProducer: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifierQuickTimeUserDataProducer');
end;

function AVMetadataIdentifierQuickTimeUserDataPublisher: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifierQuickTimeUserDataPublisher');
end;

function AVMetadataIdentifierQuickTimeUserDataProduct: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifierQuickTimeUserDataProduct');
end;

function AVMetadataIdentifierQuickTimeUserDataSoftware: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifierQuickTimeUserDataSoftware');
end;

function AVMetadataIdentifierQuickTimeUserDataSpecialPlaybackRequirements: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifierQuickTimeUserDataSpecialPlaybackRequirements');
end;

function AVMetadataIdentifierQuickTimeUserDataTrack: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifierQuickTimeUserDataTrack');
end;

function AVMetadataIdentifierQuickTimeUserDataWarning: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifierQuickTimeUserDataWarning');
end;

function AVMetadataIdentifierQuickTimeUserDataWriter: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifierQuickTimeUserDataWriter');
end;

function AVMetadataIdentifierQuickTimeUserDataURLLink: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifierQuickTimeUserDataURLLink');
end;

function AVMetadataIdentifierQuickTimeUserDataLocationISO6709: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifierQuickTimeUserDataLocationISO6709');
end;

function AVMetadataIdentifierQuickTimeUserDataTrackName: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifierQuickTimeUserDataTrackName');
end;

function AVMetadataIdentifierQuickTimeUserDataCredits: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifierQuickTimeUserDataCredits');
end;

function AVMetadataIdentifierQuickTimeUserDataPhonogramRights: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifierQuickTimeUserDataPhonogramRights');
end;

function AVMetadataIdentifierQuickTimeUserDataTaggedCharacteristic: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifierQuickTimeUserDataTaggedCharacteristic');
end;

function AVMetadataIdentifierISOUserDataCopyright: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifierISOUserDataCopyright');
end;

function AVMetadataIdentifierISOUserDataDate: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifierISOUserDataDate');
end;

function AVMetadataIdentifierISOUserDataTaggedCharacteristic: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifierISOUserDataTaggedCharacteristic');
end;

function AVMetadataIdentifier3GPUserDataCopyright: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifier3GPUserDataCopyright');
end;

function AVMetadataIdentifier3GPUserDataAuthor: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifier3GPUserDataAuthor');
end;

function AVMetadataIdentifier3GPUserDataPerformer: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifier3GPUserDataPerformer');
end;

function AVMetadataIdentifier3GPUserDataGenre: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifier3GPUserDataGenre');
end;

function AVMetadataIdentifier3GPUserDataRecordingYear: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifier3GPUserDataRecordingYear');
end;

function AVMetadataIdentifier3GPUserDataLocation: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifier3GPUserDataLocation');
end;

function AVMetadataIdentifier3GPUserDataTitle: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifier3GPUserDataTitle');
end;

function AVMetadataIdentifier3GPUserDataDescription: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifier3GPUserDataDescription');
end;

function AVMetadataIdentifier3GPUserDataCollection: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifier3GPUserDataCollection');
end;

function AVMetadataIdentifier3GPUserDataUserRating: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifier3GPUserDataUserRating');
end;

function AVMetadataIdentifier3GPUserDataThumbnail: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifier3GPUserDataThumbnail');
end;

function AVMetadataIdentifier3GPUserDataAlbumAndTrack: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifier3GPUserDataAlbumAndTrack');
end;

function AVMetadataIdentifier3GPUserDataKeywordList: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifier3GPUserDataKeywordList');
end;

function AVMetadataIdentifier3GPUserDataMediaClassification: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifier3GPUserDataMediaClassification');
end;

function AVMetadataIdentifier3GPUserDataMediaRating: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifier3GPUserDataMediaRating');
end;

function AVMetadataIdentifierQuickTimeMetadataAuthor: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifierQuickTimeMetadataAuthor');
end;

function AVMetadataIdentifierQuickTimeMetadataComment: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifierQuickTimeMetadataComment');
end;

function AVMetadataIdentifierQuickTimeMetadataCopyright: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifierQuickTimeMetadataCopyright');
end;

function AVMetadataIdentifierQuickTimeMetadataCreationDate: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifierQuickTimeMetadataCreationDate');
end;

function AVMetadataIdentifierQuickTimeMetadataDirector: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifierQuickTimeMetadataDirector');
end;

function AVMetadataIdentifierQuickTimeMetadataDisplayName: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifierQuickTimeMetadataDisplayName');
end;

function AVMetadataIdentifierQuickTimeMetadataInformation: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifierQuickTimeMetadataInformation');
end;

function AVMetadataIdentifierQuickTimeMetadataKeywords: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifierQuickTimeMetadataKeywords');
end;

function AVMetadataIdentifierQuickTimeMetadataProducer: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifierQuickTimeMetadataProducer');
end;

function AVMetadataIdentifierQuickTimeMetadataPublisher: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifierQuickTimeMetadataPublisher');
end;

function AVMetadataIdentifierQuickTimeMetadataAlbum: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifierQuickTimeMetadataAlbum');
end;

function AVMetadataIdentifierQuickTimeMetadataArtist: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifierQuickTimeMetadataArtist');
end;

function AVMetadataIdentifierQuickTimeMetadataArtwork: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifierQuickTimeMetadataArtwork');
end;

function AVMetadataIdentifierQuickTimeMetadataDescription: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifierQuickTimeMetadataDescription');
end;

function AVMetadataIdentifierQuickTimeMetadataSoftware: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifierQuickTimeMetadataSoftware');
end;

function AVMetadataIdentifierQuickTimeMetadataYear: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifierQuickTimeMetadataYear');
end;

function AVMetadataIdentifierQuickTimeMetadataGenre: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifierQuickTimeMetadataGenre');
end;

function AVMetadataIdentifierQuickTimeMetadataiXML: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifierQuickTimeMetadataiXML');
end;

function AVMetadataIdentifierQuickTimeMetadataLocationISO6709: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifierQuickTimeMetadataLocationISO6709');
end;

function AVMetadataIdentifierQuickTimeMetadataMake: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifierQuickTimeMetadataMake');
end;

function AVMetadataIdentifierQuickTimeMetadataModel: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifierQuickTimeMetadataModel');
end;

function AVMetadataIdentifierQuickTimeMetadataArranger: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifierQuickTimeMetadataArranger');
end;

function AVMetadataIdentifierQuickTimeMetadataEncodedBy: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifierQuickTimeMetadataEncodedBy');
end;

function AVMetadataIdentifierQuickTimeMetadataOriginalArtist: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifierQuickTimeMetadataOriginalArtist');
end;

function AVMetadataIdentifierQuickTimeMetadataPerformer: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifierQuickTimeMetadataPerformer');
end;

function AVMetadataIdentifierQuickTimeMetadataComposer: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifierQuickTimeMetadataComposer');
end;

function AVMetadataIdentifierQuickTimeMetadataCredits: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifierQuickTimeMetadataCredits');
end;

function AVMetadataIdentifierQuickTimeMetadataPhonogramRights: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifierQuickTimeMetadataPhonogramRights');
end;

function AVMetadataIdentifierQuickTimeMetadataCameraIdentifier: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifierQuickTimeMetadataCameraIdentifier');
end;

function AVMetadataIdentifierQuickTimeMetadataCameraFrameReadoutTime: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifierQuickTimeMetadataCameraFrameReadoutTime');
end;

function AVMetadataIdentifierQuickTimeMetadataTitle: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifierQuickTimeMetadataTitle');
end;

function AVMetadataIdentifierQuickTimeMetadataCollectionUser: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifierQuickTimeMetadataCollectionUser');
end;

function AVMetadataIdentifierQuickTimeMetadataRatingUser: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifierQuickTimeMetadataRatingUser');
end;

function AVMetadataIdentifierQuickTimeMetadataLocationName: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifierQuickTimeMetadataLocationName');
end;

function AVMetadataIdentifierQuickTimeMetadataLocationBody: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifierQuickTimeMetadataLocationBody');
end;

function AVMetadataIdentifierQuickTimeMetadataLocationNote: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifierQuickTimeMetadataLocationNote');
end;

function AVMetadataIdentifierQuickTimeMetadataLocationRole: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifierQuickTimeMetadataLocationRole');
end;

function AVMetadataIdentifierQuickTimeMetadataLocationDate: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifierQuickTimeMetadataLocationDate');
end;

function AVMetadataIdentifierQuickTimeMetadataDirectionFacing: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifierQuickTimeMetadataDirectionFacing');
end;

function AVMetadataIdentifierQuickTimeMetadataDirectionMotion: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifierQuickTimeMetadataDirectionMotion');
end;

function AVMetadataIdentifierQuickTimeMetadataPreferredAffineTransform: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifierQuickTimeMetadataPreferredAffineTransform');
end;

function AVMetadataIdentifierQuickTimeMetadataDetectedFace: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifierQuickTimeMetadataDetectedFace');
end;

function AVMetadataIdentifierQuickTimeMetadataVideoOrientation: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifierQuickTimeMetadataVideoOrientation');
end;

function AVMetadataIdentifierQuickTimeMetadataContentIdentifier: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifierQuickTimeMetadataContentIdentifier');
end;

function AVMetadataIdentifieriTunesMetadataAlbum: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifieriTunesMetadataAlbum');
end;

function AVMetadataIdentifieriTunesMetadataArtist: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifieriTunesMetadataArtist');
end;

function AVMetadataIdentifieriTunesMetadataUserComment: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifieriTunesMetadataUserComment');
end;

function AVMetadataIdentifieriTunesMetadataCoverArt: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifieriTunesMetadataCoverArt');
end;

function AVMetadataIdentifieriTunesMetadataCopyright: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifieriTunesMetadataCopyright');
end;

function AVMetadataIdentifieriTunesMetadataReleaseDate: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifieriTunesMetadataReleaseDate');
end;

function AVMetadataIdentifieriTunesMetadataEncodedBy: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifieriTunesMetadataEncodedBy');
end;

function AVMetadataIdentifieriTunesMetadataPredefinedGenre: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifieriTunesMetadataPredefinedGenre');
end;

function AVMetadataIdentifieriTunesMetadataUserGenre: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifieriTunesMetadataUserGenre');
end;

function AVMetadataIdentifieriTunesMetadataSongName: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifieriTunesMetadataSongName');
end;

function AVMetadataIdentifieriTunesMetadataTrackSubTitle: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifieriTunesMetadataTrackSubTitle');
end;

function AVMetadataIdentifieriTunesMetadataEncodingTool: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifieriTunesMetadataEncodingTool');
end;

function AVMetadataIdentifieriTunesMetadataComposer: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifieriTunesMetadataComposer');
end;

function AVMetadataIdentifieriTunesMetadataAlbumArtist: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifieriTunesMetadataAlbumArtist');
end;

function AVMetadataIdentifieriTunesMetadataAccountKind: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifieriTunesMetadataAccountKind');
end;

function AVMetadataIdentifieriTunesMetadataAppleID: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifieriTunesMetadataAppleID');
end;

function AVMetadataIdentifieriTunesMetadataArtistID: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifieriTunesMetadataArtistID');
end;

function AVMetadataIdentifieriTunesMetadataSongID: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifieriTunesMetadataSongID');
end;

function AVMetadataIdentifieriTunesMetadataDiscCompilation: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifieriTunesMetadataDiscCompilation');
end;

function AVMetadataIdentifieriTunesMetadataDiscNumber: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifieriTunesMetadataDiscNumber');
end;

function AVMetadataIdentifieriTunesMetadataGenreID: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifieriTunesMetadataGenreID');
end;

function AVMetadataIdentifieriTunesMetadataGrouping: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifieriTunesMetadataGrouping');
end;

function AVMetadataIdentifieriTunesMetadataPlaylistID: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifieriTunesMetadataPlaylistID');
end;

function AVMetadataIdentifieriTunesMetadataContentRating: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifieriTunesMetadataContentRating');
end;

function AVMetadataIdentifieriTunesMetadataBeatsPerMin: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifieriTunesMetadataBeatsPerMin');
end;

function AVMetadataIdentifieriTunesMetadataTrackNumber: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifieriTunesMetadataTrackNumber');
end;

function AVMetadataIdentifieriTunesMetadataArtDirector: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifieriTunesMetadataArtDirector');
end;

function AVMetadataIdentifieriTunesMetadataArranger: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifieriTunesMetadataArranger');
end;

function AVMetadataIdentifieriTunesMetadataAuthor: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifieriTunesMetadataAuthor');
end;

function AVMetadataIdentifieriTunesMetadataLyrics: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifieriTunesMetadataLyrics');
end;

function AVMetadataIdentifieriTunesMetadataAcknowledgement: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifieriTunesMetadataAcknowledgement');
end;

function AVMetadataIdentifieriTunesMetadataConductor: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifieriTunesMetadataConductor');
end;

function AVMetadataIdentifieriTunesMetadataDescription: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifieriTunesMetadataDescription');
end;

function AVMetadataIdentifieriTunesMetadataDirector: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifieriTunesMetadataDirector');
end;

function AVMetadataIdentifieriTunesMetadataEQ: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifieriTunesMetadataEQ');
end;

function AVMetadataIdentifieriTunesMetadataLinerNotes: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifieriTunesMetadataLinerNotes');
end;

function AVMetadataIdentifieriTunesMetadataRecordCompany: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifieriTunesMetadataRecordCompany');
end;

function AVMetadataIdentifieriTunesMetadataOriginalArtist: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifieriTunesMetadataOriginalArtist');
end;

function AVMetadataIdentifieriTunesMetadataPhonogramRights: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifieriTunesMetadataPhonogramRights');
end;

function AVMetadataIdentifieriTunesMetadataProducer: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifieriTunesMetadataProducer');
end;

function AVMetadataIdentifieriTunesMetadataPerformer: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifieriTunesMetadataPerformer');
end;

function AVMetadataIdentifieriTunesMetadataPublisher: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifieriTunesMetadataPublisher');
end;

function AVMetadataIdentifieriTunesMetadataSoundEngineer: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifieriTunesMetadataSoundEngineer');
end;

function AVMetadataIdentifieriTunesMetadataSoloist: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifieriTunesMetadataSoloist');
end;

function AVMetadataIdentifieriTunesMetadataCredits: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifieriTunesMetadataCredits');
end;

function AVMetadataIdentifieriTunesMetadataThanks: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifieriTunesMetadataThanks');
end;

function AVMetadataIdentifieriTunesMetadataOnlineExtras: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifieriTunesMetadataOnlineExtras');
end;

function AVMetadataIdentifieriTunesMetadataExecProducer: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifieriTunesMetadataExecProducer');
end;

function AVMetadataIdentifierID3MetadataAudioEncryption: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifierID3MetadataAudioEncryption');
end;

function AVMetadataIdentifierID3MetadataAttachedPicture: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifierID3MetadataAttachedPicture');
end;

function AVMetadataIdentifierID3MetadataAudioSeekPointIndex: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifierID3MetadataAudioSeekPointIndex');
end;

function AVMetadataIdentifierID3MetadataComments: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifierID3MetadataComments');
end;

function AVMetadataIdentifierID3MetadataCommercial: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifierID3MetadataCommercial');
end;

function AVMetadataIdentifierID3MetadataCommerical: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifierID3MetadataCommerical');
end;

function AVMetadataIdentifierID3MetadataEncryption: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifierID3MetadataEncryption');
end;

function AVMetadataIdentifierID3MetadataEqualization: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifierID3MetadataEqualization');
end;

function AVMetadataIdentifierID3MetadataEqualization2: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifierID3MetadataEqualization2');
end;

function AVMetadataIdentifierID3MetadataEventTimingCodes: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifierID3MetadataEventTimingCodes');
end;

function AVMetadataIdentifierID3MetadataGeneralEncapsulatedObject: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifierID3MetadataGeneralEncapsulatedObject');
end;

function AVMetadataIdentifierID3MetadataGroupIdentifier: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifierID3MetadataGroupIdentifier');
end;

function AVMetadataIdentifierID3MetadataInvolvedPeopleList_v23: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifierID3MetadataInvolvedPeopleList_v23');
end;

function AVMetadataIdentifierID3MetadataLink: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifierID3MetadataLink');
end;

function AVMetadataIdentifierID3MetadataMusicCDIdentifier: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifierID3MetadataMusicCDIdentifier');
end;

function AVMetadataIdentifierID3MetadataMPEGLocationLookupTable: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifierID3MetadataMPEGLocationLookupTable');
end;

function AVMetadataIdentifierID3MetadataOwnership: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifierID3MetadataOwnership');
end;

function AVMetadataIdentifierID3MetadataPrivate: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifierID3MetadataPrivate');
end;

function AVMetadataIdentifierID3MetadataPlayCounter: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifierID3MetadataPlayCounter');
end;

function AVMetadataIdentifierID3MetadataPopularimeter: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifierID3MetadataPopularimeter');
end;

function AVMetadataIdentifierID3MetadataPositionSynchronization: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifierID3MetadataPositionSynchronization');
end;

function AVMetadataIdentifierID3MetadataRecommendedBufferSize: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifierID3MetadataRecommendedBufferSize');
end;

function AVMetadataIdentifierID3MetadataRelativeVolumeAdjustment: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifierID3MetadataRelativeVolumeAdjustment');
end;

function AVMetadataIdentifierID3MetadataRelativeVolumeAdjustment2: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifierID3MetadataRelativeVolumeAdjustment2');
end;

function AVMetadataIdentifierID3MetadataReverb: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifierID3MetadataReverb');
end;

function AVMetadataIdentifierID3MetadataSeek: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifierID3MetadataSeek');
end;

function AVMetadataIdentifierID3MetadataSignature: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifierID3MetadataSignature');
end;

function AVMetadataIdentifierID3MetadataSynchronizedLyric: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifierID3MetadataSynchronizedLyric');
end;

function AVMetadataIdentifierID3MetadataSynchronizedTempoCodes: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifierID3MetadataSynchronizedTempoCodes');
end;

function AVMetadataIdentifierID3MetadataAlbumTitle: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifierID3MetadataAlbumTitle');
end;

function AVMetadataIdentifierID3MetadataBeatsPerMinute: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifierID3MetadataBeatsPerMinute');
end;

function AVMetadataIdentifierID3MetadataComposer: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifierID3MetadataComposer');
end;

function AVMetadataIdentifierID3MetadataContentType: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifierID3MetadataContentType');
end;

function AVMetadataIdentifierID3MetadataCopyright: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifierID3MetadataCopyright');
end;

function AVMetadataIdentifierID3MetadataDate: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifierID3MetadataDate');
end;

function AVMetadataIdentifierID3MetadataEncodingTime: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifierID3MetadataEncodingTime');
end;

function AVMetadataIdentifierID3MetadataPlaylistDelay: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifierID3MetadataPlaylistDelay');
end;

function AVMetadataIdentifierID3MetadataOriginalReleaseTime: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifierID3MetadataOriginalReleaseTime');
end;

function AVMetadataIdentifierID3MetadataRecordingTime: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifierID3MetadataRecordingTime');
end;

function AVMetadataIdentifierID3MetadataReleaseTime: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifierID3MetadataReleaseTime');
end;

function AVMetadataIdentifierID3MetadataTaggingTime: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifierID3MetadataTaggingTime');
end;

function AVMetadataIdentifierID3MetadataEncodedBy: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifierID3MetadataEncodedBy');
end;

function AVMetadataIdentifierID3MetadataLyricist: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifierID3MetadataLyricist');
end;

function AVMetadataIdentifierID3MetadataFileType: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifierID3MetadataFileType');
end;

function AVMetadataIdentifierID3MetadataTime: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifierID3MetadataTime');
end;

function AVMetadataIdentifierID3MetadataInvolvedPeopleList_v24: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifierID3MetadataInvolvedPeopleList_v24');
end;

function AVMetadataIdentifierID3MetadataContentGroupDescription: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifierID3MetadataContentGroupDescription');
end;

function AVMetadataIdentifierID3MetadataTitleDescription: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifierID3MetadataTitleDescription');
end;

function AVMetadataIdentifierID3MetadataSubTitle: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifierID3MetadataSubTitle');
end;

function AVMetadataIdentifierID3MetadataInitialKey: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifierID3MetadataInitialKey');
end;

function AVMetadataIdentifierID3MetadataLanguage: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifierID3MetadataLanguage');
end;

function AVMetadataIdentifierID3MetadataLength: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifierID3MetadataLength');
end;

function AVMetadataIdentifierID3MetadataMusicianCreditsList: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifierID3MetadataMusicianCreditsList');
end;

function AVMetadataIdentifierID3MetadataMediaType: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifierID3MetadataMediaType');
end;

function AVMetadataIdentifierID3MetadataMood: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifierID3MetadataMood');
end;

function AVMetadataIdentifierID3MetadataOriginalAlbumTitle: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifierID3MetadataOriginalAlbumTitle');
end;

function AVMetadataIdentifierID3MetadataOriginalFilename: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifierID3MetadataOriginalFilename');
end;

function AVMetadataIdentifierID3MetadataOriginalLyricist: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifierID3MetadataOriginalLyricist');
end;

function AVMetadataIdentifierID3MetadataOriginalArtist: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifierID3MetadataOriginalArtist');
end;

function AVMetadataIdentifierID3MetadataOriginalReleaseYear: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifierID3MetadataOriginalReleaseYear');
end;

function AVMetadataIdentifierID3MetadataFileOwner: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifierID3MetadataFileOwner');
end;

function AVMetadataIdentifierID3MetadataLeadPerformer: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifierID3MetadataLeadPerformer');
end;

function AVMetadataIdentifierID3MetadataBand: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifierID3MetadataBand');
end;

function AVMetadataIdentifierID3MetadataConductor: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifierID3MetadataConductor');
end;

function AVMetadataIdentifierID3MetadataModifiedBy: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifierID3MetadataModifiedBy');
end;

function AVMetadataIdentifierID3MetadataPartOfASet: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifierID3MetadataPartOfASet');
end;

function AVMetadataIdentifierID3MetadataProducedNotice: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifierID3MetadataProducedNotice');
end;

function AVMetadataIdentifierID3MetadataPublisher: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifierID3MetadataPublisher');
end;

function AVMetadataIdentifierID3MetadataTrackNumber: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifierID3MetadataTrackNumber');
end;

function AVMetadataIdentifierID3MetadataRecordingDates: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifierID3MetadataRecordingDates');
end;

function AVMetadataIdentifierID3MetadataInternetRadioStationName: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifierID3MetadataInternetRadioStationName');
end;

function AVMetadataIdentifierID3MetadataInternetRadioStationOwner: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifierID3MetadataInternetRadioStationOwner');
end;

function AVMetadataIdentifierID3MetadataSize: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifierID3MetadataSize');
end;

function AVMetadataIdentifierID3MetadataAlbumSortOrder: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifierID3MetadataAlbumSortOrder');
end;

function AVMetadataIdentifierID3MetadataPerformerSortOrder: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifierID3MetadataPerformerSortOrder');
end;

function AVMetadataIdentifierID3MetadataTitleSortOrder: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifierID3MetadataTitleSortOrder');
end;

function AVMetadataIdentifierID3MetadataInternationalStandardRecordingCode: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifierID3MetadataInternationalStandardRecordingCode');
end;

function AVMetadataIdentifierID3MetadataEncodedWith: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifierID3MetadataEncodedWith');
end;

function AVMetadataIdentifierID3MetadataSetSubtitle: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifierID3MetadataSetSubtitle');
end;

function AVMetadataIdentifierID3MetadataYear: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifierID3MetadataYear');
end;

function AVMetadataIdentifierID3MetadataUserText: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifierID3MetadataUserText');
end;

function AVMetadataIdentifierID3MetadataUniqueFileIdentifier: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifierID3MetadataUniqueFileIdentifier');
end;

function AVMetadataIdentifierID3MetadataTermsOfUse: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifierID3MetadataTermsOfUse');
end;

function AVMetadataIdentifierID3MetadataUnsynchronizedLyric: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifierID3MetadataUnsynchronizedLyric');
end;

function AVMetadataIdentifierID3MetadataCommercialInformation: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifierID3MetadataCommercialInformation');
end;

function AVMetadataIdentifierID3MetadataCopyrightInformation: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifierID3MetadataCopyrightInformation');
end;

function AVMetadataIdentifierID3MetadataOfficialAudioFileWebpage: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifierID3MetadataOfficialAudioFileWebpage');
end;

function AVMetadataIdentifierID3MetadataOfficialArtistWebpage: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifierID3MetadataOfficialArtistWebpage');
end;

function AVMetadataIdentifierID3MetadataOfficialAudioSourceWebpage: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifierID3MetadataOfficialAudioSourceWebpage');
end;

function AVMetadataIdentifierID3MetadataOfficialInternetRadioStationHomepage: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifierID3MetadataOfficialInternetRadioStationHomepage');
end;

function AVMetadataIdentifierID3MetadataPayment: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifierID3MetadataPayment');
end;

function AVMetadataIdentifierID3MetadataOfficialPublisherWebpage: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifierID3MetadataOfficialPublisherWebpage');
end;

function AVMetadataIdentifierID3MetadataUserURL: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifierID3MetadataUserURL');
end;

function AVMetadataIdentifierIcyMetadataStreamTitle: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifierIcyMetadataStreamTitle');
end;

function AVMetadataIdentifierIcyMetadataStreamURL: AVMetadataIdentifier;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMetadataIdentifierIcyMetadataStreamURL');
end;

function AVFragmentedMovieTrackTimeRangeDidChangeNotification: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVFragmentedMovieTrackTimeRangeDidChangeNotification');
end;

function AVFragmentedMovieTrackSegmentsDidChangeNotification: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVFragmentedMovieTrackSegmentsDidChangeNotification');
end;

function AVFragmentedMovieTrackTotalSampleDataLengthDidChangeNotification: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVFragmentedMovieTrackTotalSampleDataLengthDidChangeNotification');
end;

function AVMovieReferenceRestrictionsKey: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVMovieReferenceRestrictionsKey');
end;

function AVFragmentedMovieContainsMovieFragmentsDidChangeNotification: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVFragmentedMovieContainsMovieFragmentsDidChangeNotification');
end;

function AVFragmentedMovieDurationDidChangeNotification: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVFragmentedMovieDurationDidChangeNotification');
end;

function AVFragmentedMovieWasDefragmentedNotification: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVFragmentedMovieWasDefragmentedNotification');
end;

function AVOutputSettingsPreset640x480: AVOutputSettingsPreset;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVOutputSettingsPreset640x480');
end;

function AVOutputSettingsPreset960x540: AVOutputSettingsPreset;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVOutputSettingsPreset960x540');
end;

function AVOutputSettingsPreset1280x720: AVOutputSettingsPreset;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVOutputSettingsPreset1280x720');
end;

function AVOutputSettingsPreset1920x1080: AVOutputSettingsPreset;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVOutputSettingsPreset1920x1080');
end;

function AVOutputSettingsPreset3840x2160: AVOutputSettingsPreset;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVOutputSettingsPreset3840x2160');
end;

function AVOutputSettingsPresetHEVC1920x1080: AVOutputSettingsPreset;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVOutputSettingsPresetHEVC1920x1080');
end;

function AVOutputSettingsPresetHEVC3840x2160: AVOutputSettingsPreset;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVOutputSettingsPresetHEVC3840x2160');
end;

function AVPlayerWaitingToMinimizeStallsReason: AVPlayerWaitingReason;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVPlayerWaitingToMinimizeStallsReason');
end;

function AVPlayerWaitingWhileEvaluatingBufferingRateReason: AVPlayerWaitingReason;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVPlayerWaitingWhileEvaluatingBufferingRateReason');
end;

function AVPlayerWaitingWithNoItemToPlayReason: AVPlayerWaitingReason;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVPlayerWaitingWithNoItemToPlayReason');
end;

function AVPlayerAvailableHDRModesDidChangeNotification: NSNotificationName;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVPlayerAvailableHDRModesDidChangeNotification');
end;

function AVPlayerItemTimeJumpedNotification: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVPlayerItemTimeJumpedNotification');
end;

function AVPlayerItemDidPlayToEndTimeNotification: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVPlayerItemDidPlayToEndTimeNotification');
end;

function AVPlayerItemFailedToPlayToEndTimeNotification: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVPlayerItemFailedToPlayToEndTimeNotification');
end;

function AVPlayerItemPlaybackStalledNotification: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVPlayerItemPlaybackStalledNotification');
end;

function AVPlayerItemNewAccessLogEntryNotification: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVPlayerItemNewAccessLogEntryNotification');
end;

function AVPlayerItemNewErrorLogEntryNotification: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVPlayerItemNewErrorLogEntryNotification');
end;

function AVPlayerItemFailedToPlayToEndTimeErrorKey: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVPlayerItemFailedToPlayToEndTimeErrorKey');
end;

function AVPlayerItemLegibleOutputTextStylingResolutionDefault: AVPlayerItemLegibleOutputTextStylingResolution;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVPlayerItemLegibleOutputTextStylingResolutionDefault');
end;

function AVPlayerItemLegibleOutputTextStylingResolutionSourceAndRulesOnly: AVPlayerItemLegibleOutputTextStylingResolution;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVPlayerItemLegibleOutputTextStylingResolutionSourceAndRulesOnly');
end;

function AVPlayerItemTrackVideoFieldModeDeinterlaceFields: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVPlayerItemTrackVideoFieldModeDeinterlaceFields');
end;

function AVRouteDetectorMultipleRoutesDetectedDidChangeNotification: NSNotificationName;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVRouteDetectorMultipleRoutesDetectedDidChangeNotification');
end;

function AVSampleBufferAudioRendererWasFlushedAutomaticallyNotification: NSNotificationName;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVSampleBufferAudioRendererWasFlushedAutomaticallyNotification');
end;

function AVSampleBufferAudioRendererFlushTimeKey: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVSampleBufferAudioRendererFlushTimeKey');
end;

function AVSampleBufferDisplayLayerFailedToDecodeNotification: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVSampleBufferDisplayLayerFailedToDecodeNotification');
end;

function AVSampleBufferDisplayLayerFailedToDecodeNotificationErrorKey: NSString;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVSampleBufferDisplayLayerFailedToDecodeNotificationErrorKey');
end;

function AVSampleBufferRenderSynchronizerRateDidChangeNotification: NSNotificationName;
begin
  Result := CocoaNSStringConst(libAVFoundation, 'AVSampleBufferRenderSynchronizerRateDidChangeNotification');
end;
{$ENDIF}

end.
