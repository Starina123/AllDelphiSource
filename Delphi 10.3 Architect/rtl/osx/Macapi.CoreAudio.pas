{*******************************************************}
{                                                       }
{            CodeGear Delphi Runtime Library            }
{                                                       }
{ Copyright(c) 2010-2019 Embarcadero Technologies, Inc. }
{                  All rights reserved                  }
{                                                       }
{*******************************************************}

unit Macapi.CoreAudio;

interface

uses
  Macapi.ObjectiveC, Macapi.CocoaTypes, Macapi.CoreFoundation, Macapi.IOKit, Macapi.Dispatch,
  Posix.SysTypes;

const
  COREAUDIOTYPES_VERSION = 20150414;
  CA_PREFER_FIXED_POINT = 0;
  kAudio_UnimplementedError = -4;
  kAudio_FileNotFoundError = -43;
  kAudio_FilePermissionError = -54;
  kAudio_TooManyFilesOpenError = -42;
  kAudio_BadFilePathError = 561017960;
  kAudio_ParamError = -50;
  kAudio_MemFullError = -108;
  kAudioFormatLinearPCM = 1819304813;
  kAudioFormatAC3 = 1633889587;
  kAudioFormat60958AC3 = 1667326771;
  kAudioFormatAppleIMA4 = 1768775988;
  kAudioFormatMPEG4AAC = 1633772320;
  kAudioFormatMPEG4CELP = 1667591280;
  kAudioFormatMPEG4HVXC = 1752594531;
  kAudioFormatMPEG4TwinVQ = 1953986161;
  kAudioFormatMACE3 = 1296122675;
  kAudioFormatMACE6 = 1296122678;
  kAudioFormatULaw = 1970037111;
  kAudioFormatALaw = 1634492791;
  kAudioFormatQDesign = 1363430723;
  kAudioFormatQDesign2 = 1363430706;
  kAudioFormatQUALCOMM = 1365470320;
  kAudioFormatMPEGLayer1 = 778924081;
  kAudioFormatMPEGLayer2 = 778924082;
  kAudioFormatMPEGLayer3 = 778924083;
  kAudioFormatTimeCode = 1953066341;
  kAudioFormatMIDIStream = 1835623529;
  kAudioFormatParameterValueStream = 1634760307;
  kAudioFormatAppleLossless = 1634492771;
  kAudioFormatMPEG4AAC_HE = 1633772392;
  kAudioFormatMPEG4AAC_LD = 1633772396;
  kAudioFormatMPEG4AAC_ELD = 1633772389;
  kAudioFormatMPEG4AAC_ELD_SBR = 1633772390;
  kAudioFormatMPEG4AAC_ELD_V2 = 1633772391;
  kAudioFormatMPEG4AAC_HE_V2 = 1633772400;
  kAudioFormatMPEG4AAC_Spatial = 1633772403;
  kAudioFormatAMR = 1935764850;
  kAudioFormatAMR_WB = 1935767394;
  kAudioFormatAudible = 1096107074;
  kAudioFormatiLBC = 1768710755;
  kAudioFormatDVIIntelIMA = 1836253201;
  kAudioFormatMicrosoftGSM = 1836253233;
  kAudioFormatAES3 = 1634038579;
  kAudioFormatEnhancedAC3 = 1700998451;
  kAudioFormatFLAC = 1718378851;
  kAudioFormatOpus = 1869641075;
  kAudioFormatFlagIsFloat = 1 shl 0;
  kAudioFormatFlagIsBigEndian = 1 shl 1;
  kAudioFormatFlagIsSignedInteger = 1 shl 2;
  kAudioFormatFlagIsPacked = 1 shl 3;
  kAudioFormatFlagIsAlignedHigh = 1 shl 4;
  kAudioFormatFlagIsNonInterleaved = 1 shl 5;
  kAudioFormatFlagIsNonMixable = 1 shl 6;
  kAudioFormatFlagsAreAllClear = -2147483648;
  kLinearPCMFormatFlagIsFloat = kAudioFormatFlagIsFloat;
  kLinearPCMFormatFlagIsBigEndian = kAudioFormatFlagIsBigEndian;
  kLinearPCMFormatFlagIsSignedInteger = kAudioFormatFlagIsSignedInteger;
  kLinearPCMFormatFlagIsPacked = kAudioFormatFlagIsPacked;
  kLinearPCMFormatFlagIsAlignedHigh = kAudioFormatFlagIsAlignedHigh;
  kLinearPCMFormatFlagIsNonInterleaved = kAudioFormatFlagIsNonInterleaved;
  kLinearPCMFormatFlagIsNonMixable = kAudioFormatFlagIsNonMixable;
  kLinearPCMFormatFlagsSampleFractionShift = 7;
  kLinearPCMFormatFlagsSampleFractionMask = 8064;
  kLinearPCMFormatFlagsAreAllClear = kAudioFormatFlagsAreAllClear;
  kAppleLosslessFormatFlag_16BitSourceData = 1;
  kAppleLosslessFormatFlag_20BitSourceData = 2;
  kAppleLosslessFormatFlag_24BitSourceData = 3;
  kAppleLosslessFormatFlag_32BitSourceData = 4;
  kAudioFormatFlagsNativeEndian = 0;
  kAudioFormatFlagsCanonical = 9;
  kAudioFormatFlagsAudioUnitCanonical = 41;
  kAudioFormatFlagsNativeFloatPacked = 9;
  kSMPTETimeType24 = 0;
  kSMPTETimeType25 = 1;
  kSMPTETimeType30Drop = 2;
  kSMPTETimeType30 = 3;
  kSMPTETimeType2997 = 4;
  kSMPTETimeType2997Drop = 5;
  kSMPTETimeType60 = 6;
  kSMPTETimeType5994 = 7;
  kSMPTETimeType60Drop = 8;
  kSMPTETimeType5994Drop = 9;
  kSMPTETimeType50 = 10;
  kSMPTETimeType2398 = 11;
  kSMPTETimeUnknown = 0;
  kSMPTETimeValid = 1 shl 0;
  kSMPTETimeRunning = 1 shl 1;
  kAudioTimeStampNothingValid = 0;
  kAudioTimeStampSampleTimeValid = 1 shl 0;
  kAudioTimeStampHostTimeValid = 1 shl 1;
  kAudioTimeStampRateScalarValid = 1 shl 2;
  kAudioTimeStampWordClockTimeValid = 1 shl 3;
  kAudioTimeStampSMPTETimeValid = 1 shl 4;
  kAudioTimeStampSampleHostTimeValid = kAudioTimeStampSampleTimeValid  or  kAudioTimeStampHostTimeValid;
  kAudioChannelLabel_Unknown = -1;
  kAudioChannelLabel_Unused = 0;
  kAudioChannelLabel_UseCoordinates = 100;
  kAudioChannelLabel_Left = 1;
  kAudioChannelLabel_Right = 2;
  kAudioChannelLabel_Center = 3;
  kAudioChannelLabel_LFEScreen = 4;
  kAudioChannelLabel_LeftSurround = 5;
  kAudioChannelLabel_RightSurround = 6;
  kAudioChannelLabel_LeftCenter = 7;
  kAudioChannelLabel_RightCenter = 8;
  kAudioChannelLabel_CenterSurround = 9;
  kAudioChannelLabel_LeftSurroundDirect = 10;
  kAudioChannelLabel_RightSurroundDirect = 11;
  kAudioChannelLabel_TopCenterSurround = 12;
  kAudioChannelLabel_VerticalHeightLeft = 13;
  kAudioChannelLabel_VerticalHeightCenter = 14;
  kAudioChannelLabel_VerticalHeightRight = 15;
  kAudioChannelLabel_TopBackLeft = 16;
  kAudioChannelLabel_TopBackCenter = 17;
  kAudioChannelLabel_TopBackRight = 18;
  kAudioChannelLabel_RearSurroundLeft = 33;
  kAudioChannelLabel_RearSurroundRight = 34;
  kAudioChannelLabel_LeftWide = 35;
  kAudioChannelLabel_RightWide = 36;
  kAudioChannelLabel_LFE2 = 37;
  kAudioChannelLabel_LeftTotal = 38;
  kAudioChannelLabel_RightTotal = 39;
  kAudioChannelLabel_HearingImpaired = 40;
  kAudioChannelLabel_Narration = 41;
  kAudioChannelLabel_Mono = 42;
  kAudioChannelLabel_DialogCentricMix = 43;
  kAudioChannelLabel_CenterSurroundDirect = 44;
  kAudioChannelLabel_Haptic = 45;
  kAudioChannelLabel_Ambisonic_W = 200;
  kAudioChannelLabel_Ambisonic_X = 201;
  kAudioChannelLabel_Ambisonic_Y = 202;
  kAudioChannelLabel_Ambisonic_Z = 203;
  kAudioChannelLabel_MS_Mid = 204;
  kAudioChannelLabel_MS_Side = 205;
  kAudioChannelLabel_XY_X = 206;
  kAudioChannelLabel_XY_Y = 207;
  kAudioChannelLabel_BinauralLeft = 208;
  kAudioChannelLabel_BinauralRight = 209;
  kAudioChannelLabel_HeadphonesLeft = 301;
  kAudioChannelLabel_HeadphonesRight = 302;
  kAudioChannelLabel_ClickTrack = 304;
  kAudioChannelLabel_ForeignLanguage = 305;
  kAudioChannelLabel_Discrete = 400;
  kAudioChannelLabel_Discrete_0 = 65536;
  kAudioChannelLabel_Discrete_1 = 65537;
  kAudioChannelLabel_Discrete_2 = 65538;
  kAudioChannelLabel_Discrete_3 = 65539;
  kAudioChannelLabel_Discrete_4 = 65540;
  kAudioChannelLabel_Discrete_5 = 65541;
  kAudioChannelLabel_Discrete_6 = 65542;
  kAudioChannelLabel_Discrete_7 = 65543;
  kAudioChannelLabel_Discrete_8 = 65544;
  kAudioChannelLabel_Discrete_9 = 65545;
  kAudioChannelLabel_Discrete_10 = 65546;
  kAudioChannelLabel_Discrete_11 = 65547;
  kAudioChannelLabel_Discrete_12 = 65548;
  kAudioChannelLabel_Discrete_13 = 65549;
  kAudioChannelLabel_Discrete_14 = 65550;
  kAudioChannelLabel_Discrete_15 = 65551;
  kAudioChannelLabel_Discrete_65535 = 131071;
  kAudioChannelLabel_HOA_ACN = 500;
  kAudioChannelLabel_HOA_ACN_0 = 131072;
  kAudioChannelLabel_HOA_ACN_1 = 131073;
  kAudioChannelLabel_HOA_ACN_2 = 131074;
  kAudioChannelLabel_HOA_ACN_3 = 131075;
  kAudioChannelLabel_HOA_ACN_4 = 131076;
  kAudioChannelLabel_HOA_ACN_5 = 131077;
  kAudioChannelLabel_HOA_ACN_6 = 131078;
  kAudioChannelLabel_HOA_ACN_7 = 131079;
  kAudioChannelLabel_HOA_ACN_8 = 131080;
  kAudioChannelLabel_HOA_ACN_9 = 131081;
  kAudioChannelLabel_HOA_ACN_10 = 131082;
  kAudioChannelLabel_HOA_ACN_11 = 131083;
  kAudioChannelLabel_HOA_ACN_12 = 131084;
  kAudioChannelLabel_HOA_ACN_13 = 131085;
  kAudioChannelLabel_HOA_ACN_14 = 131086;
  kAudioChannelLabel_HOA_ACN_15 = 131087;
  kAudioChannelLabel_HOA_ACN_65024 = 196096;
  kAudioChannelLabel_BeginReserved = -268435456;
  kAudioChannelLabel_EndReserved = -2;
  kAudioChannelBit_Left = 1 shl 0;
  kAudioChannelBit_Right = 1 shl 1;
  kAudioChannelBit_Center = 1 shl 2;
  kAudioChannelBit_LFEScreen = 1 shl 3;
  kAudioChannelBit_LeftSurround = 1 shl 4;
  kAudioChannelBit_RightSurround = 1 shl 5;
  kAudioChannelBit_LeftCenter = 1 shl 6;
  kAudioChannelBit_RightCenter = 1 shl 7;
  kAudioChannelBit_CenterSurround = 1 shl 8;
  kAudioChannelBit_LeftSurroundDirect = 1 shl 9;
  kAudioChannelBit_RightSurroundDirect = 1 shl 10;
  kAudioChannelBit_TopCenterSurround = 1 shl 11;
  kAudioChannelBit_VerticalHeightLeft = 1 shl 12;
  kAudioChannelBit_VerticalHeightCenter = 1 shl 13;
  kAudioChannelBit_VerticalHeightRight = 1 shl 14;
  kAudioChannelBit_TopBackLeft = 1 shl 15;
  kAudioChannelBit_TopBackCenter = 1 shl 16;
  kAudioChannelBit_TopBackRight = 1 shl 17;
  kAudioChannelFlags_AllOff = 0;
  kAudioChannelFlags_RectangularCoordinates = 1 shl 0;
  kAudioChannelFlags_SphericalCoordinates = 1 shl 1;
  kAudioChannelFlags_Meters = 1 shl 2;
  kAudioChannelCoordinates_LeftRight = 0;
  kAudioChannelCoordinates_BackFront = 1;
  kAudioChannelCoordinates_DownUp = 2;
  kAudioChannelCoordinates_Azimuth = 0;
  kAudioChannelCoordinates_Elevation = 1;
  kAudioChannelCoordinates_Distance = 2;
  kAudioChannelLayoutTag_UseChannelDescriptions = 0;
  kAudioChannelLayoutTag_UseChannelBitmap = 65536;
  kAudioChannelLayoutTag_Mono = 6553601;
  kAudioChannelLayoutTag_Stereo = 6619138;
  kAudioChannelLayoutTag_StereoHeadphones = 6684674;
  kAudioChannelLayoutTag_MatrixStereo = 6750210;
  kAudioChannelLayoutTag_MidSide = 6815746;
  kAudioChannelLayoutTag_XY = 6881282;
  kAudioChannelLayoutTag_Binaural = 6946818;
  kAudioChannelLayoutTag_Ambisonic_B_Format = 7012356;
  kAudioChannelLayoutTag_Quadraphonic = 7077892;
  kAudioChannelLayoutTag_Pentagonal = 7143429;
  kAudioChannelLayoutTag_Hexagonal = 7208966;
  kAudioChannelLayoutTag_Octagonal = 7274504;
  kAudioChannelLayoutTag_Cube = 7340040;
  kAudioChannelLayoutTag_MPEG_1_0 = kAudioChannelLayoutTag_Mono;
  kAudioChannelLayoutTag_MPEG_2_0 = kAudioChannelLayoutTag_Stereo;
  kAudioChannelLayoutTag_MPEG_3_0_A = 7405571;
  kAudioChannelLayoutTag_MPEG_3_0_B = 7471107;
  kAudioChannelLayoutTag_MPEG_4_0_A = 7536644;
  kAudioChannelLayoutTag_MPEG_4_0_B = 7602180;
  kAudioChannelLayoutTag_MPEG_5_0_A = 7667717;
  kAudioChannelLayoutTag_MPEG_5_0_B = 7733253;
  kAudioChannelLayoutTag_MPEG_5_0_C = 7798789;
  kAudioChannelLayoutTag_MPEG_5_0_D = 7864325;
  kAudioChannelLayoutTag_MPEG_5_1_A = 7929862;
  kAudioChannelLayoutTag_MPEG_5_1_B = 7995398;
  kAudioChannelLayoutTag_MPEG_5_1_C = 8060934;
  kAudioChannelLayoutTag_MPEG_5_1_D = 8126470;
  kAudioChannelLayoutTag_MPEG_6_1_A = 8192007;
  kAudioChannelLayoutTag_MPEG_7_1_A = 8257544;
  kAudioChannelLayoutTag_MPEG_7_1_B = 8323080;
  kAudioChannelLayoutTag_MPEG_7_1_C = 8388616;
  kAudioChannelLayoutTag_Emagic_Default_7_1 = 8454152;
  kAudioChannelLayoutTag_SMPTE_DTV = 8519688;
  kAudioChannelLayoutTag_ITU_1_0 = kAudioChannelLayoutTag_Mono;
  kAudioChannelLayoutTag_ITU_2_0 = kAudioChannelLayoutTag_Stereo;
  kAudioChannelLayoutTag_ITU_2_1 = 8585219;
  kAudioChannelLayoutTag_ITU_2_2 = 8650756;
  kAudioChannelLayoutTag_ITU_3_0 = kAudioChannelLayoutTag_MPEG_3_0_A;
  kAudioChannelLayoutTag_ITU_3_1 = kAudioChannelLayoutTag_MPEG_4_0_A;
  kAudioChannelLayoutTag_ITU_3_2 = kAudioChannelLayoutTag_MPEG_5_0_A;
  kAudioChannelLayoutTag_ITU_3_2_1 = kAudioChannelLayoutTag_MPEG_5_1_A;
  kAudioChannelLayoutTag_ITU_3_4_1 = kAudioChannelLayoutTag_MPEG_7_1_C;
  kAudioChannelLayoutTag_DVD_0 = kAudioChannelLayoutTag_Mono;
  kAudioChannelLayoutTag_DVD_1 = kAudioChannelLayoutTag_Stereo;
  kAudioChannelLayoutTag_DVD_2 = kAudioChannelLayoutTag_ITU_2_1;
  kAudioChannelLayoutTag_DVD_3 = kAudioChannelLayoutTag_ITU_2_2;
  kAudioChannelLayoutTag_DVD_4 = 8716291;
  kAudioChannelLayoutTag_DVD_5 = 8781828;
  kAudioChannelLayoutTag_DVD_6 = 8847365;
  kAudioChannelLayoutTag_DVD_7 = kAudioChannelLayoutTag_MPEG_3_0_A;
  kAudioChannelLayoutTag_DVD_8 = kAudioChannelLayoutTag_MPEG_4_0_A;
  kAudioChannelLayoutTag_DVD_9 = kAudioChannelLayoutTag_MPEG_5_0_A;
  kAudioChannelLayoutTag_DVD_10 = 8912900;
  kAudioChannelLayoutTag_DVD_11 = 8978437;
  kAudioChannelLayoutTag_DVD_12 = kAudioChannelLayoutTag_MPEG_5_1_A;
  kAudioChannelLayoutTag_DVD_13 = kAudioChannelLayoutTag_DVD_8;
  kAudioChannelLayoutTag_DVD_14 = kAudioChannelLayoutTag_DVD_9;
  kAudioChannelLayoutTag_DVD_15 = kAudioChannelLayoutTag_DVD_10;
  kAudioChannelLayoutTag_DVD_16 = kAudioChannelLayoutTag_DVD_11;
  kAudioChannelLayoutTag_DVD_17 = kAudioChannelLayoutTag_DVD_12;
  kAudioChannelLayoutTag_DVD_18 = 9043973;
  kAudioChannelLayoutTag_DVD_19 = kAudioChannelLayoutTag_MPEG_5_0_B;
  kAudioChannelLayoutTag_DVD_20 = kAudioChannelLayoutTag_MPEG_5_1_B;
  kAudioChannelLayoutTag_AudioUnit_4 = kAudioChannelLayoutTag_Quadraphonic;
  kAudioChannelLayoutTag_AudioUnit_5 = kAudioChannelLayoutTag_Pentagonal;
  kAudioChannelLayoutTag_AudioUnit_6 = kAudioChannelLayoutTag_Hexagonal;
  kAudioChannelLayoutTag_AudioUnit_8 = kAudioChannelLayoutTag_Octagonal;
  kAudioChannelLayoutTag_AudioUnit_5_0 = kAudioChannelLayoutTag_MPEG_5_0_B;
  kAudioChannelLayoutTag_AudioUnit_6_0 = 9109510;
  kAudioChannelLayoutTag_AudioUnit_7_0 = 9175047;
  kAudioChannelLayoutTag_AudioUnit_7_0_Front = 9699335;
  kAudioChannelLayoutTag_AudioUnit_5_1 = kAudioChannelLayoutTag_MPEG_5_1_A;
  kAudioChannelLayoutTag_AudioUnit_6_1 = kAudioChannelLayoutTag_MPEG_6_1_A;
  kAudioChannelLayoutTag_AudioUnit_7_1 = kAudioChannelLayoutTag_MPEG_7_1_C;
  kAudioChannelLayoutTag_AudioUnit_7_1_Front = kAudioChannelLayoutTag_MPEG_7_1_A;
  kAudioChannelLayoutTag_AAC_3_0 = kAudioChannelLayoutTag_MPEG_3_0_B;
  kAudioChannelLayoutTag_AAC_Quadraphonic = kAudioChannelLayoutTag_Quadraphonic;
  kAudioChannelLayoutTag_AAC_4_0 = kAudioChannelLayoutTag_MPEG_4_0_B;
  kAudioChannelLayoutTag_AAC_5_0 = kAudioChannelLayoutTag_MPEG_5_0_D;
  kAudioChannelLayoutTag_AAC_5_1 = kAudioChannelLayoutTag_MPEG_5_1_D;
  kAudioChannelLayoutTag_AAC_6_0 = 9240582;
  kAudioChannelLayoutTag_AAC_6_1 = 9306119;
  kAudioChannelLayoutTag_AAC_7_0 = 9371655;
  kAudioChannelLayoutTag_AAC_7_1 = kAudioChannelLayoutTag_MPEG_7_1_B;
  kAudioChannelLayoutTag_AAC_7_1_B = 11993096;
  kAudioChannelLayoutTag_AAC_7_1_C = 12058632;
  kAudioChannelLayoutTag_AAC_Octagonal = 9437192;
  kAudioChannelLayoutTag_TMH_10_2_std = 9502736;
  kAudioChannelLayoutTag_TMH_10_2_full = 9568277;
  kAudioChannelLayoutTag_AC3_1_0_1 = 9764866;
  kAudioChannelLayoutTag_AC3_3_0 = 9830403;
  kAudioChannelLayoutTag_AC3_3_1 = 9895940;
  kAudioChannelLayoutTag_AC3_3_0_1 = 9961476;
  kAudioChannelLayoutTag_AC3_2_1_1 = 10027012;
  kAudioChannelLayoutTag_AC3_3_1_1 = 10092549;
  kAudioChannelLayoutTag_EAC_6_0_A = 10158086;
  kAudioChannelLayoutTag_EAC_7_0_A = 10223623;
  kAudioChannelLayoutTag_EAC3_6_1_A = 10289159;
  kAudioChannelLayoutTag_EAC3_6_1_B = 10354695;
  kAudioChannelLayoutTag_EAC3_6_1_C = 10420231;
  kAudioChannelLayoutTag_EAC3_7_1_A = 10485768;
  kAudioChannelLayoutTag_EAC3_7_1_B = 10551304;
  kAudioChannelLayoutTag_EAC3_7_1_C = 10616840;
  kAudioChannelLayoutTag_EAC3_7_1_D = 10682376;
  kAudioChannelLayoutTag_EAC3_7_1_E = 10747912;
  kAudioChannelLayoutTag_EAC3_7_1_F = 10813448;
  kAudioChannelLayoutTag_EAC3_7_1_G = 10878984;
  kAudioChannelLayoutTag_EAC3_7_1_H = 10944520;
  kAudioChannelLayoutTag_DTS_3_1 = 11010052;
  kAudioChannelLayoutTag_DTS_4_1 = 11075589;
  kAudioChannelLayoutTag_DTS_6_0_A = 11141126;
  kAudioChannelLayoutTag_DTS_6_0_B = 11206662;
  kAudioChannelLayoutTag_DTS_6_0_C = 11272198;
  kAudioChannelLayoutTag_DTS_6_1_A = 11337735;
  kAudioChannelLayoutTag_DTS_6_1_B = 11403271;
  kAudioChannelLayoutTag_DTS_6_1_C = 11468807;
  kAudioChannelLayoutTag_DTS_7_0 = 11534343;
  kAudioChannelLayoutTag_DTS_7_1 = 11599880;
  kAudioChannelLayoutTag_DTS_8_0_A = 11665416;
  kAudioChannelLayoutTag_DTS_8_0_B = 11730952;
  kAudioChannelLayoutTag_DTS_8_1_A = 11796489;
  kAudioChannelLayoutTag_DTS_8_1_B = 11862025;
  kAudioChannelLayoutTag_DTS_6_1_D = 11927559;
  kAudioChannelLayoutTag_HOA_ACN_SN3D = 12451840;
  kAudioChannelLayoutTag_HOA_ACN_N3D = 12517376;
  kAudioChannelLayoutTag_DiscreteInOrder = 9633792;
  kAudioChannelLayoutTag_BeginReserved = -268435456;
  kAudioChannelLayoutTag_EndReserved = -65537;
  kAudioChannelLayoutTag_Unknown = -65536;
  kMPEG4Object_AAC_Main = 1;
  kMPEG4Object_AAC_LC = 2;
  kMPEG4Object_AAC_SSR = 3;
  kMPEG4Object_AAC_LTP = 4;
  kMPEG4Object_AAC_SBR = 5;
  kMPEG4Object_AAC_Scalable = 6;
  kMPEG4Object_TwinVQ = 7;
  kMPEG4Object_CELP = 8;
  kMPEG4Object_HVXC = 9;
  kAudioHardwareNoError = 0;
  kAudioHardwareNotRunningError = 1937010544;
  kAudioHardwareUnspecifiedError = 2003329396;
  kAudioHardwareUnknownPropertyError = 2003332927;
  kAudioHardwareBadPropertySizeError = 561211770;
  kAudioHardwareIllegalOperationError = 1852797029;
  kAudioHardwareBadObjectError = 560947818;
  kAudioHardwareBadDeviceError = 560227702;
  kAudioHardwareBadStreamError = 561214578;
  kAudioHardwareUnsupportedOperationError = 1970171760;
  kAudioDeviceUnsupportedFormatError = 560226676;
  kAudioDevicePermissionsError = 560492391;
  kAudioObjectUnknown = 0;
  kAudioObjectPropertyScopeGlobal = 1735159650;
  kAudioObjectPropertyScopeInput = 1768845428;
  kAudioObjectPropertyScopeOutput = 1869968496;
  kAudioObjectPropertyScopePlayThrough = 1886679669;
  kAudioObjectPropertyElementMaster = 0;
  kAudioObjectPropertySelectorWildcard = 707406378;
  kAudioObjectPropertyScopeWildcard = 707406378;
  kAudioObjectPropertyElementWildcard = -1;
  kAudioObjectClassIDWildcard = 707406378;
  kAudioObjectClassID = 1634689642;
  kAudioObjectPropertyBaseClass = 1650682995;
  kAudioObjectPropertyClass = 1668047219;
  kAudioObjectPropertyOwner = 1937007734;
  kAudioObjectPropertyName = 1819173229;
  kAudioObjectPropertyModelName = 1819111268;
  kAudioObjectPropertyManufacturer = 1819107691;
  kAudioObjectPropertyElementName = 1818454126;
  kAudioObjectPropertyElementCategoryName = 1818452846;
  kAudioObjectPropertyElementNumberName = 1818455662;
  kAudioObjectPropertyOwnedObjects = 1870098020;
  kAudioObjectPropertyIdentify = 1768187246;
  kAudioObjectPropertySerialNumber = 1936618861;
  kAudioObjectPropertyFirmwareVersion = 1719105134;
  kAudioPlugInClassID = 1634757735;
  kAudioPlugInPropertyBundleID = 1885956452;
  kAudioPlugInPropertyDeviceList = 1684370979;
  kAudioPlugInPropertyTranslateUIDToDevice = 1969841252;
  kAudioPlugInPropertyBoxList = 1651472419;
  kAudioPlugInPropertyTranslateUIDToBox = 1969841250;
  kAudioPlugInPropertyClockDeviceList = 1668049699;
  kAudioPlugInPropertyTranslateUIDToClockDevice = 1969841251;
  kAudioTransportManagerClassID = 1953656941;
  kAudioTransportManagerPropertyEndPointList = 1701733411;
  kAudioTransportManagerPropertyTranslateUIDToEndPoint = 1969841253;
  kAudioTransportManagerPropertyTransportType = 1953653102;
  kAudioBoxClassID = 1633841016;
  kAudioBoxPropertyBoxUID = 1651861860;
  kAudioBoxPropertyTransportType = 1953653102;
  kAudioBoxPropertyHasAudio = 1651007861;
  kAudioBoxPropertyHasVideo = 1651013225;
  kAudioBoxPropertyHasMIDI = 1651010921;
  kAudioBoxPropertyIsProtected = 1651536495;
  kAudioBoxPropertyAcquired = 1652060014;
  kAudioBoxPropertyAcquisitionFailed = 1652060006;
  kAudioBoxPropertyDeviceList = 1650751011;
  kAudioBoxPropertyClockDeviceList = 1650682915;
  kAudioDeviceClassID = 1633969526;
  kAudioDeviceTransportTypeUnknown = 0;
  kAudioDeviceTransportTypeBuiltIn = 1651274862;
  kAudioDeviceTransportTypeAggregate = 1735554416;
  kAudioDeviceTransportTypeVirtual = 1986622068;
  kAudioDeviceTransportTypePCI = 1885563168;
  kAudioDeviceTransportTypeUSB = 1970496032;
  kAudioDeviceTransportTypeFireWire = 825440564;
  kAudioDeviceTransportTypeBluetooth = 1651275109;
  kAudioDeviceTransportTypeBluetoothLE = 1651271009;
  kAudioDeviceTransportTypeHDMI = 1751412073;
  kAudioDeviceTransportTypeDisplayPort = 1685090932;
  kAudioDeviceTransportTypeAirPlay = 1634300528;
  kAudioDeviceTransportTypeAVB = 1700886114;
  kAudioDeviceTransportTypeThunderbolt = 1953002862;
  kAudioDevicePropertyConfigurationApplication = 1667330160;
  kAudioDevicePropertyDeviceUID = 1969841184;
  kAudioDevicePropertyModelUID = 1836411236;
  kAudioDevicePropertyTransportType = 1953653102;
  kAudioDevicePropertyRelatedDevices = 1634429294;
  kAudioDevicePropertyClockDomain = 1668049764;
  kAudioDevicePropertyDeviceIsAlive = 1818850926;
  kAudioDevicePropertyDeviceIsRunning = 1735354734;
  kAudioDevicePropertyDeviceCanBeDefaultDevice = 1684434036;
  kAudioDevicePropertyDeviceCanBeDefaultSystemDevice = 1936092276;
  kAudioDevicePropertyLatency = 1819569763;
  kAudioDevicePropertyStreams = 1937009955;
  kAudioObjectPropertyControlList = 1668575852;
  kAudioDevicePropertySafetyOffset = 1935763060;
  kAudioDevicePropertyNominalSampleRate = 1853059700;
  kAudioDevicePropertyAvailableNominalSampleRates = 1853059619;
  kAudioDevicePropertyIcon = 1768124270;
  kAudioDevicePropertyIsHidden = 1751737454;
  kAudioDevicePropertyPreferredChannelsForStereo = 1684236338;
  kAudioDevicePropertyPreferredChannelLayout = 1936879204;
  kAudioClockDeviceClassID = 1633905771;
  kAudioClockDevicePropertyDeviceUID = 1668639076;
  kAudioClockDevicePropertyTransportType = 1953653102;
  kAudioClockDevicePropertyClockDomain = 1668049764;
  kAudioClockDevicePropertyDeviceIsAlive = 1818850926;
  kAudioClockDevicePropertyDeviceIsRunning = 1735354734;
  kAudioClockDevicePropertyLatency = 1819569763;
  kAudioClockDevicePropertyControlList = 1668575852;
  kAudioClockDevicePropertyNominalSampleRate = 1853059700;
  kAudioClockDevicePropertyAvailableNominalSampleRates = 1853059619;
  kAudioEndPointDeviceClassID = 1701078390;
  kAudioEndPointDevicePropertyComposition = 1633906541;
  kAudioEndPointDevicePropertyEndPointList = 1634169456;
  kAudioEndPointDevicePropertyIsPrivate = 1886546294;
  kAudioEndPointClassID = 1701733488;
  kAudioStreamClassID = 1634956402;
  kAudioStreamTerminalTypeUnknown = 0;
  kAudioStreamTerminalTypeLine = 1818848869;
  kAudioStreamTerminalTypeDigitalAudioInterface = 1936745574;
  kAudioStreamTerminalTypeSpeaker = 1936747378;
  kAudioStreamTerminalTypeHeadphones = 1751412840;
  kAudioStreamTerminalTypeLFESpeaker = 1818649971;
  kAudioStreamTerminalTypeReceiverSpeaker = 1920168043;
  kAudioStreamTerminalTypeMicrophone = 1835623282;
  kAudioStreamTerminalTypeHeadsetMicrophone = 1752000867;
  kAudioStreamTerminalTypeReceiverMicrophone = 1919773027;
  kAudioStreamTerminalTypeTTY = 1953790303;
  kAudioStreamTerminalTypeHDMI = 1751412073;
  kAudioStreamTerminalTypeDisplayPort = 1685090932;
  kAudioStreamPropertyIsActive = 1935762292;
  kAudioStreamPropertyDirection = 1935960434;
  kAudioStreamPropertyTerminalType = 1952805485;
  kAudioStreamPropertyStartingChannel = 1935894638;
  kAudioStreamPropertyLatency = kAudioDevicePropertyLatency;
  kAudioStreamPropertyVirtualFormat = 1936092532;
  kAudioStreamPropertyAvailableVirtualFormats = 1936092513;
  kAudioStreamPropertyPhysicalFormat = 1885762592;
  kAudioStreamPropertyAvailablePhysicalFormats = 1885762657;
  kAudioControlClassID = 1633907820;
  kAudioControlPropertyScope = 1668506480;
  kAudioControlPropertyElement = 1667591277;
  kAudioSliderControlClassID = 1936483442;
  kAudioSliderControlPropertyValue = 1935962742;
  kAudioSliderControlPropertyRange = 1935962738;
  kAudioLevelControlClassID = 1818588780;
  kAudioVolumeControlClassID = 1986817381;
  kAudioLFEVolumeControlClassID = 1937072758;
  kAudioLevelControlPropertyScalarValue = 1818456950;
  kAudioLevelControlPropertyDecibelValue = 1818453110;
  kAudioLevelControlPropertyDecibelRange = 1818453106;
  kAudioLevelControlPropertyConvertScalarToDecibels = 1818456932;
  kAudioLevelControlPropertyConvertDecibelsToScalar = 1818453107;
  kAudioBooleanControlClassID = 1953458028;
  kAudioMuteControlClassID = 1836414053;
  kAudioSoloControlClassID = 1936682095;
  kAudioJackControlClassID = 1784767339;
  kAudioLFEMuteControlClassID = 1937072749;
  kAudioPhantomPowerControlClassID = 1885888878;
  kAudioPhaseInvertControlClassID = 1885893481;
  kAudioClipLightControlClassID = 1668049264;
  kAudioTalkbackControlClassID = 1952541794;
  kAudioListenbackControlClassID = 1819504226;
  kAudioBooleanControlPropertyValue = 1650685548;
  kAudioSelectorControlClassID = 1936483188;
  kAudioDataSourceControlClassID = 1685287523;
  kAudioDataDestinationControlClassID = 1684370292;
  kAudioClockSourceControlClassID = 1668047723;
  kAudioLineLevelControlClassID = 1852601964;
  kAudioHighPassFilterControlClassID = 1751740518;
  kAudioSelectorControlPropertyCurrentItem = 1935893353;
  kAudioSelectorControlPropertyAvailableItems = 1935892841;
  kAudioSelectorControlPropertyItemName = 1935894894;
  kAudioSelectorControlPropertyItemKind = 1668049771;
  kAudioSelectorControlItemKindSpacer = 1936745330;
  kAudioClockSourceItemKindInternal = 1768846368;
  kAudioStereoPanControlClassID = 1936744814;
  kAudioStereoPanControlPropertyValue = 1936745334;
  kAudioStereoPanControlPropertyPanningChannels = 1936745315;
  kAudioObjectSystemObject = 1;
  kAudioObjectPropertyCreator = 1869638759;
  kAudioObjectPropertyListenerAdded = 1818850145;
  kAudioObjectPropertyListenerRemoved = 1818850162;
  kAudioSystemObjectClassID = 1634957683;
  kAudioHardwarePowerHintNone = 0;
  kAudioHardwarePowerHintFavorSavingPower = 1;
  kAudioHardwarePropertyDevices = 1684370979;
  kAudioHardwarePropertyDefaultInputDevice = 1682533920;
  kAudioHardwarePropertyDefaultOutputDevice = 1682929012;
  kAudioHardwarePropertyDefaultSystemOutputDevice = 1934587252;
  kAudioHardwarePropertyTranslateUIDToDevice = 1969841252;
  kAudioHardwarePropertyMixStereoToMono = 1937010031;
  kAudioHardwarePropertyPlugInList = 1886152483;
  kAudioHardwarePropertyTranslateBundleIDToPlugIn = 1651074160;
  kAudioHardwarePropertyTransportManagerList = 1953326883;
  kAudioHardwarePropertyTranslateBundleIDToTransportManager = 1953325673;
  kAudioHardwarePropertyBoxList = 1651472419;
  kAudioHardwarePropertyTranslateUIDToBox = 1969841250;
  kAudioHardwarePropertyClockDeviceList = 1668049699;
  kAudioHardwarePropertyTranslateUIDToClockDevice = 1969841251;
  kAudioHardwarePropertyProcessIsMaster = 1835103092;
  kAudioHardwarePropertyIsInitingOrExiting = 1768845172;
  kAudioHardwarePropertyUserIDChanged = 1702193508;
  kAudioHardwarePropertyProcessIsAudible = 1886221684;
  kAudioHardwarePropertySleepingIsAllowed = 1936483696;
  kAudioHardwarePropertyUnloadingIsAllowed = 1970170980;
  kAudioHardwarePropertyHogModeIsAllowed = 1752131442;
  kAudioHardwarePropertyUserSessionIsActiveOrHeadless = 1970496882;
  kAudioHardwarePropertyServiceRestarted = 1936880500;
  kAudioHardwarePropertyPowerHint = 1886353256;
  kAudioPlugInCreateAggregateDevice = 1667327847;
  kAudioPlugInDestroyAggregateDevice = 1684105063;
  kAudioTransportManagerCreateEndPointDevice = 1667523958;
  kAudioTransportManagerDestroyEndPointDevice = 1684301174;
  kAudioDeviceStartTimeIsInputFlag = 1;
  kAudioDeviceStartTimeDontConsultDeviceFlag = 2;
  kAudioDeviceStartTimeDontConsultHALFlag = 4;
  kAudioDevicePropertyPlugIn = 1886156135;
  kAudioDevicePropertyDeviceHasChanged = 1684629094;
  kAudioDevicePropertyDeviceIsRunningSomewhere = 1735356005;
  kAudioDeviceProcessorOverload = 1870030194;
  kAudioDevicePropertyIOStoppedAbnormally = 1937010788;
  kAudioDevicePropertyHogMode = 1869180523;
  kAudioDevicePropertyBufferFrameSize = 1718839674;
  kAudioDevicePropertyBufferFrameSizeRange = 1718843939;
  kAudioDevicePropertyUsesVariableBufferFrameSizes = 1986425722;
  kAudioDevicePropertyIOCycleUsage = 1852012899;
  kAudioDevicePropertyStreamConfiguration = 1936482681;
  kAudioDevicePropertyIOProcStreamUsage = 1937077093;
  kAudioDevicePropertyActualSampleRate = 1634955892;
  kAudioDevicePropertyClockDevice = 1634755428;
  kAudioDevicePropertyJackIsConnected = 1784767339;
  kAudioDevicePropertyVolumeScalar = 1987013741;
  kAudioDevicePropertyVolumeDecibels = 1987013732;
  kAudioDevicePropertyVolumeRangeDecibels = 1986290211;
  kAudioDevicePropertyVolumeScalarToDecibels = 1983013986;
  kAudioDevicePropertyVolumeDecibelsToScalar = 1684157046;
  kAudioDevicePropertyStereoPan = 1936744814;
  kAudioDevicePropertyStereoPanChannels = 1936748067;
  kAudioDevicePropertyMute = 1836414053;
  kAudioDevicePropertySolo = 1936682095;
  kAudioDevicePropertyPhantomPower = 1885888878;
  kAudioDevicePropertyPhaseInvert = 1885893481;
  kAudioDevicePropertyClipLight = 1668049264;
  kAudioDevicePropertyTalkback = 1952541794;
  kAudioDevicePropertyListenback = 1819504226;
  kAudioDevicePropertyDataSource = 1936945763;
  kAudioDevicePropertyDataSources = 1936941859;
  kAudioDevicePropertyDataSourceNameForIDCFString = 1819501422;
  kAudioDevicePropertyDataSourceKindForID = 1936941931;
  kAudioDevicePropertyClockSource = 1668510307;
  kAudioDevicePropertyClockSources = 1668506403;
  kAudioDevicePropertyClockSourceNameForIDCFString = 1818456942;
  kAudioDevicePropertyClockSourceKindForID = 1668506475;
  kAudioDevicePropertyPlayThru = 1953002101;
  kAudioDevicePropertyPlayThruSolo = 1953002099;
  kAudioDevicePropertyPlayThruVolumeScalar = 1836479331;
  kAudioDevicePropertyPlayThruVolumeDecibels = 1836475490;
  kAudioDevicePropertyPlayThruVolumeRangeDecibels = 1836475427;
  kAudioDevicePropertyPlayThruVolumeScalarToDecibels = 1836462692;
  kAudioDevicePropertyPlayThruVolumeDecibelsToScalar = 1836462707;
  kAudioDevicePropertyPlayThruStereoPan = 1836281966;
  kAudioDevicePropertyPlayThruStereoPanChannels = 1836281891;
  kAudioDevicePropertyPlayThruDestination = 1835295859;
  kAudioDevicePropertyPlayThruDestinations = 1835295779;
  kAudioDevicePropertyPlayThruDestinationNameForIDCFString = 1835295843;
  kAudioDevicePropertyChannelNominalLineLevel = 1852601964;
  kAudioDevicePropertyChannelNominalLineLevels = 1852601891;
  kAudioDevicePropertyChannelNominalLineLevelNameForIDCFString = 1818455660;
  kAudioDevicePropertyHighPassFilterSetting = 1751740518;
  kAudioDevicePropertyHighPassFilterSettings = 1751740451;
  kAudioDevicePropertyHighPassFilterSettingNameForIDCFString = 1751740524;
  kAudioDevicePropertySubVolumeScalar = 1937140845;
  kAudioDevicePropertySubVolumeDecibels = 1937140836;
  kAudioDevicePropertySubVolumeRangeDecibels = 1937138723;
  kAudioDevicePropertySubVolumeScalarToDecibels = 1937125988;
  kAudioDevicePropertySubVolumeDecibelsToScalar = 1935946358;
  kAudioDevicePropertySubMute = 1936553332;
  kAudioAggregateDeviceClassID = 1633773415;
  kAudioAggregateDevicePropertyFullSubDeviceList = 1735554416;
  kAudioAggregateDevicePropertyActiveSubDeviceList = 1634169456;
  kAudioAggregateDevicePropertyComposition = 1633906541;
  kAudioAggregateDevicePropertyMasterSubDevice = 1634562932;
  kAudioAggregateDevicePropertyClockDevice = 1634755428;
  kAudioSubDeviceClassID = 1634956642;
  kAudioSubDeviceDriftCompensationMinQuality = 0;
  kAudioSubDeviceDriftCompensationLowQuality = 32;
  kAudioSubDeviceDriftCompensationMediumQuality = 64;
  kAudioSubDeviceDriftCompensationHighQuality = 96;
  kAudioSubDeviceDriftCompensationMaxQuality = 127;
  kAudioSubDevicePropertyExtraLatency = 2020373603;
  kAudioSubDevicePropertyDriftCompensation = 1685218932;
  kAudioSubDevicePropertyDriftCompensationQuality = 1685218929;
  kAudioDevicePropertyScopeInput = kAudioObjectPropertyScopeInput;
  kAudioDevicePropertyScopeOutput = kAudioObjectPropertyScopeOutput;
  kAudioDevicePropertyScopePlayThrough = kAudioObjectPropertyScopePlayThrough;
  kAudioPropertyWildcardPropertyID = kAudioObjectPropertySelectorWildcard;
  kAudioPropertyWildcardSection = -1;
  kAudioPropertyWildcardChannel = kAudioObjectPropertyElementWildcard;
  kAudioISubOwnerControlClassID = 1635017576;
  kAudioLevelControlPropertyDecibelsToScalarTransferFunction = 1818457190;
  kAudioLevelControlTranferFunctionLinear = 0;
  kAudioLevelControlTranferFunction1Over3 = 1;
  kAudioLevelControlTranferFunction1Over2 = 2;
  kAudioLevelControlTranferFunction3Over4 = 3;
  kAudioLevelControlTranferFunction3Over2 = 4;
  kAudioLevelControlTranferFunction2Over1 = 5;
  kAudioLevelControlTranferFunction3Over1 = 6;
  kAudioLevelControlTranferFunction4Over1 = 7;
  kAudioLevelControlTranferFunction5Over1 = 8;
  kAudioLevelControlTranferFunction6Over1 = 9;
  kAudioLevelControlTranferFunction7Over1 = 10;
  kAudioLevelControlTranferFunction8Over1 = 11;
  kAudioLevelControlTranferFunction9Over1 = 12;
  kAudioLevelControlTranferFunction10Over1 = 13;
  kAudioLevelControlTranferFunction11Over1 = 14;
  kAudioLevelControlTranferFunction12Over1 = 15;
  kAudioHardwarePropertyRunLoop = 1919839344;
  kAudioHardwarePropertyDeviceForUID = 1685416292;
  kAudioHardwarePropertyPlugInForBundleID = 1885954665;
  kAudioHardwarePropertyBootChimeVolumeScalar = 1650620019;
  kAudioHardwarePropertyBootChimeVolumeDecibels = 1650620004;
  kAudioHardwarePropertyBootChimeVolumeRangeDecibels = 1650615331;
  kAudioHardwarePropertyBootChimeVolumeScalarToDecibels = 1651913316;
  kAudioHardwarePropertyBootChimeVolumeDecibelsToScalar = 1650733686;
  kAudioHardwarePropertyBootChimeVolumeDecibelsToScalarTransferFunction = 1651930214;
  kAudioDeviceUnknown = kAudioObjectUnknown;
  kAudioDeviceTransportTypeAutoAggregate = 1718055536;
  kAudioDevicePropertyVolumeDecibelsToScalarTransferFunction = 1986229350;
  kAudioDevicePropertyPlayThruVolumeDecibelsToScalarTransferFunction = 1836479590;
  kAudioDevicePropertyDriverShouldOwniSub = 1769174370;
  kAudioDevicePropertySubVolumeDecibelsToScalarTransferFunction = 1937142886;
  kAudioDevicePropertyDeviceName = 1851878757;
  kAudioDevicePropertyDeviceNameCFString = kAudioObjectPropertyName;
  kAudioDevicePropertyDeviceManufacturer = 1835101042;
  kAudioDevicePropertyDeviceManufacturerCFString = kAudioObjectPropertyManufacturer;
  kAudioDevicePropertyRegisterBufferList = 1919055206;
  kAudioDevicePropertyBufferSize = 1651730810;
  kAudioDevicePropertyBufferSizeRange = 1651735075;
  kAudioDevicePropertyChannelName = 1667788397;
  kAudioDevicePropertyChannelNameCFString = kAudioObjectPropertyElementName;
  kAudioDevicePropertyChannelCategoryName = 1667460717;
  kAudioDevicePropertyChannelCategoryNameCFString = kAudioObjectPropertyElementCategoryName;
  kAudioDevicePropertyChannelNumberName = 1668181613;
  kAudioDevicePropertyChannelNumberNameCFString = kAudioObjectPropertyElementNumberName;
  kAudioDevicePropertySupportsMixing = 1835628607;
  kAudioDevicePropertyStreamFormat = 1936092532;
  kAudioDevicePropertyStreamFormats = 1936092451;
  kAudioDevicePropertyStreamFormatSupported = 1936092479;
  kAudioDevicePropertyStreamFormatMatch = 1936092525;
  kAudioDevicePropertyDataSourceNameForID = 1936941934;
  kAudioDevicePropertyClockSourceNameForID = 1668506478;
  kAudioDevicePropertyPlayThruDestinationNameForID = 1835295854;
  kAudioDevicePropertyChannelNominalLineLevelNameForID = 1668181110;
  kAudioDevicePropertyHighPassFilterSettingNameForID = 1667787120;
  kAudioStreamUnknown = kAudioObjectUnknown;
  kAudioStreamPropertyOwningDevice = kAudioObjectPropertyOwner;
  kAudioStreamPropertyPhysicalFormats = 1885762595;
  kAudioStreamPropertyPhysicalFormatSupported = 1885762623;
  kAudioStreamPropertyPhysicalFormatMatch = 1885762669;
  kAudioBootChimeVolumeControlClassID = 1886544237;
  kAudioControlPropertyVariant = 1668702578;
  kAudioClockSourceControlPropertyItemKind = kAudioSelectorControlPropertyItemKind;
  kAudioObjectPlugInObject = 1;
  kAudioServerPlugInHostClientID = 0;
  kAudioServerPlugInCustomPropertyDataTypeNone = 0;
  kAudioServerPlugInCustomPropertyDataTypeCFString = 1667658612;
  kAudioServerPlugInCustomPropertyDataTypeCFPropertyList = 1886155636;
  kAudioServerPlugInIOOperationThread = 1953002084;
  kAudioServerPlugInIOOperationCycle = 1668899692;
  kAudioServerPlugInIOOperationReadInput = 1919246692;
  kAudioServerPlugInIOOperationConvertInput = 1667853936;
  kAudioServerPlugInIOOperationProcessInput = 1885957744;
  kAudioServerPlugInIOOperationProcessOutput = 1886352756;
  kAudioServerPlugInIOOperationMixOutput = 1835628655;
  kAudioServerPlugInIOOperationProcessMix = 1886218616;
  kAudioServerPlugInIOOperationConvertMix = 1668114808;
  kAudioServerPlugInIOOperationWriteMix = 1919513701;
  kAudioObjectPropertyCustomPropertyInfoList = 1668641652;
  kAudioPlugInPropertyResourceBundle = 1920168547;
  kAudioDeviceClockAlgorithmRaw = 1918990199;
  kAudioDeviceClockAlgorithmSimpleIIR = 1768518246;
  kAudioDeviceClockAlgorithm12PtMovingWindowAverage = 1835103847;
  kAudioDevicePropertyZeroTimeStampPeriod = 1919512167;
  kAudioDevicePropertyClockAlgorithm = 1668050795;
  kAudioDevicePropertyClockIsStable = 1668510818;

