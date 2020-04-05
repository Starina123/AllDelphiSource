{*******************************************************}
{                                                       }
{              Delphi FireMonkey Platform               }
{                                                       }
{ Copyright(c) 2018 Embarcadero Technologies, Inc.      }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

unit FMX.Presentation.Android;

interface

{$SCOPEDENUMS ON}

uses
  System.Classes, System.Types, System.Messaging, Androidapi.JNI.GraphicsContentViewText, Androidapi.JNIBridge,
  AndroidApi.JNI.Embarcadero, Androidapi.JNI.Widget, FMX.Types, FMX.Controls.Model, FMX.Presentation.Messages,
  FMX.Controls.Presentation, FMX.Forms, FMX.Controls, FMX.ZOrder.Android;

type

  TAndroidRotationGestureDetector = class;
  TAndroidViewTouchListener = class;
  TAndroidViewDblTapListener = class;
  TAndroidViewGestureListener = class;
  TAndroidViewScaleGestureListener = class;
  TAndroidFocusChangedListener = class;

  /// <summary>Basic Android presentation. It provides positioning, sizing, alignment, supporting touches, order,
  /// clipping and focussing.</summary>
  TAndroidNativeView = class
  private type
    TGestureKind = (LongTap, Pan);
  private
    [Weak] FControl: TControl;
    [Weak] FModel: TDataModel;
    [Weak] FForm: TCommonCustomForm;
    FScreenScale: Single;
    FView: JView;
    FLayout: JViewGroup;
    FChildrenLayout: JViewGroup;
    FSize: TSizeF;
    FVisible: Boolean;
    FFocusChangedListener: TAndroidFocusChangedListener;
    { Gestures }
    FTouchListener: TAndroidViewTouchListener;
    FDblTapListener: TAndroidViewDblTapListener;
    FGestureListener: TAndroidViewGestureListener;
    FScaleGestureListener: TAndroidViewScaleGestureListener;
    FGestureDetector: JGestureDetector;
    FScaleGestureDetector: JScaleGestureDetector;
    FRotationGestureDetector: TAndroidRotationGestureDetector;
    FActiveGestures: set of TGestureKind;
    FActiveGesturesInfo: array [TGestureKind] of TGestureEventInfo;
    function GetObservers: TObservers;
    function GetZOrderManager: TAndroidZOrderManager;
    procedure BeforeDestroyHandleListener(const Sender: TObject; const AMessage: TMessage);
    procedure AfterCreateHandleListener(const Sender: TObject; const AMessage: TMessage);
  protected
    /// <summary>Sets new size and refresh position and size of
    procedure SetSize(const ASize: TSizeF); virtual;
    { Touches }
    function IsActiveGesture(const AKind: TGestureKind): Boolean;
    function FindGesturedControl(const AScreenTouchPoint: TPointF; const AGestureKind: TInteractiveGesture;
      out AGestureObject: IGestureControl): Boolean;
    function ProcessTouch(view: JView; event: JMotionEvent): Boolean; virtual;
    function ProcessLongTap(event: JMotionEvent; const APhase: TInteractiveGestureFlags): Boolean; virtual;
    function ProcessDoubleTap(event: JMotionEvent): Boolean; virtual;
    function ProcessPan(const event: JMotionEvent; const Distance: Integer; const APhase: TInteractiveGestureFlags): Boolean;
    function ProcessScale(const detector: JScaleGestureDetector; const APhase: TInteractiveGestureFlags): Boolean;
    procedure RotationGestureHandler(const AScreenPoint: TPointF; const ADistance: Single; const AAngle: Single);
    { Hit-Testing }
    /// <summary>Returns a Boolean value indicating whether the receiver contains the specified point.</summary>
    function PointInside(const AScreenPoint: TPointF; const AEvent: JMotionEvent): Boolean; virtual;
    procedure UpdateVisible;
  protected
    { Messages from PresentationProxy }
    procedure PMGetNativeObject(var AMessage: TDispatchMessageWithValue<IInterface>); message PM_GET_NATIVE_OBJECT;
    procedure PMSetAbsoluteEnabled(var AMessage: TDispatchMessageWithValue<Boolean>); message PM_SET_ABSOLUTE_ENABLED;
    procedure PMSetVisible(var AMessage: TDispatchMessageWithValue<Boolean>); message PM_SET_VISIBLE;
    procedure PMGetVisible(var AMessage: TDispatchMessageWithValue<Boolean>); message PM_GET_VISIBLE;
    procedure PMSetAlpha(var AMessage: TDispatchMessageWithValue<Single>); message PM_SET_ABSOLUTE_OPACITY;
    procedure PMGetAlpha(var AMessage: TDispatchMessageWithValue<Single>); message PM_GET_ABSOLUTE_OPACITY;
    procedure PMSetSize(var AMessage: TDispatchMessageWithValue<TSizeF>); message PM_SET_SIZE;
    procedure PMGetSize(var AMessage: TDispatchMessageWithValue<TSizeF>); message PM_GET_SIZE;
    procedure PMIsFocused(var AMessage: TDispatchMessageWithValue<Boolean>); message PM_IS_FOCUSED;
    procedure PMDoExit(var AMessage: TDispatchMessage); message PM_DO_EXIT;
    procedure PMDoEnter(var AMessage: TDispatchMessage); message PM_DO_ENTER;
    procedure PMResetFocus(var AMessage: TDispatchMessage); message PM_RESET_FOCUS;
    procedure PMSetClipChildren(var AMessage: TDispatchMessageWithValue<Boolean>); message PM_SET_CLIP_CHILDREN;
    procedure PMAncestorVisibleChanged(var AMessage: TDispatchMessageWithValue<Boolean>); message PM_ANCESSTOR_VISIBLE_CHANGED;
    procedure PMAncestorPresentationLoaded(var AMessage: TDispatchMessageWithValue<Boolean>); message PM_ANCESTOR_PRESENTATION_LOADED;
    procedure PMAncestorPresentationUnloading(var AMessage: TDispatchMessageWithValue<TFmxObject>); message PM_ANCESTOR_PRESENTATION_UNLOADING;
    procedure PMUnload(var AMessage: TDispatchMessage); message PM_UNLOAD;
    procedure PMRefreshParent(var AMessage: TDispatchMessage); message PM_REFRESH_PARENT;
    procedure PMAbsoluteChanged(var AMessage: TDispatchMessage); message PM_ABSOLUTE_CHANGED;
    procedure PMPointInObject(var AMessage: TDispatchMessageWithValue<TPointInObjectLocalInfo>); message PM_POINT_IN_OBJECT_LOCAL;
    /// <summary>This handler reorders the native view by using order of TControl. TPresentedControl sends it when it
    /// changes order in children list of parent control.</summary>
    procedure PMChangeOrder(var AMessage: TDispatchMessage); message PM_CHANGE_ORDER;
    procedure PMRootChanged(var AMessage: TDispatchMessageWithValue<IRoot>); message PM_ROOT_CHANGED;
  protected
    /// <summary>Returns native UIView, which is casted to type |T|</summary>
    /// <remarks>Type T must be compatible with type of native View</remarks>
    function GetView<T: JView>: T; overload;
    /// <summary>Updates size and position of <see cref="FMX.Presentation.Android|TAndroidNativeView.View">View</see> and
    /// <see cref="FMX.Presentation.Android|TAndroidNativeView.ParentView">ParentView</see></summary>
    procedure UpdateFrame;
    /// <summary>Searches and updates ancestor <b>TPresentedControl</b>, which has native presentation. Finds parent
    /// <b>JView</b>. Refreshes visible of native <b>JView</b>.
    /// </summary>
    procedure RefreshNativeParent; virtual;
    /// <summary>Defines a class of model. If ancesstor overrides model class, presentation can check class of model
    /// in moment, when presented control send a model.</summary>
    function DefineModelClass: TDataModelClass; virtual;
    /// <summary>Tries to cast current model to type <c>T</c>. If specified type <c>T</c> is not compatible with
    /// <c>Model</c>, returns nil.</summary>
    function GetModel<T: TDataModel>: T;
    /// <summary>Returns instance of native android control</summary>
    function CreateView: JView; virtual;
      /// <summary>Returns instance of parent layout for native control <c>View</c></summary>
    function CreateLayout: JViewGroup; virtual;
    function CreateChildrenLayout: JViewGroup; virtual;
    /// <summary>Place of initialization of <see cref="FMX.Presentation.Android|TAndroidNativeView.View">View</see></summary>
    procedure InitView; virtual;
  public
    constructor Create; overload; virtual;
    constructor Create(const AModel: TDataModel; const AControl: TControl); overload;
    destructor Destroy; override;
    /// <summary>Returns true if native presentation has ZOrderManager. Form provides ZOrderManager.</summary>
    function HasZOrderManager: Boolean;
    /// <summary>Sets focus of native control, if native control doesn't have a focus</summary>
    procedure SetFocus; virtual;
    /// <summary>Resets focus of native control</summary>
    procedure ResetFocus; virtual;
    /// <summary>The root form, which contains this presentation</summary>
    property Form: TCommonCustomForm read FForm;
    /// <summary>Link to Root form's ZOrderManager</summary>
    property ZOrderManager: TAndroidZOrderManager read GetZOrderManager;
    property Model: TDataModel read FModel;
    property ChildrenLayout: JViewGroup read FChildrenLayout;
  public
    /// <summary>Presented Control</summary>
    property Control: TControl read FControl;
    /// <summary>Observers of current <see cref="FMX.Presentation.Android|TAndroidNativeView.Control">Control</see> for
    /// integration with Live Binding</summary>
    /// <remarks>If <see cref="FMX.Presentation.Android|TAndroidNativeView.Control">Control</see> is not linked with current
    /// presentation, result will be nil</remarks>
    property Observers: TObservers read GetObservers;
    /// <summary>Scale of screen</summary>
    property ScreenScale: Single read FScreenScale;
    /// <summary>Size of <see cref="FMX.Presentation.Android|TAndroidNativeView.Control">Control</see></summary>
    property Size: TSizeF read FSize write SetSize;
    /// <summary>Instance of parent layout, which contains <c>View</c></summary>
    property Layout: JViewGroup read FLayout;
    /// <summary>Instance of native view of current platform presentation</summary>
    property View: JView read FView;
    /// <summary>Visible of <see cref="FMX.Presentation.Android|TAndroidNativeView.Control">Control</see></summary>
    property Visible: Boolean read FVisible;
  end;
  TAndroidNativeViewClass = class of TAndroidNativeView;

  TAndroidBaseViewListener = class(TJavaLocal)
  private
    [Weak] FView: TAndroidNativeView;
  public
    constructor Create(const AView: TAndroidNativeView);
    property Presentation: TAndroidNativeView read FView;
  end;

  TAndroidFocusChangedListener = class(TAndroidBaseViewListener, JView_OnFocusChangeListener)
  public
    { JView_OnFocusChangeListener }
    procedure onFocusChange(view: JView; hasFocus: Boolean); cdecl;
  end;

  TAndroidViewTouchListener = class(TAndroidBaseViewListener, JView_OnTouchListener)
  public
    { JView_OnTouchListener }
    function onTouch(v: JView; event: JMotionEvent): Boolean; cdecl;
  end;

  TAndroidViewDblTapListener = class(TAndroidBaseViewListener, JGestureDetector_OnDoubleTapListener)
  public
    { JGestureDetector_OnDoubleTapListener }
    function onDoubleTap(e: JMotionEvent): Boolean; cdecl;
    function onDoubleTapEvent(e: JMotionEvent): Boolean; cdecl;
    function onSingleTapConfirmed(e: JMotionEvent): Boolean; cdecl;
  end;

  TAndroidViewGestureListener = class(TAndroidBaseViewListener, JGestureDetector_OnGestureListener)
  public
    { JGestureDetector_OnGestureListener }
    function onDown(e: JMotionEvent): Boolean; cdecl;
    function onFling(e1: JMotionEvent; e2: JMotionEvent; velocityX: Single; velocityY: Single): Boolean; cdecl;
    procedure onLongPress(e: JMotionEvent); cdecl;
    function onScroll(e1: JMotionEvent; e2: JMotionEvent; distanceX: Single; distanceY: Single): Boolean; cdecl;
    procedure onShowPress(e: JMotionEvent); cdecl;
    function onSingleTapUp(e: JMotionEvent): Boolean; cdecl;
  end;

  TAndroidViewScaleGestureListener = class(TAndroidBaseViewListener, JScaleGestureDetector_OnScaleGestureListener)
  public
    { JScaleGestureDetector_OnScaleGestureListener }
    function onScale(detector: JScaleGestureDetector): Boolean; cdecl;
    function onScaleBegin(detector: JScaleGestureDetector): Boolean; cdecl;
    procedure onScaleEnd(detector: JScaleGestureDetector); cdecl;
  end;

  TRotationGestureEvent = procedure (const AScreenPoint: TPointF; const ADistance: Single; const AAngle: Single) of object;

  TAndroidRotationGestureDetector = class
  private const
    InvalidPointerID = -1;
  private type
    TTouchPointerKind = (First, Second);
  private
    FCallback: TRotationGestureEvent;
    FPointerID1: Integer;
    FPointerID2: Integer;
    FInitialPoint1: TPointF;
    FInitialPoint2: TPointF;
    FAngle: Single;
    function AngleBetweenLines(const ANewPoint1, ANewPoint2: TPointF): Single;
    function ExtractTouchpoint(const AEvent: JMotionEvent; const AKind: TTouchPointerKind): TPointF;
  public
    constructor Create(const ACallback: TRotationGestureEvent);
    procedure ProcessTouch(v: JView; event: JMotionEvent);
  end;

  /// <summary>Generics proxy for all android native presentations</summary>
  TAndroidPresentationProxy<TPresentation: TAndroidNativeView> = class(TPresentationProxy)
  protected
    function CreateReceiver: TObject; override;
  end;

