{*******************************************************}
{                                                       }
{              Delphi FireMonkey Platform               }
{                                                       }
{ Copyright(c) 2018 Embarcadero Technologies, Inc.      }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

unit FMX.Presentation.Android.Style;

interface

{$SCOPEDENUMS ON}

uses
  System.Types, System.Classes, System.SysUtils, System.UITypes, System.Messaging, Androidapi.JNI.GraphicsContentViewText,
  Androidapi.JNI.JavaTypes, Androidapi.JNIBridge, FMX.Types, FMX.Controls.Presentation, FMX.Controls, FMX.Graphics,
  FMX.Presentation.Android, FMX.Platform.Android, FMX.Platform.UI.Android, FMX.Presentation.Style.Common;

type

  TAndroidStyledPresentation = class;
  TAndroidNativeScene = class;
  TAndroidHandle = class;

  /// <summary>Helper class used as root for control's style</summary>
  TAndroidNativeStyledControl = class(TNativeStyledControl)
  private
    function GetScene: TAndroidNativeScene;
  protected
    function GetDefaultStyleLookupName: string; override;
    procedure ApplyStyle; override;
    procedure FreeStyle; override;
    procedure AdjustSize; override;
    property Scene: TAndroidNativeScene read GetScene;
  end;

  /// <summary>Non TControl class that used as container for style to break control parenting</summary>
  TAndroidNativeScene = class(TNativeScene)
  private
    FCanvas: TCanvas;
    function GetHandle: TAndroidHandle;
    function GetPresentation: TAndroidStyledPresentation;
    function GetStyledControl: TAndroidNativeStyledControl;
  protected
    procedure DoAddUpdateRect(R: TRectF); override;
    function DoGetCanvas: TCanvas; override;
    function DoGetSceneScale: Single; override;
    function DoGetStyleBook: TStyleBook; override;
    function DoLocalToScreen(P: TPointF): TPointF; override;
    function DoScreenToLocal(P: TPointF): TPointF; override;
    procedure DoResized(const NewSize: TSizeF); override;
    function GetPresentedControl: TControl; override;
  public
    constructor Create(APresentation: TAndroidStyledPresentation); reintroduce;
    destructor Destroy; override;
    procedure Paint;
    procedure Invalidate;
    procedure CreateCanvas(Surface: JSurfaceTexture; Width: Integer; Height: Integer);
    function DestroyCanvas(Surface: JSurfaceTexture): Boolean;
    property Presentation: TAndroidStyledPresentation read GetPresentation;
    /// <summary>Link to OS window handle linked with presentation</summary>
    property Handle: TAndroidHandle read GetHandle;
    /// <summary>Link to root styled control of the scene</summary>
    property StyledControl: TAndroidNativeStyledControl read GetStyledControl;
  end;

{ TAndroidStyledPresentation }

  TTextureView_SurfaceTextureListener = class(TJavaLocal, JTextureView_SurfaceTextureListener)
  private
    [Weak] FScene: TAndroidNativeScene;
  public
    constructor Create(const AScene: TAndroidNativeScene);

    { JTextureView_SurfaceTextureListener }
    procedure onSurfaceTextureAvailable(surface: JSurfaceTexture; width: Integer; height: Integer); cdecl;
    function onSurfaceTextureDestroyed(surface: JSurfaceTexture): Boolean; cdecl;
    procedure onSurfaceTextureSizeChanged(surface: JSurfaceTexture; width: Integer; height: Integer); cdecl;
    procedure onSurfaceTextureUpdated(surface: JSurfaceTexture); cdecl;
  end;

  /// <summary>Basic Android native-styled presentation, which is JView.</summary>
  TAndroidStyledPresentation = class(TAndroidNativeView)
  private
    FNativeScene: TAndroidNativeScene;
    FListener: TTextureView_SurfaceTextureListener;
    function GetStyledControl: TAndroidNativeStyledControl;
    { System message handler }
    procedure ApplicationEventHandler(const Sender: TObject; const AMessage: TMessage);
  protected
    function CreateView: JView; override;
    procedure SetSize(const ASize: TSizeF); override;
    /// <summary>Bridge from presentation's GetDefaultStyleLookupName to StyledControl.GetDefaultStyleLookupName</summary>
    function GetDefaultStyleLookupName: string; virtual;
    /// <summary>Bridge from presentation's GetParentClassStyleLookupName to StyledControl.GetParentClassStyleLookupName</summary>
    function GetParentClassStyleLookupName: string; virtual;
    /// <summary>Bridge from presentation's ApplyStyle to StyledControl.ApplyStyle</summary>
    procedure ApplyStyle; virtual;
    /// <summary>Bridge from presentation's FreeStyle to StyledControl.FreeStyle</summary>
    procedure FreeStyle; virtual;
    /// <summary>Bridge from presentation's DoApplyStyleLookup to StyledControl.DoApplyStyleLookup</summary>
    procedure DoApplyStyleLookup; virtual;
  public
    constructor Create; overload; override;
    destructor Destroy; override;
    procedure Dispatch(var Message); override;
    /// <summary>Link to root styled control of the scene</summary>
    property StyledControl: TAndroidNativeStyledControl read GetStyledControl;
  end;

  TAndroidHandle = class(TWindowHandle)
  private
    FSurface: JSurfaceTexture;
  protected
    function GetScale: Single; override;
  public
    property Surface: JSurfaceTexture read FSurface write FSurface;
  end;

