{*******************************************************}
{                                                       }
{           CodeGear Delphi Runtime Library             }
{                                                       }
{ Copyright(c) 2010-2011 Embarcadero Technologies, Inc. }
{                                                       }
{*******************************************************}

//
// Delphi-Objective-C Bridge
// Interfaces for Cocoa framework CoreGraphics 
//
unit Macapi.CoreGraphics;

{$WEAKPACKAGEUNIT}

interface

uses
  Macapi.CocoaTypes,
  Macapi.CoreServices,
  Macapi.CoreFoundation;

const
  CGDisplayNoErr = 0;
  {$EXTERNALSYM CGDisplayNoErr}
  CGEventNoErr = 0;
  {$EXTERNALSYM CGEventNoErr}
  CGFLOAT_DEFINED = 1;
  {$EXTERNALSYM CGFLOAT_DEFINED}
  CGGlyphMax = 65534;
  {$EXTERNALSYM CGGlyphMax}
  CGGlyphMin = 0;
  {$EXTERNALSYM CGGlyphMin}
  CGPDFDataFormatJPEG2000 = 2;
  {$EXTERNALSYM CGPDFDataFormatJPEG2000}
  CGPDFDataFormatJPEGEncoded = 1;
  {$EXTERNALSYM CGPDFDataFormatJPEGEncoded}
  CGPDFDataFormatRaw = 0;
  {$EXTERNALSYM CGPDFDataFormatRaw}
  CGRectMaxXEdge = 2;
  {$EXTERNALSYM CGRectMaxXEdge}
  CGRectMaxYEdge = 3;
  {$EXTERNALSYM CGRectMaxYEdge}
  CGRectMinXEdge = 0;
  {$EXTERNALSYM CGRectMinXEdge}
  CGRectMinYEdge = 1;
  {$EXTERNALSYM CGRectMinYEdge}
  kCGAnnotatedSessionEventTap = 2;
  {$EXTERNALSYM kCGAnnotatedSessionEventTap}
  kCGAnyInputEventType = 4294967295;
  {$EXTERNALSYM kCGAnyInputEventType}
  kCGAssistiveTechHighWindowLevelKey = 20;
  {$EXTERNALSYM kCGAssistiveTechHighWindowLevelKey}
  kCGBackingStoreBuffered = 2;
  {$EXTERNALSYM kCGBackingStoreBuffered}
  kCGBackingStoreNonretained = 1;
  {$EXTERNALSYM kCGBackingStoreNonretained}
  kCGBackingStoreRetained = 0;
  {$EXTERNALSYM kCGBackingStoreRetained}
  kCGBackstopMenuLevelKey = 3;
  {$EXTERNALSYM kCGBackstopMenuLevelKey}
  kCGBaseWindowLevelKey = 0;
  {$EXTERNALSYM kCGBaseWindowLevelKey}
  kCGBitmapAlphaInfoMask = 31;
  {$EXTERNALSYM kCGBitmapAlphaInfoMask}
  kCGBitmapByteOrder16Big = 12288;
  {$EXTERNALSYM kCGBitmapByteOrder16Big}
  kCGBitmapByteOrder16Host = 4096;
  {$EXTERNALSYM kCGBitmapByteOrder16Host}
  kCGBitmapByteOrder16Little = 4096;
  {$EXTERNALSYM kCGBitmapByteOrder16Little}
  kCGBitmapByteOrder32Big = 16384;
  {$EXTERNALSYM kCGBitmapByteOrder32Big}
  kCGBitmapByteOrder32Host = 8192;
  {$EXTERNALSYM kCGBitmapByteOrder32Host}
  kCGBitmapByteOrder32Little = 8192;
  {$EXTERNALSYM kCGBitmapByteOrder32Little}
  kCGBitmapByteOrderDefault = 0;
  {$EXTERNALSYM kCGBitmapByteOrderDefault}
  kCGBitmapByteOrderMask = 28672;
  {$EXTERNALSYM kCGBitmapByteOrderMask}
  kCGBitmapFloatComponents = 256;
  {$EXTERNALSYM kCGBitmapFloatComponents}
  kCGBlendModeClear = 16;
  {$EXTERNALSYM kCGBlendModeClear}
  kCGBlendModeColor = 14;
  {$EXTERNALSYM kCGBlendModeColor}
  kCGBlendModeColorBurn = 7;
  {$EXTERNALSYM kCGBlendModeColorBurn}
  kCGBlendModeColorDodge = 6;
  {$EXTERNALSYM kCGBlendModeColorDodge}
  kCGBlendModeCopy = 17;
  {$EXTERNALSYM kCGBlendModeCopy}
  kCGBlendModeDarken = 4;
  {$EXTERNALSYM kCGBlendModeDarken}
  kCGBlendModeDestinationAtop = 24;
  {$EXTERNALSYM kCGBlendModeDestinationAtop}
  kCGBlendModeDestinationIn = 22;
  {$EXTERNALSYM kCGBlendModeDestinationIn}
  kCGBlendModeDestinationOut = 23;
  {$EXTERNALSYM kCGBlendModeDestinationOut}
  kCGBlendModeDestinationOver = 21;
  {$EXTERNALSYM kCGBlendModeDestinationOver}
  kCGBlendModeDifference = 10;
  {$EXTERNALSYM kCGBlendModeDifference}
  kCGBlendModeExclusion = 11;
  {$EXTERNALSYM kCGBlendModeExclusion}
  kCGBlendModeHardLight = 9;
  {$EXTERNALSYM kCGBlendModeHardLight}
  kCGBlendModeHue = 12;
  {$EXTERNALSYM kCGBlendModeHue}
  kCGBlendModeLighten = 5;
  {$EXTERNALSYM kCGBlendModeLighten}
  kCGBlendModeLuminosity = 15;
  {$EXTERNALSYM kCGBlendModeLuminosity}
  kCGBlendModeMultiply = 1;
  {$EXTERNALSYM kCGBlendModeMultiply}
  kCGBlendModeNormal = 0;
  {$EXTERNALSYM kCGBlendModeNormal}
  kCGBlendModeOverlay = 3;
  {$EXTERNALSYM kCGBlendModeOverlay}
  kCGBlendModePlusDarker = 26;
  {$EXTERNALSYM kCGBlendModePlusDarker}
  kCGBlendModePlusLighter = 27;
  {$EXTERNALSYM kCGBlendModePlusLighter}
  kCGBlendModeSaturation = 13;
  {$EXTERNALSYM kCGBlendModeSaturation}
  kCGBlendModeScreen = 2;
  {$EXTERNALSYM kCGBlendModeScreen}
  kCGBlendModeSoftLight = 8;
  {$EXTERNALSYM kCGBlendModeSoftLight}
  kCGBlendModeSourceAtop = 20;
  {$EXTERNALSYM kCGBlendModeSourceAtop}
  kCGBlendModeSourceIn = 18;
  {$EXTERNALSYM kCGBlendModeSourceIn}
  kCGBlendModeSourceOut = 19;
  {$EXTERNALSYM kCGBlendModeSourceOut}
  kCGBlendModeXOR = 25;
  {$EXTERNALSYM kCGBlendModeXOR}
  kCGCaptureNoFill = 1;
  {$EXTERNALSYM kCGCaptureNoFill}
  kCGCaptureNoOptions = 0;
  {$EXTERNALSYM kCGCaptureNoOptions}
  kCGColorSpaceModelCMYK = 2;
  {$EXTERNALSYM kCGColorSpaceModelCMYK}
  kCGColorSpaceModelDeviceN = 4;
  {$EXTERNALSYM kCGColorSpaceModelDeviceN}
  kCGColorSpaceModelIndexed = 5;
  {$EXTERNALSYM kCGColorSpaceModelIndexed}
  kCGColorSpaceModelLab = 3;
  {$EXTERNALSYM kCGColorSpaceModelLab}
  kCGColorSpaceModelMonochrome = 0;
  {$EXTERNALSYM kCGColorSpaceModelMonochrome}
  kCGColorSpaceModelPattern = 6;
  {$EXTERNALSYM kCGColorSpaceModelPattern}
  kCGColorSpaceModelRGB = 1;
  {$EXTERNALSYM kCGColorSpaceModelRGB}
  kCGColorSpaceModelUnknown = -1;
  {$EXTERNALSYM kCGColorSpaceModelUnknown}
  kCGConfigureForAppOnly = 0;
  {$EXTERNALSYM kCGConfigureForAppOnly}
  kCGConfigureForSession = 1;
  {$EXTERNALSYM kCGConfigureForSession}
  kCGConfigurePermanently = 2;
  {$EXTERNALSYM kCGConfigurePermanently}
  kCGCursorWindowLevelKey = 19;
  {$EXTERNALSYM kCGCursorWindowLevelKey}
  kCGDesktopIconWindowLevelKey = 18;
  {$EXTERNALSYM kCGDesktopIconWindowLevelKey}
  kCGDesktopWindowLevelKey = 2;
  {$EXTERNALSYM kCGDesktopWindowLevelKey}
  kCGDirectMainDisplay = 724062288;
  {$EXTERNALSYM kCGDirectMainDisplay}
  kCGDisplayAddFlag = 16;
  {$EXTERNALSYM kCGDisplayAddFlag}
  kCGDisplayBeginConfigurationFlag = 1;
  {$EXTERNALSYM kCGDisplayBeginConfigurationFlag}
  kCGDisplayBlendNormal = 0.0000000000000000;
  {$EXTERNALSYM kCGDisplayBlendNormal}
  kCGDisplayBlendSolidColor = 1.0000000000000000;
  {$EXTERNALSYM kCGDisplayBlendSolidColor}
  kCGDisplayDesktopShapeChangedFlag = 4096;
  {$EXTERNALSYM kCGDisplayDesktopShapeChangedFlag}
  kCGDisplayDisabledFlag = 512;
  {$EXTERNALSYM kCGDisplayDisabledFlag}
  kCGDisplayEnabledFlag = 256;
  {$EXTERNALSYM kCGDisplayEnabledFlag}
  kCGDisplayFadeReservationInvalidToken = 0;
  {$EXTERNALSYM kCGDisplayFadeReservationInvalidToken}
  kCGDisplayMirrorFlag = 1024;
  {$EXTERNALSYM kCGDisplayMirrorFlag}
  kCGDisplayMovedFlag = 2;
  {$EXTERNALSYM kCGDisplayMovedFlag}
  kCGDisplayRemoveFlag = 32;
  {$EXTERNALSYM kCGDisplayRemoveFlag}
  kCGDisplaySetMainFlag = 4;
  {$EXTERNALSYM kCGDisplaySetMainFlag}
  kCGDisplaySetModeFlag = 8;
  {$EXTERNALSYM kCGDisplaySetModeFlag}
  kCGDisplayUnMirrorFlag = 2048;
  {$EXTERNALSYM kCGDisplayUnMirrorFlag}
  kCGDockWindowLevelKey = 7;
  {$EXTERNALSYM kCGDockWindowLevelKey}
  kCGDraggingWindowLevelKey = 12;
  {$EXTERNALSYM kCGDraggingWindowLevelKey}
  kCGEncodingFontSpecific = 0;
  {$EXTERNALSYM kCGEncodingFontSpecific}
  kCGEncodingMacRoman = 1;
  {$EXTERNALSYM kCGEncodingMacRoman}
  kCGErrorApplicationAlreadyRunning = 1025;
  {$EXTERNALSYM kCGErrorApplicationAlreadyRunning}
  kCGErrorApplicationCanOnlyBeRunInOneSessionAtATime = 1026;
  {$EXTERNALSYM kCGErrorApplicationCanOnlyBeRunInOneSessionAtATime}
  kCGErrorApplicationIncorrectExecutableFormatFound = 1023;
  {$EXTERNALSYM kCGErrorApplicationIncorrectExecutableFormatFound}
  kCGErrorApplicationIsLaunching = 1024;
  {$EXTERNALSYM kCGErrorApplicationIsLaunching}
  kCGErrorApplicationNotPermittedToExecute = 1016;
  {$EXTERNALSYM kCGErrorApplicationNotPermittedToExecute}
  kCGErrorApplicationRequiresNewerSystem = 1015;
  {$EXTERNALSYM kCGErrorApplicationRequiresNewerSystem}
  kCGErrorCannotComplete = 1004;
  {$EXTERNALSYM kCGErrorCannotComplete}
  kCGErrorClassicApplicationsMustBeLaunchedByClassic = 1027;
  {$EXTERNALSYM kCGErrorClassicApplicationsMustBeLaunchedByClassic}
  kCGErrorFailure = 1000;
  {$EXTERNALSYM kCGErrorFailure}
  kCGErrorFirst = 1000;
  {$EXTERNALSYM kCGErrorFirst}
  kCGErrorForkFailed = 1028;
  {$EXTERNALSYM kCGErrorForkFailed}
  kCGErrorIllegalArgument = 1001;
  {$EXTERNALSYM kCGErrorIllegalArgument}
  kCGErrorInvalidConnection = 1002;
  {$EXTERNALSYM kCGErrorInvalidConnection}
  kCGErrorInvalidContext = 1003;
  {$EXTERNALSYM kCGErrorInvalidContext}
  kCGErrorInvalidOperation = 1010;
  {$EXTERNALSYM kCGErrorInvalidOperation}
  kCGErrorLast = 1029;
  {$EXTERNALSYM kCGErrorLast}
  kCGErrorNameTooLong = 1005;
  {$EXTERNALSYM kCGErrorNameTooLong}
  kCGErrorNoCurrentPoint = 1009;
  {$EXTERNALSYM kCGErrorNoCurrentPoint}
  kCGErrorNoneAvailable = 1011;
  {$EXTERNALSYM kCGErrorNoneAvailable}
  kCGErrorNotImplemented = 1006;
  {$EXTERNALSYM kCGErrorNotImplemented}
  kCGErrorRangeCheck = 1007;
  {$EXTERNALSYM kCGErrorRangeCheck}
  kCGErrorRetryRegistration = 1029;
  {$EXTERNALSYM kCGErrorRetryRegistration}
  kCGErrorSuccess = 0;
  {$EXTERNALSYM kCGErrorSuccess}
  kCGErrorTypeCheck = 1008;
  {$EXTERNALSYM kCGErrorTypeCheck}
  kCGEventFilterMaskPermitLocalKeyboardEvents = 2;
  {$EXTERNALSYM kCGEventFilterMaskPermitLocalKeyboardEvents}
  kCGEventFilterMaskPermitLocalMouseEvents = 1;
  {$EXTERNALSYM kCGEventFilterMaskPermitLocalMouseEvents}
  kCGEventFilterMaskPermitSystemDefinedEvents = 4;
  {$EXTERNALSYM kCGEventFilterMaskPermitSystemDefinedEvents}
  kCGEventFlagMaskAlphaShift = 65536;
  {$EXTERNALSYM kCGEventFlagMaskAlphaShift}
  kCGEventFlagMaskAlternate = 524288;
  {$EXTERNALSYM kCGEventFlagMaskAlternate}
  kCGEventFlagMaskCommand = 1048576;
  {$EXTERNALSYM kCGEventFlagMaskCommand}
  kCGEventFlagMaskControl = 262144;
  {$EXTERNALSYM kCGEventFlagMaskControl}
  kCGEventFlagMaskHelp = 4194304;
  {$EXTERNALSYM kCGEventFlagMaskHelp}
  kCGEventFlagMaskNonCoalesced = 256;
  {$EXTERNALSYM kCGEventFlagMaskNonCoalesced}
  kCGEventFlagMaskNumericPad = 2097152;
  {$EXTERNALSYM kCGEventFlagMaskNumericPad}
  kCGEventFlagMaskSecondaryFn = 8388608;
  {$EXTERNALSYM kCGEventFlagMaskSecondaryFn}
  kCGEventFlagMaskShift = 131072;
  {$EXTERNALSYM kCGEventFlagMaskShift}
  kCGEventFlagsChanged = 12;
  {$EXTERNALSYM kCGEventFlagsChanged}
  kCGEventKeyDown = 10;
  {$EXTERNALSYM kCGEventKeyDown}
  kCGEventKeyUp = 11;
  {$EXTERNALSYM kCGEventKeyUp}
  kCGEventLeftMouseDown = 1;
  {$EXTERNALSYM kCGEventLeftMouseDown}
  kCGEventLeftMouseDragged = 6;
  {$EXTERNALSYM kCGEventLeftMouseDragged}
  kCGEventLeftMouseUp = 2;
  {$EXTERNALSYM kCGEventLeftMouseUp}
  kCGEventMaskForAllEvents = 18446744073709551615;
  {$EXTERNALSYM kCGEventMaskForAllEvents}
  kCGEventMouseMoved = 5;
  {$EXTERNALSYM kCGEventMouseMoved}
  kCGEventMouseSubtypeDefault = 0;
  {$EXTERNALSYM kCGEventMouseSubtypeDefault}
  kCGEventMouseSubtypeTabletPoint = 1;
  {$EXTERNALSYM kCGEventMouseSubtypeTabletPoint}
  kCGEventMouseSubtypeTabletProximity = 2;
  {$EXTERNALSYM kCGEventMouseSubtypeTabletProximity}
  kCGEventNull = 0;
  {$EXTERNALSYM kCGEventNull}
  kCGEventOtherMouseDown = 25;
  {$EXTERNALSYM kCGEventOtherMouseDown}
  kCGEventOtherMouseDragged = 27;
  {$EXTERNALSYM kCGEventOtherMouseDragged}
  kCGEventOtherMouseUp = 26;
  {$EXTERNALSYM kCGEventOtherMouseUp}
  kCGEventRightMouseDown = 3;
  {$EXTERNALSYM kCGEventRightMouseDown}
  kCGEventRightMouseDragged = 7;
  {$EXTERNALSYM kCGEventRightMouseDragged}
  kCGEventRightMouseUp = 4;
  {$EXTERNALSYM kCGEventRightMouseUp}
  kCGEventScrollWheel = 22;
  {$EXTERNALSYM kCGEventScrollWheel}
  kCGEventSourceGroupID = 44;
  {$EXTERNALSYM kCGEventSourceGroupID}
  kCGEventSourceStateCombinedSessionState = 0;
  {$EXTERNALSYM kCGEventSourceStateCombinedSessionState}
  kCGEventSourceStateHIDSystemState = 1;
  {$EXTERNALSYM kCGEventSourceStateHIDSystemState}
  kCGEventSourceStateID = 45;
  {$EXTERNALSYM kCGEventSourceStateID}
  kCGEventSourceStatePrivate = -1;
  {$EXTERNALSYM kCGEventSourceStatePrivate}
  kCGEventSourceUnixProcessID = 41;
  {$EXTERNALSYM kCGEventSourceUnixProcessID}
  kCGEventSourceUserData = 42;
  {$EXTERNALSYM kCGEventSourceUserData}
  kCGEventSourceUserID = 43;
  {$EXTERNALSYM kCGEventSourceUserID}
  kCGEventSuppressionStateRemoteMouseDrag = 1;
  {$EXTERNALSYM kCGEventSuppressionStateRemoteMouseDrag}
  kCGEventSuppressionStateSuppressionInterval = 0;
  {$EXTERNALSYM kCGEventSuppressionStateSuppressionInterval}
  kCGEventTabletPointer = 23;
  {$EXTERNALSYM kCGEventTabletPointer}
  kCGEventTabletProximity = 24;
  {$EXTERNALSYM kCGEventTabletProximity}
  kCGEventTapDisabledByTimeout = -2;
  {$EXTERNALSYM kCGEventTapDisabledByTimeout}
  kCGEventTapDisabledByUserInput = -1;
  {$EXTERNALSYM kCGEventTapDisabledByUserInput}
  kCGEventTapOptionDefault = 0;
  {$EXTERNALSYM kCGEventTapOptionDefault}
  kCGEventTapOptionListenOnly = 1;
  {$EXTERNALSYM kCGEventTapOptionListenOnly}
  kCGEventTargetProcessSerialNumber = 39;
  {$EXTERNALSYM kCGEventTargetProcessSerialNumber}
  kCGEventTargetUnixProcessID = 40;
  {$EXTERNALSYM kCGEventTargetUnixProcessID}
  kCGFloatingWindowLevelKey = 5;
  {$EXTERNALSYM kCGFloatingWindowLevelKey}
  kCGFontIndexInvalid = 65535;
  {$EXTERNALSYM kCGFontIndexInvalid}
  kCGFontIndexMax = 65534;
  {$EXTERNALSYM kCGFontIndexMax}
  kCGFontPostScriptFormatType1 = 1;
  {$EXTERNALSYM kCGFontPostScriptFormatType1}
  kCGFontPostScriptFormatType3 = 3;
  {$EXTERNALSYM kCGFontPostScriptFormatType3}
  kCGFontPostScriptFormatType42 = 42;
  {$EXTERNALSYM kCGFontPostScriptFormatType42}
  kCGGlyphMax = 65534;
  {$EXTERNALSYM kCGGlyphMax}
  kCGGradientDrawsAfterEndLocation = 2;
  {$EXTERNALSYM kCGGradientDrawsAfterEndLocation}
  kCGGradientDrawsBeforeStartLocation = 1;
  {$EXTERNALSYM kCGGradientDrawsBeforeStartLocation}
  kCGHIDEventTap = 0;
  {$EXTERNALSYM kCGHIDEventTap}
  kCGHeadInsertEventTap = 0;
  {$EXTERNALSYM kCGHeadInsertEventTap}
  kCGHelpWindowLevelKey = 16;
  {$EXTERNALSYM kCGHelpWindowLevelKey}
  kCGImageAlphaFirst = 4;
  {$EXTERNALSYM kCGImageAlphaFirst}
  kCGImageAlphaLast = 3;
  {$EXTERNALSYM kCGImageAlphaLast}
  kCGImageAlphaNone = 0;
  {$EXTERNALSYM kCGImageAlphaNone}
  kCGImageAlphaNoneSkipFirst = 6;
  {$EXTERNALSYM kCGImageAlphaNoneSkipFirst}
  kCGImageAlphaNoneSkipLast = 5;
  {$EXTERNALSYM kCGImageAlphaNoneSkipLast}
  kCGImageAlphaOnly = 7;
  {$EXTERNALSYM kCGImageAlphaOnly}
  kCGImageAlphaPremultipliedFirst = 2;
  {$EXTERNALSYM kCGImageAlphaPremultipliedFirst}
  kCGImageAlphaPremultipliedLast = 1;
  {$EXTERNALSYM kCGImageAlphaPremultipliedLast}
  kCGInterpolationDefault = 0;
  {$EXTERNALSYM kCGInterpolationDefault}
  kCGInterpolationHigh = 3;
  {$EXTERNALSYM kCGInterpolationHigh}
  kCGInterpolationLow = 2;
  {$EXTERNALSYM kCGInterpolationLow}
  kCGInterpolationMedium = 4;
  {$EXTERNALSYM kCGInterpolationMedium}
  kCGInterpolationNone = 1;
  {$EXTERNALSYM kCGInterpolationNone}
  kCGKeyboardEventAutorepeat = 8;
  {$EXTERNALSYM kCGKeyboardEventAutorepeat}
  kCGKeyboardEventKeyboardType = 10;
  {$EXTERNALSYM kCGKeyboardEventKeyboardType}
  kCGKeyboardEventKeycode = 9;
  {$EXTERNALSYM kCGKeyboardEventKeycode}
  kCGLineCapButt = 0;
  {$EXTERNALSYM kCGLineCapButt}
  kCGLineCapRound = 1;
  {$EXTERNALSYM kCGLineCapRound}
  kCGLineCapSquare = 2;
  {$EXTERNALSYM kCGLineCapSquare}
  kCGLineJoinBevel = 2;
  {$EXTERNALSYM kCGLineJoinBevel}
  kCGLineJoinMiter = 0;
  {$EXTERNALSYM kCGLineJoinMiter}
  kCGLineJoinRound = 1;
  {$EXTERNALSYM kCGLineJoinRound}
  kCGMainMenuWindowLevelKey = 8;
  {$EXTERNALSYM kCGMainMenuWindowLevelKey}
  kCGMaxDisplayReservationInterval = 15.000000000000000;
  {$EXTERNALSYM kCGMaxDisplayReservationInterval}
  kCGMaximumWindowLevelKey = 14;
  {$EXTERNALSYM kCGMaximumWindowLevelKey}
  kCGMinimumWindowLevelKey = 1;
  {$EXTERNALSYM kCGMinimumWindowLevelKey}
  kCGModalPanelWindowLevelKey = 10;
  {$EXTERNALSYM kCGModalPanelWindowLevelKey}
  kCGMouseButtonCenter = 2;
  {$EXTERNALSYM kCGMouseButtonCenter}
  kCGMouseButtonLeft = 0;
  {$EXTERNALSYM kCGMouseButtonLeft}
  kCGMouseButtonRight = 1;
  {$EXTERNALSYM kCGMouseButtonRight}
  kCGMouseDownEventMaskingDeadSwitchTimeout = 60.000000000000000;
  {$EXTERNALSYM kCGMouseDownEventMaskingDeadSwitchTimeout}
  kCGMouseEventButtonNumber = 3;
  {$EXTERNALSYM kCGMouseEventButtonNumber}
  kCGMouseEventClickState = 1;
  {$EXTERNALSYM kCGMouseEventClickState}
  kCGMouseEventDeltaX = 4;
  {$EXTERNALSYM kCGMouseEventDeltaX}
  kCGMouseEventDeltaY = 5;
  {$EXTERNALSYM kCGMouseEventDeltaY}
  kCGMouseEventInstantMouser = 6;
  {$EXTERNALSYM kCGMouseEventInstantMouser}
  kCGMouseEventNumber = 0;
  {$EXTERNALSYM kCGMouseEventNumber}
  kCGMouseEventPressure = 2;
  {$EXTERNALSYM kCGMouseEventPressure}
  kCGMouseEventSubtype = 7;
  {$EXTERNALSYM kCGMouseEventSubtype}
  kCGNormalWindowLevelKey = 4;
  {$EXTERNALSYM kCGNormalWindowLevelKey}
  kCGNullDirectDisplay = 0;
  {$EXTERNALSYM kCGNullDirectDisplay}
  kCGNullWindowID = 0;
  {$EXTERNALSYM kCGNullWindowID}
  kCGNumReservedWindowLevels = 16;
  {$EXTERNALSYM kCGNumReservedWindowLevels}
  kCGNumberOfEventSuppressionStates = 2;
  {$EXTERNALSYM kCGNumberOfEventSuppressionStates}
  kCGNumberOfWindowLevelKeys = 21;
  {$EXTERNALSYM kCGNumberOfWindowLevelKeys}
  kCGOverlayWindowLevelKey = 15;
  {$EXTERNALSYM kCGOverlayWindowLevelKey}
  kCGPDFArtBox = 4;
  {$EXTERNALSYM kCGPDFArtBox}
  kCGPDFBleedBox = 2;
  {$EXTERNALSYM kCGPDFBleedBox}
  kCGPDFCropBox = 1;
  {$EXTERNALSYM kCGPDFCropBox}
  kCGPDFMediaBox = 0;
  {$EXTERNALSYM kCGPDFMediaBox}
  kCGPDFObjectTypeArray = 7;
  {$EXTERNALSYM kCGPDFObjectTypeArray}
  kCGPDFObjectTypeBoolean = 2;
  {$EXTERNALSYM kCGPDFObjectTypeBoolean}
  kCGPDFObjectTypeDictionary = 8;
  {$EXTERNALSYM kCGPDFObjectTypeDictionary}
  kCGPDFObjectTypeInteger = 3;
  {$EXTERNALSYM kCGPDFObjectTypeInteger}
  kCGPDFObjectTypeName = 5;
  {$EXTERNALSYM kCGPDFObjectTypeName}
  kCGPDFObjectTypeNull = 1;
  {$EXTERNALSYM kCGPDFObjectTypeNull}
  kCGPDFObjectTypeReal = 4;
  {$EXTERNALSYM kCGPDFObjectTypeReal}
  kCGPDFObjectTypeStream = 9;
  {$EXTERNALSYM kCGPDFObjectTypeStream}
  kCGPDFObjectTypeString = 6;
  {$EXTERNALSYM kCGPDFObjectTypeString}
  kCGPDFTrimBox = 3;
  {$EXTERNALSYM kCGPDFTrimBox}
  kCGPathEOFill = 1;
  {$EXTERNALSYM kCGPathEOFill}
  kCGPathEOFillStroke = 4;
  {$EXTERNALSYM kCGPathEOFillStroke}
  kCGPathElementAddCurveToPoint = 3;
  {$EXTERNALSYM kCGPathElementAddCurveToPoint}
  kCGPathElementAddLineToPoint = 1;
  {$EXTERNALSYM kCGPathElementAddLineToPoint}
  kCGPathElementAddQuadCurveToPoint = 2;
  {$EXTERNALSYM kCGPathElementAddQuadCurveToPoint}
  kCGPathElementCloseSubpath = 4;
  {$EXTERNALSYM kCGPathElementCloseSubpath}
  kCGPathElementMoveToPoint = 0;
  {$EXTERNALSYM kCGPathElementMoveToPoint}
  kCGPathFill = 0;
  {$EXTERNALSYM kCGPathFill}
  kCGPathFillStroke = 3;
  {$EXTERNALSYM kCGPathFillStroke}
  kCGPathStroke = 2;
  {$EXTERNALSYM kCGPathStroke}
  kCGPatternTilingConstantSpacing = 2;
  {$EXTERNALSYM kCGPatternTilingConstantSpacing}
  kCGPatternTilingConstantSpacingMinimalDistortion = 1;
  {$EXTERNALSYM kCGPatternTilingConstantSpacingMinimalDistortion}
  kCGPatternTilingNoDistortion = 0;
  {$EXTERNALSYM kCGPatternTilingNoDistortion}
  kCGPopUpMenuWindowLevelKey = 11;
  {$EXTERNALSYM kCGPopUpMenuWindowLevelKey}
  kCGRenderingIntentAbsoluteColorimetric = 1;
  {$EXTERNALSYM kCGRenderingIntentAbsoluteColorimetric}
  kCGRenderingIntentDefault = 0;
  {$EXTERNALSYM kCGRenderingIntentDefault}
  kCGRenderingIntentPerceptual = 3;
  {$EXTERNALSYM kCGRenderingIntentPerceptual}
  kCGRenderingIntentRelativeColorimetric = 2;
  {$EXTERNALSYM kCGRenderingIntentRelativeColorimetric}
  kCGRenderingIntentSaturation = 4;
  {$EXTERNALSYM kCGRenderingIntentSaturation}
  kCGScreenSaverWindowLevelKey = 13;
  {$EXTERNALSYM kCGScreenSaverWindowLevelKey}
  kCGScreenUpdateOperationMove = 1;
  {$EXTERNALSYM kCGScreenUpdateOperationMove}
  kCGScreenUpdateOperationReducedDirtyRectangleCount = -2147483648;
  {$EXTERNALSYM kCGScreenUpdateOperationReducedDirtyRectangleCount}
  kCGScreenUpdateOperationRefresh = 0;
  {$EXTERNALSYM kCGScreenUpdateOperationRefresh}
  kCGScrollEventUnitLine = 1;
  {$EXTERNALSYM kCGScrollEventUnitLine}
  kCGScrollEventUnitPixel = 0;
  {$EXTERNALSYM kCGScrollEventUnitPixel}
  kCGScrollWheelEventDeltaAxis1 = 11;
  {$EXTERNALSYM kCGScrollWheelEventDeltaAxis1}
  kCGScrollWheelEventDeltaAxis2 = 12;
  {$EXTERNALSYM kCGScrollWheelEventDeltaAxis2}
  kCGScrollWheelEventDeltaAxis3 = 13;
  {$EXTERNALSYM kCGScrollWheelEventDeltaAxis3}
  kCGScrollWheelEventFixedPtDeltaAxis1 = 93;
  {$EXTERNALSYM kCGScrollWheelEventFixedPtDeltaAxis1}
  kCGScrollWheelEventFixedPtDeltaAxis2 = 94;
  {$EXTERNALSYM kCGScrollWheelEventFixedPtDeltaAxis2}
  kCGScrollWheelEventFixedPtDeltaAxis3 = 95;
  {$EXTERNALSYM kCGScrollWheelEventFixedPtDeltaAxis3}
  kCGScrollWheelEventInstantMouser = 14;
  {$EXTERNALSYM kCGScrollWheelEventInstantMouser}
  kCGScrollWheelEventIsContinuous = 88;
  {$EXTERNALSYM kCGScrollWheelEventIsContinuous}
  kCGScrollWheelEventPointDeltaAxis1 = 96;
  {$EXTERNALSYM kCGScrollWheelEventPointDeltaAxis1}
  kCGScrollWheelEventPointDeltaAxis2 = 97;
  {$EXTERNALSYM kCGScrollWheelEventPointDeltaAxis2}
  kCGScrollWheelEventPointDeltaAxis3 = 98;
  {$EXTERNALSYM kCGScrollWheelEventPointDeltaAxis3}
  kCGSessionEventTap = 1;
  {$EXTERNALSYM kCGSessionEventTap}
  kCGStatusWindowLevelKey = 9;
  {$EXTERNALSYM kCGStatusWindowLevelKey}
  kCGTabletEventDeviceID = 24;
  {$EXTERNALSYM kCGTabletEventDeviceID}
  kCGTabletEventPointButtons = 18;
  {$EXTERNALSYM kCGTabletEventPointButtons}
  kCGTabletEventPointPressure = 19;
  {$EXTERNALSYM kCGTabletEventPointPressure}
  kCGTabletEventPointX = 15;
  {$EXTERNALSYM kCGTabletEventPointX}
  kCGTabletEventPointY = 16;
  {$EXTERNALSYM kCGTabletEventPointY}
  kCGTabletEventPointZ = 17;
  {$EXTERNALSYM kCGTabletEventPointZ}
  kCGTabletEventRotation = 22;
  {$EXTERNALSYM kCGTabletEventRotation}
  kCGTabletEventTangentialPressure = 23;
  {$EXTERNALSYM kCGTabletEventTangentialPressure}
  kCGTabletEventTiltX = 20;
  {$EXTERNALSYM kCGTabletEventTiltX}
  kCGTabletEventTiltY = 21;
  {$EXTERNALSYM kCGTabletEventTiltY}
  kCGTabletEventVendor1 = 25;
  {$EXTERNALSYM kCGTabletEventVendor1}
  kCGTabletEventVendor2 = 26;
  {$EXTERNALSYM kCGTabletEventVendor2}
  kCGTabletEventVendor3 = 27;
  {$EXTERNALSYM kCGTabletEventVendor3}
  kCGTabletProximityEventCapabilityMask = 36;
  {$EXTERNALSYM kCGTabletProximityEventCapabilityMask}
  kCGTabletProximityEventDeviceID = 31;
  {$EXTERNALSYM kCGTabletProximityEventDeviceID}
  kCGTabletProximityEventEnterProximity = 38;
  {$EXTERNALSYM kCGTabletProximityEventEnterProximity}
  kCGTabletProximityEventPointerID = 30;
  {$EXTERNALSYM kCGTabletProximityEventPointerID}
  kCGTabletProximityEventPointerType = 37;
  {$EXTERNALSYM kCGTabletProximityEventPointerType}
  kCGTabletProximityEventSystemTabletID = 32;
  {$EXTERNALSYM kCGTabletProximityEventSystemTabletID}
  kCGTabletProximityEventTabletID = 29;
  {$EXTERNALSYM kCGTabletProximityEventTabletID}
  kCGTabletProximityEventVendorID = 28;
  {$EXTERNALSYM kCGTabletProximityEventVendorID}
  kCGTabletProximityEventVendorPointerSerialNumber = 34;
  {$EXTERNALSYM kCGTabletProximityEventVendorPointerSerialNumber}
  kCGTabletProximityEventVendorPointerType = 33;
  {$EXTERNALSYM kCGTabletProximityEventVendorPointerType}
  kCGTabletProximityEventVendorUniqueID = 35;
  {$EXTERNALSYM kCGTabletProximityEventVendorUniqueID}
  kCGTailAppendEventTap = 1;
  {$EXTERNALSYM kCGTailAppendEventTap}
  kCGTextClip = 7;
  {$EXTERNALSYM kCGTextClip}
  kCGTextFill = 0;
  {$EXTERNALSYM kCGTextFill}
  kCGTextFillClip = 4;
  {$EXTERNALSYM kCGTextFillClip}
  kCGTextFillStroke = 2;
  {$EXTERNALSYM kCGTextFillStroke}
  kCGTextFillStrokeClip = 6;
  {$EXTERNALSYM kCGTextFillStrokeClip}
  kCGTextInvisible = 3;
  {$EXTERNALSYM kCGTextInvisible}
  kCGTextStroke = 1;
  {$EXTERNALSYM kCGTextStroke}
  kCGTextStrokeClip = 5;
  {$EXTERNALSYM kCGTextStrokeClip}
  kCGTornOffMenuWindowLevelKey = 6;
  {$EXTERNALSYM kCGTornOffMenuWindowLevelKey}
  kCGUtilityWindowLevelKey = 17;
  {$EXTERNALSYM kCGUtilityWindowLevelKey}
  kCGWindowBackingCFNumberType = 3;
  {$EXTERNALSYM kCGWindowBackingCFNumberType}
  kCGWindowIDCFNumberType = 3;
  {$EXTERNALSYM kCGWindowIDCFNumberType}
  kCGWindowImageBoundsIgnoreFraming = 1;
  {$EXTERNALSYM kCGWindowImageBoundsIgnoreFraming}
  kCGWindowImageDefault = 0;
  {$EXTERNALSYM kCGWindowImageDefault}
  kCGWindowImageOnlyShadows = 4;
  {$EXTERNALSYM kCGWindowImageOnlyShadows}
  kCGWindowImageShouldBeOpaque = 2;
  {$EXTERNALSYM kCGWindowImageShouldBeOpaque}
  kCGWindowListExcludeDesktopElements = 16;
  {$EXTERNALSYM kCGWindowListExcludeDesktopElements}
  kCGWindowListOptionAll = 0;
  {$EXTERNALSYM kCGWindowListOptionAll}
  kCGWindowListOptionIncludingWindow = 8;
  {$EXTERNALSYM kCGWindowListOptionIncludingWindow}
  kCGWindowListOptionOnScreenAboveWindow = 2;
  {$EXTERNALSYM kCGWindowListOptionOnScreenAboveWindow}
  kCGWindowListOptionOnScreenBelowWindow = 4;
  {$EXTERNALSYM kCGWindowListOptionOnScreenBelowWindow}
  kCGWindowListOptionOnScreenOnly = 1;
  {$EXTERNALSYM kCGWindowListOptionOnScreenOnly}
  kCGWindowSharingCFNumberType = 3;
  {$EXTERNALSYM kCGWindowSharingCFNumberType}
  kCGWindowSharingNone = 0;
  {$EXTERNALSYM kCGWindowSharingNone}
  kCGWindowSharingReadOnly = 1;
  {$EXTERNALSYM kCGWindowSharingReadOnly}
  kCGWindowSharingReadWrite = 2;
  {$EXTERNALSYM kCGWindowSharingReadWrite}