implementation

uses
  System.SysUtils, System.UITypes, System.Math, Androidapi.Helpers, Androidapi.JNI.JavaTypes, Androidapi.JNI.App,
  FMX.Platform, FMX.Platform.Android, FMX.Helpers.Android, FMX.Presentation.Factory, FMX.Consts;

{ TAndroidPresentationProxy<T> }

function TAndroidPresentationProxy<TPresentation>.CreateReceiver: TObject;
begin
  Result := TPresentation.Create(Model, PresentedControl);
end;

{ TAndroidNativeView }

procedure TAndroidNativeView.AfterCreateHandleListener(const Sender: TObject; const AMessage: TMessage);
begin
  if (AMessage is TAfterCreateFormHandle) and (TAfterCreateFormHandle(AMessage).Value = Form) then
  begin
    ZOrderManager.AddOrSetLink(Control, Layout, ChildrenLayout);
    // It's important to resynch native controls tree only in the end of event loop. Because when we add back native
    // controls to Z-Order manager we add it in a random order. But for correct synchronization we need to do it only,
    // when all native controls were added.
    TThread.ForceQueue(nil, procedure begin
      RefreshNativeParent;
      // Also we should update bounds of controls only after resynchronize native controls tree.
      // Otherwise, we will get the wrong calculation of new positions of native controls.
      TThread.ForceQueue(nil, procedure begin
        UpdateFrame;
      end);
    end);
  end;
