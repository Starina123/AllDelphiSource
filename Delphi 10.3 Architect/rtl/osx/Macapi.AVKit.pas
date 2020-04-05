{*******************************************************}
{                                                       }
{            CodeGear Delphi Runtime Library            }
{                                                       }
{ Copyright(c) 2010-2019 Embarcadero Technologies, Inc. }
{                  All rights reserved                  }
{                                                       }
{*******************************************************}

unit Macapi.AVKit;

interface

uses
  Macapi.ObjectiveC, Macapi.CocoaTypes, Macapi.CoreFoundation, Macapi.Foundation, Macapi.CoreGraphics, Macapi.AppKit, Macapi.Dispatch,
  Macapi.AVFoundation;

const
  AVCaptureViewControlsStyleInline = 0;
  AVCaptureViewControlsStyleFloating = 1;
  AVCaptureViewControlsStyleInlineDeviceSelection = 2;
  AVCaptureViewControlsStyleDefault = AVCaptureViewControlsStyleInline;
  AVPlayerViewControlsStyleNone = 0;
  AVPlayerViewControlsStyleInline = 1;
  AVPlayerViewControlsStyleFloating = 2;
  AVPlayerViewControlsStyleMinimal = 3;
  AVPlayerViewControlsStyleDefault = AVPlayerViewControlsStyleInline;
  AVPlayerViewTrimOKButton = 0;
  AVPlayerViewTrimCancelButton = 1;

type
  AVCaptureView = interface;
  AVCaptureViewDelegate = interface;
  AVPlayerView = interface;

  AVCaptureViewControlsStyle = NSInteger;
  AVPlayerViewControlsStyle = NSInteger;
  AVPlayerViewTrimResult = NSInteger;
  TAVPlayerViewBlockMethod1 = procedure(result: AVPlayerViewTrimResult) of object;

  AVCaptureViewClass = interface(NSViewClass)
    ['{778F5603-1C42-4FE3-B067-CDB28B80929C}']
  end;

  AVCaptureView = interface(NSView)
    ['{E1C219BF-37FB-414B-B9FD-CDD3530640C7}']
    function controlsStyle: AVCaptureViewControlsStyle; cdecl;
    function delegate: Pointer; cdecl;
    function fileOutput: AVCaptureFileOutput; cdecl;
    function session: AVCaptureSession; cdecl;
    procedure setControlsStyle(controlsStyle: AVCaptureViewControlsStyle); cdecl;
    procedure setDelegate(delegate: Pointer); cdecl;
    [MethodName('setSession:showVideoPreview:showAudioPreview:')]
    procedure setSession(session: AVCaptureSession; showVideoPreview: Boolean; showAudioPreview: Boolean); cdecl;
    procedure setVideoGravity(videoGravity: NSString); cdecl;
    function videoGravity: NSString; cdecl;
  end;
  TAVCaptureView = class(TOCGenericImport<AVCaptureViewClass, AVCaptureView>) end;

  AVCaptureViewDelegate = interface(IObjectiveC)
    ['{54975ECA-EC8D-4C81-A3C5-E41E5D6A5B6A}']
    [MethodName('captureView:startRecordingToFileOutput:')]
    procedure captureView(captureView: AVCaptureView; fileOutput: AVCaptureFileOutput); cdecl;
  end;

  AVPlayerViewClass = interface(NSViewClass)
    ['{B9BAD5DB-021D-44FB-B5B7-FE3D4B33439F}']
  end;

  AVPlayerView = interface(NSView)
    ['{0318A739-BADD-4703-BEF4-9549FE60E52F}']
    function actionPopUpButtonMenu: NSMenu; cdecl;
    procedure beginTrimmingWithCompletionHandler(handler: TAVPlayerViewBlockMethod1); cdecl;
    function canBeginTrimming: Boolean; cdecl;
    function contentOverlayView: NSView; cdecl;
    function controlsStyle: AVPlayerViewControlsStyle; cdecl;
    [MethodName('flashChapterNumber:chapterTitle:')]
    procedure flashChapterNumber(chapterNumber: NSUInteger; chapterTitle: NSString); cdecl;
    function isReadyForDisplay: Boolean; cdecl;
    function player: AVPlayer; cdecl;
    procedure setActionPopUpButtonMenu(actionPopUpButtonMenu: NSMenu); cdecl;
    procedure setControlsStyle(controlsStyle: AVPlayerViewControlsStyle); cdecl;
    procedure setPlayer(player: AVPlayer); cdecl;
    procedure setShowsFrameSteppingButtons(showsFrameSteppingButtons: Boolean); cdecl;
    procedure setShowsFullScreenToggleButton(showsFullScreenToggleButton: Boolean); cdecl;
    procedure setShowsSharingServiceButton(showsSharingServiceButton: Boolean); cdecl;
    procedure setUpdatesNowPlayingInfoCenter(updatesNowPlayingInfoCenter: Boolean); cdecl;
    procedure setVideoGravity(videoGravity: NSString); cdecl;
    function showsFrameSteppingButtons: Boolean; cdecl;
    function showsFullScreenToggleButton: Boolean; cdecl;
    function showsSharingServiceButton: Boolean; cdecl;
    function updatesNowPlayingInfoCenter: Boolean; cdecl;
    function videoBounds: NSRect; cdecl;
    function videoGravity: NSString; cdecl;
  end;
  TAVPlayerView = class(TOCGenericImport<AVPlayerViewClass, AVPlayerView>) end;

const
  libAVKit = '/System/Library/Frameworks/AVKit.framework/AVKit';

implementation

uses
  System.SysUtils;

var
  AVKitModule: THandle;

initialization
  AVKitModule := LoadLibrary(libAVKit);

finalization
  if AVKitModule <> 0 then
    FreeLibrary(AVKitModule);

end.