type
  // Needs review - BEGIN
  PAudioHardwarePlugInInterface = ^AudioHardwarePlugInInterface;
  PPAudioHardwarePlugInInterface = ^PAudioHardwarePlugInInterface;
  PAudioObjectPropertyAddress = ^AudioObjectPropertyAddress;
  PAudioServerPlugInClientInfo = ^AudioServerPlugInClientInfo;
  PAudioServerPlugInDriverInterface = ^AudioServerPlugInDriverInterface;
  PPAudioServerPlugInDriverInterface = ^PAudioServerPlugInDriverInterface;
  PAudioServerPlugInHostInterface = ^AudioServerPlugInHostInterface;
  PAudioDriverPlugInHostInfo = ^AudioDriverPlugInHostInfo;
  PAudioServerPlugInIOCycleInfo = ^AudioServerPlugInIOCycleInfo;
  PAudioTimeStamp = ^AudioTimeStamp;
  PFloat64 = ^Float64;
  PLPVOID = ^PPointer;
  REFIID = CFUUIDRef;
  // Needs review - END

  AudioValueRange = record
    mMinimum: Float64;
    mMaximum: Float64;
  end;

  AudioValueTranslation = record
    mInputData: Pointer;
    mInputDataSize: UInt32;
    mOutputData: Pointer;
    mOutputDataSize: UInt32;
  end;

  AudioBuffer = record
    mNumberChannels: UInt32;
    mDataByteSize: UInt32;
    mData: Pointer;
  end;

  AudioBufferList = record
    mNumberBuffers: UInt32;
    mBuffers: array [0..0] of AudioBuffer;
  end;

  AudioSampleType = Float32;
  AudioUnitSampleType = Float32;
  AudioFormatID = UInt32;
  AudioFormatFlags = UInt32;

  AudioStreamBasicDescription = record
    mSampleRate: Float64;
    mFormatID: AudioFormatID;
    mFormatFlags: AudioFormatFlags;
    mBytesPerPacket: UInt32;
    mFramesPerPacket: UInt32;
    mBytesPerFrame: UInt32;
    mChannelsPerFrame: UInt32;
    mBitsPerChannel: UInt32;
    mReserved: UInt32;
  end;

  AudioStreamPacketDescription = record
    mStartOffset: SInt64;
    mVariableFramesInPacket: UInt32;
    mDataByteSize: UInt32;
  end;

  SMPTETimeType = NSInteger;
  SMPTETimeFlags = NSInteger;

  SMPTETime = record
    mSubframes: SInt16;
    mSubframeDivisor: SInt16;
    mCounter: UInt32;
    mType: SMPTETimeType;
    mFlags: SMPTETimeFlags;
    mHours: SInt16;
    mMinutes: SInt16;
    mSeconds: SInt16;
    mFrames: SInt16;
  end;

  AudioTimeStampFlags = NSInteger;

  AudioTimeStamp = record
    mSampleTime: Float64;
    mHostTime: UInt64;
    mRateScalar: Float64;
    mWordClockTime: UInt64;
    mSMPTETime: SMPTETime;
    mFlags: AudioTimeStampFlags;
    mReserved: UInt32;
  end;

  AudioClassDescription = record
    mType: OSType;
    mSubType: OSType;
    mManufacturer: OSType;
  end;

  AudioChannelLabel = UInt32;
  AudioChannelLayoutTag = UInt32;
  AudioChannelBitmap = NSInteger;
  AudioChannelFlags = NSInteger;
  AudioChannelCoordinateIndex = NSInteger;

  AudioChannelDescription = record
    mChannelLabel: AudioChannelLabel;
    mChannelFlags: AudioChannelFlags;
    mCoordinates: array [0..2] of Float32;
  end;

  AudioChannelLayout = record
    mChannelLayoutTag: AudioChannelLayoutTag;
    mChannelBitmap: AudioChannelBitmap;
    mNumberChannelDescriptions: UInt32;
    mChannelDescriptions: array [0..0] of AudioChannelDescription;
  end;

  MPEG4ObjectID = NSInteger;
  AudioObjectID = UInt32;
  PAudioObjectID = ^AudioObjectID;
  AudioClassID = UInt32;
  AudioObjectPropertySelector = UInt32;
  AudioObjectPropertyScope = UInt32;
  AudioObjectPropertyElement = UInt32;

  AudioObjectPropertyAddress = record
    mSelector: AudioObjectPropertySelector;
    mScope: AudioObjectPropertyScope;
    mElement: AudioObjectPropertyElement;
  end;

  AudioStreamRangedDescription = record
    mFormat: AudioStreamBasicDescription;
    mSampleRateRange: AudioValueRange;
  end;

  AudioObjectPropertyListenerProc = function(inObjectID: AudioObjectID; inNumberAddresses: UInt32; inAddresses: PAudioObjectPropertyAddress;
    inClientData: Pointer): OSStatus; cdecl;

  AudioObjectPropertyListenerBlock = procedure(inNumberAddresses: UInt32; inAddresses: PAudioObjectPropertyAddress) of object;
  AudioHardwarePowerHint = NSInteger;

  AudioDeviceIOProc = function(inDevice: AudioObjectID; inNow: PAudioTimeStamp; inInputData: PAudioBufferList; inInputTime: PAudioTimeStamp;
    outOutputData: PAudioBufferList; inOutputTime: PAudioTimeStamp; inClientData: Pointer): OSStatus; cdecl;

  AudioDeviceIOBlock = procedure(inNow: PAudioTimeStamp; inInputData: PAudioBufferList; inInputTime: PAudioTimeStamp;
    outOutputData: PAudioBufferList; inOutputTime: PAudioTimeStamp) of object;
  AudioDeviceIOProcID = AudioDeviceIOProc;
  PAudioDeviceIOProcID = ^AudioDeviceIOProcID;

  AudioHardwareIOProcStreamUsage = record
    mIOProc: Pointer;
    mNumberStreams: UInt32;
    mStreamIsOn: array [0..0] of UInt32;
  end;

  AudioLevelControlTransferFunction = NSInteger;
  AudioHardwarePropertyID = AudioObjectPropertySelector;

  AudioHardwarePropertyListenerProc = function(inPropertyID: AudioHardwarePropertyID; inClientData: Pointer): OSStatus; cdecl;
  AudioDeviceID = AudioObjectID;
  PAudioDeviceID = ^AudioDeviceID;
  AudioDevicePropertyID = AudioObjectPropertySelector;

  AudioDevicePropertyListenerProc = function(inDevice: AudioDeviceID; inChannel: UInt32; isInput: Boolean; inPropertyID: AudioDevicePropertyID;
    inClientData: Pointer): OSStatus; cdecl;
  AudioStreamID = AudioObjectID;
  PAudioStreamID = ^AudioStreamID;

  AudioStreamPropertyListenerProc = function(inStream: AudioStreamID; inChannel: UInt32; inPropertyID: AudioDevicePropertyID;
    inClientData: Pointer): OSStatus; cdecl;

  AudioDriverPlugInDevicePropertyChangedProc = function(inDevice: AudioDeviceID; inChannel: UInt32; isInput: Boolean;
    inPropertyID: AudioDevicePropertyID): OSStatus; cdecl;

  AudioDriverPlugInStreamPropertyChangedProc = function(inDevice: AudioDeviceID; inIOAudioStream: io_object_t; inChannel: UInt32;
    inPropertyID: AudioDevicePropertyID): OSStatus; cdecl;

  AudioDriverPlugInHostInfo = record
    mDeviceID: AudioDeviceID;
    mIOAudioDevice: io_object_t;
    mIOAudioEngine: io_object_t;
    mDevicePropertyChangedProc: AudioDriverPlugInDevicePropertyChangedProc;
    mStreamPropertyChangedProc: AudioDriverPlugInStreamPropertyChangedProc;
  end;

  AudioHardwarePlugInRef = PPAudioHardwarePlugInInterface;

  AudioHardwarePlugInInterface = record
    _reserved: Pointer;
    QueryInterface: function(inSelf: Pointer; inUUID: REFIID; outInterface: PLPVOID): HRESULT; cdecl;
    AddRef: function(inSelf: Pointer): UInt32; cdecl;
    Release: function(inSelf: Pointer): UInt32; cdecl;
    Initialize: function(inSelf: AudioHardwarePlugInRef): OSStatus; cdecl;
    Teardown: function(inSelf: AudioHardwarePlugInRef): OSStatus; cdecl;
    DeviceAddIOProc: function(inSelf: AudioHardwarePlugInRef; inDevice: AudioDeviceID; inProc: AudioDeviceIOProc; inClientData: Pointer): OSStatus; cdecl;
    DeviceRemoveIOProc: function(inSelf: AudioHardwarePlugInRef; inDevice: AudioDeviceID; inProc: AudioDeviceIOProc): OSStatus; cdecl;
    DeviceStart: function(inSelf: AudioHardwarePlugInRef; inDevice: AudioDeviceID; inProc: AudioDeviceIOProcID): OSStatus; cdecl;
    DeviceStop: function(inSelf: AudioHardwarePlugInRef; inDevice: AudioDeviceID; inProc: AudioDeviceIOProcID): OSStatus; cdecl;
    DeviceRead: function(inSelf: AudioHardwarePlugInRef; inDevice: AudioDeviceID; inStartTime: PAudioTimeStamp; outData: PAudioBufferList): OSStatus; cdecl;
    DeviceGetCurrentTime: function(inSelf: AudioHardwarePlugInRef; inDevice: AudioDeviceID; outTime: PAudioTimeStamp): OSStatus; cdecl;
    DeviceTranslateTime: function(inSelf: AudioHardwarePlugInRef; inDevice: AudioDeviceID; inTime: PAudioTimeStamp; outTime: PAudioTimeStamp): OSStatus; cdecl;
    DeviceGetPropertyInfo: function(inSelf: AudioHardwarePlugInRef; inDevice: AudioDeviceID; inChannel: UInt32; isInput: Boolean;
      inPropertyID: AudioDevicePropertyID; outSize: PUInt32; outWritable: PBoolean): OSStatus; cdecl;
    DeviceGetProperty: function(inSelf: AudioHardwarePlugInRef; inDevice: AudioDeviceID; inChannel: UInt32; isInput: Boolean;
      inPropertyID: AudioDevicePropertyID; ioPropertyDataSize: PUInt32; outPropertyData: Pointer): OSStatus; cdecl;
    DeviceSetProperty: function(inSelf: AudioHardwarePlugInRef; inDevice: AudioDeviceID; inWhen: PAudioTimeStamp; inChannel: UInt32;
      isInput: Boolean; inPropertyID: AudioDevicePropertyID; inPropertyDataSize: UInt32; inPropertyData: Pointer): OSStatus; cdecl;
    StreamGetPropertyInfo: function(inSelf: AudioHardwarePlugInRef; inStream: AudioStreamID; inChannel: UInt32; inPropertyID: AudioDevicePropertyID;
      outSize: PUInt32; outWritable: PBoolean): OSStatus; cdecl;
    StreamGetProperty: function(inSelf: AudioHardwarePlugInRef; inStream: AudioStreamID; inChannel: UInt32; inPropertyID: AudioDevicePropertyID;
      ioPropertyDataSize: PUInt32; outPropertyData: Pointer): OSStatus; cdecl;
    StreamSetProperty: function(inSelf: AudioHardwarePlugInRef; inStream: AudioStreamID; inWhen: PAudioTimeStamp; inChannel: UInt32;
      inPropertyID: AudioDevicePropertyID; inPropertyDataSize: UInt32; inPropertyData: Pointer): OSStatus; cdecl;
    DeviceStartAtTime: function(inSelf: AudioHardwarePlugInRef; inDevice: AudioDeviceID; inProc: AudioDeviceIOProcID;
      ioRequestedStartTime: PAudioTimeStamp; inFlags: UInt32): OSStatus; cdecl;
    DeviceGetNearestStartTime: function(inSelf: AudioHardwarePlugInRef; inDevice: AudioDeviceID; ioRequestedStartTime: PAudioTimeStamp;
      inFlags: UInt32): OSStatus; cdecl;
    InitializeWithObjectID: function(inSelf: AudioHardwarePlugInRef; inObjectID: AudioObjectID): OSStatus; cdecl;
    ObjectShow: procedure(inSelf: AudioHardwarePlugInRef; inObjectID: AudioObjectID); cdecl;
    ObjectHasProperty: function(inSelf: AudioHardwarePlugInRef; inObjectID: AudioObjectID; inAddress: PAudioObjectPropertyAddress): Boolean; cdecl;
    ObjectIsPropertySettable: function(inSelf: AudioHardwarePlugInRef; inObjectID: AudioObjectID; inAddress: PAudioObjectPropertyAddress;
      outIsSettable: PBoolean): OSStatus; cdecl;
    ObjectGetPropertyDataSize: function(inSelf: AudioHardwarePlugInRef; inObjectID: AudioObjectID; inAddress: PAudioObjectPropertyAddress;
      inQualifierDataSize: UInt32; inQualifierData: Pointer; outDataSize: PUInt32): OSStatus; cdecl;
    ObjectGetPropertyData: function(inSelf: AudioHardwarePlugInRef; inObjectID: AudioObjectID; inAddress: PAudioObjectPropertyAddress;
      inQualifierDataSize: UInt32; inQualifierData: Pointer; ioDataSize: PUInt32; outData: Pointer): OSStatus; cdecl;
    ObjectSetPropertyData: function(inSelf: AudioHardwarePlugInRef; inObjectID: AudioObjectID; inAddress: PAudioObjectPropertyAddress;
      inQualifierDataSize: UInt32; inQualifierData: Pointer; inDataSize: UInt32; inData: Pointer): OSStatus; cdecl;
    DeviceCreateIOProcID: function(inSelf: AudioHardwarePlugInRef; inDevice: AudioDeviceID; inProc: AudioDeviceIOProc; inClientData: Pointer;
      outIOProcID: PAudioDeviceIOProcID): OSStatus; cdecl;
    DeviceDestroyIOProcID: function(inSelf: AudioHardwarePlugInRef; inDevice: AudioDeviceID; inIOProcID: AudioDeviceIOProcID): OSStatus; cdecl;
    DeviceCreateIOProcIDWithBlock: function(inSelf: AudioHardwarePlugInRef; outIOProcID: PAudioDeviceIOProcID; inDevice: AudioDeviceID;
      inDispatchQueue: dispatch_queue_t; inBlock: AudioDeviceIOBlock): OSStatus; cdecl;
  end;

  AudioServerPlugInHostRef = PAudioServerPlugInHostInterface;
  AudioServerPlugInDriverRef = PPAudioServerPlugInDriverInterface;

  AudioServerPlugInCustomPropertyInfo = record
    mSelector: AudioObjectPropertySelector;
    mPropertyDataType: UInt32;
    mQualifierDataType: UInt32;
  end;

  AudioServerPlugInClientInfo = record
    mClientID: UInt32;
    mProcessID: pid_t;
    mIsNativeEndian: Boolean;
    mBundleID: CFStringRef;
  end;

  AudioServerPlugInIOCycleInfo = record
    mIOCycleCounter: UInt64;
    mNominalIOBufferFrameSize: UInt32;
    mCurrentTime: AudioTimeStamp;
    mInputTime: AudioTimeStamp;
    mOutputTime: AudioTimeStamp;
    mMasterHostTicksPerFrame: Float64;
    mDeviceHostTicksPerFrame: Float64;
  end;

  AudioServerPlugInCustomPropertyDataType = UInt32;
  AudioServerPlugInIOOperation = NSInteger;
  AudioDeviceClockAlgorithmSelector = NSInteger;

  AudioServerPlugInHostInterface = record
    PropertiesChanged: function(inHost: AudioServerPlugInHostRef; inObjectID: AudioObjectID; inNumberAddresses: UInt32;
      inAddresses: PAudioObjectPropertyAddress): OSStatus; cdecl;
    CopyFromStorage: function(inHost: AudioServerPlugInHostRef; inKey: CFStringRef; outData: PCFPropertyListRef): OSStatus; cdecl;
    WriteToStorage: function(inHost: AudioServerPlugInHostRef; inKey: CFStringRef; inData: CFPropertyListRef): OSStatus; cdecl;
    DeleteFromStorage: function(inHost: AudioServerPlugInHostRef; inKey: CFStringRef): OSStatus; cdecl;
    RequestDeviceConfigurationChange: function(inHost: AudioServerPlugInHostRef; inDeviceObjectID: AudioObjectID; inChangeAction: UInt64;
      inChangeInfo: Pointer): OSStatus; cdecl;
  end;

  AudioServerPlugInDriverInterface = record
    _reserved: Pointer;
    QueryInterface: function(inDriver: Pointer; inUUID: REFIID; outInterface: PLPVOID): HRESULT; cdecl;
    AddRef: function(inDriver: Pointer): UInt32; cdecl;
    Release: function(inDriver: Pointer): UInt32; cdecl;
    Initialize: function(inDriver: AudioServerPlugInDriverRef; inHost: AudioServerPlugInHostRef): OSStatus; cdecl;
    CreateDevice: function(inDriver: AudioServerPlugInDriverRef; inDescription: CFDictionaryRef; inClientInfo: PAudioServerPlugInClientInfo;
      outDeviceObjectID: PAudioObjectID): OSStatus; cdecl;
    DestroyDevice: function(inDriver: AudioServerPlugInDriverRef; inDeviceObjectID: AudioObjectID): OSStatus; cdecl;
    AddDeviceClient: function(inDriver: AudioServerPlugInDriverRef; inDeviceObjectID: AudioObjectID;
      inClientInfo: PAudioServerPlugInClientInfo): OSStatus; cdecl;
    RemoveDeviceClient: function(inDriver: AudioServerPlugInDriverRef; inDeviceObjectID: AudioObjectID;
      inClientInfo: PAudioServerPlugInClientInfo): OSStatus; cdecl;
    PerformDeviceConfigurationChange: function(inDriver: AudioServerPlugInDriverRef; inDeviceObjectID: AudioObjectID; inChangeAction: UInt64;
      inChangeInfo: Pointer): OSStatus; cdecl;
    AbortDeviceConfigurationChange: function(inDriver: AudioServerPlugInDriverRef; inDeviceObjectID: AudioObjectID; inChangeAction: UInt64;
      inChangeInfo: Pointer): OSStatus; cdecl;
    HasProperty: function(inDriver: AudioServerPlugInDriverRef; inObjectID: AudioObjectID; inClientProcessID: pid_t;
      inAddress: PAudioObjectPropertyAddress): Boolean; cdecl;
    IsPropertySettable: function(inDriver: AudioServerPlugInDriverRef; inObjectID: AudioObjectID; inClientProcessID: pid_t;
      inAddress: PAudioObjectPropertyAddress; outIsSettable: PBoolean): OSStatus; cdecl;
    GetPropertyDataSize: function(inDriver: AudioServerPlugInDriverRef; inObjectID: AudioObjectID; inClientProcessID: pid_t;
      inAddress: PAudioObjectPropertyAddress; inQualifierDataSize: UInt32; inQualifierData: Pointer; outDataSize: PUInt32): OSStatus; cdecl;
    GetPropertyData: function(inDriver: AudioServerPlugInDriverRef; inObjectID: AudioObjectID; inClientProcessID: pid_t;
      inAddress: PAudioObjectPropertyAddress; inQualifierDataSize: UInt32; inQualifierData: Pointer; inDataSize: UInt32; outDataSize: PUInt32; outData: Pointer): OSStatus; cdecl;
    SetPropertyData: function(inDriver: AudioServerPlugInDriverRef; inObjectID: AudioObjectID; inClientProcessID: pid_t;
      inAddress: PAudioObjectPropertyAddress; inQualifierDataSize: UInt32; inQualifierData: Pointer; inDataSize: UInt32; inData: Pointer): OSStatus; cdecl;
    StartIO: function(inDriver: AudioServerPlugInDriverRef; inDeviceObjectID: AudioObjectID; inClientID: UInt32): OSStatus; cdecl;
    StopIO: function(inDriver: AudioServerPlugInDriverRef; inDeviceObjectID: AudioObjectID; inClientID: UInt32): OSStatus; cdecl;
    GetZeroTimeStamp: function(inDriver: AudioServerPlugInDriverRef; inDeviceObjectID: AudioObjectID; inClientID: UInt32; outSampleTime: PFloat64;
      outHostTime: PUInt64; outSeed: PUInt64): OSStatus; cdecl;
    WillDoIOOperation: function(inDriver: AudioServerPlugInDriverRef; inDeviceObjectID: AudioObjectID; inClientID: UInt32; inOperationID: UInt32;
      outWillDo: PBoolean; outWillDoInPlace: PBoolean): OSStatus; cdecl;
    BeginIOOperation: function(inDriver: AudioServerPlugInDriverRef; inDeviceObjectID: AudioObjectID; inClientID: UInt32; inOperationID: UInt32;
      inIOBufferFrameSize: UInt32; inIOCycleInfo: PAudioServerPlugInIOCycleInfo): OSStatus; cdecl;
    DoIOOperation: function(inDriver: AudioServerPlugInDriverRef; inDeviceObjectID: AudioObjectID; inStreamObjectID: AudioObjectID;
      inClientID: UInt32; inOperationID: UInt32; inIOBufferFrameSize: UInt32; inIOCycleInfo: PAudioServerPlugInIOCycleInfo; ioMainBuffer: Pointer; ioSecondaryBuffer: Pointer): OSStatus; cdecl;
    EndIOOperation: function(inDriver: AudioServerPlugInDriverRef; inDeviceObjectID: AudioObjectID; inClientID: UInt32; inOperationID: UInt32;
      inIOBufferFrameSize: UInt32; inIOCycleInfo: PAudioServerPlugInIOCycleInfo): OSStatus; cdecl;
  end;