end;

procedure TAndroidNativeView.BeforeDestroyHandleListener(const Sender: TObject; const AMessage: TMessage);
begin
  if (AMessage is TBeforeDestroyFormHandle) and (TBeforeDestroyFormHandle(AMessage).Value = Form) then
    ZOrderManager.RemoveLink(Control);
end;

constructor TAndroidNativeView.Create(const AModel: TDataModel; const AControl: TControl);
begin
  FControl := AControl;
  FModel := AModel;
  if FModel is DefineModelClass then
    FModel.Receiver := Self
  else
    raise EPresentationWrongModel.CreateFmt(SWrongModelClassType, [DefineModelClass.ClassName, FModel.ClassName]);

  Create;
  RefreshNativeParent;
end;

function TAndroidNativeView.CreateChildrenLayout: JViewGroup;
var
  LayoutParams: JRelativeLayout_LayoutParams;
begin
  Result := TJRelativeLayout.JavaClass.init(TAndroidHelper.Context);
  LayoutParams := TJRelativeLayout_LayoutParams.JavaClass.init(TJViewGroup_LayoutParams.JavaClass.MATCH_PARENT, TJViewGroup_LayoutParams.JavaClass.MATCH_PARENT);
  FLayout.addView(Result, LayoutParams);
end;

function TAndroidNativeView.CreateLayout: JViewGroup;
begin
  Result := TJRelativeLayout.JavaClass.init(TAndroidHelper.Context)