implementation

uses
  AndroidApi.JNI.App, Androidapi.Helpers, FMX.Consts, FMX.Presentation.Factory, FMX.Helpers.Android, FMX.Platform,
  FMX.Context.GLES.Android;

type

  TOpenStyledControl = class(TStyledControl);

{ TAndroidHandle }

function TAndroidHandle.GetScale: Single;
begin
  Result := PlatformAndroid.WindowService.Scale;
end;

{ TAndroidNativeStyledControl }

procedure TAndroidNativeStyledControl.AdjustSize;
begin
end;

procedure TAndroidNativeStyledControl.ApplyStyle;
begin
  inherited;
  if Scene.Presentation <> nil then
    Scene.Presentation.ApplyStyle;
end;

procedure TAndroidNativeStyledControl.FreeStyle;
begin
  if Scene.Presentation <> nil then
    Scene.Presentation.FreeStyle;
  inherited;
end;

function TAndroidNativeStyledControl.GetDefaultStyleLookupName: string;
begin
  Result := Scene.Presentation.GetDefaultStyleLookupName;
end;

function TAndroidNativeStyledControl.GetScene: TAndroidNativeScene;
begin
  Result := TAndroidNativeScene(inherited Scene);
end;

{ TAndroidNativeScene }

constructor TAndroidNativeScene.Create(APresentation: TAndroidStyledPresentation);
begin
  inherited Create(TAndroidHandle.Create, APresentation, TAndroidNativeStyledControl);
  FCanvas := TCanvasManager.CreateFromWindow(Handle, 1, 1);
end;

destructor TAndroidNativeScene.Destroy;
begin
  FCanvas.Free;
  inherited;
end;

function TAndroidNativeScene.DoLocalToScreen(P: TPointF): TPointF;
begin
end;

function TAndroidNativeScene.DoScreenToLocal(P: TPointF): TPointF;
begin
end;

procedure TAndroidNativeScene.DoAddUpdateRect(R: TRectF);
begin
  if not (csDestroying in ComponentState) and not IsDisableUpdating then
  begin
    R := TRectF.Create(R.TopLeft.Truncate, R.BottomRight.Ceiling);
    if IntersectRect(R, TRectF.Create(0, 0, Presentation.Size.Width, Presentation.Size.Height)) then
    begin
      UpdateRects.Add(TRectF.Create(0, 0, FCanvas.Width, FCanvas.Height));
      Paint;
    end;
  end;
end;

function TAndroidNativeScene.DoGetCanvas: TCanvas;
begin
  Result := FCanvas;
end;

function TAndroidNativeScene.GetHandle: TAndroidHandle;
begin
  Result := TAndroidHandle(inherited Handle);
end;

function TAndroidNativeScene.GetPresentation: TAndroidStyledPresentation;
begin
  Result := TAndroidStyledPresentation(inherited Presentation);
end;

function TAndroidNativeScene.GetPresentedControl: TControl;
begin
  Result := Presentation.Control;
end;

function TAndroidNativeScene.DoGetSceneScale: Single;
begin
  Result := PlatformAndroid.WindowService.Scale;
end;

function TAndroidNativeScene.DoGetStyleBook: TStyleBook;
begin
  if (Presentation.Control <> nil) and (Presentation.Control.Scene <> nil) then
    Result := Presentation.Control.Scene.StyleBook
  else
    Result := nil;
end;

function TAndroidNativeScene.GetStyledControl: TAndroidNativeStyledControl;
begin
  Result := TAndroidNativeStyledControl(inherited StyledControl);
end;

procedure TAndroidNativeScene.Invalidate;
begin
  UpdateRects.Add(TRectF.Create(0, 0, FCanvas.Width, FCanvas.Height));
  if FCanvas.BeginScene then
    try
      FCanvas.Clear(TAlphaColorRec.Null);
      PaintControls;
    finally
      FCanvas.EndScene;
    end;
end;

procedure TAndroidNativeScene.CreateCanvas(Surface: JSurfaceTexture; Width, Height: Integer);
begin
  Handle.Surface := Surface;

  UpdateRects.Add(TRectF.Create(0, 0, FCanvas.Width, FCanvas.Height));
  Paint;
end;