const
  libCoreAudio = '/System/Library/Frameworks/CoreAudio.framework/CoreAudio';

procedure AudioObjectShow(inObjectID: AudioObjectID); cdecl;
  external libCoreAudio name _PU + 'AudioObjectShow';

function AudioObjectHasProperty(inObjectID: AudioObjectID; inAddress: PAudioObjectPropertyAddress): Boolean; cdecl;
  external libCoreAudio name _PU + 'AudioObjectHasProperty';

function AudioObjectIsPropertySettable(inObjectID: AudioObjectID; inAddress: PAudioObjectPropertyAddress; outIsSettable: PBoolean): OSStatus; cdecl;
  external libCoreAudio name _PU + 'AudioObjectIsPropertySettable';

function AudioObjectGetPropertyDataSize(inObjectID: AudioObjectID; inAddress: PAudioObjectPropertyAddress; inQualifierDataSize: UInt32;
  inQualifierData: Pointer; outDataSize: PUInt32): OSStatus; cdecl;
  external libCoreAudio name _PU + 'AudioObjectGetPropertyDataSize';

function AudioObjectGetPropertyData(inObjectID: AudioObjectID; inAddress: PAudioObjectPropertyAddress; inQualifierDataSize: UInt32;
  inQualifierData: Pointer; ioDataSize: PUInt32; outData: Pointer): OSStatus; cdecl;
  external libCoreAudio name _PU + 'AudioObjectGetPropertyData';