end;

function TAndroidNativeView.CreateView: JView;
begin
  Result := TJView.JavaClass.init(TAndroidHelper.Activity);
end;

constructor TAndroidNativeView.Create;
var
  LayoutParams: JRelativeLayout_LayoutParams;
  ScreenService: IFMXScreenService;
begin
  inherited;
  FLayout := CreateLayout;
  FView := CreateView;
  FView.setClipToOutline(False);
  if TPlatformServices.Current.SupportsPlatformService(IFMXScreenService, ScreenService) then
    FScreenScale := ScreenService.GetScreenScale
  else
    FScreenScale := 1;

  FFocusChangedListener := TAndroidFocusChangedListener.Create(Self);
  View.setOnFocusChangeListener(FFocusChangedListener);

  { Gestures }
  FTouchListener := TAndroidViewTouchListener.Create(Self);
  View.setOnTouchListener(FTouchListener);
  FDblTapListener := TAndroidViewDblTapListener.Create(Self);
  FGestureListener := TAndroidViewGestureListener.Create(Self);
  FGestureDetector := TJGestureDetector.JavaClass.init(TAndroidHelper.Context, FGestureListener);
  FGestureDetector.setOnDoubleTapListener(FDblTapListener);
  FScaleGestureListener := TAndroidViewScaleGestureListener.Create(Self);
  FScaleGestureDetector := TJScaleGestureDetector.JavaClass.init(TAndroidHelper.Context, FScaleGestureListener);
  FRotationGestureDetector := TAndroidRotationGestureDetector.Create(RotationGestureHandler);

  { Tree view structure }
  LayoutParams := TJRelativeLayout_LayoutParams.JavaClass.init(TJViewGroup_LayoutParams.JavaClass.MATCH_PARENT, TJViewGroup_LayoutParams.JavaClass.MATCH_PARENT);
  FLayout.addView(FView, LayoutParams);

  FChildrenLayout := CreateChildrenLayout;
  FChildrenLayout.setFocusable(False);

  // Ancesstors can override CreateChildrenLayout and return view, if view support ViewGroup for avoid of creating
  // additional ViewGroup layout

  InitView;

  FVisible := True;

  TMessageManager.DefaultManager.SubscribeToMessage(TBeforeDestroyFormHandle, BeforeDestroyHandleListener);
  TMessageManager.DefaultManager.SubscribeToMessage(TAfterCreateFormHandle, AfterCreateHandleListener);
end;

function TAndroidNativeView.DefineModelClass: TDataModelClass;
begin
  Result := TDataModel;
end;

destructor TAndroidNativeView.Destroy;
begin
  TMessageManager.DefaultManager.Unsubscribe(TBeforeDestroyFormHandle, BeforeDestroyHandleListener);
  TMessageManager.DefaultManager.Unsubscribe(TAfterCreateFormHandle, AfterCreateHandleListener);

  if HasZOrderManager then
    ZOrderManager.RemoveLink(Control);
  
  View.setOnTouchListener(nil);
  FreeAndNil(FTouchListener);
  View.setOnFocusChangeListener(nil);
  FreeAndNil(FFocusChangedListener);
  FreeAndNil(FScaleGestureListener);
  FreeAndNil(FRotationGestureDetector);
  FreeAndNil(FGestureListener);
  FreeAndNil(FDblTapListener);
  inherited;
end;

function TAndroidNativeView.FindGesturedControl(const AScreenTouchPoint: TPointF; const AGestureKind: TInteractiveGesture;
  out AGestureObject: IGestureControl): Boolean;
var
  Obj: IControl;
  GestureControl: TComponent;
  LGObj: IGestureControl;
begin
  Obj := Form.ObjectAtPoint(AScreenTouchPoint);
  if Obj <> nil then
    GestureControl := Obj.GetObject
  else
    GestureControl := Form;

  if Supports(GestureControl, IGestureControl, LGObj) then
  begin
    GestureControl := LGObj.GetFirstControlWithGesture(AGestureKind);
    Result := Supports(GestureControl, IGestureControl, AGestureObject);
  end
  else
  begin
    GestureControl := nil;
    Result := False;
  end;
end;

function TAndroidNativeView.GetModel<T>: T;
begin
  Result := FModel as T;
end;

function TAndroidNativeView.GetObservers: TObservers;
begin
  if Control <> nil then
    Result := Control.Observers
  else
    Result := nil;
end;

function TAndroidNativeView.GetView<T>: T;
begin
  Result := T(FView);
end;

function TAndroidNativeView.GetZOrderManager: TAndroidZOrderManager;
begin
  if Form <> nil then
    Result := WindowHandleToPlatform(Form.Handle).ZOrderManager
  else
    Result := nil;
end;

