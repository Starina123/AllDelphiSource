{*******************************************************}
{                                                       }
{           CodeGear Delphi Runtime Library             }
{                                                       }
{ Copyright(c) 2018 Embarcadero Technologies, Inc.      }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

unit Winapi.Media.MediaProperties;

{$HPPEMIT NOUSINGNAMESPACE}

{$WARN SYMBOL_DEPRECATED OFF}

interface

{$MINENUMSIZE 4}

uses 
  Winapi.Winrt, 
  System.Types, 
  System.Win.WinRT, 
  Winapi.ApplicationModel, 
  Winapi.CommonTypes, 
  Winapi.CommonNames;

{$SCOPEDENUMS ON}


type
  // Forward declare interfaces
  // Windows.Media.MediaProperties.IMediaEncodingProperties
  IMediaEncodingProperties = interface;
  PIMediaEncodingProperties = ^IMediaEncodingProperties;

  // Windows.Media.MediaProperties.IContainerEncodingProperties
  IContainerEncodingProperties = interface;
  PIContainerEncodingProperties = ^IContainerEncodingProperties;

  // Windows.Media.MediaProperties.IMediaEncodingProfile
  IMediaEncodingProfile = interface;
  PIMediaEncodingProfile = ^IMediaEncodingProfile;

  // Windows.Media.MediaProperties.IImageEncodingProperties
  IImageEncodingProperties = interface;
  PIImageEncodingProperties = ^IImageEncodingProperties;

  // Windows.Foundation.Collections.IIterator`1<Windows.Media.MediaProperties.IMediaEncodingProperties>
  IIterator_1__IMediaEncodingProperties = interface;
  PIIterator_1__IMediaEncodingProperties = ^IIterator_1__IMediaEncodingProperties;

  // Windows.Foundation.Collections.IIterable`1<Windows.Media.MediaProperties.IMediaEncodingProperties>
  IIterable_1__IMediaEncodingProperties = interface;
  PIIterable_1__IMediaEncodingProperties = ^IIterable_1__IMediaEncodingProperties;

  // Windows.Foundation.Collections.IVectorView`1<Windows.Media.MediaProperties.IMediaEncodingProperties>
  IVectorView_1__IMediaEncodingProperties = interface;
  PIVectorView_1__IMediaEncodingProperties = ^IVectorView_1__IMediaEncodingProperties;

  // Windows.Media.MediaProperties.IAudioEncodingPropertiesWithFormatUserData
  IAudioEncodingPropertiesWithFormatUserData = interface;
  PIAudioEncodingPropertiesWithFormatUserData = ^IAudioEncodingPropertiesWithFormatUserData;

  // Windows.Media.MediaProperties.IAudioEncodingProperties2
  IAudioEncodingProperties2 = interface;
  PIAudioEncodingProperties2 = ^IAudioEncodingProperties2;

  // Windows.Media.MediaProperties.IAudioEncodingPropertiesStatics
  IAudioEncodingPropertiesStatics = interface;
  PIAudioEncodingPropertiesStatics = ^IAudioEncodingPropertiesStatics;

  // Windows.Media.MediaProperties.IAudioEncodingPropertiesStatics2
  IAudioEncodingPropertiesStatics2 = interface;
  PIAudioEncodingPropertiesStatics2 = ^IAudioEncodingPropertiesStatics2;

  // Windows.Media.MediaProperties.IVideoEncodingProperties2
  IVideoEncodingProperties2 = interface;
  PIVideoEncodingProperties2 = ^IVideoEncodingProperties2;

  // Windows.Media.MediaProperties.IVideoEncodingProperties3
  IVideoEncodingProperties3 = interface;
  PIVideoEncodingProperties3 = ^IVideoEncodingProperties3;

  // Windows.Media.MediaProperties.IVideoEncodingProperties4
  IVideoEncodingProperties4 = interface;
  PIVideoEncodingProperties4 = ^IVideoEncodingProperties4;

  // Windows.Media.MediaProperties.IVideoEncodingPropertiesStatics
  IVideoEncodingPropertiesStatics = interface;
  PIVideoEncodingPropertiesStatics = ^IVideoEncodingPropertiesStatics;

  // Windows.Media.MediaProperties.IVideoEncodingPropertiesStatics2
  IVideoEncodingPropertiesStatics2 = interface;
  PIVideoEncodingPropertiesStatics2 = ^IVideoEncodingPropertiesStatics2;

  // Windows.Media.MediaProperties.IImageEncodingPropertiesStatics
  IImageEncodingPropertiesStatics = interface;
  PIImageEncodingPropertiesStatics = ^IImageEncodingPropertiesStatics;

  // Windows.Media.MediaProperties.IImageEncodingPropertiesStatics2
  IImageEncodingPropertiesStatics2 = interface;
  PIImageEncodingPropertiesStatics2 = ^IImageEncodingPropertiesStatics2;

  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Media.MediaProperties.IMediaEncodingProfile>
  AsyncOperationCompletedHandler_1__IMediaEncodingProfile = interface;
  PAsyncOperationCompletedHandler_1__IMediaEncodingProfile = ^AsyncOperationCompletedHandler_1__IMediaEncodingProfile;

  // Windows.Foundation.IAsyncOperation`1<Windows.Media.MediaProperties.IMediaEncodingProfile>
  IAsyncOperation_1__IMediaEncodingProfile = interface;
  PIAsyncOperation_1__IMediaEncodingProfile = ^IAsyncOperation_1__IMediaEncodingProfile;

  // Windows.Media.MediaProperties.IMediaEncodingProfileStatics
  IMediaEncodingProfileStatics = interface;
  PIMediaEncodingProfileStatics = ^IMediaEncodingProfileStatics;

  // Windows.Media.MediaProperties.IMediaEncodingProfileStatics2
  IMediaEncodingProfileStatics2 = interface;
  PIMediaEncodingProfileStatics2 = ^IMediaEncodingProfileStatics2;

  // Windows.Media.MediaProperties.IMediaEncodingProfileStatics3
  IMediaEncodingProfileStatics3 = interface;
  PIMediaEncodingProfileStatics3 = ^IMediaEncodingProfileStatics3;

  // Windows.Media.MediaProperties.IMediaEncodingProfile2
  IMediaEncodingProfile2 = interface;
  PIMediaEncodingProfile2 = ^IMediaEncodingProfile2;

  // Windows.Foundation.Collections.IIterator`1<Windows.Media.MediaProperties.IVideoEncodingProperties>
  IIterator_1__IVideoEncodingProperties = interface;
  PIIterator_1__IVideoEncodingProperties = ^IIterator_1__IVideoEncodingProperties;

  // Windows.Foundation.Collections.IIterable`1<Windows.Media.MediaProperties.IVideoEncodingProperties>
  IIterable_1__IVideoEncodingProperties = interface;
  PIIterable_1__IVideoEncodingProperties = ^IIterable_1__IVideoEncodingProperties;

  // Windows.Foundation.Collections.IVectorView`1<Windows.Media.MediaProperties.IVideoEncodingProperties>
  IVectorView_1__IVideoEncodingProperties = interface;
  PIVectorView_1__IVideoEncodingProperties = ^IVectorView_1__IVideoEncodingProperties;

  // Windows.Foundation.Collections.IIterator`1<Windows.Media.MediaProperties.IAudioEncodingProperties>
  IIterator_1__IAudioEncodingProperties = interface;
  PIIterator_1__IAudioEncodingProperties = ^IIterator_1__IAudioEncodingProperties;

  // Windows.Foundation.Collections.IIterable`1<Windows.Media.MediaProperties.IAudioEncodingProperties>
  IIterable_1__IAudioEncodingProperties = interface;
  PIIterable_1__IAudioEncodingProperties = ^IIterable_1__IAudioEncodingProperties;

  // Windows.Foundation.Collections.IVectorView`1<Windows.Media.MediaProperties.IAudioEncodingProperties>
  IVectorView_1__IAudioEncodingProperties = interface;
  PIVectorView_1__IAudioEncodingProperties = ^IVectorView_1__IAudioEncodingProperties;


  // Emit enums

  // Emit records

  // Emit Forwarded interfaces
  // Windows.Media.MediaProperties Interfaces
  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.Collections.IMap`2<Guid,Object>
  // Used Types:  String
  }
  // Windows.Media.MediaProperties.IMediaEncodingProperties
  IMediaEncodingProperties = interface(IInspectable)
  ['{B4002AF6-ACD4-4E5A-A24B-5D7498A8B8C4}']
    function get_Properties: IMap_2__TGuid__IInspectable; safecall;
    function get_Type: HSTRING; safecall;
    procedure put_Subtype(value: HSTRING); safecall;
    function get_Subtype: HSTRING; safecall;
    property Properties: IMap_2__TGuid__IInspectable read get_Properties;
    property Subtype: HSTRING read get_Subtype write put_Subtype;
    property &Type: HSTRING read get_Type;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  }
  // Windows.Media.MediaProperties.IContainerEncodingProperties
  [WinRTClassNameAttribute(SContainerEncodingProperties)]
  IContainerEncodingProperties = interface(IInspectable)
  ['{59AC2A57-B32A-479E-8A61-4B7F2E9E7EA0}']
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.MediaProperties.IAudioEncodingProperties
  // Used Types:  Windows.Media.MediaProperties.IVideoEncodingProperties
  // Used Types:  Windows.Media.MediaProperties.IContainerEncodingProperties
  }
  // Windows.Media.MediaProperties.IMediaEncodingProfile
  [WinRTClassNameAttribute(SMediaEncodingProfile)]
  IMediaEncodingProfile = interface(IInspectable)
  ['{E7DBF5A8-1DB9-4783-876B-3DFE12ACFDB3}']
    procedure put_Audio(value: IAudioEncodingProperties); safecall;
    function get_Audio: IAudioEncodingProperties; safecall;
    procedure put_Video(value: IVideoEncodingProperties); safecall;
    function get_Video: IVideoEncodingProperties; safecall;
    procedure put_Container(value: IContainerEncodingProperties); safecall;
    function get_Container: IContainerEncodingProperties; safecall;
    property Audio: IAudioEncodingProperties read get_Audio write put_Audio;
    property Container: IContainerEncodingProperties read get_Container write put_Container;
    property Video: IVideoEncodingProperties read get_Video write put_Video;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  UInt32
  }
  // Windows.Media.MediaProperties.IImageEncodingProperties
  [WinRTClassNameAttribute(SImageEncodingProperties)]
  IImageEncodingProperties = interface(IInspectable)
  ['{78625635-F331-4189-B1C3-B48D5AE034F1}']
    procedure put_Width(value: Cardinal); safecall;
    function get_Width: Cardinal; safecall;
    procedure put_Height(value: Cardinal); safecall;
    function get_Height: Cardinal; safecall;
    property Height: Cardinal read get_Height write put_Height;
    property Width: Cardinal read get_Width write put_Width;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.Media.MediaProperties.IMediaEncodingProperties>
  IIterator_1__IMediaEncodingProperties_Base = interface(IInspectable)
  ['{7C094AEC-C8F3-5F49-99C7-B66D8414200E}']
  end;
  {
  // Used Types:  Windows.Media.MediaProperties.IMediaEncodingProperties
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Media.MediaProperties.IMediaEncodingProperties>
  IIterator_1__IMediaEncodingProperties = interface(IIterator_1__IMediaEncodingProperties_Base)
  ['{7C094AEC-C8F3-5F49-99C7-B66D8414200E}']
    function get_Current: IMediaEncodingProperties; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PIMediaEncodingProperties): Cardinal; safecall;
    property Current: IMediaEncodingProperties read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.Media.MediaProperties.IMediaEncodingProperties>
  IIterable_1__IMediaEncodingProperties_Base = interface(IInspectable)
  ['{D7FC75D5-3492-5BBB-9B34-DAC3E24E79D0}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Media.MediaProperties.IMediaEncodingProperties>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Media.MediaProperties.IMediaEncodingProperties>
  IIterable_1__IMediaEncodingProperties = interface(IIterable_1__IMediaEncodingProperties_Base)
  ['{D7FC75D5-3492-5BBB-9B34-DAC3E24E79D0}']
    function First: IIterator_1__IMediaEncodingProperties; safecall;
  end;

  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.MediaProperties.IMediaEncodingProperties
  // Used Types:  UInt32
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVectorView`1<Windows.Media.MediaProperties.IMediaEncodingProperties>
  IVectorView_1__IMediaEncodingProperties = interface(IInspectable)
  ['{0F6C3B8B-5818-5CBF-BF26-6616BFC308C4}']
    function GetAt(index: Cardinal): IMediaEncodingProperties; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: IMediaEncodingProperties; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PIMediaEncodingProperties): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  UInt8
  }
  // Windows.Media.MediaProperties.IAudioEncodingPropertiesWithFormatUserData
  IAudioEncodingPropertiesWithFormatUserData = interface(IInspectable)
  ['{98F10D79-13EA-49FF-BE70-2673DB69702C}']
    procedure SetFormatUserData(valueSize: Cardinal; value: PByte); safecall;
    procedure GetFormatUserData(valueSize: Cardinal; value: PByte); safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Boolean
  }
  // Windows.Media.MediaProperties.IAudioEncodingProperties2
  IAudioEncodingProperties2 = interface(IInspectable)
  ['{C45D54DA-80BD-4C23-80D5-72D4A181E894}']
    function get_IsSpatial: Boolean; safecall;
    property IsSpatial: Boolean read get_IsSpatial;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.MediaProperties.IAudioEncodingProperties
  // Used Types:  UInt32
  }
  // Windows.Media.MediaProperties.IAudioEncodingPropertiesStatics
  [WinRTClassNameAttribute(SAudioEncodingProperties)]
  IAudioEncodingPropertiesStatics = interface(IInspectable)
  ['{0CAD332C-EBE9-4527-B36D-E42A13CF38DB}']
    function CreateAac(sampleRate: Cardinal; channelCount: Cardinal; bitrate: Cardinal): IAudioEncodingProperties; safecall;
    function CreateAacAdts(sampleRate: Cardinal; channelCount: Cardinal; bitrate: Cardinal): IAudioEncodingProperties; safecall;
    function CreateMp3(sampleRate: Cardinal; channelCount: Cardinal; bitrate: Cardinal): IAudioEncodingProperties; safecall;
    function CreatePcm(sampleRate: Cardinal; channelCount: Cardinal; bitsPerSample: Cardinal): IAudioEncodingProperties; safecall;
    function CreateWma(sampleRate: Cardinal; channelCount: Cardinal; bitrate: Cardinal): IAudioEncodingProperties; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.MediaProperties.IAudioEncodingProperties
  // Used Types:  UInt32
  }
  // Windows.Media.MediaProperties.IAudioEncodingPropertiesStatics2
  [WinRTClassNameAttribute(SAudioEncodingProperties)]
  IAudioEncodingPropertiesStatics2 = interface(IInspectable)
  ['{7489316F-77A0-433D-8ED5-4040280E8665}']
    function CreateAlac(sampleRate: Cardinal; channelCount: Cardinal; bitsPerSample: Cardinal): IAudioEncodingProperties; safecall;
    function CreateFlac(sampleRate: Cardinal; channelCount: Cardinal; bitsPerSample: Cardinal): IAudioEncodingProperties; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  UInt8
  // Used Types:  Int32
  }
  // Windows.Media.MediaProperties.IVideoEncodingProperties2
  IVideoEncodingProperties2 = interface(IInspectable)
  ['{F743A1EF-D465-4290-A94B-EF0F1528F8E3}']
    procedure SetFormatUserData(valueSize: Cardinal; value: PByte); safecall;
    procedure GetFormatUserData(valueSize: Cardinal; value: PByte); safecall;
    procedure put_ProfileId(value: Integer); safecall;
    function get_ProfileId: Integer; safecall;
    property ProfileId: Integer read get_ProfileId write put_ProfileId;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.MediaProperties.StereoscopicVideoPackingMode
  }
  // Windows.Media.MediaProperties.IVideoEncodingProperties3
  IVideoEncodingProperties3 = interface(IInspectable)
  ['{386BCDC4-873A-479F-B3EB-56C1FCBEC6D7}']
    function get_StereoscopicVideoPackingMode: StereoscopicVideoPackingMode; safecall;
    property StereoscopicVideoPackingMode: StereoscopicVideoPackingMode read get_StereoscopicVideoPackingMode;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.MediaProperties.SphericalVideoFrameFormat
  }
  // Windows.Media.MediaProperties.IVideoEncodingProperties4
  IVideoEncodingProperties4 = interface(IInspectable)
  ['{724EF014-C10C-40F2-9D72-3EE13B45FA8E}']
    function get_SphericalVideoFrameFormat: SphericalVideoFrameFormat; safecall;
    property SphericalVideoFrameFormat: SphericalVideoFrameFormat read get_SphericalVideoFrameFormat;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.MediaProperties.IVideoEncodingProperties
  // Used Types:  String
  // Used Types:  UInt32
  }
  // Windows.Media.MediaProperties.IVideoEncodingPropertiesStatics
  [WinRTClassNameAttribute(SVideoEncodingProperties)]
  IVideoEncodingPropertiesStatics = interface(IInspectable)
  ['{3CE14D44-1DC5-43DB-9F38-EBEBF90152CB}']
    function CreateH264: IVideoEncodingProperties; safecall;
    function CreateMpeg2: IVideoEncodingProperties; safecall;
    function CreateUncompressed(subtype: HSTRING; width: Cardinal; height: Cardinal): IVideoEncodingProperties; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.MediaProperties.IVideoEncodingProperties
  }
  // Windows.Media.MediaProperties.IVideoEncodingPropertiesStatics2
  [WinRTClassNameAttribute(SVideoEncodingProperties)]
  IVideoEncodingPropertiesStatics2 = interface(IInspectable)
  ['{CF1EBD5D-49FE-4D00-B59A-CFA4DFC51944}']
    function CreateHevc: IVideoEncodingProperties; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.MediaProperties.IImageEncodingProperties
  }
  // Windows.Media.MediaProperties.IImageEncodingPropertiesStatics
  [WinRTClassNameAttribute(SImageEncodingProperties)]
  IImageEncodingPropertiesStatics = interface(IInspectable)
  ['{257C68DC-8B99-439E-AA59-913A36161297}']
    function CreateJpeg: IImageEncodingProperties; safecall;
    function CreatePng: IImageEncodingProperties; safecall;
    function CreateJpegXR: IImageEncodingProperties; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.MediaProperties.IImageEncodingProperties
  // Used Types:  Windows.Media.MediaProperties.MediaPixelFormat
  }
  // Windows.Media.MediaProperties.IImageEncodingPropertiesStatics2
  [WinRTClassNameAttribute(SImageEncodingProperties)]
  IImageEncodingPropertiesStatics2 = interface(IInspectable)
  ['{F6C25B29-3824-46B0-956E-501329E1BE3C}']
    function CreateUncompressed(format: MediaPixelFormat): IImageEncodingProperties; safecall;
    function CreateBmp: IImageEncodingProperties; safecall;
  end;

  // Generic Delegate for 
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Media.MediaProperties.IMediaEncodingProfile>
  AsyncOperationCompletedHandler_1__IMediaEncodingProfile_Delegate_Base = interface(IUnknown)
  ['{37296FC1-86DA-58A0-90C0-C807BD94395E}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Media.MediaProperties.IMediaEncodingProfile>
  // Used Types:  Windows.Foundation.AsyncStatus
  }
  // Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Media.MediaProperties.IMediaEncodingProfile>
  AsyncOperationCompletedHandler_1__IMediaEncodingProfile = interface(AsyncOperationCompletedHandler_1__IMediaEncodingProfile_Delegate_Base)
  ['{EA573F5C-0121-57EE-A482-BD401D22533A}']
    procedure Invoke(asyncInfo: IAsyncOperation_1__IMediaEncodingProfile; asyncStatus: AsyncStatus); safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.IAsyncOperation`1<Windows.Media.MediaProperties.IMediaEncodingProfile>
  IAsyncOperation_1__IMediaEncodingProfile_Base = interface(IInspectable)
  ['{D4F86F16-C6CF-57C8-9743-5EC20C31AB79}']
  end;
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.AsyncOperationCompletedHandler`1<Windows.Media.MediaProperties.IMediaEncodingProfile>
  // Used Types:  Windows.Media.MediaProperties.IMediaEncodingProfile
  }
  // Windows.Foundation.IAsyncOperation`1<Windows.Media.MediaProperties.IMediaEncodingProfile>
  IAsyncOperation_1__IMediaEncodingProfile = interface(IAsyncOperation_1__IMediaEncodingProfile_Base)
  ['{B89AC012-9E35-5D18-A44A-CADCEB7268FC}']
    procedure put_Completed(handler: AsyncOperationCompletedHandler_1__IMediaEncodingProfile); safecall;
    function get_Completed: AsyncOperationCompletedHandler_1__IMediaEncodingProfile; safecall;
    function GetResults: IMediaEncodingProfile; safecall;
    property Completed: AsyncOperationCompletedHandler_1__IMediaEncodingProfile read get_Completed write put_Completed;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.MediaProperties.IMediaEncodingProfile
  // Used Types:  Windows.Media.MediaProperties.AudioEncodingQuality
  // Used Types:  Windows.Media.MediaProperties.VideoEncodingQuality
  // Used Types:  Windows.Foundation.IAsyncOperation`1<Windows.Media.MediaProperties.IMediaEncodingProfile>
  // Used Types:  Windows.Storage.IStorageFile
  // Used Types:  Windows.Storage.Streams.IRandomAccessStream
  }
  // Windows.Media.MediaProperties.IMediaEncodingProfileStatics
  [WinRTClassNameAttribute(SMediaEncodingProfile)]
  IMediaEncodingProfileStatics = interface(IInspectable)
  ['{197F352C-2EDE-4A45-A896-817A4854F8FE}']
    function CreateM4a(quality: AudioEncodingQuality): IMediaEncodingProfile; safecall;
    function CreateMp3(quality: AudioEncodingQuality): IMediaEncodingProfile; safecall;
    function CreateWma(quality: AudioEncodingQuality): IMediaEncodingProfile; safecall;
    function CreateMp4(quality: VideoEncodingQuality): IMediaEncodingProfile; safecall;
    function CreateWmv(quality: VideoEncodingQuality): IMediaEncodingProfile; safecall;
    function CreateFromFileAsync(&file: IStorageFile): IAsyncOperation_1__IMediaEncodingProfile; safecall;
    function CreateFromStreamAsync(stream: IRandomAccessStream): IAsyncOperation_1__IMediaEncodingProfile; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.MediaProperties.IMediaEncodingProfile
  // Used Types:  Windows.Media.MediaProperties.AudioEncodingQuality
  // Used Types:  Windows.Media.MediaProperties.VideoEncodingQuality
  }
  // Windows.Media.MediaProperties.IMediaEncodingProfileStatics2
  [WinRTClassNameAttribute(SMediaEncodingProfile)]
  IMediaEncodingProfileStatics2 = interface(IInspectable)
  ['{CE8DE74F-6AF4-4288-8FE2-79ADF1F79A43}']
    function CreateWav(quality: AudioEncodingQuality): IMediaEncodingProfile; safecall;
    function CreateAvi(quality: VideoEncodingQuality): IMediaEncodingProfile; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Media.MediaProperties.IMediaEncodingProfile
  // Used Types:  Windows.Media.MediaProperties.AudioEncodingQuality
  // Used Types:  Windows.Media.MediaProperties.VideoEncodingQuality
  }
  // Windows.Media.MediaProperties.IMediaEncodingProfileStatics3
  [WinRTClassNameAttribute(SMediaEncodingProfile)]
  IMediaEncodingProfileStatics3 = interface(IInspectable)
  ['{90DAC5AA-CF76-4294-A9ED-1A1420F51F6B}']
    function CreateAlac(quality: AudioEncodingQuality): IMediaEncodingProfile; safecall;
    function CreateFlac(quality: AudioEncodingQuality): IMediaEncodingProfile; safecall;
    function CreateHevc(quality: VideoEncodingQuality): IMediaEncodingProfile; safecall;
  end;

  // DualAPI Interface
  // UsedAPI Interface
  {
  // Used Types:  Windows.Foundation.Collections.IIterable`1<Windows.Media.Core.IAudioStreamDescriptor>
  // Used Types:  Windows.Foundation.Collections.IVector`1<Windows.Media.Core.IAudioStreamDescriptor>
  // Used Types:  Windows.Foundation.Collections.IIterable`1<Windows.Media.Core.IVideoStreamDescriptor>
  // Used Types:  Windows.Foundation.Collections.IVector`1<Windows.Media.Core.IVideoStreamDescriptor>
  }
  // Windows.Media.MediaProperties.IMediaEncodingProfile2
  IMediaEncodingProfile2 = interface(IInspectable)
  ['{349B3E0A-4035-488E-9877-85632865ED10}']
    procedure SetAudioTracks(value: IIterable_1__Core_IAudioStreamDescriptor); safecall;
    function GetAudioTracks: IVector_1__Core_IAudioStreamDescriptor; safecall;
    procedure SetVideoTracks(value: IIterable_1__Core_IVideoStreamDescriptor); safecall;
    function GetVideoTracks: IVector_1__Core_IVideoStreamDescriptor; safecall;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.Media.MediaProperties.IVideoEncodingProperties>
  IIterator_1__IVideoEncodingProperties_Base = interface(IInspectable)
  ['{094166EF-AE5F-5315-A3BF-FE54E8C35FCD}']
  end;
  {
  // Used Types:  Windows.Media.MediaProperties.IVideoEncodingProperties
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Media.MediaProperties.IVideoEncodingProperties>
  IIterator_1__IVideoEncodingProperties = interface(IIterator_1__IVideoEncodingProperties_Base)
  ['{BCF430E8-92CF-5D32-9D66-CA3BA7EB02B3}']
    function get_Current: IVideoEncodingProperties; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PIVideoEncodingProperties): Cardinal; safecall;
    property Current: IVideoEncodingProperties read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.Media.MediaProperties.IVideoEncodingProperties>
  IIterable_1__IVideoEncodingProperties_Base = interface(IInspectable)
  ['{73C7317C-8682-5F81-84A2-30C425FA2D24}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Media.MediaProperties.IVideoEncodingProperties>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Media.MediaProperties.IVideoEncodingProperties>
  IIterable_1__IVideoEncodingProperties = interface(IIterable_1__IVideoEncodingProperties_Base)
  ['{33989EE8-DF57-522A-904C-C824469A24D3}']
    function First: IIterator_1__IVideoEncodingProperties; safecall;
  end;

  {
  // Used Types:  Windows.Media.MediaProperties.IVideoEncodingProperties
  // Used Types:  UInt32
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVectorView`1<Windows.Media.MediaProperties.IVideoEncodingProperties>
  IVectorView_1__IVideoEncodingProperties = interface(IInspectable)
  ['{DB7651E0-A202-50EE-9814-D739E8D01CB2}']
    function GetAt(index: Cardinal): IVideoEncodingProperties; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: IVideoEncodingProperties; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PIVideoEncodingProperties): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterator`1<Windows.Media.MediaProperties.IAudioEncodingProperties>
  IIterator_1__IAudioEncodingProperties_Base = interface(IInspectable)
  ['{064B6AEF-3BD0-5463-8450-72C6169AF5D4}']
  end;
  {
  // Used Types:  Windows.Media.MediaProperties.IAudioEncodingProperties
  // Used Types:  Boolean
  // Used Types:  UInt32
  }
  // Windows.Foundation.Collections.IIterator`1<Windows.Media.MediaProperties.IAudioEncodingProperties>
  IIterator_1__IAudioEncodingProperties = interface(IIterator_1__IAudioEncodingProperties_Base)
  ['{6050A010-2204-5ACC-BB40-2151822324A4}']
    function get_Current: IAudioEncodingProperties; safecall;
    function get_HasCurrent: Boolean; safecall;
    function MoveNext: Boolean; safecall;
    function GetMany(itemsSize: Cardinal; items: PIAudioEncodingProperties): Cardinal; safecall;
    property Current: IAudioEncodingProperties read get_Current;
    property HasCurrent: Boolean read get_HasCurrent;
  end;

  // Generic Ancestor for 
  // Windows.Foundation.Collections.IIterable`1<Windows.Media.MediaProperties.IAudioEncodingProperties>
  IIterable_1__IAudioEncodingProperties_Base = interface(IInspectable)
  ['{00939468-25D8-533F-854E-4F20F36C51DC}']
  end;
  {
  // Used Types:  Windows.Foundation.Collections.IIterator`1<Windows.Media.MediaProperties.IAudioEncodingProperties>
  }
  // Windows.Foundation.Collections.IIterable`1<Windows.Media.MediaProperties.IAudioEncodingProperties>
  IIterable_1__IAudioEncodingProperties = interface(IIterable_1__IAudioEncodingProperties_Base)
  ['{86D0739C-26C6-5CD4-87D1-6550DC0B634B}']
    function First: IIterator_1__IAudioEncodingProperties; safecall;
  end;

  {
  // Used Types:  Windows.Media.MediaProperties.IAudioEncodingProperties
  // Used Types:  UInt32
  // Used Types:  Boolean
  }
  // Windows.Foundation.Collections.IVectorView`1<Windows.Media.MediaProperties.IAudioEncodingProperties>
  IVectorView_1__IAudioEncodingProperties = interface(IInspectable)
  ['{51F8BE1E-AB49-5465-94A7-650DE058774C}']
    function GetAt(index: Cardinal): IAudioEncodingProperties; safecall;
    function get_Size: Cardinal; safecall;
    function IndexOf(value: IAudioEncodingProperties; out index: Cardinal): Boolean; safecall;
    function GetMany(startIndex: Cardinal; itemsSize: Cardinal; items: PIAudioEncodingProperties): Cardinal; safecall;
    property Size: Cardinal read get_Size;
  end;


  // Emit Forwarded classes
  // Windows.Media.MediaProperties.MediaRatio
  // DualAPI
  // Implements: Windows.Media.MediaProperties.IMediaRatio

  // Windows.Media.MediaProperties.MediaPropertySet
  // DualAPI
  // Implements: Windows.Foundation.Collections.IMap`2<Guid,Object>
  // Implements: Windows.Foundation.Collections.IIterable`1<Windows.Foundation.Collections.IKeyValuePair`2<Guid,Object>>
  // Instantiable: "IMap_2__TGuid__IInspectable"
  TMediaPropertySet = class(TWinRTGenericImportI<IMap_2__TGuid__IInspectable>) end;

  // Windows.Media.MediaProperties.AudioEncodingProperties
  // DualAPI
  // Implements: Windows.Media.MediaProperties.IAudioEncodingProperties
  // Implements: Windows.Media.MediaProperties.IMediaEncodingProperties
  // Implements: Windows.Media.MediaProperties.IAudioEncodingPropertiesWithFormatUserData
  // Implements: Windows.Media.MediaProperties.IAudioEncodingProperties2
  // Statics: "Windows.Media.MediaProperties.IAudioEncodingPropertiesStatics"
  // Statics: "Windows.Media.MediaProperties.IAudioEncodingPropertiesStatics2"
  // Instantiable: "IAudioEncodingProperties"
  TAudioEncodingProperties = class(TWinRTGenericImportS2I<IAudioEncodingPropertiesStatics, IAudioEncodingPropertiesStatics2, IAudioEncodingProperties>)
  public
    // -> IAudioEncodingPropertiesStatics
    class function CreateAac(sampleRate: Cardinal; channelCount: Cardinal; bitrate: Cardinal): IAudioEncodingProperties; static; inline;
    class function CreateAacAdts(sampleRate: Cardinal; channelCount: Cardinal; bitrate: Cardinal): IAudioEncodingProperties; static; inline;
    class function CreateMp3(sampleRate: Cardinal; channelCount: Cardinal; bitrate: Cardinal): IAudioEncodingProperties; static; inline;
    class function CreatePcm(sampleRate: Cardinal; channelCount: Cardinal; bitsPerSample: Cardinal): IAudioEncodingProperties; static; inline;
    class function CreateWma(sampleRate: Cardinal; channelCount: Cardinal; bitrate: Cardinal): IAudioEncodingProperties; static; inline;

    // -> IAudioEncodingPropertiesStatics2
    class function CreateAlac(sampleRate: Cardinal; channelCount: Cardinal; bitsPerSample: Cardinal): IAudioEncodingProperties; static; inline;
    class function CreateFlac(sampleRate: Cardinal; channelCount: Cardinal; bitsPerSample: Cardinal): IAudioEncodingProperties; static; inline;
  end;

  // Windows.Media.MediaProperties.VideoEncodingProperties
  // DualAPI
  // Implements: Windows.Media.MediaProperties.IVideoEncodingProperties
  // Implements: Windows.Media.MediaProperties.IMediaEncodingProperties
  // Implements: Windows.Media.MediaProperties.IVideoEncodingProperties2
  // Implements: Windows.Media.MediaProperties.IVideoEncodingProperties3
  // Implements: Windows.Media.MediaProperties.IVideoEncodingProperties4
  // Statics: "Windows.Media.MediaProperties.IVideoEncodingPropertiesStatics2"
  // Statics: "Windows.Media.MediaProperties.IVideoEncodingPropertiesStatics"
  // Instantiable: "IVideoEncodingProperties"
  TVideoEncodingProperties = class(TWinRTGenericImportS2I<IVideoEncodingPropertiesStatics, IVideoEncodingPropertiesStatics2, IVideoEncodingProperties>)
  public
    // -> IVideoEncodingPropertiesStatics2
    class function CreateHevc: IVideoEncodingProperties; static; inline;

    // -> IVideoEncodingPropertiesStatics
    class function CreateH264: IVideoEncodingProperties; static; inline;
    class function CreateMpeg2: IVideoEncodingProperties; static; inline;
    class function CreateUncompressed(subtype: HSTRING; width: Cardinal; height: Cardinal): IVideoEncodingProperties; static; inline;
  end;

  // Windows.Media.MediaProperties.ImageEncodingProperties
  // DualAPI
  // Implements: Windows.Media.MediaProperties.IImageEncodingProperties
  // Implements: Windows.Media.MediaProperties.IMediaEncodingProperties
  // Statics: "Windows.Media.MediaProperties.IImageEncodingPropertiesStatics"
  // Statics: "Windows.Media.MediaProperties.IImageEncodingPropertiesStatics2"
  // Instantiable: "IImageEncodingProperties"
  TImageEncodingProperties = class(TWinRTGenericImportS2I<IImageEncodingPropertiesStatics, IImageEncodingPropertiesStatics2, IImageEncodingProperties>)
  public
    // -> IImageEncodingPropertiesStatics
    class function CreateJpeg: IImageEncodingProperties; static; inline;
    class function CreatePng: IImageEncodingProperties; static; inline;
    class function CreateJpegXR: IImageEncodingProperties; static; inline;

    // -> IImageEncodingPropertiesStatics2
    class function CreateUncompressed(format: MediaPixelFormat): IImageEncodingProperties; static; inline;
    class function CreateBmp: IImageEncodingProperties; static; inline;
  end;

  // Windows.Media.MediaProperties.ContainerEncodingProperties
  // DualAPI
  // Implements: Windows.Media.MediaProperties.IContainerEncodingProperties
  // Implements: Windows.Media.MediaProperties.IMediaEncodingProperties
  // Instantiable: "IContainerEncodingProperties"
  TContainerEncodingProperties = class(TWinRTGenericImportI<IContainerEncodingProperties>) end;

  // Windows.Media.MediaProperties.MediaEncodingProfile
  // DualAPI
  // Implements: Windows.Media.MediaProperties.IMediaEncodingProfile
  // Implements: Windows.Media.MediaProperties.IMediaEncodingProfile2
  // Statics: "Windows.Media.MediaProperties.IMediaEncodingProfileStatics2"
  // Statics: "Windows.Media.MediaProperties.IMediaEncodingProfileStatics"
  // Statics: "Windows.Media.MediaProperties.IMediaEncodingProfileStatics3"
  // Instantiable: "IMediaEncodingProfile"
  TMediaEncodingProfile = class(TWinRTGenericImportS3I<IMediaEncodingProfileStatics, IMediaEncodingProfileStatics2, IMediaEncodingProfileStatics3, IMediaEncodingProfile>)
  public
    // -> IMediaEncodingProfileStatics2
    class function CreateWav(quality: AudioEncodingQuality): IMediaEncodingProfile; static; inline;
    class function CreateAvi(quality: VideoEncodingQuality): IMediaEncodingProfile; static; inline;

    // -> IMediaEncodingProfileStatics
    class function CreateM4a(quality: AudioEncodingQuality): IMediaEncodingProfile; static; inline;
    class function CreateMp3(quality: AudioEncodingQuality): IMediaEncodingProfile; static; inline;
    class function CreateWma(quality: AudioEncodingQuality): IMediaEncodingProfile; static; inline;
    class function CreateMp4(quality: VideoEncodingQuality): IMediaEncodingProfile; static; inline;
    class function CreateWmv(quality: VideoEncodingQuality): IMediaEncodingProfile; static; inline;
    class function CreateFromFileAsync(&file: IStorageFile): IAsyncOperation_1__IMediaEncodingProfile; static; inline;
    class function CreateFromStreamAsync(stream: IRandomAccessStream): IAsyncOperation_1__IMediaEncodingProfile; static; inline;

    // -> IMediaEncodingProfileStatics3
    class function CreateAlac(quality: AudioEncodingQuality): IMediaEncodingProfile; static; inline;
    class function CreateFlac(quality: AudioEncodingQuality): IMediaEncodingProfile; static; inline;
    class function CreateHevc(quality: VideoEncodingQuality): IMediaEncodingProfile; static; inline;
  end;


implementation

  // Emit Classes Implementation
 { TMediaPropertySet }

 { TAudioEncodingProperties }

class function TAudioEncodingProperties.CreateAac(sampleRate: Cardinal; channelCount: Cardinal; bitrate: Cardinal): IAudioEncodingProperties;
begin
  Result := Statics.CreateAac(sampleRate, channelCount, bitrate);
end;

class function TAudioEncodingProperties.CreateAacAdts(sampleRate: Cardinal; channelCount: Cardinal; bitrate: Cardinal): IAudioEncodingProperties;
begin
  Result := Statics.CreateAacAdts(sampleRate, channelCount, bitrate);
end;

class function TAudioEncodingProperties.CreateMp3(sampleRate: Cardinal; channelCount: Cardinal; bitrate: Cardinal): IAudioEncodingProperties;
begin
  Result := Statics.CreateMp3(sampleRate, channelCount, bitrate);
end;

class function TAudioEncodingProperties.CreatePcm(sampleRate: Cardinal; channelCount: Cardinal; bitsPerSample: Cardinal): IAudioEncodingProperties;
begin
  Result := Statics.CreatePcm(sampleRate, channelCount, bitsPerSample);
end;

class function TAudioEncodingProperties.CreateWma(sampleRate: Cardinal; channelCount: Cardinal; bitrate: Cardinal): IAudioEncodingProperties;
begin
  Result := Statics.CreateWma(sampleRate, channelCount, bitrate);
end;


class function TAudioEncodingProperties.CreateAlac(sampleRate: Cardinal; channelCount: Cardinal; bitsPerSample: Cardinal): IAudioEncodingProperties;
begin
  Result := Statics2.CreateAlac(sampleRate, channelCount, bitsPerSample);
end;

class function TAudioEncodingProperties.CreateFlac(sampleRate: Cardinal; channelCount: Cardinal; bitsPerSample: Cardinal): IAudioEncodingProperties;
begin
  Result := Statics2.CreateFlac(sampleRate, channelCount, bitsPerSample);
end;


 { TVideoEncodingProperties }

class function TVideoEncodingProperties.CreateH264: IVideoEncodingProperties;
begin
  Result := Statics.CreateH264;
end;

class function TVideoEncodingProperties.CreateMpeg2: IVideoEncodingProperties;
begin
  Result := Statics.CreateMpeg2;
end;

class function TVideoEncodingProperties.CreateUncompressed(subtype: HSTRING; width: Cardinal; height: Cardinal): IVideoEncodingProperties;
begin
  Result := Statics.CreateUncompressed(subtype, width, height);
end;


class function TVideoEncodingProperties.CreateHevc: IVideoEncodingProperties;
begin
  Result := Statics2.CreateHevc;
end;


 { TImageEncodingProperties }

class function TImageEncodingProperties.CreateJpeg: IImageEncodingProperties;
begin
  Result := Statics.CreateJpeg;
end;

class function TImageEncodingProperties.CreatePng: IImageEncodingProperties;
begin
  Result := Statics.CreatePng;
end;

class function TImageEncodingProperties.CreateJpegXR: IImageEncodingProperties;
begin
  Result := Statics.CreateJpegXR;
end;


class function TImageEncodingProperties.CreateUncompressed(format: MediaPixelFormat): IImageEncodingProperties;
begin
  Result := Statics2.CreateUncompressed(format);
end;

class function TImageEncodingProperties.CreateBmp: IImageEncodingProperties;
begin
  Result := Statics2.CreateBmp;
end;


 { TContainerEncodingProperties }

 { TMediaEncodingProfile }

class function TMediaEncodingProfile.CreateM4a(quality: AudioEncodingQuality): IMediaEncodingProfile;
begin
  Result := Statics.CreateM4a(quality);
end;

class function TMediaEncodingProfile.CreateMp3(quality: AudioEncodingQuality): IMediaEncodingProfile;
begin
  Result := Statics.CreateMp3(quality);
end;

class function TMediaEncodingProfile.CreateWma(quality: AudioEncodingQuality): IMediaEncodingProfile;
begin
  Result := Statics.CreateWma(quality);
end;

class function TMediaEncodingProfile.CreateMp4(quality: VideoEncodingQuality): IMediaEncodingProfile;
begin
  Result := Statics.CreateMp4(quality);
end;

class function TMediaEncodingProfile.CreateWmv(quality: VideoEncodingQuality): IMediaEncodingProfile;
begin
  Result := Statics.CreateWmv(quality);
end;

class function TMediaEncodingProfile.CreateFromFileAsync(&file: IStorageFile): IAsyncOperation_1__IMediaEncodingProfile;
begin
  Result := Statics.CreateFromFileAsync(&file);
end;

class function TMediaEncodingProfile.CreateFromStreamAsync(stream: IRandomAccessStream): IAsyncOperation_1__IMediaEncodingProfile;
begin
  Result := Statics.CreateFromStreamAsync(stream);
end;


class function TMediaEncodingProfile.CreateWav(quality: AudioEncodingQuality): IMediaEncodingProfile;
begin
  Result := Statics2.CreateWav(quality);
end;

class function TMediaEncodingProfile.CreateAvi(quality: VideoEncodingQuality): IMediaEncodingProfile;
begin
  Result := Statics2.CreateAvi(quality);
end;


class function TMediaEncodingProfile.CreateAlac(quality: AudioEncodingQuality): IMediaEncodingProfile;
begin
  Result := Statics3.CreateAlac(quality);
end;

class function TMediaEncodingProfile.CreateFlac(quality: AudioEncodingQuality): IMediaEncodingProfile;
begin
  Result := Statics3.CreateFlac(quality);
end;

class function TMediaEncodingProfile.CreateHevc(quality: VideoEncodingQuality): IMediaEncodingProfile;
begin
  Result := Statics3.CreateHevc(quality);
end;



end.