function AudioObjectSetPropertyData(inObjectID: AudioObjectID; inAddress: PAudioObjectPropertyAddress; inQualifierDataSize: UInt32;
  inQualifierData: Pointer; inDataSize: UInt32; inData: Pointer): OSStatus; cdecl;
  external libCoreAudio name _PU + 'AudioObjectSetPropertyData';

function AudioObjectAddPropertyListener(inObjectID: AudioObjectID; inAddress: PAudioObjectPropertyAddress;
  inListener: AudioObjectPropertyListenerProc; inClientData: Pointer): OSStatus; cdecl;
  external libCoreAudio name _PU + 'AudioObjectAddPropertyListener';

function AudioObjectRemovePropertyListener(inObjectID: AudioObjectID; inAddress: PAudioObjectPropertyAddress;
  inListener: AudioObjectPropertyListenerProc; inClientData: Pointer): OSStatus; cdecl;
  external libCoreAudio name _PU + 'AudioObjectRemovePropertyListener';

function AudioObjectAddPropertyListenerBlock(inObjectID: AudioObjectID; inAddress: PAudioObjectPropertyAddress; inDispatchQueue: dispatch_queue_t;
  inListener: AudioObjectPropertyListenerBlock): OSStatus; cdecl;
  external libCoreAudio name _PU + 'AudioObjectAddPropertyListenerBlock';