function TAndroidNativeScene.DestroyCanvas(Surface: JSurfaceTexture): Boolean;
var
  Size: TSize;
begin
  Handle.Surface := nil;

  Size := TSize.Create(FCanvas.Width, FCanvas.Height);
  FCanvas.Free;
  FCanvas := TCanvasManager.CreateFromWindow(Handle, Size.Width, Size.Height);
  Result := True;
end;

procedure TAndroidNativeScene.Paint;
begin
  if (UpdateRects.Count > 0) and FCanvas.BeginScene then
    try
      FCanvas.Clear(TAlphaColorRec.Null);
      PaintControls;
    finally
      FCanvas.EndScene;
    end;
end;

procedure TAndroidNativeScene.DoResized(const NewSize: TSizeF);
begin
  inherited;
  FCanvas.Free;
  FCanvas := TCanvasManager.CreateFromWindow(Handle, Trunc(NewSize.Width), Trunc(NewSize.Height));
end;

{ TTextureView_SurfaceTextureListener }

constructor TTextureView_SurfaceTextureListener.Create(const AScene: TAndroidNativeScene);
begin
  inherited Create;
  FScene := AScene;
end;

procedure TTextureView_SurfaceTextureListener.onSurfaceTextureAvailable(surface: JSurfaceTexture; width,
  height: Integer);
begin
  FScene.CreateCanvas(surface, width, height);
end;

function TTextureView_SurfaceTextureListener.onSurfaceTextureDestroyed(surface: JSurfaceTexture): Boolean;
begin
  FScene.DestroyCanvas(surface);
  surface.release;
  Result := True;
end;

procedure TTextureView_SurfaceTextureListener.onSurfaceTextureSizeChanged(surface: JSurfaceTexture; width,
  height: Integer);
begin
  FScene.DestroyCanvas(surface);
  FScene.CreateCanvas(surface, width, height);
end;

procedure TTextureView_SurfaceTextureListener.onSurfaceTextureUpdated(surface: JSurfaceTexture);
begin
end;

{ TAndroidStyledPresentation }

constructor TAndroidStyledPresentation.Create;
begin
  inherited;
  FNativeScene := TAndroidNativeScene.Create(Self);
  Control.InsertObject(0, FNativeScene);

  FListener := TTextureView_SurfaceTextureListener.Create(FNativeScene);
  with TJTextureView.Wrap(View) do
  begin
    setSurfaceTextureListener(FListener);
    setOpaque(True);
  end;
  TMessageManager.DefaultManager.SubscribeToMessage(TApplicationEventMessage, ApplicationEventHandler);
end;

function TAndroidStyledPresentation.CreateView: JView;
begin
  Result := TJTextureView.JavaClass.init(TAndroidHelper.Activity);
end;

destructor TAndroidStyledPresentation.Destroy;
begin
  TMessageManager.DefaultManager.Unsubscribe(TApplicationEventMessage, ApplicationEventHandler);
  FreeAndNil(FNativeScene);
  inherited;
end;

procedure TAndroidStyledPresentation.Dispatch(var Message);
begin
  FNativeScene.Dispatch(Message);
  inherited;
end;

procedure TAndroidStyledPresentation.DoApplyStyleLookup;
begin
  FNativeScene.StyledControl.DoApplyStyleLookup;
end;

procedure TAndroidStyledPresentation.ApplicationEventHandler(const Sender: TObject; const AMessage: TMessage);
begin
  // When the app goes into the background and then comes back, it clears texture. Therefore, after opening
  // the application, we need to perform a redraw.
  if (AMessage is TApplicationEventMessage) and (TApplicationEventMessage(AMessage).Value.Event = TApplicationEvent.BecameActive) then
    FNativeScene.Invalidate;
end;

procedure TAndroidStyledPresentation.ApplyStyle;
begin
  TOpenStyledControl(Control).ApplyStyle;
end;

procedure TAndroidStyledPresentation.FreeStyle;
begin
  TOpenStyledControl(Control).FreeStyle;
end;

function TAndroidStyledPresentation.GetDefaultStyleLookupName: string;
begin
  Result := TStyledControl(Control).DefaultStyleLookupName;
end;

function TAndroidStyledPresentation.GetParentClassStyleLookupName: string;
begin
  Result := TStyledControl(Control).ParentClassStyleLookupName;
end;

function TAndroidStyledPresentation.GetStyledControl: TAndroidNativeStyledControl;
begin
  Result := FNativeScene.StyledControl;
end;

procedure TAndroidStyledPresentation.SetSize(const ASize: TSizeF);
begin
  inherited;
  FNativeScene.SetSize(Size);
end;

initialization
  TPresentationProxyFactory.Current.RegisterDefault(TControlType.Platform, TAndroidPresentationProxy<TAndroidStyledPresentation>);
finalization
  TPresentationProxyFactory.Current.UnregisterDefault(TControlType.Platform);
end.
