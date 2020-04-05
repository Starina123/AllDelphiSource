{*******************************************************}
{                                                       }
{              Delphi FireMonkey Platform               }
{                                                       }
{ Copyright(c) 2014-2018 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

unit FMX.Presentation.Win.Style;

interface

{$SCOPEDENUMS ON}

uses
  WinApi.Messages, WinApi.Windows, System.Types, System.Classes, FMX.Types, FMX.Graphics, FMX.Controls, FMX.Controls.Win,
  FMX.Controls.Presentation, FMX.Platform.Win, FMX.Presentation.Win, FMX.Presentation.Style.Common;

type

  TWinStyledPresentation = class;
  TWinNativeScene = class;

  /// <summary>Helper class used as root for control's style</summary>
  TWinNativeStyledControl = class(TNativeStyledControl)
  private
    function GetScene: TWinNativeScene;
  protected
    function GetDefaultStyleLookupName: string; override;
    procedure ApplyStyle; override;
    procedure FreeStyle; override;
    procedure AdjustSize; override;
    property Scene: TWinNativeScene read GetScene;
  end;

  /// <summary>Non TControl class that used as container for style to break control parenting</summary>
  TWinNativeScene = class(TNativeScene)
  private
    FBackground: TBitmap;
    FCanvas: TCanvas;
    function GetParentedPosition(const ParentHandle: HWnd): TPointF;
    procedure DrawFMBackground(const ParentHandle: HWnd);
    procedure DrawNativeBackground(const ParentHandle: HWnd);
    procedure DrawBackground(const Handle: HWnd);
    function GetPresentation: TWinStyledPresentation;
    function GetHandle: TWinWindowHandle;
    function GetStyledControl: TWinNativeStyledControl;
  protected
    function DoGetCanvas: TCanvas; override;
    function DoGetSceneScale: Single; override;
    function DoGetStyleBook: TStyleBook; override;
    procedure DoAddUpdateRect(R: TRectF); override;
    procedure DoResized(const NewSize: TSizeF); override;
    function DoLocalToScreen(P: TPointF): TPointF; override;
    function DoScreenToLocal(P: TPointF): TPointF; override;
    function GetPresentedControl: TControl; override;
  public
    constructor Create(APresentation: TWinStyledPresentation; const ControlClass: TNativeStyledControlClass); reintroduce;
    destructor Destroy; override;
    procedure Paint(const DC: HDC);
    /// <summary>Link to presentation object</summary>
    property Presentation: TWinStyledPresentation read GetPresentation;
    /// <summary>Link to OS window handle linked with presentation</summary>
    property Handle: TWinWindowHandle read GetHandle;
    /// <summary>Link to root styled control of the scene</summary>
    property StyledControl: TWinNativeStyledControl read GetStyledControl;
  end;

{ TWinStyledPresentation }

  /// <summary>Basic Win native-styled presentation, which is HWnd.</summary>
  TWinStyledPresentation = class(TWinPresentation)
  public class var
    ///<summary>Atom assosiated with Handle that used as presentation</summary>
    Atom: TAtom;
    ///<summary>String assosiated with Atom</summary>
    AtomString: string;
    ///<summary>Return True Handle not assosiated with object</summary>
    class function IsParentNative(const Handle: HWnd): Boolean;
    ///<summary>Return assosiated with Handle object</summary>
    class function WindowToObject(Handle: HWND): TFmxObject;
  private
    FNativeScene: TWinNativeScene;
    function GetStyledControl: TWinNativeStyledControl;
    function GetResourceLink: TFmxObject;
    procedure WMPaint(var Message: TWMPaint); message WM_PAINT;
    procedure WMEraseBkgnd(var Message: TWmEraseBkgnd); message WM_ERASEBKGND;
  protected
    function ExtractPoint(var Message: TWMMouse): TPoint; override;
    procedure Resized; override;
    /// <summary>Bridge from presentation's GetDefaultStyleLookupName to StyledControl.GetDefaultStyleLookupName</summary>
    function GetDefaultStyleLookupName: string; virtual;
    /// <summary>Bridge from presentation's GetParentClassStyleLookupName to StyledControl.GetParentClassStyleLookupName</summary>
    function GetParentClassStyleLookupName: string; virtual;
    /// <summary>Bridge from presentation's ApplyStyle to StyledControl.ApplyStyle</summary>
    procedure ApplyStyle; virtual;
    /// <summary>Bridge from presentation's FreeStyle to StyledControl.FreeStyle</summary>
    procedure FreeStyle; virtual;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Dispatch(var Message); override;
    /// <summary>Link to root styled control of the scene</summary>
    property StyledControl: TWinNativeStyledControl read GetStyledControl;
    /// <summary>Link to style of presentation</summary>
    property ResourceLink: TFmxObject read GetResourceLink;
  end;

implementation

uses
  System.SysUtils,  FMX.Presentation.Factory, FMX.Helpers.Win, FMX.Utils;

type

{ TViewWindowHandle }

  TViewWindowHandle = class(TWinWindowHandle)
  private
    [Weak] FPresentation: TWinStyledPresentation;
  protected
    function GetTransparency: Boolean; override;
    function GetWndClientSize: TSize; override;
  protected
    constructor Create(const APresentation: TWinStyledPresentation); reintroduce;
    function GetScale: Single; override;
  end;

  TOpenControl = class(TControl);
  TOpenStyledControl = class(TStyledControl);

{ TWinNativeStyledControl }

procedure TWinNativeStyledControl.AdjustSize;
begin
end;

procedure TWinNativeStyledControl.ApplyStyle;
begin
  inherited;
  Scene.Presentation.ApplyStyle;
end;

procedure TWinNativeStyledControl.FreeStyle;
begin
  Scene.Presentation.FreeStyle;
  inherited;
end;

function TWinNativeStyledControl.GetDefaultStyleLookupName: string;
begin
  Result := Scene.Presentation.GetDefaultStyleLookupName;
end;

function TWinNativeStyledControl.GetScene: TWinNativeScene;
begin
  Result := TWinNativeScene(inherited Scene);
end;

{ TViewWindowHandle }

constructor TViewWindowHandle.Create(const APresentation: TWinStyledPresentation);
begin
  FPresentation := APresentation;
  inherited Create(nil, APresentation.Handle);
end;

function TViewWindowHandle.GetScale: Single;
begin
  Result := FPresentation.Scale;
end;

function TViewWindowHandle.GetTransparency: Boolean;
begin
  Result := True;
end;

function TViewWindowHandle.GetWndClientSize: TSize;
var
  R: TRect;
begin
  GetWindowRect(Wnd, R);
  Result := R.Size;
end;

{ TWinNativeScene }

constructor TWinNativeScene.Create(APresentation: TWinStyledPresentation; const ControlClass: TNativeStyledControlClass);
begin
  inherited Create(TViewWindowHandle.Create(APresentation), APresentation, ControlClass);
  FCanvas := TCanvasManager.CreateFromWindow(Handle, Round(Presentation.ControlSize.Width),
    Round(APresentation.ControlSize.Height));
  FBackground := TBitmap.Create;
end;

destructor TWinNativeScene.Destroy;
begin
  FBackground.Free;
  // FCanvas must be nil or valid for the checks in FStyledControl to correctly fail when it is being destroyed
  FreeAndNil(FCanvas);
  inherited;
end;

procedure TWinNativeScene.DoAddUpdateRect(R: TRectF);
var
  LRect: TRect;
begin
  if not (csDestroying in ComponentState) and not IsDisableUpdating then
  begin
    R := Handle.FormToWnd(R);
    R := TRectF.Create(R.TopLeft.Truncate, R.BottomRight.Ceiling);
    if IntersectRect(R, TRectF.Create(0, 0, Presentation.Size.Width, Presentation.Size.Height)) then
    begin
      LRect := R.Round;
      InvalidateRect(Presentation.Handle, @LRect, True);
    end;
  end;
end;

function TWinNativeScene.DoGetCanvas: TCanvas;
begin
  Result := FCanvas;
end;

function TWinNativeScene.GetHandle: TWinWindowHandle;
begin
  Result := TWinWindowHandle(inherited Handle);
end;

function TWinNativeScene.DoGetSceneScale: Single;
begin
  Result := Handle.Scale;
end;

function TWinNativeScene.GetStyledControl: TWinNativeStyledControl;
begin
  Result := TWinNativeStyledControl(inherited StyledControl);
end;

function TWinNativeScene.DoGetStyleBook: TStyleBook;
begin
  if (Presentation.Control <> nil) and (Presentation.Control.Scene <> nil) then
    Result := Presentation.Control.Scene.StyleBook
  else
    Result := nil;
end;

function TWinNativeScene.DoLocalToScreen(P: TPointF): TPointF;
var
  LPoint: TPoint;
begin
  LPoint := (P * Handle.Scale).Round;
  Winapi.Windows.ClientToScreen(Presentation.Handle, LPoint);
  Result := TPointF.Create(LPoint);
end;

procedure TWinNativeScene.DrawFMBackground(const ParentHandle: HWnd);
var
  I: Integer;
  Control: TOpenControl;
  ParentObject: TFmxObject;
begin
  ParentObject := Presentation.WindowToObject(ParentHandle);
  if ParentObject <> nil then
  begin
    with GetParentedPosition(ParentHandle) do
      FBackground.Canvas.Offset := TPointF.Create(-X, -Y);
    try
      if ParentObject.ChildrenCount > 0 then
        for I := 0 to ParentObject.Children.Count - 1 do
          if ParentObject.Children[I] is TControl then
          begin
            Control := TOpenControl(ParentObject.Children[I]);
            if not Control.Visible then
              Continue;
            if Control.Scene = nil then
              Continue;
            if not Control.InPaintTo and Control.UpdateRect.IsEmpty then
              Continue;

            Control.TempCanvas := FBackground.Canvas;
            try
              Control.PaintInternal;
            finally
              Control.TempCanvas := nil;
            end;
          end;
    finally
      FBackground.Canvas.Offset := TPointF.Zero;
    end;
  end;
end;

procedure TWinNativeScene.DrawNativeBackground(const ParentHandle: HWnd);

  procedure MoveWindowOrg(DC: HDC; DX, DY: Integer);
  var
    P: TPoint;
  begin
    GetWindowOrgEx(DC, P);
    SetWindowOrgEx(DC, P.X - DX, P.Y - DY, nil);
  end;

var
  P: TPoint;
  R: TRect;
  I: Integer;
  Data: TBitmapData;
begin
  GetWindowRect(Presentation.Handle, R);
  ScreenToClient(ParentHandle, R.TopLeft);
  ScreenToClient(ParentHandle, R.BottomRight);
  P := R.TopLeft;

  MoveWindowOrg(Handle.BufferHandle, -P.X, -P.Y);

  SendMessage(ParentHandle, WM_ERASEBKGND, Handle.BufferHandle, 0);
  SendMessage(ParentHandle, WM_PAINT, Handle.BufferHandle, 0);

  MoveWindowOrg(Handle.BufferHandle, P.X, P.Y);

  if not Handle.BufferSize.IsZero and FBackground.Map(TMapAccess.Write, Data) then
  try
    for I := 0 to Data.Height - 1 do
      Move(PAlphaColorArray(Handle.BufferBits)[I * Data.Width], Data.GetScanline(I)^, Data.Pitch);
  finally
    FBackground.Unmap(Data);
  end;
end;

procedure TWinNativeScene.DrawBackground(const Handle: HWnd);
var
  ParentWnd, WorkWnd: HWnd;
begin
  ParentWnd := Winapi.Windows.GetParent(Handle);
  WorkWnd := ParentWnd;
  while not Presentation.IsParentNative(WorkWnd) do
  begin
    DrawBackground(WorkWnd);
    WorkWnd := Winapi.Windows.GetParent(WorkWnd);
  end;

  if (ParentWnd <> 0) and (ParentWnd <> Presentation.ContainerHandle) then
  begin
    if Presentation.IsParentNative(ParentWnd) then
      DrawNativeBackground(ParentWnd)
    else
      DrawFMBackground(ParentWnd);
  end;
end;

procedure TWinNativeScene.Paint(const DC: HDC);
var
  U: TArray<TRectF>;
begin
  if UpdateRects.Count > 0 then
  begin
    if FBackground.Canvas.BeginScene then
    try
      DrawBackground(Presentation.Handle);
    finally
      FBackground.Canvas.EndScene;
    end;

    U := Self.UpdateRects.ToArray;
    if FCanvas.BeginScene(@U, DC) then
    try
      FCanvas.Clear(0);
      FCanvas.DrawBitmap(FBackground, TRectF.Create(0, 0, FBackground.Width, FBackground.Height),
        TRectF.Create(0, 0, FBackground.Width / Handle.Scale, FBackground.Height / Handle.Scale), 1, True);

      PaintControls;
    finally
      FCanvas.EndScene;
    end;
  end;
end;

function TWinNativeScene.GetParentedPosition(const ParentHandle: HWnd): TPointF;
var
  P: TPoint;
begin
  P := TPoint.Zero;
  Winapi.Windows.ClientToScreen(Presentation.Handle, P);
  Winapi.Windows.ScreenToClient(ParentHandle, P);
  Result := TPointF.Create(P) / Handle.Scale;
end;

function TWinNativeScene.GetPresentation: TWinStyledPresentation;
begin
  Result := TWinStyledPresentation(inherited Presentation);
end;

function TWinNativeScene.GetPresentedControl: TControl;
begin
  Result := Presentation.Control;
end;

procedure TWinNativeScene.DoResized;
begin
  FCanvas.SetSize(Trunc(NewSize.Width), Trunc(NewSize.Height));
  FBackground.SetSize(FCanvas.Width, FCanvas.Height);
  FBackground.BitmapScale := Handle.Scale;
  inherited;
end;

function TWinNativeScene.DoScreenToLocal(P: TPointF): TPointF;
var
  LPoint: TPoint;
begin
  LPoint := P.Round;
  Winapi.Windows.ScreenToClient(Presentation.Handle, LPoint);
  Result := TPointF.Create(LPoint) / Handle.Scale;
end;

{ TWinStyledPresentation }

constructor TWinStyledPresentation.Create(AOwner: TComponent);
begin
  inherited;
  if AtomString.IsEmpty then
  begin
    AtomString := Format('STYLEY%.8X', [GetCurrentProcessID]);
    Atom := GlobalAddAtomW(PChar(AtomString));
  end;
  SetProp(Handle, MakeIntAtom(Atom), THandle(Self));
  FNativeScene := TWinNativeScene.Create(Self, TWinNativeStyledControl);
  if Control <> nil then
    Control.InsertObject(0, FNativeScene);
end;

destructor TWinStyledPresentation.Destroy;
begin
  FNativeScene.Free;
  inherited;
end;

procedure TWinStyledPresentation.Dispatch(var Message);
begin
  if FNativeScene <> nil then
    FNativeScene.Dispatch(Message);
  inherited;
end;

function TWinStyledPresentation.ExtractPoint(var Message: TWMMouse): TPoint;
begin
  Result := TPoint.Create(Message.XPos, Message.YPos);
  ClientToScreen(Handle, Result);
  if Form <> nil then
  begin
    ScreenToClient(WindowHandleToPlatform(Form.Handle).Wnd, Result);
    Result := TPointF.Create(Result.X / FNativeScene.Handle.Scale, Result.Y / FNativeScene.Handle.Scale).Round;
  end;
end;

procedure TWinStyledPresentation.ApplyStyle;
begin
  TOpenStyledControl(Control).ApplyStyle;
end;

procedure TWinStyledPresentation.FreeStyle;
begin
  TOpenStyledControl(Control).FreeStyle;
end;

function TWinStyledPresentation.GetDefaultStyleLookupName: string;
begin
  Result := TStyledControl(Control).DefaultStyleLookupName;
end;

function TWinStyledPresentation.GetParentClassStyleLookupName: string;
begin
  Result := TStyledControl(Control).ParentClassStyleLookupName;
end;

function TWinStyledPresentation.GetResourceLink: TFmxObject;
begin
  if StyledControl <> nil then
    Result := StyledControl.ResourceLink
  else
    Result := nil;
end;

procedure TWinStyledPresentation.Resized;
begin
  inherited;
  if FNativeScene <> nil then
    FNativeScene.SetSize(Size);
end;

function TWinStyledPresentation.GetStyledControl: TWinNativeStyledControl;
begin
  Result := FNativeScene.StyledControl;
end;

class function TWinStyledPresentation.IsParentNative(const Handle: HWnd): Boolean;
begin
  Result := (GetProp(Handle, MakeIntAtom(Atom)) = 0) and (FindWindow(Handle) = nil);
end;

class function TWinStyledPresentation.WindowToObject(Handle: HWND): TFmxObject;
begin
  Result := FindWindow(Handle);
  if (Result = nil) and (GetProp(Handle, MakeIntAtom(Atom)) <> 0) then
    Result := TWinStyledPresentation(GetProp(Handle, MakeIntAtom(Atom))).Control;
end;

procedure TWinStyledPresentation.WMEraseBkgnd(var Message: TWmEraseBkgnd);
begin
  Message.Result := 1;
end;

procedure TWinStyledPresentation.WMPaint(var Message: TWMPaint);
var
  I, RgnStatus: Integer;
  Region: HRgn;
  RegionSize: Integer;
  RegionData: PRgnData;
  R: TRect;
  PS: TPaintStruct;
  DC: HDC;
begin
  Winapi.Windows.GetUpdateRect(Handle, R, False);
  Region := CreateRectRgn(R.Left, R.Top, R.Right, R.Bottom);
  if Region <> 0 then
  try
    RgnStatus := GetUpdateRgn(Handle, Region, False);
    if (RgnStatus = 2) or (RgnStatus = 3) then
    begin
      RegionSize := GetRegionData(Region, $FFFF, nil);
      if RegionSize > 0 then
      begin
        GetMem(RegionData, RegionSize);
        try
          GetRegionData(Region, RegionSize, RegionData);
          for I := 0 to RegionData.rdh.nCount - 1 do
          begin
            R := PRgnRects(@RegionData.buffer[0])[I];
            FNativeScene.UpdateRects.Add(FNativeScene.Handle.WndToForm(TRectF.Create(R.Left, R.Top, R.Right, R.Bottom)));
          end;
        finally
          FreeMem(RegionData, RegionSize);
        end;

        DC := BeginPaint(Handle, PS);
        try
          FNativeScene.Paint(DC);
          BitBlt(PS.hdc, 0, 0, Size.Width, Size.Height, WindowHandleToPlatform(FNativeScene.Handle).BufferHandle,
            0, 0, SRCCOPY);
        finally
          EndPaint(Handle, PS);
        end;
      end;
    end;
  finally
    DeleteObject(Region);
  end;
  inherited;
end;

initialization
  TPresentationProxyFactory.Current.RegisterDefault(TControlType.Platform, TWinPresentationProxy<TWinStyledPresentation>);
finalization
  TPresentationProxyFactory.Current.UnregisterDefault(TControlType.Platform);
end.