function AudioObjectRemovePropertyListenerBlock(inObjectID: AudioObjectID; inAddress: PAudioObjectPropertyAddress; inDispatchQueue: dispatch_queue_t;
  inListener: AudioObjectPropertyListenerBlock): OSStatus; cdecl;
  external libCoreAudio name _PU + 'AudioObjectRemovePropertyListenerBlock';

function AudioHardwareUnload: OSStatus; cdecl;
  external libCoreAudio name _PU + 'AudioHardwareUnload';

function AudioHardwareCreateAggregateDevice(inDescription: CFDictionaryRef; outDeviceID: PAudioObjectID): OSStatus; cdecl;
  external libCoreAudio name _PU + 'AudioHardwareCreateAggregateDevice';

function AudioHardwareDestroyAggregateDevice(inDeviceID: AudioObjectID): OSStatus; cdecl;
  external libCoreAudio name _PU + 'AudioHardwareDestroyAggregateDevice';

function AudioDeviceCreateIOProcID(inDevice: AudioObjectID; inProc: AudioDeviceIOProc; inClientData: Pointer;
  outIOProcID: PAudioDeviceIOProcID): OSStatus; cdecl;
  external libCoreAudio name _PU + 'AudioDeviceCreateIOProcID';

function AudioDeviceCreateIOProcIDWithBlock(outIOProcID: PAudioDeviceIOProcID; inDevice: AudioObjectID; inDispatchQueue: dispatch_queue_t;
  inIOBlock: AudioDeviceIOBlock): OSStatus; cdecl;
  external libCoreAudio name _PU + 'AudioDeviceCreateIOProcIDWithBlock';