function TAndroidNativeView.HasZOrderManager: Boolean;
begin
  Result := (Form <> nil) and (Form.Handle <> nil);
end;

procedure TAndroidNativeView.InitView;
begin
end;

function TAndroidNativeView.IsActiveGesture(const AKind: TGestureKind): Boolean;
begin
  Result := AKind in FActiveGestures;
end;

procedure TAndroidNativeView.PMAbsoluteChanged(var AMessage: TDispatchMessage);
begin
  UpdateFrame;
end;

procedure TAndroidNativeView.PMAncestorPresentationLoaded(var AMessage: TDispatchMessageWithValue<Boolean>);
begin
  RefreshNativeParent;
end;

procedure TAndroidNativeView.PMAncestorPresentationUnloading(var AMessage: TDispatchMessageWithValue<TFmxObject>);
begin
  RefreshNativeParent;
end;

procedure TAndroidNativeView.PMAncestorVisibleChanged(var AMessage: TDispatchMessageWithValue<Boolean>);
begin
  UpdateVisible;
end;

procedure TAndroidNativeView.PMChangeOrder(var AMessage: TDispatchMessage);
begin
  if ZOrderManager <> nil then
    ZOrderManager.UpdateOrder(Control);
end;

procedure TAndroidNativeView.PMDoEnter(var AMessage: TDispatchMessage);
begin
  SetFocus;
end;

procedure TAndroidNativeView.PMDoExit(var AMessage: TDispatchMessage);
begin
  ResetFocus;
end;

procedure TAndroidNativeView.PMGetAlpha(var AMessage: TDispatchMessageWithValue<Single>);
begin
  AMessage.Value := FView.getAlpha;
end;

procedure TAndroidNativeView.PMGetNativeObject(var AMessage: TDispatchMessageWithValue<IInterface>);
begin
  AMessage.Value := FView;
end;

procedure TAndroidNativeView.PMGetSize(var AMessage: TDispatchMessageWithValue<TSizeF>);
begin
  AMessage.Value := FSize;
end;

procedure TAndroidNativeView.PMGetVisible(var AMessage: TDispatchMessageWithValue<Boolean>);
begin
  AMessage.Value := Layout.getVisibility = TJView.JavaClass.VISIBLE;
end;

procedure TAndroidNativeView.PMIsFocused(var AMessage: TDispatchMessageWithValue<Boolean>);
begin
  AMessage.Value := FView.isFocused;
end;

procedure TAndroidNativeView.PMPointInObject(var AMessage: TDispatchMessageWithValue<TPointInObjectLocalInfo>);
var
  HitTestPoint: TPointF;
begin
  HitTestPoint := AMessage.Value.Point;
  AMessage.Value.Result := Control.LocalRect.Contains(HitTestPoint);
end;

procedure TAndroidNativeView.PMRefreshParent(var AMessage: TDispatchMessage);
begin
  RefreshNativeParent;
end;

procedure TAndroidNativeView.PMResetFocus(var AMessage: TDispatchMessage);
begin
  ResetFocus;
end;

procedure TAndroidNativeView.PMRootChanged(var AMessage: TDispatchMessageWithValue<IRoot>);
begin
  // Changing root for native control means changing ZOrderManager, because one form owns ZOrderManager.
  // So we need to remove itself from old one and add to new one.
  if HasZOrderManager then
    ZOrderManager.RemoveLink(Control);

  if AMessage.Value is TCommonCustomForm then
    FForm := TCommonCustomForm(AMessage.Value)
  else
    FForm := nil;

  if HasZOrderManager then
    ZOrderManager.AddOrSetLink(Control, Layout, ChildrenLayout);
  RefreshNativeParent;
end;

procedure TAndroidNativeView.PMSetAbsoluteEnabled(var AMessage: TDispatchMessageWithValue<Boolean>);
var
  EnabledNew: Boolean;
begin
  EnabledNew := AMessage.Value;
  FView.setEnabled(EnabledNew);
end;

procedure TAndroidNativeView.PMSetAlpha(var AMessage: TDispatchMessageWithValue<Single>);
var
  AlphaNew: Single;
begin
  AlphaNew := AMessage.Value;
  FView.setAlpha(AlphaNew);
end;

procedure TAndroidNativeView.PMSetClipChildren(var AMessage: TDispatchMessageWithValue<Boolean>);
begin
  FLayout.setClipToPadding(Control.ClipChildren);
  FLayout.setClipToOutline(Control.ClipChildren);
  FLayout.setClipChildren(Control.ClipChildren);
  FChildrenLayout.setClipChildren(Control.ClipChildren);
  FChildrenLayout.setClipToOutline(Control.ClipChildren);
  FChildrenLayout.setClipToPadding(Control.ClipChildren);
end;

procedure TAndroidNativeView.PMSetSize(var AMessage: TDispatchMessageWithValue<TSizeF>);
begin
  Size := AMessage.Value;
end;

procedure TAndroidNativeView.PMSetVisible(var AMessage: TDispatchMessageWithValue<Boolean>);
begin
  FVisible := AMessage.Value;
  UpdateVisible;
end;

procedure TAndroidNativeView.PMUnload(var AMessage: TDispatchMessage);
begin
  if HasZOrderManager then
    if csDestroying in Control.ComponentState then
      ZOrderManager.RemoveLinksForControlTree(Control)
    else
      ZOrderManager.RemoveLink(Control);
end;