// ===== External functions =====

const
  libCoreGraphics = '/System/Library/Frameworks/ApplicationServices.framework/Frameworks/CoreGraphics.framework/CoreGraphics';

function CGAcquireDisplayFadeReservation(seconds: CGDisplayReservationInterval; token: PCGDisplayFadeReservationToken): CGError; cdecl; external libCoreGraphics name '_CGAcquireDisplayFadeReservation';
{$EXTERNALSYM CGAcquireDisplayFadeReservation}
function CGAffineTransformConcat(t1: CGAffineTransform; t2: CGAffineTransform): CGAffineTransform; cdecl; external libCoreGraphics name '_CGAffineTransformConcat';
{$EXTERNALSYM CGAffineTransformConcat}
function CGAffineTransformEqualToTransform(t1: CGAffineTransform; t2: CGAffineTransform): Integer; cdecl; external libCoreGraphics name '_CGAffineTransformEqualToTransform';
{$EXTERNALSYM CGAffineTransformEqualToTransform}
function CGAffineTransformInvert(t: CGAffineTransform): CGAffineTransform; cdecl; external libCoreGraphics name '_CGAffineTransformInvert';
{$EXTERNALSYM CGAffineTransformInvert}
function CGAffineTransformIsIdentity(t: CGAffineTransform): Integer; cdecl; external libCoreGraphics name '_CGAffineTransformIsIdentity';
{$EXTERNALSYM CGAffineTransformIsIdentity}
function CGAffineTransformMake(a: Single; b: Single; c: Single; d: Single; tx: Single; ty: Single): CGAffineTransform; cdecl; external libCoreGraphics name '_CGAffineTransformMake';
{$EXTERNALSYM CGAffineTransformMake}
function CGAffineTransformMakeRotation(angle: Single): CGAffineTransform; cdecl; external libCoreGraphics name '_CGAffineTransformMakeRotation';
{$EXTERNALSYM CGAffineTransformMakeRotation}
function CGAffineTransformMakeScale(sx: Single; sy: Single): CGAffineTransform; cdecl; external libCoreGraphics name '_CGAffineTransformMakeScale';
{$EXTERNALSYM CGAffineTransformMakeScale}
function CGAffineTransformMakeTranslation(tx: Single; ty: Single): CGAffineTransform; cdecl; external libCoreGraphics name '_CGAffineTransformMakeTranslation';
{$EXTERNALSYM CGAffineTransformMakeTranslation}
function CGAffineTransformRotate(t: CGAffineTransform; angle: Single): CGAffineTransform; cdecl; external libCoreGraphics name '_CGAffineTransformRotate';
{$EXTERNALSYM CGAffineTransformRotate}
function CGAffineTransformScale(t: CGAffineTransform; sx: Single; sy: Single): CGAffineTransform; cdecl; external libCoreGraphics name '_CGAffineTransformScale';
{$EXTERNALSYM CGAffineTransformScale}
function CGAffineTransformTranslate(t: CGAffineTransform; tx: Single; ty: Single): CGAffineTransform; cdecl; external libCoreGraphics name '_CGAffineTransformTranslate';
{$EXTERNALSYM CGAffineTransformTranslate}
function CGAssociateMouseAndMouseCursorPosition(connected: Integer): CGError; cdecl; external libCoreGraphics name '_CGAssociateMouseAndMouseCursorPosition';
{$EXTERNALSYM CGAssociateMouseAndMouseCursorPosition}
function CGBeginDisplayConfiguration(config: CGDisplayConfigRef): CGError; cdecl; external libCoreGraphics name '_CGBeginDisplayConfiguration';
{$EXTERNALSYM CGBeginDisplayConfiguration}
function CGBitmapContextCreate(data: Pointer; width: Longword; height: Longword; bitsPerComponent: Longword; bytesPerRow: Longword; space: CGColorSpaceRef; bitmapInfo: CGBitmapInfo): CGContextRef; cdecl; external libCoreGraphics name '_CGBitmapContextCreate';
{$EXTERNALSYM CGBitmapContextCreate}
function CGBitmapContextCreateImage(context: CGContextRef): CGImageRef; cdecl; external libCoreGraphics name '_CGBitmapContextCreateImage';
{$EXTERNALSYM CGBitmapContextCreateImage}
function CGBitmapContextCreateWithData(data: Pointer; width: Longword; height: Longword; bitsPerComponent: Longword; bytesPerRow: Longword; space: CGColorSpaceRef; bitmapInfo: CGBitmapInfo; releaseCallback: CGBitmapContextReleaseDataCallback; releaseInfo: Pointer): CGContextRef; cdecl; external libCoreGraphics name '_CGBitmapContextCreateWithData';
{$EXTERNALSYM CGBitmapContextCreateWithData}
function CGBitmapContextGetAlphaInfo(context: CGContextRef): CGImageAlphaInfo; cdecl; external libCoreGraphics name '_CGBitmapContextGetAlphaInfo';
{$EXTERNALSYM CGBitmapContextGetAlphaInfo}
function CGBitmapContextGetBitmapInfo(context: CGContextRef): CGBitmapInfo; cdecl; external libCoreGraphics name '_CGBitmapContextGetBitmapInfo';
{$EXTERNALSYM CGBitmapContextGetBitmapInfo}
function CGBitmapContextGetBitsPerComponent(context: CGContextRef): Longword; cdecl; external libCoreGraphics name '_CGBitmapContextGetBitsPerComponent';
{$EXTERNALSYM CGBitmapContextGetBitsPerComponent}
function CGBitmapContextGetBitsPerPixel(context: CGContextRef): Longword; cdecl; external libCoreGraphics name '_CGBitmapContextGetBitsPerPixel';
{$EXTERNALSYM CGBitmapContextGetBitsPerPixel}
function CGBitmapContextGetBytesPerRow(context: CGContextRef): Longword; cdecl; external libCoreGraphics name '_CGBitmapContextGetBytesPerRow';
{$EXTERNALSYM CGBitmapContextGetBytesPerRow}
function CGBitmapContextGetColorSpace(context: CGContextRef): CGColorSpaceRef; cdecl; external libCoreGraphics name '_CGBitmapContextGetColorSpace';
{$EXTERNALSYM CGBitmapContextGetColorSpace}
function CGBitmapContextGetData(context: CGContextRef): Pointer; cdecl; external libCoreGraphics name '_CGBitmapContextGetData';
{$EXTERNALSYM CGBitmapContextGetData}
function CGBitmapContextGetHeight(context: CGContextRef): Longword; cdecl; external libCoreGraphics name '_CGBitmapContextGetHeight';
{$EXTERNALSYM CGBitmapContextGetHeight}
function CGBitmapContextGetWidth(context: CGContextRef): Longword; cdecl; external libCoreGraphics name '_CGBitmapContextGetWidth';
{$EXTERNALSYM CGBitmapContextGetWidth}
function CGCancelDisplayConfiguration(config: CGDisplayConfigRef): CGError; cdecl; external libCoreGraphics name '_CGCancelDisplayConfiguration';
{$EXTERNALSYM CGCancelDisplayConfiguration}
function CGCaptureAllDisplays: CGError; cdecl; external libCoreGraphics name '_CGCaptureAllDisplays';
{$EXTERNALSYM CGCaptureAllDisplays}
function CGCaptureAllDisplaysWithOptions(options: CGCaptureOptions): CGError; cdecl; external libCoreGraphics name '_CGCaptureAllDisplaysWithOptions';
{$EXTERNALSYM CGCaptureAllDisplaysWithOptions}
function CGColorCreate(space: CGColorSpaceRef; components: PSingle): CGColorRef; cdecl; external libCoreGraphics name '_CGColorCreate';
{$EXTERNALSYM CGColorCreate}
function CGColorCreateCopy(color: CGColorRef): CGColorRef; cdecl; external libCoreGraphics name '_CGColorCreateCopy';
{$EXTERNALSYM CGColorCreateCopy}
function CGColorCreateCopyWithAlpha(color: CGColorRef; alpha: Single): CGColorRef; cdecl; external libCoreGraphics name '_CGColorCreateCopyWithAlpha';
{$EXTERNALSYM CGColorCreateCopyWithAlpha}
function CGColorCreateGenericCMYK(cyan: Single; magenta: Single; yellow: Single; black: Single; alpha: Single): CGColorRef; cdecl; external libCoreGraphics name '_CGColorCreateGenericCMYK';
{$EXTERNALSYM CGColorCreateGenericCMYK}
function CGColorCreateGenericGray(gray: Single; alpha: Single): CGColorRef; cdecl; external libCoreGraphics name '_CGColorCreateGenericGray';
{$EXTERNALSYM CGColorCreateGenericGray}
function CGColorCreateGenericRGB(red: Single; green: Single; blue: Single; alpha: Single): CGColorRef; cdecl; external libCoreGraphics name '_CGColorCreateGenericRGB';
{$EXTERNALSYM CGColorCreateGenericRGB}
function CGColorCreateWithPattern(space: CGColorSpaceRef; pattern: CGPatternRef; components: PSingle): CGColorRef; cdecl; external libCoreGraphics name '_CGColorCreateWithPattern';
{$EXTERNALSYM CGColorCreateWithPattern}
function CGColorEqualToColor(color1: CGColorRef; color2: CGColorRef): Integer; cdecl; external libCoreGraphics name '_CGColorEqualToColor';
{$EXTERNALSYM CGColorEqualToColor}
function CGColorGetAlpha(color: CGColorRef): Single; cdecl; external libCoreGraphics name '_CGColorGetAlpha';
{$EXTERNALSYM CGColorGetAlpha}
function CGColorGetColorSpace(color: CGColorRef): CGColorSpaceRef; cdecl; external libCoreGraphics name '_CGColorGetColorSpace';
{$EXTERNALSYM CGColorGetColorSpace}
function CGColorGetComponents(color: CGColorRef): PSingle; cdecl; external libCoreGraphics name '_CGColorGetComponents';
{$EXTERNALSYM CGColorGetComponents}
function CGColorGetConstantColor(colorName: CFStringRef): CGColorRef; cdecl; external libCoreGraphics name '_CGColorGetConstantColor';
{$EXTERNALSYM CGColorGetConstantColor}
function CGColorGetNumberOfComponents(color: CGColorRef): Longword; cdecl; external libCoreGraphics name '_CGColorGetNumberOfComponents';
{$EXTERNALSYM CGColorGetNumberOfComponents}
function CGColorGetPattern(color: CGColorRef): CGPatternRef; cdecl; external libCoreGraphics name '_CGColorGetPattern';
{$EXTERNALSYM CGColorGetPattern}
function CGColorGetTypeID: CFTypeID; cdecl; external libCoreGraphics name '_CGColorGetTypeID';
{$EXTERNALSYM CGColorGetTypeID}
procedure CGColorRelease(color: CGColorRef); cdecl; external libCoreGraphics name '_CGColorRelease';
{$EXTERNALSYM CGColorRelease}
function CGColorRetain(color: CGColorRef): CGColorRef; cdecl; external libCoreGraphics name '_CGColorRetain';
{$EXTERNALSYM CGColorRetain}
function CGColorSpaceCopyICCProfile(space: CGColorSpaceRef): CFDataRef; cdecl; external libCoreGraphics name '_CGColorSpaceCopyICCProfile';
{$EXTERNALSYM CGColorSpaceCopyICCProfile}
function CGColorSpaceCopyName(space: CGColorSpaceRef): CFStringRef; cdecl; external libCoreGraphics name '_CGColorSpaceCopyName';
{$EXTERNALSYM CGColorSpaceCopyName}
function CGColorSpaceCreateCalibratedGray(whitePoint: PSingle; blackPoint: PSingle; gamma: Single): CGColorSpaceRef; cdecl; external libCoreGraphics name '_CGColorSpaceCreateCalibratedGray';
{$EXTERNALSYM CGColorSpaceCreateCalibratedGray}
function CGColorSpaceCreateCalibratedRGB(whitePoint: PSingle; blackPoint: PSingle; gamma: PSingle; matrix: PSingle): CGColorSpaceRef; cdecl; external libCoreGraphics name '_CGColorSpaceCreateCalibratedRGB';
{$EXTERNALSYM CGColorSpaceCreateCalibratedRGB}
function CGColorSpaceCreateDeviceCMYK: CGColorSpaceRef; cdecl; external libCoreGraphics name '_CGColorSpaceCreateDeviceCMYK';
{$EXTERNALSYM CGColorSpaceCreateDeviceCMYK}
function CGColorSpaceCreateDeviceGray: CGColorSpaceRef; cdecl; external libCoreGraphics name '_CGColorSpaceCreateDeviceGray';
{$EXTERNALSYM CGColorSpaceCreateDeviceGray}
function CGColorSpaceCreateDeviceRGB: CGColorSpaceRef; cdecl; external libCoreGraphics name '_CGColorSpaceCreateDeviceRGB';
{$EXTERNALSYM CGColorSpaceCreateDeviceRGB}
function CGColorSpaceCreateICCBased(nComponents: Longword; range: PSingle; profile: CGDataProviderRef; alternate: CGColorSpaceRef): CGColorSpaceRef; cdecl; external libCoreGraphics name '_CGColorSpaceCreateICCBased';
{$EXTERNALSYM CGColorSpaceCreateICCBased}
function CGColorSpaceCreateIndexed(baseSpace: CGColorSpaceRef; lastIndex: Longword; colorTable: PByte): CGColorSpaceRef; cdecl; external libCoreGraphics name '_CGColorSpaceCreateIndexed';
{$EXTERNALSYM CGColorSpaceCreateIndexed}
function CGColorSpaceCreateLab(whitePoint: PSingle; blackPoint: PSingle; range: PSingle): CGColorSpaceRef; cdecl; external libCoreGraphics name '_CGColorSpaceCreateLab';
{$EXTERNALSYM CGColorSpaceCreateLab}
function CGColorSpaceCreatePattern(baseSpace: CGColorSpaceRef): CGColorSpaceRef; cdecl; external libCoreGraphics name '_CGColorSpaceCreatePattern';
{$EXTERNALSYM CGColorSpaceCreatePattern}
function CGColorSpaceCreateWithICCProfile(data: CFDataRef): CGColorSpaceRef; cdecl; external libCoreGraphics name '_CGColorSpaceCreateWithICCProfile';
{$EXTERNALSYM CGColorSpaceCreateWithICCProfile}
function CGColorSpaceCreateWithName(name: CFStringRef): CGColorSpaceRef; cdecl; external libCoreGraphics name '_CGColorSpaceCreateWithName';
{$EXTERNALSYM CGColorSpaceCreateWithName}
function CGColorSpaceCreateWithPlatformColorSpace(ref: Pointer): CGColorSpaceRef; cdecl; external libCoreGraphics name '_CGColorSpaceCreateWithPlatformColorSpace';
{$EXTERNALSYM CGColorSpaceCreateWithPlatformColorSpace}
function CGColorSpaceGetBaseColorSpace(space: CGColorSpaceRef): CGColorSpaceRef; cdecl; external libCoreGraphics name '_CGColorSpaceGetBaseColorSpace';
{$EXTERNALSYM CGColorSpaceGetBaseColorSpace}
procedure CGColorSpaceGetColorTable(space: CGColorSpaceRef; table: PByte); cdecl; external libCoreGraphics name '_CGColorSpaceGetColorTable';
{$EXTERNALSYM CGColorSpaceGetColorTable}
function CGColorSpaceGetColorTableCount(space: CGColorSpaceRef): Longword; cdecl; external libCoreGraphics name '_CGColorSpaceGetColorTableCount';
{$EXTERNALSYM CGColorSpaceGetColorTableCount}
function CGColorSpaceGetModel(space: CGColorSpaceRef): CGColorSpaceModel; cdecl; external libCoreGraphics name '_CGColorSpaceGetModel';
{$EXTERNALSYM CGColorSpaceGetModel}
function CGColorSpaceGetNumberOfComponents(space: CGColorSpaceRef): Longword; cdecl; external libCoreGraphics name '_CGColorSpaceGetNumberOfComponents';
{$EXTERNALSYM CGColorSpaceGetNumberOfComponents}
function CGColorSpaceGetTypeID: CFTypeID; cdecl; external libCoreGraphics name '_CGColorSpaceGetTypeID';
{$EXTERNALSYM CGColorSpaceGetTypeID}
procedure CGColorSpaceRelease(space: CGColorSpaceRef); cdecl; external libCoreGraphics name '_CGColorSpaceRelease';
{$EXTERNALSYM CGColorSpaceRelease}
function CGColorSpaceRetain(space: CGColorSpaceRef): CGColorSpaceRef; cdecl; external libCoreGraphics name '_CGColorSpaceRetain';
{$EXTERNALSYM CGColorSpaceRetain}
function CGCompleteDisplayConfiguration(config: CGDisplayConfigRef; option: CGConfigureOption): CGError; cdecl; external libCoreGraphics name '_CGCompleteDisplayConfiguration';
{$EXTERNALSYM CGCompleteDisplayConfiguration}
function CGConfigureDisplayFadeEffect(config: CGDisplayConfigRef; fadeOutSeconds: CGDisplayFadeInterval; fadeInSeconds: CGDisplayFadeInterval; fadeRed: Single; fadeGreen: Single; fadeBlue: Single): CGError; cdecl; external libCoreGraphics name '_CGConfigureDisplayFadeEffect';
{$EXTERNALSYM CGConfigureDisplayFadeEffect}
function CGConfigureDisplayMirrorOfDisplay(config: CGDisplayConfigRef; display: CGDirectDisplayID; master: CGDirectDisplayID): CGError; cdecl; external libCoreGraphics name '_CGConfigureDisplayMirrorOfDisplay';
{$EXTERNALSYM CGConfigureDisplayMirrorOfDisplay}
function CGConfigureDisplayMode(config: CGDisplayConfigRef; display: CGDirectDisplayID; mode: CFDictionaryRef): CGError; cdecl; external libCoreGraphics name '_CGConfigureDisplayMode';
{$EXTERNALSYM CGConfigureDisplayMode}
function CGConfigureDisplayOrigin(config: CGDisplayConfigRef; display: CGDirectDisplayID; x: Integer; y: Integer): CGError; cdecl; external libCoreGraphics name '_CGConfigureDisplayOrigin';
{$EXTERNALSYM CGConfigureDisplayOrigin}
function CGConfigureDisplayStereoOperation(config: CGDisplayConfigRef; display: CGDirectDisplayID; stereo: Integer; forceBlueLine: Integer): CGError; cdecl; external libCoreGraphics name '_CGConfigureDisplayStereoOperation';
{$EXTERNALSYM CGConfigureDisplayStereoOperation}
function CGConfigureDisplayWithDisplayMode(config: CGDisplayConfigRef; display: CGDirectDisplayID; mode: CGDisplayModeRef; options: CFDictionaryRef): CGError; cdecl; external libCoreGraphics name '_CGConfigureDisplayWithDisplayMode';
{$EXTERNALSYM CGConfigureDisplayWithDisplayMode}
procedure CGContextAddArc(c: CGContextRef; x: Single; y: Single; radius: Single; startAngle: Single; endAngle: Single; clockwise: Integer); cdecl; external libCoreGraphics name '_CGContextAddArc';
{$EXTERNALSYM CGContextAddArc}
procedure CGContextAddArcToPoint(c: CGContextRef; x1: Single; y1: Single; x2: Single; y2: Single; radius: Single); cdecl; external libCoreGraphics name '_CGContextAddArcToPoint';
{$EXTERNALSYM CGContextAddArcToPoint}
procedure CGContextAddCurveToPoint(c: CGContextRef; cp1x: Single; cp1y: Single; cp2x: Single; cp2y: Single; x: Single; y: Single); cdecl; external libCoreGraphics name '_CGContextAddCurveToPoint';
{$EXTERNALSYM CGContextAddCurveToPoint}
procedure CGContextAddEllipseInRect(context: CGContextRef; rect: CGRect); cdecl; external libCoreGraphics name '_CGContextAddEllipseInRect';
{$EXTERNALSYM CGContextAddEllipseInRect}
procedure CGContextAddLineToPoint(c: CGContextRef; x: Single; y: Single); cdecl; external libCoreGraphics name '_CGContextAddLineToPoint';
{$EXTERNALSYM CGContextAddLineToPoint}
procedure CGContextAddLines(c: CGContextRef; points: PCGPoint; count: Longword); cdecl; external libCoreGraphics name '_CGContextAddLines';
{$EXTERNALSYM CGContextAddLines}
procedure CGContextAddPath(context: CGContextRef; path: CGPathRef); cdecl; external libCoreGraphics name '_CGContextAddPath';
{$EXTERNALSYM CGContextAddPath}
procedure CGContextAddQuadCurveToPoint(c: CGContextRef; cpx: Single; cpy: Single; x: Single; y: Single); cdecl; external libCoreGraphics name '_CGContextAddQuadCurveToPoint';
{$EXTERNALSYM CGContextAddQuadCurveToPoint}
procedure CGContextAddRect(c: CGContextRef; rect: CGRect); cdecl; external libCoreGraphics name '_CGContextAddRect';
{$EXTERNALSYM CGContextAddRect}
procedure CGContextAddRects(c: CGContextRef; rects: PCGRect; count: Longword); cdecl; external libCoreGraphics name '_CGContextAddRects';
{$EXTERNALSYM CGContextAddRects}
procedure CGContextBeginPage(c: CGContextRef; mediaBox: PCGRect); cdecl; external libCoreGraphics name '_CGContextBeginPage';
{$EXTERNALSYM CGContextBeginPage}
procedure CGContextBeginPath(c: CGContextRef); cdecl; external libCoreGraphics name '_CGContextBeginPath';
{$EXTERNALSYM CGContextBeginPath}
procedure CGContextBeginTransparencyLayer(context: CGContextRef; auxiliaryInfo: CFDictionaryRef); cdecl; external libCoreGraphics name '_CGContextBeginTransparencyLayer';
{$EXTERNALSYM CGContextBeginTransparencyLayer}
procedure CGContextBeginTransparencyLayerWithRect(context: CGContextRef; rect: CGRect; auxiliaryInfo: CFDictionaryRef); cdecl; external libCoreGraphics name '_CGContextBeginTransparencyLayerWithRect';
{$EXTERNALSYM CGContextBeginTransparencyLayerWithRect}
procedure CGContextClearRect(c: CGContextRef; rect: CGRect); cdecl; external libCoreGraphics name '_CGContextClearRect';
{$EXTERNALSYM CGContextClearRect}
procedure CGContextClip(c: CGContextRef); cdecl; external libCoreGraphics name '_CGContextClip';
{$EXTERNALSYM CGContextClip}
procedure CGContextClipToMask(c: CGContextRef; rect: CGRect; mask: CGImageRef); cdecl; external libCoreGraphics name '_CGContextClipToMask';
{$EXTERNALSYM CGContextClipToMask}
procedure CGContextClipToRect(c: CGContextRef; rect: CGRect); cdecl; external libCoreGraphics name '_CGContextClipToRect';
{$EXTERNALSYM CGContextClipToRect}
procedure CGContextClipToRects(c: CGContextRef; rects: PCGRect; count: Longword); cdecl; external libCoreGraphics name '_CGContextClipToRects';
{$EXTERNALSYM CGContextClipToRects}
procedure CGContextClosePath(c: CGContextRef); cdecl; external libCoreGraphics name '_CGContextClosePath';
{$EXTERNALSYM CGContextClosePath}
procedure CGContextConcatCTM(c: CGContextRef; transform: CGAffineTransform); cdecl; external libCoreGraphics name '_CGContextConcatCTM';
{$EXTERNALSYM CGContextConcatCTM}
function CGContextConvertPointToDeviceSpace(context: CGContextRef; point: CGPoint): CGPoint; cdecl; external libCoreGraphics name '_CGContextConvertPointToDeviceSpace';
{$EXTERNALSYM CGContextConvertPointToDeviceSpace}
function CGContextConvertPointToUserSpace(context: CGContextRef; point: CGPoint): CGPoint; cdecl; external libCoreGraphics name '_CGContextConvertPointToUserSpace';
{$EXTERNALSYM CGContextConvertPointToUserSpace}
function CGContextConvertRectToDeviceSpace(context: CGContextRef; rect: CGRect): CGRect; cdecl; external libCoreGraphics name '_CGContextConvertRectToDeviceSpace';
{$EXTERNALSYM CGContextConvertRectToDeviceSpace}
function CGContextConvertRectToUserSpace(context: CGContextRef; rect: CGRect): CGRect; cdecl; external libCoreGraphics name '_CGContextConvertRectToUserSpace';
{$EXTERNALSYM CGContextConvertRectToUserSpace}
function CGContextConvertSizeToDeviceSpace(context: CGContextRef; size: CGSize): CGSize; cdecl; external libCoreGraphics name '_CGContextConvertSizeToDeviceSpace';
{$EXTERNALSYM CGContextConvertSizeToDeviceSpace}
function CGContextConvertSizeToUserSpace(context: CGContextRef; size: CGSize): CGSize; cdecl; external libCoreGraphics name '_CGContextConvertSizeToUserSpace';
{$EXTERNALSYM CGContextConvertSizeToUserSpace}
function CGContextCopyPath(context: CGContextRef): CGPathRef; cdecl; external libCoreGraphics name '_CGContextCopyPath';
{$EXTERNALSYM CGContextCopyPath}
procedure CGContextDrawImage(c: CGContextRef; rect: CGRect; image: CGImageRef); cdecl; external libCoreGraphics name '_CGContextDrawImage';
{$EXTERNALSYM CGContextDrawImage}
procedure CGContextDrawLayerAtPoint(context: CGContextRef; point: CGPoint; layer: CGLayerRef); cdecl; external libCoreGraphics name '_CGContextDrawLayerAtPoint';
{$EXTERNALSYM CGContextDrawLayerAtPoint}
procedure CGContextDrawLayerInRect(context: CGContextRef; rect: CGRect; layer: CGLayerRef); cdecl; external libCoreGraphics name '_CGContextDrawLayerInRect';
{$EXTERNALSYM CGContextDrawLayerInRect}
procedure CGContextDrawLinearGradient(context: CGContextRef; gradient: CGGradientRef; startPoint: CGPoint; endPoint: CGPoint; options: CGGradientDrawingOptions); cdecl; external libCoreGraphics name '_CGContextDrawLinearGradient';
{$EXTERNALSYM CGContextDrawLinearGradient}
procedure CGContextDrawPDFDocument(c: CGContextRef; rect: CGRect; document: CGPDFDocumentRef; page: Integer); cdecl; external libCoreGraphics name '_CGContextDrawPDFDocument';
{$EXTERNALSYM CGContextDrawPDFDocument}
procedure CGContextDrawPDFPage(c: CGContextRef; page: CGPDFPageRef); cdecl; external libCoreGraphics name '_CGContextDrawPDFPage';
{$EXTERNALSYM CGContextDrawPDFPage}
procedure CGContextDrawPath(c: CGContextRef; mode: CGPathDrawingMode); cdecl; external libCoreGraphics name '_CGContextDrawPath';
{$EXTERNALSYM CGContextDrawPath}
procedure CGContextDrawRadialGradient(context: CGContextRef; gradient: CGGradientRef; startCenter: CGPoint; startRadius: Single; endCenter: CGPoint; endRadius: Single; options: CGGradientDrawingOptions); cdecl; external libCoreGraphics name '_CGContextDrawRadialGradient';
{$EXTERNALSYM CGContextDrawRadialGradient}
procedure CGContextDrawShading(context: CGContextRef; shading: CGShadingRef); cdecl; external libCoreGraphics name '_CGContextDrawShading';
{$EXTERNALSYM CGContextDrawShading}
procedure CGContextDrawTiledImage(c: CGContextRef; rect: CGRect; image: CGImageRef); cdecl; external libCoreGraphics name '_CGContextDrawTiledImage';
{$EXTERNALSYM CGContextDrawTiledImage}
procedure CGContextEOClip(c: CGContextRef); cdecl; external libCoreGraphics name '_CGContextEOClip';
{$EXTERNALSYM CGContextEOClip}
procedure CGContextEOFillPath(c: CGContextRef); cdecl; external libCoreGraphics name '_CGContextEOFillPath';
{$EXTERNALSYM CGContextEOFillPath}
procedure CGContextEndPage(c: CGContextRef); cdecl; external libCoreGraphics name '_CGContextEndPage';
{$EXTERNALSYM CGContextEndPage}
procedure CGContextEndTransparencyLayer(context: CGContextRef); cdecl; external libCoreGraphics name '_CGContextEndTransparencyLayer';
{$EXTERNALSYM CGContextEndTransparencyLayer}
procedure CGContextFillEllipseInRect(context: CGContextRef; rect: CGRect); cdecl; external libCoreGraphics name '_CGContextFillEllipseInRect';
{$EXTERNALSYM CGContextFillEllipseInRect}
procedure CGContextFillPath(c: CGContextRef); cdecl; external libCoreGraphics name '_CGContextFillPath';
{$EXTERNALSYM CGContextFillPath}
procedure CGContextFillRect(c: CGContextRef; rect: CGRect); cdecl; external libCoreGraphics name '_CGContextFillRect';
{$EXTERNALSYM CGContextFillRect}
procedure CGContextFillRects(c: CGContextRef; rects: PCGRect; count: Longword); cdecl; external libCoreGraphics name '_CGContextFillRects';
{$EXTERNALSYM CGContextFillRects}
procedure CGContextFlush(c: CGContextRef); cdecl; external libCoreGraphics name '_CGContextFlush';
{$EXTERNALSYM CGContextFlush}
function CGContextGetCTM(c: CGContextRef): CGAffineTransform; cdecl; external libCoreGraphics name '_CGContextGetCTM';
{$EXTERNALSYM CGContextGetCTM}
function CGContextGetClipBoundingBox(c: CGContextRef): CGRect; cdecl; external libCoreGraphics name '_CGContextGetClipBoundingBox';
{$EXTERNALSYM CGContextGetClipBoundingBox}
function CGContextGetInterpolationQuality(context: CGContextRef): CGInterpolationQuality; cdecl; external libCoreGraphics name '_CGContextGetInterpolationQuality';
{$EXTERNALSYM CGContextGetInterpolationQuality}
function CGContextGetPathBoundingBox(context: CGContextRef): CGRect; cdecl; external libCoreGraphics name '_CGContextGetPathBoundingBox';
{$EXTERNALSYM CGContextGetPathBoundingBox}
function CGContextGetPathCurrentPoint(context: CGContextRef): CGPoint; cdecl; external libCoreGraphics name '_CGContextGetPathCurrentPoint';
{$EXTERNALSYM CGContextGetPathCurrentPoint}
function CGContextGetTextMatrix(c: CGContextRef): CGAffineTransform; cdecl; external libCoreGraphics name '_CGContextGetTextMatrix';
{$EXTERNALSYM CGContextGetTextMatrix}
function CGContextGetTextPosition(context: CGContextRef): CGPoint; cdecl; external libCoreGraphics name '_CGContextGetTextPosition';
{$EXTERNALSYM CGContextGetTextPosition}
function CGContextGetTypeID: CFTypeID; cdecl; external libCoreGraphics name '_CGContextGetTypeID';
{$EXTERNALSYM CGContextGetTypeID}
function CGContextGetUserSpaceToDeviceSpaceTransform(context: CGContextRef): CGAffineTransform; cdecl; external libCoreGraphics name '_CGContextGetUserSpaceToDeviceSpaceTransform';
{$EXTERNALSYM CGContextGetUserSpaceToDeviceSpaceTransform}
function CGContextIsPathEmpty(context: CGContextRef): Integer; cdecl; external libCoreGraphics name '_CGContextIsPathEmpty';
{$EXTERNALSYM CGContextIsPathEmpty}
procedure CGContextMoveToPoint(c: CGContextRef; x: Single; y: Single); cdecl; external libCoreGraphics name '_CGContextMoveToPoint';
{$EXTERNALSYM CGContextMoveToPoint}
function CGContextPathContainsPoint(context: CGContextRef; point: CGPoint; mode: CGPathDrawingMode): Integer; cdecl; external libCoreGraphics name '_CGContextPathContainsPoint';
{$EXTERNALSYM CGContextPathContainsPoint}
procedure CGContextRelease(c: CGContextRef); cdecl; external libCoreGraphics name '_CGContextRelease';
{$EXTERNALSYM CGContextRelease}
procedure CGContextReplacePathWithStrokedPath(c: CGContextRef); cdecl; external libCoreGraphics name '_CGContextReplacePathWithStrokedPath';
{$EXTERNALSYM CGContextReplacePathWithStrokedPath}
procedure CGContextRestoreGState(c: CGContextRef); cdecl; external libCoreGraphics name '_CGContextRestoreGState';
{$EXTERNALSYM CGContextRestoreGState}
function CGContextRetain(c: CGContextRef): CGContextRef; cdecl; external libCoreGraphics name '_CGContextRetain';
{$EXTERNALSYM CGContextRetain}
procedure CGContextRotateCTM(c: CGContextRef; angle: Single); cdecl; external libCoreGraphics name '_CGContextRotateCTM';
{$EXTERNALSYM CGContextRotateCTM}
procedure CGContextSaveGState(c: CGContextRef); cdecl; external libCoreGraphics name '_CGContextSaveGState';
{$EXTERNALSYM CGContextSaveGState}
procedure CGContextScaleCTM(c: CGContextRef; sx: Single; sy: Single); cdecl; external libCoreGraphics name '_CGContextScaleCTM';
{$EXTERNALSYM CGContextScaleCTM}
procedure CGContextSelectFont(c: CGContextRef; name: PAnsiChar; size: Single; textEncoding: CGTextEncoding); cdecl; external libCoreGraphics name '_CGContextSelectFont';
{$EXTERNALSYM CGContextSelectFont}
procedure CGContextSetAllowsAntialiasing(context: CGContextRef; allowsAntialiasing: Integer); cdecl; external libCoreGraphics name '_CGContextSetAllowsAntialiasing';
{$EXTERNALSYM CGContextSetAllowsAntialiasing}
procedure CGContextSetAllowsFontSmoothing(context: CGContextRef; allowsFontSmoothing: Integer); cdecl; external libCoreGraphics name '_CGContextSetAllowsFontSmoothing';
{$EXTERNALSYM CGContextSetAllowsFontSmoothing}
procedure CGContextSetAllowsFontSubpixelPositioning(context: CGContextRef; allowsFontSubpixelPositioning: Integer); cdecl; external libCoreGraphics name '_CGContextSetAllowsFontSubpixelPositioning';
{$EXTERNALSYM CGContextSetAllowsFontSubpixelPositioning}
procedure CGContextSetAllowsFontSubpixelQuantization(context: CGContextRef; allowsFontSubpixelQuantization: Integer); cdecl; external libCoreGraphics name '_CGContextSetAllowsFontSubpixelQuantization';
{$EXTERNALSYM CGContextSetAllowsFontSubpixelQuantization}
procedure CGContextSetAlpha(c: CGContextRef; alpha: Single); cdecl; external libCoreGraphics name '_CGContextSetAlpha';
{$EXTERNALSYM CGContextSetAlpha}
procedure CGContextSetBlendMode(context: CGContextRef; mode: CGBlendMode); cdecl; external libCoreGraphics name '_CGContextSetBlendMode';
{$EXTERNALSYM CGContextSetBlendMode}
procedure CGContextSetCMYKFillColor(context: CGContextRef; cyan: Single; magenta: Single; yellow: Single; black: Single; alpha: Single); cdecl; external libCoreGraphics name '_CGContextSetCMYKFillColor';
{$EXTERNALSYM CGContextSetCMYKFillColor}
procedure CGContextSetCMYKStrokeColor(context: CGContextRef; cyan: Single; magenta: Single; yellow: Single; black: Single; alpha: Single); cdecl; external libCoreGraphics name '_CGContextSetCMYKStrokeColor';
{$EXTERNALSYM CGContextSetCMYKStrokeColor}
procedure CGContextSetCharacterSpacing(context: CGContextRef; spacing: Single); cdecl; external libCoreGraphics name '_CGContextSetCharacterSpacing';
{$EXTERNALSYM CGContextSetCharacterSpacing}
procedure CGContextSetFillColor(context: CGContextRef; components: PSingle); cdecl; external libCoreGraphics name '_CGContextSetFillColor';
{$EXTERNALSYM CGContextSetFillColor}
procedure CGContextSetFillColorSpace(context: CGContextRef; space: CGColorSpaceRef); cdecl; external libCoreGraphics name '_CGContextSetFillColorSpace';
{$EXTERNALSYM CGContextSetFillColorSpace}
procedure CGContextSetFillColorWithColor(c: CGContextRef; color: CGColorRef); cdecl; external libCoreGraphics name '_CGContextSetFillColorWithColor';
{$EXTERNALSYM CGContextSetFillColorWithColor}
procedure CGContextSetFillPattern(context: CGContextRef; pattern: CGPatternRef; components: PSingle); cdecl; external libCoreGraphics name '_CGContextSetFillPattern';
{$EXTERNALSYM CGContextSetFillPattern}
procedure CGContextSetFlatness(c: CGContextRef; flatness: Single); cdecl; external libCoreGraphics name '_CGContextSetFlatness';
{$EXTERNALSYM CGContextSetFlatness}
procedure CGContextSetFont(c: CGContextRef; font: CGFontRef); cdecl; external libCoreGraphics name '_CGContextSetFont';
{$EXTERNALSYM CGContextSetFont}
procedure CGContextSetFontSize(c: CGContextRef; size: Single); cdecl; external libCoreGraphics name '_CGContextSetFontSize';
{$EXTERNALSYM CGContextSetFontSize}
procedure CGContextSetGrayFillColor(context: CGContextRef; gray: Single; alpha: Single); cdecl; external libCoreGraphics name '_CGContextSetGrayFillColor';
{$EXTERNALSYM CGContextSetGrayFillColor}
procedure CGContextSetGrayStrokeColor(context: CGContextRef; gray: Single; alpha: Single); cdecl; external libCoreGraphics name '_CGContextSetGrayStrokeColor';
{$EXTERNALSYM CGContextSetGrayStrokeColor}
procedure CGContextSetInterpolationQuality(context: CGContextRef; quality: CGInterpolationQuality); cdecl; external libCoreGraphics name '_CGContextSetInterpolationQuality';
{$EXTERNALSYM CGContextSetInterpolationQuality}
procedure CGContextSetLineCap(c: CGContextRef; cap: CGLineCap); cdecl; external libCoreGraphics name '_CGContextSetLineCap';
{$EXTERNALSYM CGContextSetLineCap}
procedure CGContextSetLineDash(c: CGContextRef; phase: Single; lengths: PSingle; count: Longword); cdecl; external libCoreGraphics name '_CGContextSetLineDash';
{$EXTERNALSYM CGContextSetLineDash}
procedure CGContextSetLineJoin(c: CGContextRef; join: CGLineJoin); cdecl; external libCoreGraphics name '_CGContextSetLineJoin';
{$EXTERNALSYM CGContextSetLineJoin}
procedure CGContextSetLineWidth(c: CGContextRef; width: Single); cdecl; external libCoreGraphics name '_CGContextSetLineWidth';
{$EXTERNALSYM CGContextSetLineWidth}
procedure CGContextSetMiterLimit(c: CGContextRef; limit: Single); cdecl; external libCoreGraphics name '_CGContextSetMiterLimit';
{$EXTERNALSYM CGContextSetMiterLimit}
procedure CGContextSetPatternPhase(context: CGContextRef; phase: CGSize); cdecl; external libCoreGraphics name '_CGContextSetPatternPhase';
{$EXTERNALSYM CGContextSetPatternPhase}
procedure CGContextSetRGBFillColor(context: CGContextRef; red: Single; green: Single; blue: Single; alpha: Single); cdecl; external libCoreGraphics name '_CGContextSetRGBFillColor';
{$EXTERNALSYM CGContextSetRGBFillColor}
procedure CGContextSetRGBStrokeColor(context: CGContextRef; red: Single; green: Single; blue: Single; alpha: Single); cdecl; external libCoreGraphics name '_CGContextSetRGBStrokeColor';
{$EXTERNALSYM CGContextSetRGBStrokeColor}
procedure CGContextSetRenderingIntent(context: CGContextRef; intent: CGColorRenderingIntent); cdecl; external libCoreGraphics name '_CGContextSetRenderingIntent';
{$EXTERNALSYM CGContextSetRenderingIntent}
procedure CGContextSetShadow(context: CGContextRef; offset: CGSize; blur: Single); cdecl; external libCoreGraphics name '_CGContextSetShadow';
{$EXTERNALSYM CGContextSetShadow}
procedure CGContextSetShadowWithColor(context: CGContextRef; offset: CGSize; blur: Single; color: CGColorRef); cdecl; external libCoreGraphics name '_CGContextSetShadowWithColor';
{$EXTERNALSYM CGContextSetShadowWithColor}
procedure CGContextSetShouldAntialias(context: CGContextRef; shouldAntialias: Integer); cdecl; external libCoreGraphics name '_CGContextSetShouldAntialias';
{$EXTERNALSYM CGContextSetShouldAntialias}
procedure CGContextSetShouldSmoothFonts(context: CGContextRef; shouldSmoothFonts: Integer); cdecl; external libCoreGraphics name '_CGContextSetShouldSmoothFonts';
{$EXTERNALSYM CGContextSetShouldSmoothFonts}
procedure CGContextSetShouldSubpixelPositionFonts(context: CGContextRef; shouldSubpixelPositionFonts: Integer); cdecl; external libCoreGraphics name '_CGContextSetShouldSubpixelPositionFonts';
{$EXTERNALSYM CGContextSetShouldSubpixelPositionFonts}
procedure CGContextSetShouldSubpixelQuantizeFonts(context: CGContextRef; shouldSubpixelQuantizeFonts: Integer); cdecl; external libCoreGraphics name '_CGContextSetShouldSubpixelQuantizeFonts';
{$EXTERNALSYM CGContextSetShouldSubpixelQuantizeFonts}
procedure CGContextSetStrokeColor(context: CGContextRef; components: PSingle); cdecl; external libCoreGraphics name '_CGContextSetStrokeColor';
{$EXTERNALSYM CGContextSetStrokeColor}
procedure CGContextSetStrokeColorSpace(context: CGContextRef; space: CGColorSpaceRef); cdecl; external libCoreGraphics name '_CGContextSetStrokeColorSpace';
{$EXTERNALSYM CGContextSetStrokeColorSpace}
procedure CGContextSetStrokeColorWithColor(c: CGContextRef; color: CGColorRef); cdecl; external libCoreGraphics name '_CGContextSetStrokeColorWithColor';
{$EXTERNALSYM CGContextSetStrokeColorWithColor}
procedure CGContextSetStrokePattern(context: CGContextRef; pattern: CGPatternRef; components: PSingle); cdecl; external libCoreGraphics name '_CGContextSetStrokePattern';
{$EXTERNALSYM CGContextSetStrokePattern}
procedure CGContextSetTextDrawingMode(c: CGContextRef; mode: CGTextDrawingMode); cdecl; external libCoreGraphics name '_CGContextSetTextDrawingMode';
{$EXTERNALSYM CGContextSetTextDrawingMode}
procedure CGContextSetTextMatrix(c: CGContextRef; t: CGAffineTransform); cdecl; external libCoreGraphics name '_CGContextSetTextMatrix';
{$EXTERNALSYM CGContextSetTextMatrix}
procedure CGContextSetTextPosition(c: CGContextRef; x: Single; y: Single); cdecl; external libCoreGraphics name '_CGContextSetTextPosition';
{$EXTERNALSYM CGContextSetTextPosition}
procedure CGContextShowGlyphs(c: CGContextRef; g: PCGGlyph; count: Longword); cdecl; external libCoreGraphics name '_CGContextShowGlyphs';
{$EXTERNALSYM CGContextShowGlyphs}
procedure CGContextShowGlyphsAtPoint(context: CGContextRef; x: Single; y: Single; glyphs: PCGGlyph; count: Longword); cdecl; external libCoreGraphics name '_CGContextShowGlyphsAtPoint';
{$EXTERNALSYM CGContextShowGlyphsAtPoint}
procedure CGContextShowGlyphsAtPositions(context: CGContextRef; glyphs: PCGGlyph; positions: PCGPoint; count: Longword); cdecl; external libCoreGraphics name '_CGContextShowGlyphsAtPositions';
{$EXTERNALSYM CGContextShowGlyphsAtPositions}
procedure CGContextShowGlyphsWithAdvances(c: CGContextRef; glyphs: PCGGlyph; advances: PCGSize; count: Longword); cdecl; external libCoreGraphics name '_CGContextShowGlyphsWithAdvances';
{$EXTERNALSYM CGContextShowGlyphsWithAdvances}
procedure CGContextShowText(c: CGContextRef; string_: PAnsiChar; length: Longword); cdecl; external libCoreGraphics name '_CGContextShowText';
{$EXTERNALSYM CGContextShowText}
procedure CGContextShowTextAtPoint(c: CGContextRef; x: Single; y: Single; string_: PAnsiChar; length: Longword); cdecl; external libCoreGraphics name '_CGContextShowTextAtPoint';
{$EXTERNALSYM CGContextShowTextAtPoint}
procedure CGContextStrokeEllipseInRect(context: CGContextRef; rect: CGRect); cdecl; external libCoreGraphics name '_CGContextStrokeEllipseInRect';
{$EXTERNALSYM CGContextStrokeEllipseInRect}
procedure CGContextStrokeLineSegments(c: CGContextRef; points: PCGPoint; count: Longword); cdecl; external libCoreGraphics name '_CGContextStrokeLineSegments';
{$EXTERNALSYM CGContextStrokeLineSegments}
procedure CGContextStrokePath(c: CGContextRef); cdecl; external libCoreGraphics name '_CGContextStrokePath';
{$EXTERNALSYM CGContextStrokePath}
procedure CGContextStrokeRect(c: CGContextRef; rect: CGRect); cdecl; external libCoreGraphics name '_CGContextStrokeRect';
{$EXTERNALSYM CGContextStrokeRect}
procedure CGContextStrokeRectWithWidth(c: CGContextRef; rect: CGRect; width: Single); cdecl; external libCoreGraphics name '_CGContextStrokeRectWithWidth';
{$EXTERNALSYM CGContextStrokeRectWithWidth}
procedure CGContextSynchronize(c: CGContextRef); cdecl; external libCoreGraphics name '_CGContextSynchronize';
{$EXTERNALSYM CGContextSynchronize}
procedure CGContextTranslateCTM(c: CGContextRef; tx: Single; ty: Single); cdecl; external libCoreGraphics name '_CGContextTranslateCTM';
{$EXTERNALSYM CGContextTranslateCTM}
function CGCursorIsDrawnInFramebuffer: Integer; cdecl; external libCoreGraphics name '_CGCursorIsDrawnInFramebuffer';
{$EXTERNALSYM CGCursorIsDrawnInFramebuffer}
function CGCursorIsVisible: Integer; cdecl; external libCoreGraphics name '_CGCursorIsVisible';
{$EXTERNALSYM CGCursorIsVisible}
function CGDataConsumerCreate(info: Pointer; callbacks: PCGDataConsumerCallbacks): CGDataConsumerRef; cdecl; external libCoreGraphics name '_CGDataConsumerCreate';
{$EXTERNALSYM CGDataConsumerCreate}
function CGDataConsumerCreateWithCFData(data: CFMutableDataRef): CGDataConsumerRef; cdecl; external libCoreGraphics name '_CGDataConsumerCreateWithCFData';
{$EXTERNALSYM CGDataConsumerCreateWithCFData}
function CGDataConsumerCreateWithURL(url: CFURLRef): CGDataConsumerRef; cdecl; external libCoreGraphics name '_CGDataConsumerCreateWithURL';
{$EXTERNALSYM CGDataConsumerCreateWithURL}
function CGDataConsumerGetTypeID: CFTypeID; cdecl; external libCoreGraphics name '_CGDataConsumerGetTypeID';
{$EXTERNALSYM CGDataConsumerGetTypeID}
procedure CGDataConsumerRelease(consumer: CGDataConsumerRef); cdecl; external libCoreGraphics name '_CGDataConsumerRelease';
{$EXTERNALSYM CGDataConsumerRelease}
function CGDataConsumerRetain(consumer: CGDataConsumerRef): CGDataConsumerRef; cdecl; external libCoreGraphics name '_CGDataConsumerRetain';
{$EXTERNALSYM CGDataConsumerRetain}
function CGDataProviderCopyData(provider: CGDataProviderRef): CFDataRef; cdecl; external libCoreGraphics name '_CGDataProviderCopyData';
{$EXTERNALSYM CGDataProviderCopyData}
function CGDataProviderCreate(info: Pointer; callbacks: PCGDataProviderCallbacks): CGDataProviderRef; cdecl; external libCoreGraphics name '_CGDataProviderCreate';
{$EXTERNALSYM CGDataProviderCreate}
function CGDataProviderCreateDirect(info: Pointer; size: Integer; callbacks: PCGDataProviderDirectCallbacks): CGDataProviderRef; cdecl; external libCoreGraphics name '_CGDataProviderCreateDirect';
{$EXTERNALSYM CGDataProviderCreateDirect}
function CGDataProviderCreateDirectAccess(info: Pointer; size: Longword; callbacks: PCGDataProviderDirectAccessCallbacks): CGDataProviderRef; cdecl; external libCoreGraphics name '_CGDataProviderCreateDirectAccess';
{$EXTERNALSYM CGDataProviderCreateDirectAccess}
function CGDataProviderCreateSequential(info: Pointer; callbacks: PCGDataProviderSequentialCallbacks): CGDataProviderRef; cdecl; external libCoreGraphics name '_CGDataProviderCreateSequential';
{$EXTERNALSYM CGDataProviderCreateSequential}
function CGDataProviderCreateWithCFData(data: CFDataRef): CGDataProviderRef; cdecl; external libCoreGraphics name '_CGDataProviderCreateWithCFData';
{$EXTERNALSYM CGDataProviderCreateWithCFData}
function CGDataProviderCreateWithData(info: Pointer; data: Pointer; size: Longword; releaseData: CGDataProviderReleaseDataCallback): CGDataProviderRef; cdecl; external libCoreGraphics name '_CGDataProviderCreateWithData';
{$EXTERNALSYM CGDataProviderCreateWithData}
function CGDataProviderCreateWithFilename(filename: PAnsiChar): CGDataProviderRef; cdecl; external libCoreGraphics name '_CGDataProviderCreateWithFilename';
{$EXTERNALSYM CGDataProviderCreateWithFilename}
function CGDataProviderCreateWithURL(url: CFURLRef): CGDataProviderRef; cdecl; external libCoreGraphics name '_CGDataProviderCreateWithURL';
{$EXTERNALSYM CGDataProviderCreateWithURL}
function CGDataProviderGetTypeID: CFTypeID; cdecl; external libCoreGraphics name '_CGDataProviderGetTypeID';
{$EXTERNALSYM CGDataProviderGetTypeID}
procedure CGDataProviderRelease(provider: CGDataProviderRef); cdecl; external libCoreGraphics name '_CGDataProviderRelease';
{$EXTERNALSYM CGDataProviderRelease}
function CGDataProviderRetain(provider: CGDataProviderRef): CGDataProviderRef; cdecl; external libCoreGraphics name '_CGDataProviderRetain';
{$EXTERNALSYM CGDataProviderRetain}
function CGDisplayAddressForPosition(display: CGDirectDisplayID; x: Integer; y: Integer): Pointer; cdecl; external libCoreGraphics name '_CGDisplayAddressForPosition';
{$EXTERNALSYM CGDisplayAddressForPosition}
function CGDisplayAvailableModes(display: CGDirectDisplayID): CFArrayRef; cdecl; external libCoreGraphics name '_CGDisplayAvailableModes';
{$EXTERNALSYM CGDisplayAvailableModes}
function CGDisplayBaseAddress(display: CGDirectDisplayID): Pointer; cdecl; external libCoreGraphics name '_CGDisplayBaseAddress';
{$EXTERNALSYM CGDisplayBaseAddress}
function CGDisplayBeamPosition(display: CGDirectDisplayID): Longword; cdecl; external libCoreGraphics name '_CGDisplayBeamPosition';
{$EXTERNALSYM CGDisplayBeamPosition}
function CGDisplayBestModeForParameters(display: CGDirectDisplayID; bitsPerPixel: Longword; width: Longword; height: Longword; exactMatch: PInteger): CFDictionaryRef; cdecl; external libCoreGraphics name '_CGDisplayBestModeForParameters';
{$EXTERNALSYM CGDisplayBestModeForParameters}
function CGDisplayBestModeForParametersAndRefreshRate(display: CGDirectDisplayID; bitsPerPixel: Longword; width: Longword; height: Longword; refreshRate: CGRefreshRate; exactMatch: PInteger): CFDictionaryRef; cdecl; external libCoreGraphics name '_CGDisplayBestModeForParametersAndRefreshRate';
{$EXTERNALSYM CGDisplayBestModeForParametersAndRefreshRate}
function CGDisplayBestModeForParametersAndRefreshRateWithProperty(display: CGDirectDisplayID; bitsPerPixel: Longword; width: Longword; height: Longword; refreshRate: CGRefreshRate; property_: CFStringRef; exactMatch: PInteger): CFDictionaryRef; cdecl; external libCoreGraphics name '_CGDisplayBestModeForParametersAndRefreshRateWithProperty';
{$EXTERNALSYM CGDisplayBestModeForParametersAndRefreshRateWithProperty}
function CGDisplayBitsPerPixel(display: CGDirectDisplayID): Longword; cdecl; external libCoreGraphics name '_CGDisplayBitsPerPixel';
{$EXTERNALSYM CGDisplayBitsPerPixel}
function CGDisplayBitsPerSample(display: CGDirectDisplayID): Longword; cdecl; external libCoreGraphics name '_CGDisplayBitsPerSample';
{$EXTERNALSYM CGDisplayBitsPerSample}
function CGDisplayBounds(display: CGDirectDisplayID): CGRect; cdecl; external libCoreGraphics name '_CGDisplayBounds';
{$EXTERNALSYM CGDisplayBounds}
function CGDisplayBytesPerRow(display: CGDirectDisplayID): Longword; cdecl; external libCoreGraphics name '_CGDisplayBytesPerRow';
{$EXTERNALSYM CGDisplayBytesPerRow}
function CGDisplayCanSetPalette(display: CGDirectDisplayID): Integer; cdecl; external libCoreGraphics name '_CGDisplayCanSetPalette';
{$EXTERNALSYM CGDisplayCanSetPalette}
function CGDisplayCapture(display: CGDirectDisplayID): CGError; cdecl; external libCoreGraphics name '_CGDisplayCapture';
{$EXTERNALSYM CGDisplayCapture}
function CGDisplayCaptureWithOptions(display: CGDirectDisplayID; options: CGCaptureOptions): CGError; cdecl; external libCoreGraphics name '_CGDisplayCaptureWithOptions';
{$EXTERNALSYM CGDisplayCaptureWithOptions}
function CGDisplayCopyAllDisplayModes(display: CGDirectDisplayID; options: CFDictionaryRef): CFArrayRef; cdecl; external libCoreGraphics name '_CGDisplayCopyAllDisplayModes';
{$EXTERNALSYM CGDisplayCopyAllDisplayModes}
function CGDisplayCopyColorSpace(display: CGDirectDisplayID): CGColorSpaceRef; cdecl; external libCoreGraphics name '_CGDisplayCopyColorSpace';
{$EXTERNALSYM CGDisplayCopyColorSpace}
function CGDisplayCopyDisplayMode(display: CGDirectDisplayID): CGDisplayModeRef; cdecl; external libCoreGraphics name '_CGDisplayCopyDisplayMode';
{$EXTERNALSYM CGDisplayCopyDisplayMode}
function CGDisplayCreateImage(displayID: CGDirectDisplayID): CGImageRef; cdecl; external libCoreGraphics name '_CGDisplayCreateImage';
{$EXTERNALSYM CGDisplayCreateImage}
function CGDisplayCreateImageForRect(display: CGDirectDisplayID; rect: CGRect): CGImageRef; cdecl; external libCoreGraphics name '_CGDisplayCreateImageForRect';
{$EXTERNALSYM CGDisplayCreateImageForRect}
function CGDisplayCurrentMode(display: CGDirectDisplayID): CFDictionaryRef; cdecl; external libCoreGraphics name '_CGDisplayCurrentMode';
{$EXTERNALSYM CGDisplayCurrentMode}
function CGDisplayFade(token: CGDisplayFadeReservationToken; duration: CGDisplayFadeInterval; startBlend: CGDisplayBlendFraction; endBlend: CGDisplayBlendFraction; redBlend: Single; greenBlend: Single; blueBlend: Single; synchronous: Integer): CGError; cdecl; external libCoreGraphics name '_CGDisplayFade';
{$EXTERNALSYM CGDisplayFade}
function CGDisplayFadeOperationInProgress: Integer; cdecl; external libCoreGraphics name '_CGDisplayFadeOperationInProgress';
{$EXTERNALSYM CGDisplayFadeOperationInProgress}
function CGDisplayGammaTableCapacity(display: CGDirectDisplayID): Longword; cdecl; external libCoreGraphics name '_CGDisplayGammaTableCapacity';
{$EXTERNALSYM CGDisplayGammaTableCapacity}
function CGDisplayGetDrawingContext(display: CGDirectDisplayID): CGContextRef; cdecl; external libCoreGraphics name '_CGDisplayGetDrawingContext';
{$EXTERNALSYM CGDisplayGetDrawingContext}
function CGDisplayHideCursor(display: CGDirectDisplayID): CGError; cdecl; external libCoreGraphics name '_CGDisplayHideCursor';
{$EXTERNALSYM CGDisplayHideCursor}
function CGDisplayIDToOpenGLDisplayMask(display: CGDirectDisplayID): CGOpenGLDisplayMask; cdecl; external libCoreGraphics name '_CGDisplayIDToOpenGLDisplayMask';
{$EXTERNALSYM CGDisplayIDToOpenGLDisplayMask}
//function CGDisplayIOServicePort(display: CGDirectDisplayID): io_service_t; cdecl; external libCoreGraphics name '_CGDisplayIOServicePort';
function CGDisplayIsActive(display: CGDirectDisplayID): Integer; cdecl; external libCoreGraphics name '_CGDisplayIsActive';
{$EXTERNALSYM CGDisplayIsActive}
function CGDisplayIsAlwaysInMirrorSet(display: CGDirectDisplayID): Integer; cdecl; external libCoreGraphics name '_CGDisplayIsAlwaysInMirrorSet';
{$EXTERNALSYM CGDisplayIsAlwaysInMirrorSet}
function CGDisplayIsAsleep(display: CGDirectDisplayID): Integer; cdecl; external libCoreGraphics name '_CGDisplayIsAsleep';
{$EXTERNALSYM CGDisplayIsAsleep}
function CGDisplayIsBuiltin(display: CGDirectDisplayID): Integer; cdecl; external libCoreGraphics name '_CGDisplayIsBuiltin';
{$EXTERNALSYM CGDisplayIsBuiltin}
function CGDisplayIsCaptured(display: CGDirectDisplayID): Integer; cdecl; external libCoreGraphics name '_CGDisplayIsCaptured';
{$EXTERNALSYM CGDisplayIsCaptured}
function CGDisplayIsInHWMirrorSet(display: CGDirectDisplayID): Integer; cdecl; external libCoreGraphics name '_CGDisplayIsInHWMirrorSet';
{$EXTERNALSYM CGDisplayIsInHWMirrorSet}
function CGDisplayIsInMirrorSet(display: CGDirectDisplayID): Integer; cdecl; external libCoreGraphics name '_CGDisplayIsInMirrorSet';
{$EXTERNALSYM CGDisplayIsInMirrorSet}
function CGDisplayIsMain(display: CGDirectDisplayID): Integer; cdecl; external libCoreGraphics name '_CGDisplayIsMain';
{$EXTERNALSYM CGDisplayIsMain}
function CGDisplayIsOnline(display: CGDirectDisplayID): Integer; cdecl; external libCoreGraphics name '_CGDisplayIsOnline';
{$EXTERNALSYM CGDisplayIsOnline}
function CGDisplayIsStereo(display: CGDirectDisplayID): Integer; cdecl; external libCoreGraphics name '_CGDisplayIsStereo';
{$EXTERNALSYM CGDisplayIsStereo}
function CGDisplayMirrorsDisplay(display: CGDirectDisplayID): CGDirectDisplayID; cdecl; external libCoreGraphics name '_CGDisplayMirrorsDisplay';
{$EXTERNALSYM CGDisplayMirrorsDisplay}
function CGDisplayModeCopyPixelEncoding(mode: CGDisplayModeRef): CFStringRef; cdecl; external libCoreGraphics name '_CGDisplayModeCopyPixelEncoding';
{$EXTERNALSYM CGDisplayModeCopyPixelEncoding}
function CGDisplayModeGetHeight(mode: CGDisplayModeRef): Longword; cdecl; external libCoreGraphics name '_CGDisplayModeGetHeight';
{$EXTERNALSYM CGDisplayModeGetHeight}
function CGDisplayModeGetIODisplayModeID(mode: CGDisplayModeRef): Integer; cdecl; external libCoreGraphics name '_CGDisplayModeGetIODisplayModeID';
{$EXTERNALSYM CGDisplayModeGetIODisplayModeID}
function CGDisplayModeGetIOFlags(mode: CGDisplayModeRef): Longword; cdecl; external libCoreGraphics name '_CGDisplayModeGetIOFlags';
{$EXTERNALSYM CGDisplayModeGetIOFlags}
function CGDisplayModeGetRefreshRate(mode: CGDisplayModeRef): double; cdecl; external libCoreGraphics name '_CGDisplayModeGetRefreshRate';
{$EXTERNALSYM CGDisplayModeGetRefreshRate}
function CGDisplayModeGetTypeID: CFTypeID; cdecl; external libCoreGraphics name '_CGDisplayModeGetTypeID';
{$EXTERNALSYM CGDisplayModeGetTypeID}
function CGDisplayModeGetWidth(mode: CGDisplayModeRef): Longword; cdecl; external libCoreGraphics name '_CGDisplayModeGetWidth';
{$EXTERNALSYM CGDisplayModeGetWidth}
function CGDisplayModeIsUsableForDesktopGUI(mode: CGDisplayModeRef): Integer; cdecl; external libCoreGraphics name '_CGDisplayModeIsUsableForDesktopGUI';
{$EXTERNALSYM CGDisplayModeIsUsableForDesktopGUI}
procedure CGDisplayModeRelease(mode: CGDisplayModeRef); cdecl; external libCoreGraphics name '_CGDisplayModeRelease';
{$EXTERNALSYM CGDisplayModeRelease}
function CGDisplayModeRetain(mode: CGDisplayModeRef): CGDisplayModeRef; cdecl; external libCoreGraphics name '_CGDisplayModeRetain';
{$EXTERNALSYM CGDisplayModeRetain}
function CGDisplayModelNumber(display: CGDirectDisplayID): Longword; cdecl; external libCoreGraphics name '_CGDisplayModelNumber';
{$EXTERNALSYM CGDisplayModelNumber}
function CGDisplayMoveCursorToPoint(display: CGDirectDisplayID; point: CGPoint): CGError; cdecl; external libCoreGraphics name '_CGDisplayMoveCursorToPoint';
{$EXTERNALSYM CGDisplayMoveCursorToPoint}
function CGDisplayPixelsHigh(display: CGDirectDisplayID): Longword; cdecl; external libCoreGraphics name '_CGDisplayPixelsHigh';
{$EXTERNALSYM CGDisplayPixelsHigh}
function CGDisplayPixelsWide(display: CGDirectDisplayID): Longword; cdecl; external libCoreGraphics name '_CGDisplayPixelsWide';
{$EXTERNALSYM CGDisplayPixelsWide}
function CGDisplayPrimaryDisplay(display: CGDirectDisplayID): CGDirectDisplayID; cdecl; external libCoreGraphics name '_CGDisplayPrimaryDisplay';
{$EXTERNALSYM CGDisplayPrimaryDisplay}
function CGDisplayRegisterReconfigurationCallback(callback: CGDisplayReconfigurationCallBack; userInfo: Pointer): CGError; cdecl; external libCoreGraphics name '_CGDisplayRegisterReconfigurationCallback';
{$EXTERNALSYM CGDisplayRegisterReconfigurationCallback}
function CGDisplayRelease(display: CGDirectDisplayID): CGError; cdecl; external libCoreGraphics name '_CGDisplayRelease';
{$EXTERNALSYM CGDisplayRelease}
function CGDisplayRemoveReconfigurationCallback(callback: CGDisplayReconfigurationCallBack; userInfo: Pointer): CGError; cdecl; external libCoreGraphics name '_CGDisplayRemoveReconfigurationCallback';
{$EXTERNALSYM CGDisplayRemoveReconfigurationCallback}
procedure CGDisplayRestoreColorSyncSettings; cdecl; external libCoreGraphics name '_CGDisplayRestoreColorSyncSettings';
{$EXTERNALSYM CGDisplayRestoreColorSyncSettings}
function CGDisplayRotation(display: CGDirectDisplayID): double; cdecl; external libCoreGraphics name '_CGDisplayRotation';
{$EXTERNALSYM CGDisplayRotation}
function CGDisplaySamplesPerPixel(display: CGDirectDisplayID): Longword; cdecl; external libCoreGraphics name '_CGDisplaySamplesPerPixel';
{$EXTERNALSYM CGDisplaySamplesPerPixel}
function CGDisplayScreenSize(display: CGDirectDisplayID): CGSize; cdecl; external libCoreGraphics name '_CGDisplayScreenSize';
{$EXTERNALSYM CGDisplayScreenSize}
function CGDisplaySerialNumber(display: CGDirectDisplayID): Longword; cdecl; external libCoreGraphics name '_CGDisplaySerialNumber';
{$EXTERNALSYM CGDisplaySerialNumber}
function CGDisplaySetDisplayMode(display: CGDirectDisplayID; mode: CGDisplayModeRef; options: CFDictionaryRef): CGError; cdecl; external libCoreGraphics name '_CGDisplaySetDisplayMode';
{$EXTERNALSYM CGDisplaySetDisplayMode}
function CGDisplaySetPalette(display: CGDirectDisplayID; palette: CGDirectPaletteRef): CGError; cdecl; external libCoreGraphics name '_CGDisplaySetPalette';
{$EXTERNALSYM CGDisplaySetPalette}
function CGDisplaySetStereoOperation(display: CGDirectDisplayID; stereo: Integer; forceBlueLine: Integer; option: CGConfigureOption): CGError; cdecl; external libCoreGraphics name '_CGDisplaySetStereoOperation';
{$EXTERNALSYM CGDisplaySetStereoOperation}
function CGDisplayShowCursor(display: CGDirectDisplayID): CGError; cdecl; external libCoreGraphics name '_CGDisplayShowCursor';
{$EXTERNALSYM CGDisplayShowCursor}
function CGDisplaySwitchToMode(display: CGDirectDisplayID; mode: CFDictionaryRef): CGError; cdecl; external libCoreGraphics name '_CGDisplaySwitchToMode';
{$EXTERNALSYM CGDisplaySwitchToMode}
function CGDisplayUnitNumber(display: CGDirectDisplayID): Longword; cdecl; external libCoreGraphics name '_CGDisplayUnitNumber';
{$EXTERNALSYM CGDisplayUnitNumber}
function CGDisplayUsesOpenGLAcceleration(display: CGDirectDisplayID): Integer; cdecl; external libCoreGraphics name '_CGDisplayUsesOpenGLAcceleration';
{$EXTERNALSYM CGDisplayUsesOpenGLAcceleration}
function CGDisplayVendorNumber(display: CGDirectDisplayID): Longword; cdecl; external libCoreGraphics name '_CGDisplayVendorNumber';
{$EXTERNALSYM CGDisplayVendorNumber}
function CGDisplayWaitForBeamPositionOutsideLines(display: CGDirectDisplayID; upperScanLine: Longword; lowerScanLine: Longword): CGError; cdecl; external libCoreGraphics name '_CGDisplayWaitForBeamPositionOutsideLines';
{$EXTERNALSYM CGDisplayWaitForBeamPositionOutsideLines}
function CGEnableEventStateCombining(combineState: Integer): CGError; cdecl; external libCoreGraphics name '_CGEnableEventStateCombining';
{$EXTERNALSYM CGEnableEventStateCombining}
function CGEventCreate(source: CGEventSourceRef): CGEventRef; cdecl; external libCoreGraphics name '_CGEventCreate';
{$EXTERNALSYM CGEventCreate}
function CGEventCreateCopy(event: CGEventRef): CGEventRef; cdecl; external libCoreGraphics name '_CGEventCreateCopy';
{$EXTERNALSYM CGEventCreateCopy}
function CGEventCreateData(allocator: CFAllocatorRef; event: CGEventRef): CFDataRef; cdecl; external libCoreGraphics name '_CGEventCreateData';
{$EXTERNALSYM CGEventCreateData}
function CGEventCreateFromData(allocator: CFAllocatorRef; data: CFDataRef): CGEventRef; cdecl; external libCoreGraphics name '_CGEventCreateFromData';
{$EXTERNALSYM CGEventCreateFromData}
function CGEventCreateKeyboardEvent(source: CGEventSourceRef; virtualKey: CGKeyCode; keyDown: Integer): CGEventRef; cdecl; external libCoreGraphics name '_CGEventCreateKeyboardEvent';
{$EXTERNALSYM CGEventCreateKeyboardEvent}
function CGEventCreateMouseEvent(source: CGEventSourceRef; mouseType: CGEventType; mouseCursorPosition: CGPoint; mouseButton: CGMouseButton): CGEventRef; cdecl; external libCoreGraphics name '_CGEventCreateMouseEvent';
{$EXTERNALSYM CGEventCreateMouseEvent}
function CGEventCreateScrollWheelEvent(source: CGEventSourceRef; units: CGScrollEventUnit; wheelCount: Longword; wheel1: Integer): CGEventRef; cdecl; varargs; external libCoreGraphics name '_CGEventCreateScrollWheelEvent';
{$EXTERNALSYM CGEventCreateScrollWheelEvent}
function CGEventCreateSourceFromEvent(event: CGEventRef): CGEventSourceRef; cdecl; external libCoreGraphics name '_CGEventCreateSourceFromEvent';
{$EXTERNALSYM CGEventCreateSourceFromEvent}
function CGEventGetDoubleValueField(event: CGEventRef; field: CGEventField): double; cdecl; external libCoreGraphics name '_CGEventGetDoubleValueField';
{$EXTERNALSYM CGEventGetDoubleValueField}
function CGEventGetFlags(event: CGEventRef): CGEventFlags; cdecl; external libCoreGraphics name '_CGEventGetFlags';
{$EXTERNALSYM CGEventGetFlags}
function CGEventGetIntegerValueField(event: CGEventRef; field: CGEventField): Int64; cdecl; external libCoreGraphics name '_CGEventGetIntegerValueField';
{$EXTERNALSYM CGEventGetIntegerValueField}
function CGEventGetLocation(event: CGEventRef): CGPoint; cdecl; external libCoreGraphics name '_CGEventGetLocation';
{$EXTERNALSYM CGEventGetLocation}
function CGEventGetTimestamp(event: CGEventRef): CGEventTimestamp; cdecl; external libCoreGraphics name '_CGEventGetTimestamp';
{$EXTERNALSYM CGEventGetTimestamp}
function CGEventGetType(event: CGEventRef): CGEventType; cdecl; external libCoreGraphics name '_CGEventGetType';
{$EXTERNALSYM CGEventGetType}
function CGEventGetTypeID: CFTypeID; cdecl; external libCoreGraphics name '_CGEventGetTypeID';
{$EXTERNALSYM CGEventGetTypeID}
function CGEventGetUnflippedLocation(event: CGEventRef): CGPoint; cdecl; external libCoreGraphics name '_CGEventGetUnflippedLocation';
{$EXTERNALSYM CGEventGetUnflippedLocation}
procedure CGEventKeyboardGetUnicodeString(event: CGEventRef; maxStringLength: UniCharCount; actualStringLength: UniCharCountPtr; unicodeString: PUniChar); cdecl; external libCoreGraphics name '_CGEventKeyboardGetUnicodeString';
{$EXTERNALSYM CGEventKeyboardGetUnicodeString}
procedure CGEventKeyboardSetUnicodeString(event: CGEventRef; stringLength: UniCharCount; unicodeString: PUniChar); cdecl; external libCoreGraphics name '_CGEventKeyboardSetUnicodeString';
{$EXTERNALSYM CGEventKeyboardSetUnicodeString}
procedure CGEventPost(tap: CGEventTapLocation; event: CGEventRef); cdecl; external libCoreGraphics name '_CGEventPost';
{$EXTERNALSYM CGEventPost}
procedure CGEventPostToPSN(processSerialNumber: Pointer; event: CGEventRef); cdecl; external libCoreGraphics name '_CGEventPostToPSN';
{$EXTERNALSYM CGEventPostToPSN}
procedure CGEventSetDoubleValueField(event: CGEventRef; field: CGEventField; value: double); cdecl; external libCoreGraphics name '_CGEventSetDoubleValueField';
{$EXTERNALSYM CGEventSetDoubleValueField}
procedure CGEventSetFlags(event: CGEventRef; flags: CGEventFlags); cdecl; external libCoreGraphics name '_CGEventSetFlags';
{$EXTERNALSYM CGEventSetFlags}
procedure CGEventSetIntegerValueField(event: CGEventRef; field: CGEventField; value: Int64); cdecl; external libCoreGraphics name '_CGEventSetIntegerValueField';
{$EXTERNALSYM CGEventSetIntegerValueField}
procedure CGEventSetLocation(event: CGEventRef; location: CGPoint); cdecl; external libCoreGraphics name '_CGEventSetLocation';
{$EXTERNALSYM CGEventSetLocation}
procedure CGEventSetSource(event: CGEventRef; source: CGEventSourceRef); cdecl; external libCoreGraphics name '_CGEventSetSource';
{$EXTERNALSYM CGEventSetSource}
procedure CGEventSetTimestamp(event: CGEventRef; timestamp: CGEventTimestamp); cdecl; external libCoreGraphics name '_CGEventSetTimestamp';
{$EXTERNALSYM CGEventSetTimestamp}
procedure CGEventSetType(event: CGEventRef; type_: CGEventType); cdecl; external libCoreGraphics name '_CGEventSetType';
{$EXTERNALSYM CGEventSetType}
function CGEventSourceButtonState(stateID: CGEventSourceStateID; button: CGMouseButton): Integer; cdecl; external libCoreGraphics name '_CGEventSourceButtonState';
{$EXTERNALSYM CGEventSourceButtonState}
function CGEventSourceCounterForEventType(stateID: CGEventSourceStateID; eventType: CGEventType): Longword; cdecl; external libCoreGraphics name '_CGEventSourceCounterForEventType';
{$EXTERNALSYM CGEventSourceCounterForEventType}
function CGEventSourceCreate(stateID: CGEventSourceStateID): CGEventSourceRef; cdecl; external libCoreGraphics name '_CGEventSourceCreate';
{$EXTERNALSYM CGEventSourceCreate}
function CGEventSourceFlagsState(stateID: CGEventSourceStateID): CGEventFlags; cdecl; external libCoreGraphics name '_CGEventSourceFlagsState';
{$EXTERNALSYM CGEventSourceFlagsState}
function CGEventSourceGetKeyboardType(source: CGEventSourceRef): CGEventSourceKeyboardType; cdecl; external libCoreGraphics name '_CGEventSourceGetKeyboardType';
{$EXTERNALSYM CGEventSourceGetKeyboardType}
function CGEventSourceGetLocalEventsFilterDuringSuppressionState(source: CGEventSourceRef; state: CGEventSuppressionState): CGEventFilterMask; cdecl; external libCoreGraphics name '_CGEventSourceGetLocalEventsFilterDuringSuppressionState';
{$EXTERNALSYM CGEventSourceGetLocalEventsFilterDuringSuppressionState}
function CGEventSourceGetLocalEventsSuppressionInterval(source: CGEventSourceRef): CFTimeInterval; cdecl; external libCoreGraphics name '_CGEventSourceGetLocalEventsSuppressionInterval';
{$EXTERNALSYM CGEventSourceGetLocalEventsSuppressionInterval}
function CGEventSourceGetPixelsPerLine(source: CGEventSourceRef): double; cdecl; external libCoreGraphics name '_CGEventSourceGetPixelsPerLine';
{$EXTERNALSYM CGEventSourceGetPixelsPerLine}
function CGEventSourceGetSourceStateID(source: CGEventSourceRef): CGEventSourceStateID; cdecl; external libCoreGraphics name '_CGEventSourceGetSourceStateID';
{$EXTERNALSYM CGEventSourceGetSourceStateID}
function CGEventSourceGetTypeID: CFTypeID; cdecl; external libCoreGraphics name '_CGEventSourceGetTypeID';
{$EXTERNALSYM CGEventSourceGetTypeID}
function CGEventSourceGetUserData(source: CGEventSourceRef): Int64; cdecl; external libCoreGraphics name '_CGEventSourceGetUserData';
{$EXTERNALSYM CGEventSourceGetUserData}
function CGEventSourceKeyState(stateID: CGEventSourceStateID; key: CGKeyCode): Integer; cdecl; external libCoreGraphics name '_CGEventSourceKeyState';
{$EXTERNALSYM CGEventSourceKeyState}
function CGEventSourceSecondsSinceLastEventType(stateID: CGEventSourceStateID; eventType: CGEventType): CFTimeInterval; cdecl; external libCoreGraphics name '_CGEventSourceSecondsSinceLastEventType';
{$EXTERNALSYM CGEventSourceSecondsSinceLastEventType}
procedure CGEventSourceSetKeyboardType(source: CGEventSourceRef; keyboardType: CGEventSourceKeyboardType); cdecl; external libCoreGraphics name '_CGEventSourceSetKeyboardType';
{$EXTERNALSYM CGEventSourceSetKeyboardType}
procedure CGEventSourceSetLocalEventsFilterDuringSuppressionState(source: CGEventSourceRef; filter: CGEventFilterMask; state: CGEventSuppressionState); cdecl; external libCoreGraphics name '_CGEventSourceSetLocalEventsFilterDuringSuppressionState';
{$EXTERNALSYM CGEventSourceSetLocalEventsFilterDuringSuppressionState}
procedure CGEventSourceSetLocalEventsSuppressionInterval(source: CGEventSourceRef; seconds: CFTimeInterval); cdecl; external libCoreGraphics name '_CGEventSourceSetLocalEventsSuppressionInterval';
{$EXTERNALSYM CGEventSourceSetLocalEventsSuppressionInterval}
procedure CGEventSourceSetPixelsPerLine(source: CGEventSourceRef; pixelsPerLine: double); cdecl; external libCoreGraphics name '_CGEventSourceSetPixelsPerLine';
{$EXTERNALSYM CGEventSourceSetPixelsPerLine}
procedure CGEventSourceSetUserData(source: CGEventSourceRef; userData: Int64); cdecl; external libCoreGraphics name '_CGEventSourceSetUserData';
{$EXTERNALSYM CGEventSourceSetUserData}
function CGEventTapCreate(tap: CGEventTapLocation; place: CGEventTapPlacement; options: CGEventTapOptions; eventsOfInterest: CGEventMask; callback: CGEventTapCallBack; userInfo: Pointer): CFMachPortRef; cdecl; external libCoreGraphics name '_CGEventTapCreate';
{$EXTERNALSYM CGEventTapCreate}
function CGEventTapCreateForPSN(processSerialNumber: Pointer; place: CGEventTapPlacement; options: CGEventTapOptions; eventsOfInterest: CGEventMask; callback: CGEventTapCallBack; userInfo: Pointer): CFMachPortRef; cdecl; external libCoreGraphics name '_CGEventTapCreateForPSN';
{$EXTERNALSYM CGEventTapCreateForPSN}
procedure CGEventTapEnable(tap: CFMachPortRef; enable: Integer); cdecl; external libCoreGraphics name '_CGEventTapEnable';
{$EXTERNALSYM CGEventTapEnable}
function CGEventTapIsEnabled(tap: CFMachPortRef): Integer; cdecl; external libCoreGraphics name '_CGEventTapIsEnabled';
{$EXTERNALSYM CGEventTapIsEnabled}
procedure CGEventTapPostEvent(proxy: CGEventTapProxy; event: CGEventRef); cdecl; external libCoreGraphics name '_CGEventTapPostEvent';
{$EXTERNALSYM CGEventTapPostEvent}
function CGFontCanCreatePostScriptSubset(font: CGFontRef; format: CGFontPostScriptFormat): Integer; cdecl; external libCoreGraphics name '_CGFontCanCreatePostScriptSubset';
{$EXTERNALSYM CGFontCanCreatePostScriptSubset}
function CGFontCopyFullName(font: CGFontRef): CFStringRef; cdecl; external libCoreGraphics name '_CGFontCopyFullName';
{$EXTERNALSYM CGFontCopyFullName}
function CGFontCopyGlyphNameForGlyph(font: CGFontRef; glyph: CGGlyph): CFStringRef; cdecl; external libCoreGraphics name '_CGFontCopyGlyphNameForGlyph';
{$EXTERNALSYM CGFontCopyGlyphNameForGlyph}
function CGFontCopyPostScriptName(font: CGFontRef): CFStringRef; cdecl; external libCoreGraphics name '_CGFontCopyPostScriptName';
{$EXTERNALSYM CGFontCopyPostScriptName}
function CGFontCopyTableForTag(font: CGFontRef; tag: Longword): CFDataRef; cdecl; external libCoreGraphics name '_CGFontCopyTableForTag';
{$EXTERNALSYM CGFontCopyTableForTag}
function CGFontCopyTableTags(font: CGFontRef): CFArrayRef; cdecl; external libCoreGraphics name '_CGFontCopyTableTags';
{$EXTERNALSYM CGFontCopyTableTags}
function CGFontCopyVariationAxes(font: CGFontRef): CFArrayRef; cdecl; external libCoreGraphics name '_CGFontCopyVariationAxes';
{$EXTERNALSYM CGFontCopyVariationAxes}
function CGFontCopyVariations(font: CGFontRef): CFDictionaryRef; cdecl; external libCoreGraphics name '_CGFontCopyVariations';
{$EXTERNALSYM CGFontCopyVariations}
function CGFontCreateCopyWithVariations(font: CGFontRef; variations: CFDictionaryRef): CGFontRef; cdecl; external libCoreGraphics name '_CGFontCreateCopyWithVariations';
{$EXTERNALSYM CGFontCreateCopyWithVariations}
function CGFontCreatePostScriptEncoding(font: CGFontRef; encoding: PCGGlyph): CFDataRef; cdecl; external libCoreGraphics name '_CGFontCreatePostScriptEncoding';
{$EXTERNALSYM CGFontCreatePostScriptEncoding}
function CGFontCreatePostScriptSubset(font: CGFontRef; subsetName: CFStringRef; format: CGFontPostScriptFormat; glyphs: PCGGlyph; count: Longword; encoding: PCGGlyph): CFDataRef; cdecl; external libCoreGraphics name '_CGFontCreatePostScriptSubset';
{$EXTERNALSYM CGFontCreatePostScriptSubset}
function CGFontCreateWithDataProvider(provider: CGDataProviderRef): CGFontRef; cdecl; external libCoreGraphics name '_CGFontCreateWithDataProvider';
{$EXTERNALSYM CGFontCreateWithDataProvider}
function CGFontCreateWithFontName(name: CFStringRef): CGFontRef; cdecl; external libCoreGraphics name '_CGFontCreateWithFontName';
{$EXTERNALSYM CGFontCreateWithFontName}
function CGFontCreateWithPlatformFont(platformFontReference: Pointer): CGFontRef; cdecl; external libCoreGraphics name '_CGFontCreateWithPlatformFont';
{$EXTERNALSYM CGFontCreateWithPlatformFont}
function CGFontGetAscent(font: CGFontRef): Integer; cdecl; external libCoreGraphics name '_CGFontGetAscent';
{$EXTERNALSYM CGFontGetAscent}
function CGFontGetCapHeight(font: CGFontRef): Integer; cdecl; external libCoreGraphics name '_CGFontGetCapHeight';
{$EXTERNALSYM CGFontGetCapHeight}
function CGFontGetDescent(font: CGFontRef): Integer; cdecl; external libCoreGraphics name '_CGFontGetDescent';
{$EXTERNALSYM CGFontGetDescent}
function CGFontGetFontBBox(font: CGFontRef): CGRect; cdecl; external libCoreGraphics name '_CGFontGetFontBBox';
{$EXTERNALSYM CGFontGetFontBBox}
function CGFontGetGlyphAdvances(font: CGFontRef; glyphs: PCGGlyph; count: Longword; advances: PInteger): Integer; cdecl; external libCoreGraphics name '_CGFontGetGlyphAdvances';
{$EXTERNALSYM CGFontGetGlyphAdvances}
function CGFontGetGlyphBBoxes(font: CGFontRef; glyphs: PCGGlyph; count: Longword; bboxes: PCGRect): Integer; cdecl; external libCoreGraphics name '_CGFontGetGlyphBBoxes';
{$EXTERNALSYM CGFontGetGlyphBBoxes}
function CGFontGetGlyphWithGlyphName(font: CGFontRef; name: CFStringRef): CGGlyph; cdecl; external libCoreGraphics name '_CGFontGetGlyphWithGlyphName';
{$EXTERNALSYM CGFontGetGlyphWithGlyphName}
function CGFontGetItalicAngle(font: CGFontRef): Single; cdecl; external libCoreGraphics name '_CGFontGetItalicAngle';
{$EXTERNALSYM CGFontGetItalicAngle}
function CGFontGetLeading(font: CGFontRef): Integer; cdecl; external libCoreGraphics name '_CGFontGetLeading';
{$EXTERNALSYM CGFontGetLeading}
function CGFontGetNumberOfGlyphs(font: CGFontRef): Longword; cdecl; external libCoreGraphics name '_CGFontGetNumberOfGlyphs';
{$EXTERNALSYM CGFontGetNumberOfGlyphs}
function CGFontGetStemV(font: CGFontRef): Single; cdecl; external libCoreGraphics name '_CGFontGetStemV';
{$EXTERNALSYM CGFontGetStemV}
function CGFontGetTypeID: CFTypeID; cdecl; external libCoreGraphics name '_CGFontGetTypeID';
{$EXTERNALSYM CGFontGetTypeID}
function CGFontGetUnitsPerEm(font: CGFontRef): Integer; cdecl; external libCoreGraphics name '_CGFontGetUnitsPerEm';
{$EXTERNALSYM CGFontGetUnitsPerEm}
function CGFontGetXHeight(font: CGFontRef): Integer; cdecl; external libCoreGraphics name '_CGFontGetXHeight';
{$EXTERNALSYM CGFontGetXHeight}
procedure CGFontRelease(font: CGFontRef); cdecl; external libCoreGraphics name '_CGFontRelease';
{$EXTERNALSYM CGFontRelease}
function CGFontRetain(font: CGFontRef): CGFontRef; cdecl; external libCoreGraphics name '_CGFontRetain';
{$EXTERNALSYM CGFontRetain}
function CGFunctionCreate(info: Pointer; domainDimension: Longword; domain: PSingle; rangeDimension: Longword; range: PSingle; callbacks: PCGFunctionCallbacks): CGFunctionRef; cdecl; external libCoreGraphics name '_CGFunctionCreate';
{$EXTERNALSYM CGFunctionCreate}
function CGFunctionGetTypeID: CFTypeID; cdecl; external libCoreGraphics name '_CGFunctionGetTypeID';
{$EXTERNALSYM CGFunctionGetTypeID}
procedure CGFunctionRelease(function_: CGFunctionRef); cdecl; external libCoreGraphics name '_CGFunctionRelease';
{$EXTERNALSYM CGFunctionRelease}
function CGFunctionRetain(function_: CGFunctionRef): CGFunctionRef; cdecl; external libCoreGraphics name '_CGFunctionRetain';
{$EXTERNALSYM CGFunctionRetain}
function CGGLContextCreate(glContext: Pointer; size: CGSize; colorspace: CGColorSpaceRef): CGContextRef; cdecl; external libCoreGraphics name '_CGGLContextCreate';
{$EXTERNALSYM CGGLContextCreate}
procedure CGGLContextUpdateViewportSize(c: CGContextRef; size: CGSize); cdecl; external libCoreGraphics name '_CGGLContextUpdateViewportSize';
{$EXTERNALSYM CGGLContextUpdateViewportSize}
function CGGetActiveDisplayList(maxDisplays: Longword; activeDisplays: PCGDirectDisplayID; displayCount: PLongword): CGError; cdecl; external libCoreGraphics name '_CGGetActiveDisplayList';
{$EXTERNALSYM CGGetActiveDisplayList}
function CGGetDisplayTransferByFormula(display: CGDirectDisplayID; redMin: PCGGammaValue; redMax: PCGGammaValue; redGamma: PCGGammaValue; greenMin: PCGGammaValue; greenMax: PCGGammaValue; greenGamma: PCGGammaValue; blueMin: PCGGammaValue; blueMax: PCGGammaValue; blueGamma: PCGGammaValue): CGError; cdecl; external libCoreGraphics name '_CGGetDisplayTransferByFormula';
{$EXTERNALSYM CGGetDisplayTransferByFormula}
function CGGetDisplayTransferByTable(display: CGDirectDisplayID; capacity: Longword; redTable: PCGGammaValue; greenTable: PCGGammaValue; blueTable: PCGGammaValue; sampleCount: PLongword): CGError; cdecl; external libCoreGraphics name '_CGGetDisplayTransferByTable';
{$EXTERNALSYM CGGetDisplayTransferByTable}
function CGGetDisplaysWithOpenGLDisplayMask(mask: CGOpenGLDisplayMask; maxDisplays: Longword; displays: PCGDirectDisplayID; matchingDisplayCount: PLongword): CGError; cdecl; external libCoreGraphics name '_CGGetDisplaysWithOpenGLDisplayMask';
{$EXTERNALSYM CGGetDisplaysWithOpenGLDisplayMask}
function CGGetDisplaysWithPoint(point: CGPoint; maxDisplays: Longword; displays: PCGDirectDisplayID; matchingDisplayCount: PLongword): CGError; cdecl; external libCoreGraphics name '_CGGetDisplaysWithPoint';
{$EXTERNALSYM CGGetDisplaysWithPoint}
function CGGetDisplaysWithRect(rect: CGRect; maxDisplays: Longword; displays: PCGDirectDisplayID; matchingDisplayCount: PLongword): CGError; cdecl; external libCoreGraphics name '_CGGetDisplaysWithRect';
{$EXTERNALSYM CGGetDisplaysWithRect}
function CGGetEventTapList(maxNumberOfTaps: Longword; tapList: PCGEventTapInformation; eventTapCount: PLongword): CGError; cdecl; external libCoreGraphics name '_CGGetEventTapList';
{$EXTERNALSYM CGGetEventTapList}
procedure CGGetLastMouseDelta(deltaX: PInteger; deltaY: PInteger); cdecl; external libCoreGraphics name '_CGGetLastMouseDelta';
{$EXTERNALSYM CGGetLastMouseDelta}
function CGGetOnlineDisplayList(maxDisplays: Longword; onlineDisplays: PCGDirectDisplayID; displayCount: PLongword): CGError; cdecl; external libCoreGraphics name '_CGGetOnlineDisplayList';
{$EXTERNALSYM CGGetOnlineDisplayList}
function CGGradientCreateWithColorComponents(space: CGColorSpaceRef; components: PSingle; locations: PSingle; count: Longword): CGGradientRef; cdecl; external libCoreGraphics name '_CGGradientCreateWithColorComponents';
{$EXTERNALSYM CGGradientCreateWithColorComponents}
function CGGradientCreateWithColors(space: CGColorSpaceRef; colors: CFArrayRef; locations: PSingle): CGGradientRef; cdecl; external libCoreGraphics name '_CGGradientCreateWithColors';
{$EXTERNALSYM CGGradientCreateWithColors}
function CGGradientGetTypeID: CFTypeID; cdecl; external libCoreGraphics name '_CGGradientGetTypeID';
{$EXTERNALSYM CGGradientGetTypeID}
procedure CGGradientRelease(gradient: CGGradientRef); cdecl; external libCoreGraphics name '_CGGradientRelease';
{$EXTERNALSYM CGGradientRelease}
function CGGradientRetain(gradient: CGGradientRef): CGGradientRef; cdecl; external libCoreGraphics name '_CGGradientRetain';
{$EXTERNALSYM CGGradientRetain}
function CGImageCreate(width: Longword; height: Longword; bitsPerComponent: Longword; bitsPerPixel: Longword; bytesPerRow: Longword; space: CGColorSpaceRef; bitmapInfo: CGBitmapInfo; provider: CGDataProviderRef; decode: PSingle; shouldInterpolate: Integer; intent: CGColorRenderingIntent): CGImageRef; cdecl; external libCoreGraphics name '_CGImageCreate';
{$EXTERNALSYM CGImageCreate}
function CGImageCreateCopy(image: CGImageRef): CGImageRef; cdecl; external libCoreGraphics name '_CGImageCreateCopy';
{$EXTERNALSYM CGImageCreateCopy}
function CGImageCreateCopyWithColorSpace(image: CGImageRef; space: CGColorSpaceRef): CGImageRef; cdecl; external libCoreGraphics name '_CGImageCreateCopyWithColorSpace';
{$EXTERNALSYM CGImageCreateCopyWithColorSpace}
function CGImageCreateWithImageInRect(image: CGImageRef; rect: CGRect): CGImageRef; cdecl; external libCoreGraphics name '_CGImageCreateWithImageInRect';
{$EXTERNALSYM CGImageCreateWithImageInRect}
function CGImageCreateWithJPEGDataProvider(source: CGDataProviderRef; decode: PSingle; shouldInterpolate: Integer; intent: CGColorRenderingIntent): CGImageRef; cdecl; external libCoreGraphics name '_CGImageCreateWithJPEGDataProvider';
{$EXTERNALSYM CGImageCreateWithJPEGDataProvider}
function CGImageCreateWithMask(image: CGImageRef; mask: CGImageRef): CGImageRef; cdecl; external libCoreGraphics name '_CGImageCreateWithMask';
{$EXTERNALSYM CGImageCreateWithMask}
function CGImageCreateWithMaskingColors(image: CGImageRef; components: PSingle): CGImageRef; cdecl; external libCoreGraphics name '_CGImageCreateWithMaskingColors';
{$EXTERNALSYM CGImageCreateWithMaskingColors}
function CGImageCreateWithPNGDataProvider(source: CGDataProviderRef; decode: PSingle; shouldInterpolate: Integer; intent: CGColorRenderingIntent): CGImageRef; cdecl; external libCoreGraphics name '_CGImageCreateWithPNGDataProvider';
{$EXTERNALSYM CGImageCreateWithPNGDataProvider}
function CGImageGetAlphaInfo(image: CGImageRef): CGImageAlphaInfo; cdecl; external libCoreGraphics name '_CGImageGetAlphaInfo';
{$EXTERNALSYM CGImageGetAlphaInfo}
function CGImageGetBitmapInfo(image: CGImageRef): CGBitmapInfo; cdecl; external libCoreGraphics name '_CGImageGetBitmapInfo';
{$EXTERNALSYM CGImageGetBitmapInfo}
function CGImageGetBitsPerComponent(image: CGImageRef): Longword; cdecl; external libCoreGraphics name '_CGImageGetBitsPerComponent';
{$EXTERNALSYM CGImageGetBitsPerComponent}
function CGImageGetBitsPerPixel(image: CGImageRef): Longword; cdecl; external libCoreGraphics name '_CGImageGetBitsPerPixel';
{$EXTERNALSYM CGImageGetBitsPerPixel}
function CGImageGetBytesPerRow(image: CGImageRef): Longword; cdecl; external libCoreGraphics name '_CGImageGetBytesPerRow';
{$EXTERNALSYM CGImageGetBytesPerRow}
function CGImageGetColorSpace(image: CGImageRef): CGColorSpaceRef; cdecl; external libCoreGraphics name '_CGImageGetColorSpace';
{$EXTERNALSYM CGImageGetColorSpace}
function CGImageGetDataProvider(image: CGImageRef): CGDataProviderRef; cdecl; external libCoreGraphics name '_CGImageGetDataProvider';
{$EXTERNALSYM CGImageGetDataProvider}
function CGImageGetDecode(image: CGImageRef): PSingle; cdecl; external libCoreGraphics name '_CGImageGetDecode';
{$EXTERNALSYM CGImageGetDecode}
function CGImageGetHeight(image: CGImageRef): Longword; cdecl; external libCoreGraphics name '_CGImageGetHeight';
{$EXTERNALSYM CGImageGetHeight}
function CGImageGetRenderingIntent(image: CGImageRef): CGColorRenderingIntent; cdecl; external libCoreGraphics name '_CGImageGetRenderingIntent';
{$EXTERNALSYM CGImageGetRenderingIntent}
function CGImageGetShouldInterpolate(image: CGImageRef): Integer; cdecl; external libCoreGraphics name '_CGImageGetShouldInterpolate';
{$EXTERNALSYM CGImageGetShouldInterpolate}
function CGImageGetTypeID: CFTypeID; cdecl; external libCoreGraphics name '_CGImageGetTypeID';
{$EXTERNALSYM CGImageGetTypeID}
function CGImageGetWidth(image: CGImageRef): Longword; cdecl; external libCoreGraphics name '_CGImageGetWidth';
{$EXTERNALSYM CGImageGetWidth}
function CGImageIsMask(image: CGImageRef): Integer; cdecl; external libCoreGraphics name '_CGImageIsMask';
{$EXTERNALSYM CGImageIsMask}
function CGImageMaskCreate(width: Longword; height: Longword; bitsPerComponent: Longword; bitsPerPixel: Longword; bytesPerRow: Longword; provider: CGDataProviderRef; decode: PSingle; shouldInterpolate: Integer): CGImageRef; cdecl; external libCoreGraphics name '_CGImageMaskCreate';
{$EXTERNALSYM CGImageMaskCreate}
procedure CGImageRelease(image: CGImageRef); cdecl; external libCoreGraphics name '_CGImageRelease';
{$EXTERNALSYM CGImageRelease}
function CGImageRetain(image: CGImageRef): CGImageRef; cdecl; external libCoreGraphics name '_CGImageRetain';
{$EXTERNALSYM CGImageRetain}
function CGInhibitLocalEvents(inhibit: Integer): CGError; cdecl; external libCoreGraphics name '_CGInhibitLocalEvents';
{$EXTERNALSYM CGInhibitLocalEvents}
function CGLayerCreateWithContext(context: CGContextRef; size: CGSize; auxiliaryInfo: CFDictionaryRef): CGLayerRef; cdecl; external libCoreGraphics name '_CGLayerCreateWithContext';
{$EXTERNALSYM CGLayerCreateWithContext}
function CGLayerGetContext(layer: CGLayerRef): CGContextRef; cdecl; external libCoreGraphics name '_CGLayerGetContext';
{$EXTERNALSYM CGLayerGetContext}
function CGLayerGetSize(layer: CGLayerRef): CGSize; cdecl; external libCoreGraphics name '_CGLayerGetSize';
{$EXTERNALSYM CGLayerGetSize}
function CGLayerGetTypeID: CFTypeID; cdecl; external libCoreGraphics name '_CGLayerGetTypeID';
{$EXTERNALSYM CGLayerGetTypeID}
procedure CGLayerRelease(layer: CGLayerRef); cdecl; external libCoreGraphics name '_CGLayerRelease';
{$EXTERNALSYM CGLayerRelease}
function CGLayerRetain(layer: CGLayerRef): CGLayerRef; cdecl; external libCoreGraphics name '_CGLayerRetain';
{$EXTERNALSYM CGLayerRetain}
function CGMainDisplayID: CGDirectDisplayID; cdecl; external libCoreGraphics name '_CGMainDisplayID';
{$EXTERNALSYM CGMainDisplayID}
function CGOpenGLDisplayMaskToDisplayID(mask: CGOpenGLDisplayMask): CGDirectDisplayID; cdecl; external libCoreGraphics name '_CGOpenGLDisplayMaskToDisplayID';
{$EXTERNALSYM CGOpenGLDisplayMaskToDisplayID}
function CGPDFArrayGetArray(array_: CGPDFArrayRef; index: Longword; value: PCGPDFArrayRef): Integer; cdecl; external libCoreGraphics name '_CGPDFArrayGetArray';
{$EXTERNALSYM CGPDFArrayGetArray}
function CGPDFArrayGetBoolean(array_: CGPDFArrayRef; index: Longword; value: PCGPDFBoolean): Integer; cdecl; external libCoreGraphics name '_CGPDFArrayGetBoolean';
{$EXTERNALSYM CGPDFArrayGetBoolean}
function CGPDFArrayGetCount(array_: CGPDFArrayRef): Longword; cdecl; external libCoreGraphics name '_CGPDFArrayGetCount';
{$EXTERNALSYM CGPDFArrayGetCount}
function CGPDFArrayGetDictionary(array_: CGPDFArrayRef; index: Longword; value: PCGPDFDictionaryRef): Integer; cdecl; external libCoreGraphics name '_CGPDFArrayGetDictionary';
{$EXTERNALSYM CGPDFArrayGetDictionary}
function CGPDFArrayGetInteger(array_: CGPDFArrayRef; index: Longword; value: PCGPDFInteger): Integer; cdecl; external libCoreGraphics name '_CGPDFArrayGetInteger';
{$EXTERNALSYM CGPDFArrayGetInteger}
function CGPDFArrayGetName(array_: CGPDFArrayRef; index: Longword; value: Pchar): Integer; cdecl; external libCoreGraphics name '_CGPDFArrayGetName';
{$EXTERNALSYM CGPDFArrayGetName}
function CGPDFArrayGetNull(array_: CGPDFArrayRef; index: Longword): Integer; cdecl; external libCoreGraphics name '_CGPDFArrayGetNull';
{$EXTERNALSYM CGPDFArrayGetNull}
function CGPDFArrayGetNumber(array_: CGPDFArrayRef; index: Longword; value: PCGPDFReal): Integer; cdecl; external libCoreGraphics name '_CGPDFArrayGetNumber';
{$EXTERNALSYM CGPDFArrayGetNumber}
function CGPDFArrayGetObject(array_: CGPDFArrayRef; index: Longword; value: PCGPDFObjectRef): Integer; cdecl; external libCoreGraphics name '_CGPDFArrayGetObject';
{$EXTERNALSYM CGPDFArrayGetObject}
function CGPDFArrayGetStream(array_: CGPDFArrayRef; index: Longword; value: PCGPDFStreamRef): Integer; cdecl; external libCoreGraphics name '_CGPDFArrayGetStream';
{$EXTERNALSYM CGPDFArrayGetStream}
function CGPDFArrayGetString(array_: CGPDFArrayRef; index: Longword; value: PCGPDFStringRef): Integer; cdecl; external libCoreGraphics name '_CGPDFArrayGetString';
{$EXTERNALSYM CGPDFArrayGetString}
function CGPDFContentStreamCreateWithPage(page: CGPDFPageRef): CGPDFContentStreamRef; cdecl; external libCoreGraphics name '_CGPDFContentStreamCreateWithPage';
{$EXTERNALSYM CGPDFContentStreamCreateWithPage}
function CGPDFContentStreamCreateWithStream(stream: CGPDFStreamRef; streamResources: CGPDFDictionaryRef; parent: CGPDFContentStreamRef): CGPDFContentStreamRef; cdecl; external libCoreGraphics name '_CGPDFContentStreamCreateWithStream';
{$EXTERNALSYM CGPDFContentStreamCreateWithStream}
function CGPDFContentStreamGetResource(cs: CGPDFContentStreamRef; category: PAnsiChar; name: PAnsiChar): CGPDFObjectRef; cdecl; external libCoreGraphics name '_CGPDFContentStreamGetResource';
{$EXTERNALSYM CGPDFContentStreamGetResource}
function CGPDFContentStreamGetStreams(cs: CGPDFContentStreamRef): CFArrayRef; cdecl; external libCoreGraphics name '_CGPDFContentStreamGetStreams';
{$EXTERNALSYM CGPDFContentStreamGetStreams}
procedure CGPDFContentStreamRelease(cs: CGPDFContentStreamRef); cdecl; external libCoreGraphics name '_CGPDFContentStreamRelease';
{$EXTERNALSYM CGPDFContentStreamRelease}
function CGPDFContentStreamRetain(cs: CGPDFContentStreamRef): CGPDFContentStreamRef; cdecl; external libCoreGraphics name '_CGPDFContentStreamRetain';
{$EXTERNALSYM CGPDFContentStreamRetain}
procedure CGPDFContextAddDestinationAtPoint(context: CGContextRef; name: CFStringRef; point: CGPoint); cdecl; external libCoreGraphics name '_CGPDFContextAddDestinationAtPoint';
{$EXTERNALSYM CGPDFContextAddDestinationAtPoint}
procedure CGPDFContextBeginPage(context: CGContextRef; pageInfo: CFDictionaryRef); cdecl; external libCoreGraphics name '_CGPDFContextBeginPage';
{$EXTERNALSYM CGPDFContextBeginPage}
procedure CGPDFContextClose(context: CGContextRef); cdecl; external libCoreGraphics name '_CGPDFContextClose';
{$EXTERNALSYM CGPDFContextClose}
function CGPDFContextCreate(consumer: CGDataConsumerRef; mediaBox: PCGRect; auxiliaryInfo: CFDictionaryRef): CGContextRef; cdecl; external libCoreGraphics name '_CGPDFContextCreate';
{$EXTERNALSYM CGPDFContextCreate}
function CGPDFContextCreateWithURL(url: CFURLRef; mediaBox: PCGRect; auxiliaryInfo: CFDictionaryRef): CGContextRef; cdecl; external libCoreGraphics name '_CGPDFContextCreateWithURL';
{$EXTERNALSYM CGPDFContextCreateWithURL}
procedure CGPDFContextEndPage(context: CGContextRef); cdecl; external libCoreGraphics name '_CGPDFContextEndPage';
{$EXTERNALSYM CGPDFContextEndPage}
procedure CGPDFContextSetDestinationForRect(context: CGContextRef; name: CFStringRef; rect: CGRect); cdecl; external libCoreGraphics name '_CGPDFContextSetDestinationForRect';
{$EXTERNALSYM CGPDFContextSetDestinationForRect}
procedure CGPDFContextSetURLForRect(context: CGContextRef; url: CFURLRef; rect: CGRect); cdecl; external libCoreGraphics name '_CGPDFContextSetURLForRect';
{$EXTERNALSYM CGPDFContextSetURLForRect}
procedure CGPDFDictionaryApplyFunction(dict: CGPDFDictionaryRef; function_: CGPDFDictionaryApplierFunction; info: Pointer); cdecl; external libCoreGraphics name '_CGPDFDictionaryApplyFunction';
{$EXTERNALSYM CGPDFDictionaryApplyFunction}
function CGPDFDictionaryGetArray(dict: CGPDFDictionaryRef; key: PAnsiChar; value: PCGPDFArrayRef): Integer; cdecl; external libCoreGraphics name '_CGPDFDictionaryGetArray';
{$EXTERNALSYM CGPDFDictionaryGetArray}
function CGPDFDictionaryGetBoolean(dict: CGPDFDictionaryRef; key: PAnsiChar; value: PCGPDFBoolean): Integer; cdecl; external libCoreGraphics name '_CGPDFDictionaryGetBoolean';
{$EXTERNALSYM CGPDFDictionaryGetBoolean}
function CGPDFDictionaryGetCount(dict: CGPDFDictionaryRef): Longword; cdecl; external libCoreGraphics name '_CGPDFDictionaryGetCount';
{$EXTERNALSYM CGPDFDictionaryGetCount}
function CGPDFDictionaryGetDictionary(dict: CGPDFDictionaryRef; key: PAnsiChar; value: PCGPDFDictionaryRef): Integer; cdecl; external libCoreGraphics name '_CGPDFDictionaryGetDictionary';
{$EXTERNALSYM CGPDFDictionaryGetDictionary}
function CGPDFDictionaryGetInteger(dict: CGPDFDictionaryRef; key: PAnsiChar; value: PCGPDFInteger): Integer; cdecl; external libCoreGraphics name '_CGPDFDictionaryGetInteger';
{$EXTERNALSYM CGPDFDictionaryGetInteger}
function CGPDFDictionaryGetName(dict: CGPDFDictionaryRef; key: PAnsiChar; value: Pchar): Integer; cdecl; external libCoreGraphics name '_CGPDFDictionaryGetName';
{$EXTERNALSYM CGPDFDictionaryGetName}
function CGPDFDictionaryGetNumber(dict: CGPDFDictionaryRef; key: PAnsiChar; value: PCGPDFReal): Integer; cdecl; external libCoreGraphics name '_CGPDFDictionaryGetNumber';
{$EXTERNALSYM CGPDFDictionaryGetNumber}
function CGPDFDictionaryGetObject(dict: CGPDFDictionaryRef; key: PAnsiChar; value: PCGPDFObjectRef): Integer; cdecl; external libCoreGraphics name '_CGPDFDictionaryGetObject';
{$EXTERNALSYM CGPDFDictionaryGetObject}
function CGPDFDictionaryGetStream(dict: CGPDFDictionaryRef; key: PAnsiChar; value: PCGPDFStreamRef): Integer; cdecl; external libCoreGraphics name '_CGPDFDictionaryGetStream';
{$EXTERNALSYM CGPDFDictionaryGetStream}
function CGPDFDictionaryGetString(dict: CGPDFDictionaryRef; key: PAnsiChar; value: PCGPDFStringRef): Integer; cdecl; external libCoreGraphics name '_CGPDFDictionaryGetString';
{$EXTERNALSYM CGPDFDictionaryGetString}
function CGPDFDocumentAllowsCopying(document: CGPDFDocumentRef): Integer; cdecl; external libCoreGraphics name '_CGPDFDocumentAllowsCopying';
{$EXTERNALSYM CGPDFDocumentAllowsCopying}
function CGPDFDocumentAllowsPrinting(document: CGPDFDocumentRef): Integer; cdecl; external libCoreGraphics name '_CGPDFDocumentAllowsPrinting';
{$EXTERNALSYM CGPDFDocumentAllowsPrinting}
function CGPDFDocumentCreateWithProvider(provider: CGDataProviderRef): CGPDFDocumentRef; cdecl; external libCoreGraphics name '_CGPDFDocumentCreateWithProvider';
{$EXTERNALSYM CGPDFDocumentCreateWithProvider}
function CGPDFDocumentCreateWithURL(url: CFURLRef): CGPDFDocumentRef; cdecl; external libCoreGraphics name '_CGPDFDocumentCreateWithURL';
{$EXTERNALSYM CGPDFDocumentCreateWithURL}
function CGPDFDocumentGetArtBox(document: CGPDFDocumentRef; page: Integer): CGRect; cdecl; external libCoreGraphics name '_CGPDFDocumentGetArtBox';
{$EXTERNALSYM CGPDFDocumentGetArtBox}
function CGPDFDocumentGetBleedBox(document: CGPDFDocumentRef; page: Integer): CGRect; cdecl; external libCoreGraphics name '_CGPDFDocumentGetBleedBox';
{$EXTERNALSYM CGPDFDocumentGetBleedBox}
function CGPDFDocumentGetCatalog(document: CGPDFDocumentRef): CGPDFDictionaryRef; cdecl; external libCoreGraphics name '_CGPDFDocumentGetCatalog';
{$EXTERNALSYM CGPDFDocumentGetCatalog}
function CGPDFDocumentGetCropBox(document: CGPDFDocumentRef; page: Integer): CGRect; cdecl; external libCoreGraphics name '_CGPDFDocumentGetCropBox';
{$EXTERNALSYM CGPDFDocumentGetCropBox}
function CGPDFDocumentGetID(document: CGPDFDocumentRef): CGPDFArrayRef; cdecl; external libCoreGraphics name '_CGPDFDocumentGetID';
{$EXTERNALSYM CGPDFDocumentGetID}
function CGPDFDocumentGetInfo(document: CGPDFDocumentRef): CGPDFDictionaryRef; cdecl; external libCoreGraphics name '_CGPDFDocumentGetInfo';
{$EXTERNALSYM CGPDFDocumentGetInfo}
function CGPDFDocumentGetMediaBox(document: CGPDFDocumentRef; page: Integer): CGRect; cdecl; external libCoreGraphics name '_CGPDFDocumentGetMediaBox';
{$EXTERNALSYM CGPDFDocumentGetMediaBox}
function CGPDFDocumentGetNumberOfPages(document: CGPDFDocumentRef): Longword; cdecl; external libCoreGraphics name '_CGPDFDocumentGetNumberOfPages';
{$EXTERNALSYM CGPDFDocumentGetNumberOfPages}
function CGPDFDocumentGetPage(document: CGPDFDocumentRef; pageNumber: Longword): CGPDFPageRef; cdecl; external libCoreGraphics name '_CGPDFDocumentGetPage';
{$EXTERNALSYM CGPDFDocumentGetPage}
function CGPDFDocumentGetRotationAngle(document: CGPDFDocumentRef; page: Integer): Integer; cdecl; external libCoreGraphics name '_CGPDFDocumentGetRotationAngle';
{$EXTERNALSYM CGPDFDocumentGetRotationAngle}
function CGPDFDocumentGetTrimBox(document: CGPDFDocumentRef; page: Integer): CGRect; cdecl; external libCoreGraphics name '_CGPDFDocumentGetTrimBox';
{$EXTERNALSYM CGPDFDocumentGetTrimBox}
function CGPDFDocumentGetTypeID: CFTypeID; cdecl; external libCoreGraphics name '_CGPDFDocumentGetTypeID';
{$EXTERNALSYM CGPDFDocumentGetTypeID}
procedure CGPDFDocumentGetVersion(document: CGPDFDocumentRef; majorVersion: PInteger; minorVersion: PInteger); cdecl; external libCoreGraphics name '_CGPDFDocumentGetVersion';
{$EXTERNALSYM CGPDFDocumentGetVersion}
function CGPDFDocumentIsEncrypted(document: CGPDFDocumentRef): Integer; cdecl; external libCoreGraphics name '_CGPDFDocumentIsEncrypted';
{$EXTERNALSYM CGPDFDocumentIsEncrypted}
function CGPDFDocumentIsUnlocked(document: CGPDFDocumentRef): Integer; cdecl; external libCoreGraphics name '_CGPDFDocumentIsUnlocked';
{$EXTERNALSYM CGPDFDocumentIsUnlocked}
procedure CGPDFDocumentRelease(document: CGPDFDocumentRef); cdecl; external libCoreGraphics name '_CGPDFDocumentRelease';
{$EXTERNALSYM CGPDFDocumentRelease}
function CGPDFDocumentRetain(document: CGPDFDocumentRef): CGPDFDocumentRef; cdecl; external libCoreGraphics name '_CGPDFDocumentRetain';
{$EXTERNALSYM CGPDFDocumentRetain}
function CGPDFDocumentUnlockWithPassword(document: CGPDFDocumentRef; password: PAnsiChar): Integer; cdecl; external libCoreGraphics name '_CGPDFDocumentUnlockWithPassword';
{$EXTERNALSYM CGPDFDocumentUnlockWithPassword}
function CGPDFObjectGetType(object_: CGPDFObjectRef): CGPDFObjectType; cdecl; external libCoreGraphics name '_CGPDFObjectGetType';
{$EXTERNALSYM CGPDFObjectGetType}
function CGPDFObjectGetValue(object_: CGPDFObjectRef; type_: CGPDFObjectType; value: Pointer): Integer; cdecl; external libCoreGraphics name '_CGPDFObjectGetValue';
{$EXTERNALSYM CGPDFObjectGetValue}
function CGPDFOperatorTableCreate: CGPDFOperatorTableRef; cdecl; external libCoreGraphics name '_CGPDFOperatorTableCreate';
{$EXTERNALSYM CGPDFOperatorTableCreate}
procedure CGPDFOperatorTableRelease(table: CGPDFOperatorTableRef); cdecl; external libCoreGraphics name '_CGPDFOperatorTableRelease';
{$EXTERNALSYM CGPDFOperatorTableRelease}
function CGPDFOperatorTableRetain(table: CGPDFOperatorTableRef): CGPDFOperatorTableRef; cdecl; external libCoreGraphics name '_CGPDFOperatorTableRetain';
{$EXTERNALSYM CGPDFOperatorTableRetain}
procedure CGPDFOperatorTableSetCallback(table: CGPDFOperatorTableRef; name: PAnsiChar; callback: CGPDFOperatorCallback); cdecl; external libCoreGraphics name '_CGPDFOperatorTableSetCallback';
{$EXTERNALSYM CGPDFOperatorTableSetCallback}
function CGPDFPageGetBoxRect(page: CGPDFPageRef; box: CGPDFBox): CGRect; cdecl; external libCoreGraphics name '_CGPDFPageGetBoxRect';
{$EXTERNALSYM CGPDFPageGetBoxRect}
function CGPDFPageGetDictionary(page: CGPDFPageRef): CGPDFDictionaryRef; cdecl; external libCoreGraphics name '_CGPDFPageGetDictionary';
{$EXTERNALSYM CGPDFPageGetDictionary}
function CGPDFPageGetDocument(page: CGPDFPageRef): CGPDFDocumentRef; cdecl; external libCoreGraphics name '_CGPDFPageGetDocument';
{$EXTERNALSYM CGPDFPageGetDocument}
function CGPDFPageGetDrawingTransform(page: CGPDFPageRef; box: CGPDFBox; rect: CGRect; rotate: Integer; preserveAspectRatio: Integer): CGAffineTransform; cdecl; external libCoreGraphics name '_CGPDFPageGetDrawingTransform';
{$EXTERNALSYM CGPDFPageGetDrawingTransform}
function CGPDFPageGetPageNumber(page: CGPDFPageRef): Longword; cdecl; external libCoreGraphics name '_CGPDFPageGetPageNumber';
{$EXTERNALSYM CGPDFPageGetPageNumber}
function CGPDFPageGetRotationAngle(page: CGPDFPageRef): Integer; cdecl; external libCoreGraphics name '_CGPDFPageGetRotationAngle';
{$EXTERNALSYM CGPDFPageGetRotationAngle}
function CGPDFPageGetTypeID: CFTypeID; cdecl; external libCoreGraphics name '_CGPDFPageGetTypeID';
{$EXTERNALSYM CGPDFPageGetTypeID}
procedure CGPDFPageRelease(page: CGPDFPageRef); cdecl; external libCoreGraphics name '_CGPDFPageRelease';
{$EXTERNALSYM CGPDFPageRelease}
function CGPDFPageRetain(page: CGPDFPageRef): CGPDFPageRef; cdecl; external libCoreGraphics name '_CGPDFPageRetain';
{$EXTERNALSYM CGPDFPageRetain}
function CGPDFScannerCreate(cs: CGPDFContentStreamRef; table: CGPDFOperatorTableRef; info: Pointer): CGPDFScannerRef; cdecl; external libCoreGraphics name '_CGPDFScannerCreate';
{$EXTERNALSYM CGPDFScannerCreate}
function CGPDFScannerGetContentStream(scanner: CGPDFScannerRef): CGPDFContentStreamRef; cdecl; external libCoreGraphics name '_CGPDFScannerGetContentStream';
{$EXTERNALSYM CGPDFScannerGetContentStream}
function CGPDFScannerPopArray(scanner: CGPDFScannerRef; value: PCGPDFArrayRef): Integer; cdecl; external libCoreGraphics name '_CGPDFScannerPopArray';
{$EXTERNALSYM CGPDFScannerPopArray}
function CGPDFScannerPopBoolean(scanner: CGPDFScannerRef; value: PCGPDFBoolean): Integer; cdecl; external libCoreGraphics name '_CGPDFScannerPopBoolean';
{$EXTERNALSYM CGPDFScannerPopBoolean}
function CGPDFScannerPopDictionary(scanner: CGPDFScannerRef; value: PCGPDFDictionaryRef): Integer; cdecl; external libCoreGraphics name '_CGPDFScannerPopDictionary';
{$EXTERNALSYM CGPDFScannerPopDictionary}
function CGPDFScannerPopInteger(scanner: CGPDFScannerRef; value: PCGPDFInteger): Integer; cdecl; external libCoreGraphics name '_CGPDFScannerPopInteger';
{$EXTERNALSYM CGPDFScannerPopInteger}
function CGPDFScannerPopName(scanner: CGPDFScannerRef; value: Pchar): Integer; cdecl; external libCoreGraphics name '_CGPDFScannerPopName';
{$EXTERNALSYM CGPDFScannerPopName}
function CGPDFScannerPopNumber(scanner: CGPDFScannerRef; value: PCGPDFReal): Integer; cdecl; external libCoreGraphics name '_CGPDFScannerPopNumber';
{$EXTERNALSYM CGPDFScannerPopNumber}
function CGPDFScannerPopObject(scanner: CGPDFScannerRef; value: PCGPDFObjectRef): Integer; cdecl; external libCoreGraphics name '_CGPDFScannerPopObject';
{$EXTERNALSYM CGPDFScannerPopObject}
function CGPDFScannerPopStream(scanner: CGPDFScannerRef; value: PCGPDFStreamRef): Integer; cdecl; external libCoreGraphics name '_CGPDFScannerPopStream';
{$EXTERNALSYM CGPDFScannerPopStream}
function CGPDFScannerPopString(scanner: CGPDFScannerRef; value: PCGPDFStringRef): Integer; cdecl; external libCoreGraphics name '_CGPDFScannerPopString';
{$EXTERNALSYM CGPDFScannerPopString}
procedure CGPDFScannerRelease(scanner: CGPDFScannerRef); cdecl; external libCoreGraphics name '_CGPDFScannerRelease';
{$EXTERNALSYM CGPDFScannerRelease}
function CGPDFScannerRetain(scanner: CGPDFScannerRef): CGPDFScannerRef; cdecl; external libCoreGraphics name '_CGPDFScannerRetain';
{$EXTERNALSYM CGPDFScannerRetain}
function CGPDFScannerScan(scanner: CGPDFScannerRef): Integer; cdecl; external libCoreGraphics name '_CGPDFScannerScan';
{$EXTERNALSYM CGPDFScannerScan}
function CGPDFStreamCopyData(stream: CGPDFStreamRef; format: PCGPDFDataFormat): CFDataRef; cdecl; external libCoreGraphics name '_CGPDFStreamCopyData';
{$EXTERNALSYM CGPDFStreamCopyData}
function CGPDFStreamGetDictionary(stream: CGPDFStreamRef): CGPDFDictionaryRef; cdecl; external libCoreGraphics name '_CGPDFStreamGetDictionary';
{$EXTERNALSYM CGPDFStreamGetDictionary}
function CGPDFStringCopyDate(string_: CGPDFStringRef): CFDateRef; cdecl; external libCoreGraphics name '_CGPDFStringCopyDate';
{$EXTERNALSYM CGPDFStringCopyDate}
function CGPDFStringCopyTextString(string_: CGPDFStringRef): CFStringRef; cdecl; external libCoreGraphics name '_CGPDFStringCopyTextString';
{$EXTERNALSYM CGPDFStringCopyTextString}
function CGPDFStringGetBytePtr(string_: CGPDFStringRef): PByte; cdecl; external libCoreGraphics name '_CGPDFStringGetBytePtr';
{$EXTERNALSYM CGPDFStringGetBytePtr}
function CGPDFStringGetLength(string_: CGPDFStringRef): Longword; cdecl; external libCoreGraphics name '_CGPDFStringGetLength';
{$EXTERNALSYM CGPDFStringGetLength}
function CGPSConverterAbort(converter: CGPSConverterRef): Integer; cdecl; external libCoreGraphics name '_CGPSConverterAbort';
{$EXTERNALSYM CGPSConverterAbort}
function CGPSConverterConvert(converter: CGPSConverterRef; provider: CGDataProviderRef; consumer: CGDataConsumerRef; options: CFDictionaryRef): Integer; cdecl; external libCoreGraphics name '_CGPSConverterConvert';
{$EXTERNALSYM CGPSConverterConvert}
//function CGPSConverterCreate(info: Pointer; callbacks: PCGPSConverterCallbacks; options: CFDictionaryRef): CGPSConverterRef; cdecl; external libCoreGraphics name '_CGPSConverterCreate';
function CGPSConverterGetTypeID: CFTypeID; cdecl; external libCoreGraphics name '_CGPSConverterGetTypeID';
{$EXTERNALSYM CGPSConverterGetTypeID}
function CGPSConverterIsConverting(converter: CGPSConverterRef): Integer; cdecl; external libCoreGraphics name '_CGPSConverterIsConverting';
{$EXTERNALSYM CGPSConverterIsConverting}
function CGPaletteCreateCopy(palette: CGDirectPaletteRef): CGDirectPaletteRef; cdecl; external libCoreGraphics name '_CGPaletteCreateCopy';
{$EXTERNALSYM CGPaletteCreateCopy}
function CGPaletteCreateDefaultColorPalette: CGDirectPaletteRef; cdecl; external libCoreGraphics name '_CGPaletteCreateDefaultColorPalette';
{$EXTERNALSYM CGPaletteCreateDefaultColorPalette}
function CGPaletteCreateFromPaletteBlendedWithColor(palette: CGDirectPaletteRef; fraction: CGPaletteBlendFraction; color: CGDeviceColor): CGDirectPaletteRef; cdecl; external libCoreGraphics name '_CGPaletteCreateFromPaletteBlendedWithColor';
{$EXTERNALSYM CGPaletteCreateFromPaletteBlendedWithColor}
function CGPaletteCreateWithByteSamples(samples: PCGDeviceByteColor; count: Longword): CGDirectPaletteRef; cdecl; external libCoreGraphics name '_CGPaletteCreateWithByteSamples';
{$EXTERNALSYM CGPaletteCreateWithByteSamples}
function CGPaletteCreateWithCapacity(capacity: Longword): CGDirectPaletteRef; cdecl; external libCoreGraphics name '_CGPaletteCreateWithCapacity';
{$EXTERNALSYM CGPaletteCreateWithCapacity}
function CGPaletteCreateWithDisplay(display: CGDirectDisplayID): CGDirectPaletteRef; cdecl; external libCoreGraphics name '_CGPaletteCreateWithDisplay';
{$EXTERNALSYM CGPaletteCreateWithDisplay}
function CGPaletteCreateWithSamples(samples: PCGDeviceColor; count: Longword): CGDirectPaletteRef; cdecl; external libCoreGraphics name '_CGPaletteCreateWithSamples';
{$EXTERNALSYM CGPaletteCreateWithSamples}
function CGPaletteGetColorAtIndex(palette: CGDirectPaletteRef; index: Longword): CGDeviceColor; cdecl; external libCoreGraphics name '_CGPaletteGetColorAtIndex';
{$EXTERNALSYM CGPaletteGetColorAtIndex}
function CGPaletteGetIndexForColor(palette: CGDirectPaletteRef; color: CGDeviceColor): Longword; cdecl; external libCoreGraphics name '_CGPaletteGetIndexForColor';
{$EXTERNALSYM CGPaletteGetIndexForColor}
function CGPaletteGetNumberOfSamples(palette: CGDirectPaletteRef): Longword; cdecl; external libCoreGraphics name '_CGPaletteGetNumberOfSamples';
{$EXTERNALSYM CGPaletteGetNumberOfSamples}
function CGPaletteIsEqualToPalette(palette1: CGDirectPaletteRef; palette2: CGDirectPaletteRef): Integer; cdecl; external libCoreGraphics name '_CGPaletteIsEqualToPalette';
{$EXTERNALSYM CGPaletteIsEqualToPalette}
procedure CGPaletteRelease(palette: CGDirectPaletteRef); cdecl; external libCoreGraphics name '_CGPaletteRelease';
{$EXTERNALSYM CGPaletteRelease}
procedure CGPaletteSetColorAtIndex(palette: CGDirectPaletteRef; color: CGDeviceColor; index: Longword); cdecl; external libCoreGraphics name '_CGPaletteSetColorAtIndex';
{$EXTERNALSYM CGPaletteSetColorAtIndex}
procedure CGPathAddArc(path: CGMutablePathRef; m: PCGAffineTransform; x: Single; y: Single; radius: Single; startAngle: Single; endAngle: Single; clockwise: Integer); cdecl; external libCoreGraphics name '_CGPathAddArc';
{$EXTERNALSYM CGPathAddArc}
procedure CGPathAddArcToPoint(path: CGMutablePathRef; m: PCGAffineTransform; x1: Single; y1: Single; x2: Single; y2: Single; radius: Single); cdecl; external libCoreGraphics name '_CGPathAddArcToPoint';
{$EXTERNALSYM CGPathAddArcToPoint}
procedure CGPathAddCurveToPoint(path: CGMutablePathRef; m: PCGAffineTransform; cp1x: Single; cp1y: Single; cp2x: Single; cp2y: Single; x: Single; y: Single); cdecl; external libCoreGraphics name '_CGPathAddCurveToPoint';
{$EXTERNALSYM CGPathAddCurveToPoint}
procedure CGPathAddEllipseInRect(path: CGMutablePathRef; m: PCGAffineTransform; rect: CGRect); cdecl; external libCoreGraphics name '_CGPathAddEllipseInRect';
{$EXTERNALSYM CGPathAddEllipseInRect}
procedure CGPathAddLineToPoint(path: CGMutablePathRef; m: PCGAffineTransform; x: Single; y: Single); cdecl; external libCoreGraphics name '_CGPathAddLineToPoint';
{$EXTERNALSYM CGPathAddLineToPoint}
procedure CGPathAddLines(path: CGMutablePathRef; m: PCGAffineTransform; points: PCGPoint; count: Longword); cdecl; external libCoreGraphics name '_CGPathAddLines';
{$EXTERNALSYM CGPathAddLines}
procedure CGPathAddPath(path1: CGMutablePathRef; m: PCGAffineTransform; path2: CGPathRef); cdecl; external libCoreGraphics name '_CGPathAddPath';
{$EXTERNALSYM CGPathAddPath}
procedure CGPathAddQuadCurveToPoint(path: CGMutablePathRef; m: PCGAffineTransform; cpx: Single; cpy: Single; x: Single; y: Single); cdecl; external libCoreGraphics name '_CGPathAddQuadCurveToPoint';
{$EXTERNALSYM CGPathAddQuadCurveToPoint}
procedure CGPathAddRect(path: CGMutablePathRef; m: PCGAffineTransform; rect: CGRect); cdecl; external libCoreGraphics name '_CGPathAddRect';
{$EXTERNALSYM CGPathAddRect}
procedure CGPathAddRects(path: CGMutablePathRef; m: PCGAffineTransform; rects: PCGRect; count: Longword); cdecl; external libCoreGraphics name '_CGPathAddRects';
{$EXTERNALSYM CGPathAddRects}
procedure CGPathApply(path: CGPathRef; info: Pointer; function_: CGPathApplierFunction); cdecl; external libCoreGraphics name '_CGPathApply';
{$EXTERNALSYM CGPathApply}
procedure CGPathCloseSubpath(path: CGMutablePathRef); cdecl; external libCoreGraphics name '_CGPathCloseSubpath';
{$EXTERNALSYM CGPathCloseSubpath}
function CGPathContainsPoint(path: CGPathRef; m: PCGAffineTransform; point: CGPoint; eoFill: Integer): Integer; cdecl; external libCoreGraphics name '_CGPathContainsPoint';
{$EXTERNALSYM CGPathContainsPoint}
function CGPathCreateCopy(path: CGPathRef): CGPathRef; cdecl; external libCoreGraphics name '_CGPathCreateCopy';
{$EXTERNALSYM CGPathCreateCopy}
function CGPathCreateMutable: CGMutablePathRef; cdecl; external libCoreGraphics name '_CGPathCreateMutable';
{$EXTERNALSYM CGPathCreateMutable}
function CGPathCreateMutableCopy(path: CGPathRef): CGMutablePathRef; cdecl; external libCoreGraphics name '_CGPathCreateMutableCopy';
{$EXTERNALSYM CGPathCreateMutableCopy}
function CGPathEqualToPath(path1: CGPathRef; path2: CGPathRef): Integer; cdecl; external libCoreGraphics name '_CGPathEqualToPath';
{$EXTERNALSYM CGPathEqualToPath}
function CGPathGetBoundingBox(path: CGPathRef): CGRect; cdecl; external libCoreGraphics name '_CGPathGetBoundingBox';
{$EXTERNALSYM CGPathGetBoundingBox}
function CGPathGetCurrentPoint(path: CGPathRef): CGPoint; cdecl; external libCoreGraphics name '_CGPathGetCurrentPoint';
{$EXTERNALSYM CGPathGetCurrentPoint}
function CGPathGetPathBoundingBox(path: CGPathRef): CGRect; cdecl; external libCoreGraphics name '_CGPathGetPathBoundingBox';
{$EXTERNALSYM CGPathGetPathBoundingBox}
function CGPathGetTypeID: CFTypeID; cdecl; external libCoreGraphics name '_CGPathGetTypeID';
{$EXTERNALSYM CGPathGetTypeID}
function CGPathIsEmpty(path: CGPathRef): Integer; cdecl; external libCoreGraphics name '_CGPathIsEmpty';
{$EXTERNALSYM CGPathIsEmpty}
function CGPathIsRect(path: CGPathRef; rect: PCGRect): Integer; cdecl; external libCoreGraphics name '_CGPathIsRect';
{$EXTERNALSYM CGPathIsRect}
procedure CGPathMoveToPoint(path: CGMutablePathRef; m: PCGAffineTransform; x: Single; y: Single); cdecl; external libCoreGraphics name '_CGPathMoveToPoint';
{$EXTERNALSYM CGPathMoveToPoint}
procedure CGPathRelease(path: CGPathRef); cdecl; external libCoreGraphics name '_CGPathRelease';
{$EXTERNALSYM CGPathRelease}
function CGPathRetain(path: CGPathRef): CGPathRef; cdecl; external libCoreGraphics name '_CGPathRetain';
{$EXTERNALSYM CGPathRetain}
function CGPatternCreate(info: Pointer; bounds: CGRect; matrix: CGAffineTransform; xStep: Single; yStep: Single; tiling: CGPatternTiling; isColored: Integer; callbacks: PCGPatternCallbacks): CGPatternRef; cdecl; external libCoreGraphics name '_CGPatternCreate';
{$EXTERNALSYM CGPatternCreate}
function CGPatternGetTypeID: CFTypeID; cdecl; external libCoreGraphics name '_CGPatternGetTypeID';
{$EXTERNALSYM CGPatternGetTypeID}
procedure CGPatternRelease(pattern: CGPatternRef); cdecl; external libCoreGraphics name '_CGPatternRelease';
{$EXTERNALSYM CGPatternRelease}
function CGPatternRetain(pattern: CGPatternRef): CGPatternRef; cdecl; external libCoreGraphics name '_CGPatternRetain';
{$EXTERNALSYM CGPatternRetain}
function CGPointApplyAffineTransform(point: CGPoint; t: CGAffineTransform): CGPoint; cdecl; external libCoreGraphics name '_CGPointApplyAffineTransform';
{$EXTERNALSYM CGPointApplyAffineTransform}
function CGPointCreateDictionaryRepresentation(point: CGPoint): CFDictionaryRef; cdecl; external libCoreGraphics name '_CGPointCreateDictionaryRepresentation';
{$EXTERNALSYM CGPointCreateDictionaryRepresentation}
function CGPointEqualToPoint(point1: CGPoint; point2: CGPoint): Integer; cdecl; external libCoreGraphics name '_CGPointEqualToPoint';
{$EXTERNALSYM CGPointEqualToPoint}
function CGPointMake(x: Single; y: Single): CGPoint; cdecl; external libCoreGraphics name '_CGPointMake';
{$EXTERNALSYM CGPointMake}
function CGPointMakeWithDictionaryRepresentation(dict: CFDictionaryRef; point: PCGPoint): Integer; cdecl; external libCoreGraphics name '_CGPointMakeWithDictionaryRepresentation';
{$EXTERNALSYM CGPointMakeWithDictionaryRepresentation}
function CGPostKeyboardEvent(keyChar: CGCharCode; virtualKey: CGKeyCode; keyDown: Integer): CGError; cdecl; external libCoreGraphics name '_CGPostKeyboardEvent';
{$EXTERNALSYM CGPostKeyboardEvent}
function CGPostMouseEvent(mouseCursorPosition: CGPoint; updateMouseCursorPosition: Integer; buttonCount: CGButtonCount; mouseButtonDown: Integer): CGError; cdecl; varargs; external libCoreGraphics name '_CGPostMouseEvent';
{$EXTERNALSYM CGPostMouseEvent}
function CGPostScrollWheelEvent(wheelCount: CGWheelCount; wheel1: Integer): CGError; cdecl; varargs; external libCoreGraphics name '_CGPostScrollWheelEvent';
{$EXTERNALSYM CGPostScrollWheelEvent}
function CGRectApplyAffineTransform(rect: CGRect; t: CGAffineTransform): CGRect; cdecl; external libCoreGraphics name '_CGRectApplyAffineTransform';
{$EXTERNALSYM CGRectApplyAffineTransform}
function CGRectContainsPoint(rect: CGRect; point: CGPoint): Integer; cdecl; external libCoreGraphics name '_CGRectContainsPoint';
{$EXTERNALSYM CGRectContainsPoint}
function CGRectContainsRect(rect1: CGRect; rect2: CGRect): Integer; cdecl; external libCoreGraphics name '_CGRectContainsRect';
{$EXTERNALSYM CGRectContainsRect}
function CGRectCreateDictionaryRepresentation(dummy: CGRect): CFDictionaryRef; cdecl; external libCoreGraphics name '_CGRectCreateDictionaryRepresentation';
{$EXTERNALSYM CGRectCreateDictionaryRepresentation}
procedure CGRectDivide(rect: CGRect; slice: PCGRect; remainder: PCGRect; amount: Single; edge: CGRectEdge); cdecl; external libCoreGraphics name '_CGRectDivide';
{$EXTERNALSYM CGRectDivide}
function CGRectEqualToRect(rect1: CGRect; rect2: CGRect): Integer; cdecl; external libCoreGraphics name '_CGRectEqualToRect';
{$EXTERNALSYM CGRectEqualToRect}
function CGRectGetHeight(rect: CGRect): Single; cdecl; external libCoreGraphics name '_CGRectGetHeight';
{$EXTERNALSYM CGRectGetHeight}
function CGRectGetMaxX(rect: CGRect): Single; cdecl; external libCoreGraphics name '_CGRectGetMaxX';
{$EXTERNALSYM CGRectGetMaxX}
function CGRectGetMaxY(rect: CGRect): Single; cdecl; external libCoreGraphics name '_CGRectGetMaxY';
{$EXTERNALSYM CGRectGetMaxY}
function CGRectGetMidX(rect: CGRect): Single; cdecl; external libCoreGraphics name '_CGRectGetMidX';
{$EXTERNALSYM CGRectGetMidX}
function CGRectGetMidY(rect: CGRect): Single; cdecl; external libCoreGraphics name '_CGRectGetMidY';
{$EXTERNALSYM CGRectGetMidY}
function CGRectGetMinX(rect: CGRect): Single; cdecl; external libCoreGraphics name '_CGRectGetMinX';
{$EXTERNALSYM CGRectGetMinX}
function CGRectGetMinY(rect: CGRect): Single; cdecl; external libCoreGraphics name '_CGRectGetMinY';
{$EXTERNALSYM CGRectGetMinY}
function CGRectGetWidth(rect: CGRect): Single; cdecl; external libCoreGraphics name '_CGRectGetWidth';
{$EXTERNALSYM CGRectGetWidth}
function CGRectInset(rect: CGRect; dx: Single; dy: Single): CGRect; cdecl; external libCoreGraphics name '_CGRectInset';
{$EXTERNALSYM CGRectInset}
function CGRectIntegral(rect: CGRect): CGRect; cdecl; external libCoreGraphics name '_CGRectIntegral';
{$EXTERNALSYM CGRectIntegral}
function CGRectIntersection(r1: CGRect; r2: CGRect): CGRect; cdecl; external libCoreGraphics name '_CGRectIntersection';
{$EXTERNALSYM CGRectIntersection}
function CGRectIntersectsRect(rect1: CGRect; rect2: CGRect): Integer; cdecl; external libCoreGraphics name '_CGRectIntersectsRect';
{$EXTERNALSYM CGRectIntersectsRect}
function CGRectIsEmpty(rect: CGRect): Integer; cdecl; external libCoreGraphics name '_CGRectIsEmpty';
{$EXTERNALSYM CGRectIsEmpty}
function CGRectIsInfinite(rect: CGRect): Integer; cdecl; external libCoreGraphics name '_CGRectIsInfinite';
{$EXTERNALSYM CGRectIsInfinite}
function CGRectIsNull(rect: CGRect): Integer; cdecl; external libCoreGraphics name '_CGRectIsNull';
{$EXTERNALSYM CGRectIsNull}
function CGRectMake(x: Single; y: Single; width: Single; height: Single): CGRect; cdecl; external libCoreGraphics name '_CGRectMake';
{$EXTERNALSYM CGRectMake}
function CGRectMakeWithDictionaryRepresentation(dict: CFDictionaryRef; rect: PCGRect): Integer; cdecl; external libCoreGraphics name '_CGRectMakeWithDictionaryRepresentation';
{$EXTERNALSYM CGRectMakeWithDictionaryRepresentation}
function CGRectOffset(rect: CGRect; dx: Single; dy: Single): CGRect; cdecl; external libCoreGraphics name '_CGRectOffset';
{$EXTERNALSYM CGRectOffset}
function CGRectStandardize(rect: CGRect): CGRect; cdecl; external libCoreGraphics name '_CGRectStandardize';
{$EXTERNALSYM CGRectStandardize}
function CGRectUnion(r1: CGRect; r2: CGRect): CGRect; cdecl; external libCoreGraphics name '_CGRectUnion';
{$EXTERNALSYM CGRectUnion}
function CGRegisterScreenRefreshCallback(callback: CGScreenRefreshCallback; userInfo: Pointer): CGError; cdecl; external libCoreGraphics name '_CGRegisterScreenRefreshCallback';
{$EXTERNALSYM CGRegisterScreenRefreshCallback}
function CGReleaseAllDisplays: CGError; cdecl; external libCoreGraphics name '_CGReleaseAllDisplays';
{$EXTERNALSYM CGReleaseAllDisplays}
function CGReleaseDisplayFadeReservation(token: CGDisplayFadeReservationToken): CGError; cdecl; external libCoreGraphics name '_CGReleaseDisplayFadeReservation';
{$EXTERNALSYM CGReleaseDisplayFadeReservation}
procedure CGReleaseScreenRefreshRects(rects: PCGRect); cdecl; external libCoreGraphics name '_CGReleaseScreenRefreshRects';
{$EXTERNALSYM CGReleaseScreenRefreshRects}
procedure CGRestorePermanentDisplayConfiguration; cdecl; external libCoreGraphics name '_CGRestorePermanentDisplayConfiguration';
{$EXTERNALSYM CGRestorePermanentDisplayConfiguration}
function CGScreenRegisterMoveCallback(callback: CGScreenUpdateMoveCallback; userInfo: Pointer): CGError; cdecl; external libCoreGraphics name '_CGScreenRegisterMoveCallback';
{$EXTERNALSYM CGScreenRegisterMoveCallback}
procedure CGScreenUnregisterMoveCallback(callback: CGScreenUpdateMoveCallback; userInfo: Pointer); cdecl; external libCoreGraphics name '_CGScreenUnregisterMoveCallback';
{$EXTERNALSYM CGScreenUnregisterMoveCallback}
function CGSessionCopyCurrentDictionary: CFDictionaryRef; cdecl; external libCoreGraphics name '_CGSessionCopyCurrentDictionary';
{$EXTERNALSYM CGSessionCopyCurrentDictionary}
function CGSetDisplayTransferByByteTable(display: CGDirectDisplayID; tableSize: Longword; redTable: PByte; greenTable: PByte; blueTable: PByte): CGError; cdecl; external libCoreGraphics name '_CGSetDisplayTransferByByteTable';
{$EXTERNALSYM CGSetDisplayTransferByByteTable}
function CGSetDisplayTransferByFormula(display: CGDirectDisplayID; redMin: CGGammaValue; redMax: CGGammaValue; redGamma: CGGammaValue; greenMin: CGGammaValue; greenMax: CGGammaValue; greenGamma: CGGammaValue; blueMin: CGGammaValue; blueMax: CGGammaValue; blueGamma: CGGammaValue): CGError; cdecl; external libCoreGraphics name '_CGSetDisplayTransferByFormula';
{$EXTERNALSYM CGSetDisplayTransferByFormula}
function CGSetDisplayTransferByTable(display: CGDirectDisplayID; tableSize: Longword; redTable: PCGGammaValue; greenTable: PCGGammaValue; blueTable: PCGGammaValue): CGError; cdecl; external libCoreGraphics name '_CGSetDisplayTransferByTable';
{$EXTERNALSYM CGSetDisplayTransferByTable}
function CGSetLocalEventsFilterDuringSuppressionState(filter: CGEventFilterMask; state: CGEventSuppressionState): CGError; cdecl; external libCoreGraphics name '_CGSetLocalEventsFilterDuringSuppressionState';
{$EXTERNALSYM CGSetLocalEventsFilterDuringSuppressionState}
function CGSetLocalEventsSuppressionInterval(seconds: CFTimeInterval): CGError; cdecl; external libCoreGraphics name '_CGSetLocalEventsSuppressionInterval';
{$EXTERNALSYM CGSetLocalEventsSuppressionInterval}
function CGShadingCreateAxial(space: CGColorSpaceRef; start: CGPoint; end_: CGPoint; function_: CGFunctionRef; extendStart: Integer; extendEnd: Integer): CGShadingRef; cdecl; external libCoreGraphics name '_CGShadingCreateAxial';
{$EXTERNALSYM CGShadingCreateAxial}
function CGShadingCreateRadial(space: CGColorSpaceRef; start: CGPoint; startRadius: Single; end_: CGPoint; endRadius: Single; function_: CGFunctionRef; extendStart: Integer; extendEnd: Integer): CGShadingRef; cdecl; external libCoreGraphics name '_CGShadingCreateRadial';
{$EXTERNALSYM CGShadingCreateRadial}
function CGShadingGetTypeID: CFTypeID; cdecl; external libCoreGraphics name '_CGShadingGetTypeID';
{$EXTERNALSYM CGShadingGetTypeID}
procedure CGShadingRelease(shading: CGShadingRef); cdecl; external libCoreGraphics name '_CGShadingRelease';
{$EXTERNALSYM CGShadingRelease}
function CGShadingRetain(shading: CGShadingRef): CGShadingRef; cdecl; external libCoreGraphics name '_CGShadingRetain';
{$EXTERNALSYM CGShadingRetain}
function CGShieldingWindowID(display: CGDirectDisplayID): Longword; cdecl; external libCoreGraphics name '_CGShieldingWindowID';
{$EXTERNALSYM CGShieldingWindowID}
function CGShieldingWindowLevel: Integer; cdecl; external libCoreGraphics name '_CGShieldingWindowLevel';
{$EXTERNALSYM CGShieldingWindowLevel}
function CGSizeApplyAffineTransform(size: CGSize; t: CGAffineTransform): CGSize; cdecl; external libCoreGraphics name '_CGSizeApplyAffineTransform';
{$EXTERNALSYM CGSizeApplyAffineTransform}
function CGSizeCreateDictionaryRepresentation(size: CGSize): CFDictionaryRef; cdecl; external libCoreGraphics name '_CGSizeCreateDictionaryRepresentation';
{$EXTERNALSYM CGSizeCreateDictionaryRepresentation}
function CGSizeEqualToSize(size1: CGSize; size2: CGSize): Integer; cdecl; external libCoreGraphics name '_CGSizeEqualToSize';
{$EXTERNALSYM CGSizeEqualToSize}
function CGSizeMake(width: Single; height: Single): CGSize; cdecl; external libCoreGraphics name '_CGSizeMake';
{$EXTERNALSYM CGSizeMake}
function CGSizeMakeWithDictionaryRepresentation(dict: CFDictionaryRef; size: PCGSize): Integer; cdecl; external libCoreGraphics name '_CGSizeMakeWithDictionaryRepresentation';
{$EXTERNALSYM CGSizeMakeWithDictionaryRepresentation}
procedure CGUnregisterScreenRefreshCallback(callback: CGScreenRefreshCallback; userInfo: Pointer); cdecl; external libCoreGraphics name '_CGUnregisterScreenRefreshCallback';
{$EXTERNALSYM CGUnregisterScreenRefreshCallback}
function CGWaitForScreenRefreshRects(rects: PCGRect; count: PLongword): CGError; cdecl; external libCoreGraphics name '_CGWaitForScreenRefreshRects';
{$EXTERNALSYM CGWaitForScreenRefreshRects}
function CGWaitForScreenUpdateRects(requestedOperations: CGScreenUpdateOperation; currentOperation: PCGScreenUpdateOperation; rects: PCGRect; rectCount: PLongword; delta: PCGScreenUpdateMoveDelta): CGError; cdecl; external libCoreGraphics name '_CGWaitForScreenUpdateRects';
{$EXTERNALSYM CGWaitForScreenUpdateRects}
function CGWarpMouseCursorPosition(newCursorPosition: CGPoint): CGError; cdecl; external libCoreGraphics name '_CGWarpMouseCursorPosition';
{$EXTERNALSYM CGWarpMouseCursorPosition}
function CGWindowLevelForKey(key: CGWindowLevelKey): CGWindowLevel; cdecl; external libCoreGraphics name '_CGWindowLevelForKey';
{$EXTERNALSYM CGWindowLevelForKey}
function CGWindowListCopyWindowInfo(option: CGWindowListOption; relativeToWindow: CGWindowID): CFArrayRef; cdecl; external libCoreGraphics name '_CGWindowListCopyWindowInfo';
{$EXTERNALSYM CGWindowListCopyWindowInfo}
function CGWindowListCreate(option: CGWindowListOption; relativeToWindow: CGWindowID): CFArrayRef; cdecl; external libCoreGraphics name '_CGWindowListCreate';
{$EXTERNALSYM CGWindowListCreate}
function CGWindowListCreateDescriptionFromArray(windowArray: CFArrayRef): CFArrayRef; cdecl; external libCoreGraphics name '_CGWindowListCreateDescriptionFromArray';
{$EXTERNALSYM CGWindowListCreateDescriptionFromArray}
function CGWindowListCreateImage(screenBounds: CGRect; listOption: CGWindowListOption; windowID: CGWindowID; imageOption: CGWindowImageOption): CGImageRef; cdecl; external libCoreGraphics name '_CGWindowListCreateImage';
{$EXTERNALSYM CGWindowListCreateImage}
function CGWindowListCreateImageFromArray(screenBounds: CGRect; windowArray: CFArrayRef; imageOption: CGWindowImageOption): CGImageRef; cdecl; external libCoreGraphics name '_CGWindowListCreateImageFromArray';
{$EXTERNALSYM CGWindowListCreateImageFromArray}
function CGWindowServerCFMachPort: CFMachPortRef; cdecl; external libCoreGraphics name '_CGWindowServerCFMachPort';
{$EXTERNALSYM CGWindowServerCFMachPort}

implementation
end.