function AudioDeviceDestroyIOProcID(inDevice: AudioObjectID; inIOProcID: AudioDeviceIOProcID): OSStatus; cdecl;
  external libCoreAudio name _PU + 'AudioDeviceDestroyIOProcID';

function AudioDeviceStart(inDevice: AudioObjectID; inProcID: AudioDeviceIOProcID): OSStatus; cdecl;
  external libCoreAudio name _PU + 'AudioDeviceStart';

function AudioDeviceStartAtTime(inDevice: AudioObjectID; inProcID: AudioDeviceIOProcID; ioRequestedStartTime: PAudioTimeStamp;
  inFlags: UInt32): OSStatus; cdecl;
  external libCoreAudio name _PU + 'AudioDeviceStartAtTime';

function AudioDeviceStop(inDevice: AudioObjectID; inProcID: AudioDeviceIOProcID): OSStatus; cdecl;
  external libCoreAudio name _PU + 'AudioDeviceStop';

function AudioDeviceGetCurrentTime(inDevice: AudioObjectID; outTime: PAudioTimeStamp): OSStatus; cdecl;
  external libCoreAudio name _PU + 'AudioDeviceGetCurrentTime';

function AudioDeviceTranslateTime(inDevice: AudioObjectID; inTime: PAudioTimeStamp; outTime: PAudioTimeStamp): OSStatus; cdecl;
  external libCoreAudio name _PU + 'AudioDeviceTranslateTime';