function TAndroidNativeView.PointInside(const AScreenPoint: TPointF; const AEvent: JMotionEvent): Boolean;
begin
  Result := True;
end;

function TAndroidNativeView.ProcessDoubleTap(event: JMotionEvent): Boolean;
var
  EventInfo: TGestureEventInfo;
  LGObj: IGestureControl;
  ScreenTouchPoint: TPointF;
begin
  ScreenTouchPoint := TPointF.Create(event.getX / ScreenScale, event.getY / ScreenScale);

  if FindGesturedControl(ScreenTouchPoint, TInteractiveGesture.DoubleTap, LGObj) then
  begin
    EventInfo.Location := ScreenTouchPoint;
    EventInfo.GestureID := igiDoubleTap;
    LGObj.CMGesture(EventInfo);
  end;
  Result := LGObj <> nil;
end;

function TAndroidNativeView.ProcessLongTap(event: JMotionEvent; const APhase: TInteractiveGestureFlags): Boolean;
var
  EventInfo: TGestureEventInfo;
  LGObj: IGestureControl;
  ScreenTouchPoint: TPointF;
begin
  if TInteractiveGestureFlag.gfBegin in APhase then
    Include(FActiveGestures, TGestureKind.LongTap)
  else if TInteractiveGestureFlag.gfEnd in APhase then
    Exclude(FActiveGestures, TGestureKind.LongTap);

  ScreenTouchPoint := TPointF.Create(event.getRawX / ScreenScale, event.getRawY / ScreenScale);
  if FindGesturedControl(ScreenTouchPoint, TInteractiveGesture.LongTap, LGObj) then
  begin
    EventInfo.Location := ScreenTouchPoint;
    EventInfo.GestureID := igiLongTap;
    EventInfo.Flags := APhase;
    FActiveGesturesInfo[TGestureKind.LongTap] := EventInfo;
    LGObj.CMGesture(EventInfo);
  end;
  Result := LGObj <> nil;
end;

function TAndroidNativeView.ProcessPan(const event: JMotionEvent; const Distance: Integer;
  const APhase: TInteractiveGestureFlags): Boolean;
var
  LGObj: IGestureControl;
  ScreenTouchPoint: TPointF;
  EventInfo: TGestureEventInfo;
begin
  if TInteractiveGestureFlag.gfBegin in APhase then
    Include(FActiveGestures, TGestureKind.Pan)
  else if TInteractiveGestureFlag.gfEnd in APhase then
    Exclude(FActiveGestures, TGestureKind.Pan);

  ScreenTouchPoint := TPointF.Create(event.getRawX / ScreenScale, event.getRawY / ScreenScale);
  if FindGesturedControl(ScreenTouchPoint, TInteractiveGesture.Pan, LGObj) then
  begin
    EventInfo.Distance := Distance;
    EventInfo.Location := ScreenTouchPoint;
    EventInfo.GestureID := igiPan;
    EventInfo.Flags := APhase;
    LGObj.CMGesture(EventInfo);
  end;
  Result := LGObj <> nil;
end;

function TAndroidNativeView.ProcessScale(const detector: JScaleGestureDetector;
  const APhase: TInteractiveGestureFlags): Boolean;
var
  LGObj: IGestureControl;
  ScreenTouchPoint: TPointF;
  EventInfo: TGestureEventInfo;
begin
  ScreenTouchPoint := TPointF.Create(detector.getFocusX / ScreenScale, detector.getFocusY / ScreenScale);
  if FindGesturedControl(ScreenTouchPoint, TInteractiveGesture.Zoom, LGObj) then
  begin
    EventInfo.Distance := Round(detector.getCurrentSpan / ScreenScale);
    EventInfo.Location := ScreenTouchPoint;
    EventInfo.GestureID := igiZoom;
    EventInfo.Flags := APhase;
    LGObj.CMGesture(EventInfo);
  end;
  Result := LGObj <> nil;
end;

function TAndroidNativeView.ProcessTouch(view: JView; event: JMotionEvent): Boolean;

  // Some kinds of android gestures don't notify about finishing them, but we use final stage of gestures in fmx.
  // So we emulate it.
  procedure FinishActiveGestures;
  var
    Distance: Integer;
  begin
    if TGestureKind.Pan in FActiveGestures then
    begin
      Distance := FActiveGesturesInfo[TGestureKind.Pan].Distance;
      ProcessPan(event, Distance, [TInteractiveGestureFlag.gfEnd]);
    end;
    if TGestureKind.LongTap in FActiveGestures then
      ProcessLongTap(event, [TInteractiveGestureFlag.gfEnd]);
  end;

  procedure ProcessMoveActiveGestures;
  begin
    if TGestureKind.LongTap in FActiveGestures then
      ProcessLongTap(event, []);
  end;

var
  TouchPoint: TPointF;
  EventAction: Integer;