function AudioDeviceGetNearestStartTime(inDevice: AudioObjectID; ioRequestedStartTime: PAudioTimeStamp; inFlags: UInt32): OSStatus; cdecl;
  external libCoreAudio name _PU + 'AudioDeviceGetNearestStartTime';

function AudioHardwareAddRunLoopSource(inRunLoopSource: CFRunLoopSourceRef): OSStatus; cdecl;
  external libCoreAudio name _PU + 'AudioHardwareAddRunLoopSource';

function AudioHardwareRemoveRunLoopSource(inRunLoopSource: CFRunLoopSourceRef): OSStatus; cdecl;
  external libCoreAudio name _PU + 'AudioHardwareRemoveRunLoopSource';

function AudioHardwareGetPropertyInfo(inPropertyID: AudioHardwarePropertyID; outSize: PUInt32; outWritable: PBoolean): OSStatus; cdecl;
  external libCoreAudio name _PU + 'AudioHardwareGetPropertyInfo';

function AudioHardwareGetProperty(inPropertyID: AudioHardwarePropertyID; ioPropertyDataSize: PUInt32; outPropertyData: Pointer): OSStatus; cdecl;
  external libCoreAudio name _PU + 'AudioHardwareGetProperty';

function AudioHardwareSetProperty(inPropertyID: AudioHardwarePropertyID; inPropertyDataSize: UInt32; inPropertyData: Pointer): OSStatus; cdecl;
  external libCoreAudio name _PU + 'AudioHardwareSetProperty';

function AudioHardwareAddPropertyListener(inPropertyID: AudioHardwarePropertyID; inProc: AudioHardwarePropertyListenerProc;
  inClientData: Pointer): OSStatus; cdecl;
  external libCoreAudio name _PU + 'AudioHardwareAddPropertyListener';

function AudioHardwareRemovePropertyListener(inPropertyID: AudioHardwarePropertyID; inProc: AudioHardwarePropertyListenerProc): OSStatus; cdecl;
  external libCoreAudio name _PU + 'AudioHardwareRemovePropertyListener';

function AudioDeviceAddIOProc(inDevice: AudioDeviceID; inProc: AudioDeviceIOProc; inClientData: Pointer): OSStatus; cdecl;
  external libCoreAudio name _PU + 'AudioDeviceAddIOProc';

function AudioDeviceRemoveIOProc(inDevice: AudioDeviceID; inProc: AudioDeviceIOProc): OSStatus; cdecl;
  external libCoreAudio name _PU + 'AudioDeviceRemoveIOProc';

function AudioDeviceRead(inDevice: AudioDeviceID; inStartTime: PAudioTimeStamp; outData: PAudioBufferList): OSStatus; cdecl;
  external libCoreAudio name _PU + 'AudioDeviceRead';

function AudioDeviceGetPropertyInfo(inDevice: AudioDeviceID; inChannel: UInt32; isInput: Boolean; inPropertyID: AudioDevicePropertyID;
  outSize: PUInt32; outWritable: PBoolean): OSStatus; cdecl;
  external libCoreAudio name _PU + 'AudioDeviceGetPropertyInfo';

function AudioDeviceGetProperty(inDevice: AudioDeviceID; inChannel: UInt32; isInput: Boolean; inPropertyID: AudioDevicePropertyID;
  ioPropertyDataSize: PUInt32; outPropertyData: Pointer): OSStatus; cdecl;
  external libCoreAudio name _PU + 'AudioDeviceGetProperty';

function AudioDeviceSetProperty(inDevice: AudioDeviceID; inWhen: PAudioTimeStamp; inChannel: UInt32; isInput: Boolean;
  inPropertyID: AudioDevicePropertyID; inPropertyDataSize: UInt32; inPropertyData: Pointer): OSStatus; cdecl;
  external libCoreAudio name _PU + 'AudioDeviceSetProperty';

function AudioDeviceAddPropertyListener(inDevice: AudioDeviceID; inChannel: UInt32; isInput: Boolean; inPropertyID: AudioDevicePropertyID;
  inProc: AudioDevicePropertyListenerProc; inClientData: Pointer): OSStatus; cdecl;
  external libCoreAudio name _PU + 'AudioDeviceAddPropertyListener';

function AudioDeviceRemovePropertyListener(inDevice: AudioDeviceID; inChannel: UInt32; isInput: Boolean; inPropertyID: AudioDevicePropertyID;
  inProc: AudioDevicePropertyListenerProc): OSStatus; cdecl;
  external libCoreAudio name _PU + 'AudioDeviceRemovePropertyListener';

function AudioStreamGetPropertyInfo(inStream: AudioStreamID; inChannel: UInt32; inPropertyID: AudioDevicePropertyID; outSize: PUInt32;
  outWritable: PBoolean): OSStatus; cdecl;
  external libCoreAudio name _PU + 'AudioStreamGetPropertyInfo';

function AudioStreamGetProperty(inStream: AudioStreamID; inChannel: UInt32; inPropertyID: AudioDevicePropertyID; ioPropertyDataSize: PUInt32;
  outPropertyData: Pointer): OSStatus; cdecl;
  external libCoreAudio name _PU + 'AudioStreamGetProperty';

function AudioStreamSetProperty(inStream: AudioStreamID; inWhen: PAudioTimeStamp; inChannel: UInt32; inPropertyID: AudioDevicePropertyID;
  inPropertyDataSize: UInt32; inPropertyData: Pointer): OSStatus; cdecl;
  external libCoreAudio name _PU + 'AudioStreamSetProperty';

function AudioStreamAddPropertyListener(inStream: AudioStreamID; inChannel: UInt32; inPropertyID: AudioDevicePropertyID;
  inProc: AudioStreamPropertyListenerProc; inClientData: Pointer): OSStatus; cdecl;
  external libCoreAudio name _PU + 'AudioStreamAddPropertyListener';

function AudioStreamRemovePropertyListener(inStream: AudioStreamID; inChannel: UInt32; inPropertyID: AudioDevicePropertyID;
  inProc: AudioStreamPropertyListenerProc): OSStatus; cdecl;
  external libCoreAudio name _PU + 'AudioStreamRemovePropertyListener';

function AudioDriverPlugInOpen(inHostInfo: PAudioDriverPlugInHostInfo): OSStatus; cdecl;
  external libCoreAudio name _PU + 'AudioDriverPlugInOpen';

function AudioDriverPlugInClose(inDevice: AudioDeviceID): OSStatus; cdecl;
  external libCoreAudio name _PU + 'AudioDriverPlugInClose';

function AudioDriverPlugInDeviceGetPropertyInfo(inDevice: AudioDeviceID; inChannel: UInt32; isInput: Boolean; inPropertyID: AudioDevicePropertyID;
  outSize: PUInt32; outWritable: PBoolean): OSStatus; cdecl;
  external libCoreAudio name _PU + 'AudioDriverPlugInDeviceGetPropertyInfo';

function AudioDriverPlugInDeviceGetProperty(inDevice: AudioDeviceID; inChannel: UInt32; isInput: Boolean; inPropertyID: AudioDevicePropertyID;
  ioPropertyDataSize: PUInt32; outPropertyData: Pointer): OSStatus; cdecl;
  external libCoreAudio name _PU + 'AudioDriverPlugInDeviceGetProperty';

function AudioDriverPlugInDeviceSetProperty(inDevice: AudioDeviceID; inWhen: PAudioTimeStamp; inChannel: UInt32; isInput: Boolean;
  inPropertyID: AudioDevicePropertyID; inPropertyDataSize: UInt32; inPropertyData: Pointer): OSStatus; cdecl;
  external libCoreAudio name _PU + 'AudioDriverPlugInDeviceSetProperty';

function AudioDriverPlugInStreamGetPropertyInfo(inDevice: AudioDeviceID; inIOAudioStream: io_object_t; inChannel: UInt32;
  inPropertyID: AudioDevicePropertyID; outSize: PUInt32; outWritable: PBoolean): OSStatus; cdecl;
  external libCoreAudio name _PU + 'AudioDriverPlugInStreamGetPropertyInfo';

function AudioDriverPlugInStreamGetProperty(inDevice: AudioDeviceID; inIOAudioStream: io_object_t; inChannel: UInt32;
  inPropertyID: AudioDevicePropertyID; ioPropertyDataSize: PUInt32; outPropertyData: Pointer): OSStatus; cdecl;
  external libCoreAudio name _PU + 'AudioDriverPlugInStreamGetProperty';

function AudioDriverPlugInStreamSetProperty(inDevice: AudioDeviceID; inIOAudioStream: io_object_t; inWhen: PAudioTimeStamp; inChannel: UInt32;
  inPropertyID: AudioDevicePropertyID; inPropertyDataSize: UInt32; inPropertyData: Pointer): OSStatus; cdecl;
  external libCoreAudio name _PU + 'AudioDriverPlugInStreamSetProperty';

function AudioObjectCreate(inOwningPlugIn: AudioHardwarePlugInRef; inOwningObjectID: AudioObjectID; inClassID: AudioClassID;
  outAudioObjectID: PAudioObjectID): OSStatus; cdecl;
  external libCoreAudio name _PU + 'AudioObjectCreate';

function AudioObjectsPublishedAndDied(inOwningPlugIn: AudioHardwarePlugInRef; inOwningObjectID: AudioObjectID; inNumberPublishedAudioObjects: UInt32;
  inPublishedAudioObjects: PAudioObjectID; inNumberDeadAudioObjects: UInt32; inDeadAudioObjects: PAudioObjectID): OSStatus; cdecl;
  external libCoreAudio name _PU + 'AudioObjectsPublishedAndDied';

function AudioObjectPropertiesChanged(inOwningPlugIn: AudioHardwarePlugInRef; inObjectID: AudioObjectID; inNumberAddresses: UInt32;
  inAddresses: PAudioObjectPropertyAddress): OSStatus; cdecl;
  external libCoreAudio name _PU + 'AudioObjectPropertiesChanged';

function AudioHardwareClaimAudioDeviceID(inOwner: AudioHardwarePlugInRef; outAudioDeviceID: PAudioDeviceID): OSStatus; cdecl;
  external libCoreAudio name _PU + 'AudioHardwareClaimAudioDeviceID';

function AudioHardwareDevicesCreated(inOwner: AudioHardwarePlugInRef; inNumberDevices: UInt32; inAudioDeviceIDs: PAudioDeviceID): OSStatus; cdecl;
  external libCoreAudio name _PU + 'AudioHardwareDevicesCreated';

function AudioHardwareDevicesDied(inOwner: AudioHardwarePlugInRef; inNumberDevices: UInt32; inAudioDeviceIDs: PAudioDeviceID): OSStatus; cdecl;
  external libCoreAudio name _PU + 'AudioHardwareDevicesDied';

function AudioHardwareDevicePropertyChanged(inOwner: AudioHardwarePlugInRef; inDeviceID: AudioDeviceID; inChannel: UInt32; isInput: Boolean;
  inPropertyID: AudioDevicePropertyID): OSStatus; cdecl;
  external libCoreAudio name _PU + 'AudioHardwareDevicePropertyChanged';

function AudioHardwareClaimAudioStreamID(inOwner: AudioHardwarePlugInRef; inOwningDeviceID: AudioDeviceID;
  outAudioStreamID: PAudioStreamID): OSStatus; cdecl;
  external libCoreAudio name _PU + 'AudioHardwareClaimAudioStreamID';

function AudioHardwareStreamsCreated(inOwner: AudioHardwarePlugInRef; inOwningDeviceID: AudioDeviceID; inNumberStreams: UInt32;
  inAudioStreamIDs: PAudioStreamID): OSStatus; cdecl;
  external libCoreAudio name _PU + 'AudioHardwareStreamsCreated';

function AudioHardwareStreamsDied(inOwner: AudioHardwarePlugInRef; inOwningDeviceID: AudioDeviceID; inNumberStreams: UInt32;
  inAudioStreamIDs: PAudioStreamID): OSStatus; cdecl;
  external libCoreAudio name _PU + 'AudioHardwareStreamsDied';

function AudioHardwareStreamPropertyChanged(inOwner: AudioHardwarePlugInRef; inOwningDeviceID: AudioDeviceID; inStreamID: AudioStreamID;
  inChannel: UInt32; inPropertyID: AudioDevicePropertyID): OSStatus; cdecl;
  external libCoreAudio name _PU + 'AudioHardwareStreamPropertyChanged';

function AudioGetCurrentHostTime: UInt64; cdecl;
  external libCoreAudio name _PU + 'AudioGetCurrentHostTime';

function AudioGetHostClockFrequency: Float64; cdecl;
  external libCoreAudio name _PU + 'AudioGetHostClockFrequency';

function AudioGetHostClockMinimumTimeDelta: UInt32; cdecl;
  external libCoreAudio name _PU + 'AudioGetHostClockMinimumTimeDelta';

function AudioConvertHostTimeToNanos(inHostTime: UInt64): UInt64; cdecl;
  external libCoreAudio name _PU + 'AudioConvertHostTimeToNanos';

function AudioConvertNanosToHostTime(inNanos: UInt64): UInt64; cdecl;
  external libCoreAudio name _PU + 'AudioConvertNanosToHostTime';

implementation

uses
  System.SysUtils;

var
  CoreAudioModule: THandle;

initialization
  CoreAudioModule := LoadLibrary(libCoreAudio);

finalization
  if CoreAudioModule <> 0 then
    FreeLibrary(CoreAudioModule);

end.