begin
  TouchPoint := TPointF.Create(event.getRawX / ScreenScale, event.getRawY / ScreenScale);
  TouchPoint := Form.ScreenToClient(TouchPoint);

  if not PointInside(TouchPoint, event) then
    Exit(False);

  // Transfer touch point into gestures recognizers
  FGestureDetector.onTouchEvent(event);
  FScaleGestureDetector.onTouchEvent(event);
  FRotationGestureDetector.ProcessTouch(view, event);

  // Performs mouse events
  if (Form <> nil) and Control.HitTest then
  begin
    EventAction := event.getAction;
    if EventAction = TJMotionEvent.JavaClass.ACTION_DOWN then
    begin
      Form.MouseMove([ssTouch], TouchPoint.X, TouchPoint.Y);
      Form.MouseMove([], TouchPoint.X, TouchPoint.Y); // Require for correct IsMouseOver handle
      Form.MouseDown(TMouseButton.mbLeft, [ssLeft, ssTouch], TouchPoint.x, TouchPoint.y);
    end
    else if EventAction = TJMotionEvent.JavaClass.ACTION_MOVE then
    begin
      ProcessMoveActiveGestures;
      Form.MouseMove([ssLeft, ssTouch], TouchPoint.x, TouchPoint.y)
    end
    else if EventAction = TJMotionEvent.JavaClass.ACTION_CANCEL then
    begin
      FinishActiveGestures;
      Form.MouseUp(TMouseButton.mbLeft, [ssLeft, ssTouch], TouchPoint.x, TouchPoint.y, False);
      // In MouseUp the form can unload presentation!
      if Form <> nil then
        Form.MouseLeave;
    end
    else if EventAction = TJMotionEvent.JavaClass.ACTION_UP then
    begin
      FinishActiveGestures;
      Form.MouseUp(TMouseButton.mbLeft, [ssLeft, ssTouch], TouchPoint.x, TouchPoint.y);
      // In MouseUp the form can unload presentation!
      if Form <> nil then
        Form.MouseLeave;
    end;
    Result := True;
  end
  else
    Result := False;
end;

procedure TAndroidNativeView.RefreshNativeParent;
begin
  if HasZOrderManager then
    ZOrderManager.UpdateOrderAndBounds(Control);
end;

procedure TAndroidNativeView.ResetFocus;
begin
  FView.clearFocus;
end;

procedure TAndroidNativeView.RotationGestureHandler(const AScreenPoint: TPointF; const ADistance: Single; const AAngle: Single);
var
  GestureControl: IGestureControl;
  EventInfo: TGestureEventInfo;
begin
  if FindGesturedControl(AScreenPoint / ScreenScale, TInteractiveGesture.Rotate, GestureControl) then
  begin
    EventInfo.Distance := Round(ADistance / ScreenScale);
    EventInfo.Location := AScreenPoint / ScreenScale;
    EventInfo.Angle := AAngle;
    EventInfo.GestureID := igiRotate;
    EventInfo.Flags := [];
    GestureControl.CMGesture(EventInfo);
  end;
end;

procedure TAndroidNativeView.SetFocus;
begin
  FView.requestFocus;
end;

procedure TAndroidNativeView.SetSize(const ASize: TSizeF);
begin
  FSize := ASize;
  UpdateFrame;
end;

procedure TAndroidNativeView.UpdateFrame;
begin
  if ZOrderManager <> nil then
    ZOrderManager.UpdateOrderAndBounds(Control);
end;

procedure TAndroidNativeView.UpdateVisible;
begin
  if not Visible or not Control.ParentedVisible then
    Layout.setVisibility(TJView.JavaClass.GONE)
  else if ZOrderManager = nil then
    Layout.setVisibility(TJView.JavaClass.VISIBLE)
  else
    ZOrderManager.UpdateOrderAndBounds(Control);
end;

{ TAndroidBaseViewListener }

constructor TAndroidBaseViewListener.Create(const AView: TAndroidNativeView);
begin
  if AView = nil then
    raise EArgumentNilException.CreateFmt(SWrongParameter, ['AView']);

  inherited Create;
  FView := AView;
end;

{ TAndroidViewTouchListener }

function TAndroidViewTouchListener.onTouch(v: JView; event: JMotionEvent): Boolean;
begin
  Result := FView.ProcessTouch(v, Event);
end;

{ TAndroidViewDblTapListener }

function TAndroidViewDblTapListener.onDoubleTap(e: JMotionEvent): Boolean;
begin
  Result := FView.ProcessDoubleTap(e);
end;

function TAndroidViewDblTapListener.onDoubleTapEvent(e: JMotionEvent): Boolean;
begin
  Result := True;
end;

function TAndroidViewDblTapListener.onSingleTapConfirmed(e: JMotionEvent): Boolean;
begin
  Result := True;
end;

{ TAndroidViewGestureListener }

function TAndroidViewGestureListener.onDown(e: JMotionEvent): Boolean;
begin
  Result := True;
end;

function TAndroidViewGestureListener.onFling(e1, e2: JMotionEvent; velocityX, velocityY: Single): Boolean;
begin
  Result := True;
end;

procedure TAndroidViewGestureListener.onLongPress(e: JMotionEvent);
begin
  if not Presentation.IsActiveGesture(TAndroidNativeView.TGestureKind.LongTap) then
    Presentation.ProcessLongTap(e, [TInteractiveGestureFlag.gfBegin]);

  Presentation.ProcessLongTap(e, []);
end;

function TAndroidViewGestureListener.onScroll(e1, e2: JMotionEvent; distanceX, distanceY: Single): Boolean;
var
  Distance: Integer;
begin
  Distance := Round(Sqrt(Sqr(distanceX) + Sqr(distanceY)));

  // As Google said Scrolling begins from first TouchDown event, but we need to be sure, that Scrolling began, so
  // we make first phase in this place
  if not Presentation.IsActiveGesture(TAndroidNativeView.TGestureKind.Pan) then
    // Begin phase
    Presentation.ProcessPan(e1, Distance, [TInteractiveGestureFlag.gfBegin]);

  // Move Phase
  Result := Presentation.ProcessPan(e2, Distance, []);
end;

procedure TAndroidViewGestureListener.onShowPress(e: JMotionEvent);
begin
end;

function TAndroidViewGestureListener.onSingleTapUp(e: JMotionEvent): Boolean;
begin
  Result := True;
end;

{ TAndroidRotationGestureDetector }

function TAndroidRotationGestureDetector.AngleBetweenLines(const ANewPoint1, ANewPoint2: TPointF): Single;
var
  Angle1: Single;
  Angle2: Single;
  Angle: Single;
begin
  Angle1 := FInitialPoint1.Angle(FInitialPoint2);
  Angle2 := ANewPoint1.Angle(ANewPoint2);
  Angle := 0;
  if Min(2 * Pi - Abs(Angle1 - Angle2), Abs(Angle1 - Angle2)) >= 0.01 then
  begin
    // make rotation value counterclockwise and cumulative
    Angle := Angle2 - Angle1;
    // Keep rotation angle between -2Pi and 2Pi
    if Angle > 2 * Pi then
      Angle := Angle - 2 * Pi
    else if Angle < -2 * Pi then
      Angle := Angle + 2 * Pi
  end;

  Result := -Angle;
end;

constructor TAndroidRotationGestureDetector.Create(const ACallback: TRotationGestureEvent);
begin
  FPointerID1 := InvalidPointerID;
  FPointerID2 := InvalidPointerID;
  FCallback := ACallback;
end;

function TAndroidRotationGestureDetector.ExtractTouchpoint(const AEvent: JMotionEvent; const AKind: TTouchPointerKind): TPointF;
var
  Index: Integer;
begin
  case AKind of
    TAndroidRotationGestureDetector.TTouchPointerKind.First:
      Index := AEvent.findPointerIndex(FPointerID1);
    TAndroidRotationGestureDetector.TTouchPointerKind.Second:
      Index := AEvent.findPointerIndex(FPointerID2);
  end;

  Result := TPointF.Create(AEvent.getX(Index), AEvent.getY(Index));
end;

procedure TAndroidRotationGestureDetector.ProcessTouch(v: JView; event: JMotionEvent);
var
  ActionMasked: Integer;
  NewTouchPoint1: TPointF;
  NewTouchPoint2: TPointF;
  MidPoint: TPointF;
  Distance: Single;
begin
  ActionMasked := event.getActionMasked;
  if ActionMasked = TJMotionEvent.JavaClass.ACTION_DOWN then
    FPointerID1 := event.getPointerId(event.getActionIndex)
  else if ActionMasked = TJMotionEvent.JavaClass.ACTION_POINTER_DOWN then
  begin
    FPointerID2 := event.getPointerId(event.getActionIndex);
    FInitialPoint1 := ExtractTouchpoint(event, TTouchPointerKind.First);
    FInitialPoint2 := ExtractTouchpoint(event, TTouchPointerKind.Second);
  end
  else if (ActionMasked = TJMotionEvent.JavaClass.ACTION_MOVE) and (FPointerID1 <> InvalidPointerID)
    and (FPointerID2 <> InvalidPointerID) then
  begin
    NewTouchPoint1 := ExtractTouchpoint(event, TTouchPointerKind.Second);
    NewTouchPoint2 := ExtractTouchpoint(event, TTouchPointerKind.First);

    FAngle := AngleBetweenLines(NewTouchPoint1, NewTouchPoint2);
    if Assigned(FCallback) then
    begin
      MidPoint := NewTouchPoint1.MidPoint(NewTouchPoint2);
      Distance := NewTouchPoint1.Distance(NewTouchPoint2);
      FCallback(MidPoint, Distance, FAngle);
    end;
  end
  else if ActionMasked = TJMotionEvent.JavaClass.ACTION_UP then
    FPointerID1 := InvalidPointerID
  else if ActionMasked = TJMotionEvent.JavaClass.ACTION_POINTER_UP then
    FPointerID2 := InvalidPointerID
  else if ActionMasked = TJMotionEvent.JavaClass.ACTION_CANCEL then
  begin
    FPointerID1 := InvalidPointerID;
    FPointerID2 := InvalidPointerID;
  end;
end;

{ TAndroidViewScaleGestureListener }

function TAndroidViewScaleGestureListener.onScale(detector: JScaleGestureDetector): Boolean;
begin
  Result := Presentation.ProcessScale(detector, []);
end;

function TAndroidViewScaleGestureListener.onScaleBegin(detector: JScaleGestureDetector): Boolean;
begin
  Result := Presentation.ProcessScale(detector, [TInteractiveGestureFlag.gfBegin]);
end;

procedure TAndroidViewScaleGestureListener.onScaleEnd(detector: JScaleGestureDetector);
begin
  Presentation.ProcessScale(detector, [TInteractiveGestureFlag.gfEnd]);
end;

{ TAndroidFocusChangedListener }

procedure TAndroidFocusChangedListener.onFocusChange(view: JView; hasFocus: Boolean);
begin
  // Since view can get focus without us, we synchronize native focus and fmx focus. For example, when user makes a tap
  // on Input control, control request focus itself and we can get the situation with two focused controls native and
  // styled Edit.
  if hasFocus and not Presentation.Control.IsFocused then
    Presentation.Control.SetFocus
  else if not hasFocus and Presentation.Control.IsFocused then
    Presentation.Control.ResetFocus;
end;

end.
