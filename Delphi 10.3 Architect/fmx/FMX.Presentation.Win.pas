{*******************************************************}
{                                                       }
{              Delphi FireMonkey Platform               }
{                                                       }
{ Copyright(c) 2015-2018 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

unit FMX.Presentation.Win;

interface

{$SCOPEDENUMS ON}

uses
  System.Types, System.Classes, System.Messaging, WinApi.Windows, Winapi.Messages, FMX.Types, FMX.Forms, FMX.Controls,
  FMX.Controls.Presentation, FMX.Controls.Win, FMX.Controls.Model, FMX.Graphics, FMX.Presentation.Messages,
  FMX.Zorder.Win, FMX.Helpers.Win;

type

  { TWinView }

  TWinView = class(TComponent)
  private class var
    FCreationControl: TWinView;
    FContainerHandle: HWnd;
    class function GetContainerHandle: HWnd; static;
    class procedure CreateContainerHandle;
    class procedure DestroyContainerHandle;
    class destructor DestroyClass;
  private
    FDefWndProc: Pointer;
    FHandle: HWND;
    FObjectInstance: Pointer;
    procedure SetParentWindow(const Value: HWND);
    function GetParentWindow: HWND;
    procedure WndProc(var Message: TMessage);
    procedure WMDestroy(var Message: TWMDestroy); message WM_DESTROY;
    procedure WMWindowPosChanged(var Message: TWMWindowPosChanged); message WM_WINDOWPOSCHANGED;
    function GetSize: TSize;
    function GetHandle: HWND;
    function GetScale: Single;
  protected
    class property ContainerHandle: HWnd read GetContainerHandle;
    /// <summary>Constant for a zero handle </summary>
    const NullHWnd = 0;
    /// <summary>Create native Handle for control </summary>
    procedure CreateHandle; virtual;
    /// <summary>Fill the structure using default parameters </summary>
    procedure CreateParams(var Params: TCreateParams); virtual;
    /// <summary>Used to create Windows's subslassed control</summary>
    procedure CreateSubClass(var Params: TCreateParams; ControlClassName: PChar);
    /// <summary>Destroy the window handle</summary>
    procedure DestroyHandle; virtual;
    /// <summary>Pointer to default WndProc </summary>
    property DefWndProc: Pointer read FDefWndProc;
    /// <summary>Called when control resized</summary>
    procedure Resized; virtual;
  public
    constructor Create(AOwner: TComponent); overload; override;
    destructor Destroy; override;
    procedure DefaultHandler(var Message); override;
    procedure RecreateWnd;
    function HandleAllocated: Boolean; inline;
    property Handle: HWND read GetHandle;
    property Size: TSize read GetSize;
    property Scale: Single read GetScale;
    property ParentWindow: HWND read GetParentWindow write SetParentWindow;
  end;

{ TWinPresentation }

  TWinPresentation = class(TWinView)
  private type
    TInterfacedHandle = class(TInterfacedObject)
    private
      [Weak] FView: TWinPresentation;
    public
      constructor Create(const AView: TWinPresentation);
      property View: TWinPresentation read FView;
    end;
  private
    [Weak] FControl: TControl;
    [Weak] FModel: TDataModel;
    [Weak] FForm: TCommonCustomForm;
    FInterfacedHandle: TInterfacedHandle;
    FIsParentNativeForm: Boolean;
    FControlSize: TSizeF;
    function GetZOrderManager: TWinZOrderManager;
    { Listeners of messages from System.Messaging }
    procedure BeforeDestroyMessageListener(const Sender: TObject; const AMessage: System.Messaging.TMessage);
    procedure AfterCreateMessageListener(const Sender: TObject; const AMessage: System.Messaging.TMessage);
  protected
    procedure CreateParams(var Params: TCreateParams); override;
    function ExtractPoint(var Message: TWMMouse): TPoint; virtual;
    /// <summary>Sets text and background colors of the control</summary>
    /// <returns>Handle to a brush for edit control</returns>
    /// <param name="DC">Handle to the device context for the control window</param>
    /// <param name="Disabled">
    ///   Indicates disbaled state of the control. True for the disabled control color,
    ///   False - for the enabled.
    /// </param>
    function SetControlTextColor(const DC: HDC; const Disabled: Boolean): NativeInt; virtual;
    property ControlSize: TSizeF read FControlSize;
  protected
    { Messages from PresentationProxy }
    procedure PMGetNativeObject(var AMessage: TDispatchMessageWithValue<IInterface>); message PM_GET_NATIVE_OBJECT;
    procedure PMRootChanged(var AMessage: TDispatchMessageWithValue<IRoot>); message PM_ROOT_CHANGED;
    procedure PMAncestorPresentationLoaded(var AMessage: TDispatchMessageWithValue<Boolean>); message PM_ANCESTOR_PRESENTATION_LOADED;
    procedure PMAncestorPresentationUnloading(var AMessage: TDispatchMessageWithValue<TControl>); message PM_ANCESTOR_PRESENTATION_UNLOADING;
    procedure PMUnload(var AMessage: TDispatchMessage); message PM_UNLOAD;
    procedure PMRefreshParent(var AMessage: TDispatchMessage); message PM_REFRESH_PARENT;
    procedure PMChangeOrder(var AMessage: TDispatchMessage); message PM_CHANGE_ORDER;
    procedure PMAbsoluteChanged(var AMessage: TDispatchMessage); message PM_ABSOLUTE_CHANGED;
    procedure PMSetSize(var AMessage: TDispatchMessageWithValue<TSizeF>); message PM_SET_SIZE;
    procedure PMGetSize(var AMessage: TDispatchMessageWithValue<TSizeF>); message PM_GET_SIZE;
    procedure PMSetVisible(var AMessage: TDispatchMessageWithValue<Boolean>); message PM_SET_VISIBLE;
    procedure PMGetVisible(var AMessage: TDispatchMessageWithValue<Boolean>); message PM_GET_VISIBLE;
    procedure PMAncesstorVisibleChanged(var AMessage: TDispatchMessageWithValue<Boolean>); message PM_ANCESSTOR_VISIBLE_CHANGED;
    procedure PMSetAbsoluteEnabled(var AMessage: TDispatchMessageWithValue<Boolean>); message PM_SET_ABSOLUTE_ENABLED;
    procedure PMGetAbsoluteEnabled(var AMessage: TDispatchMessageWithValue<Boolean>); message PM_GET_ABSOLUTE_ENABLED;
    procedure PMDoExit(var AMessage: TDispatchMessage); message PM_DO_EXIT;
    procedure PMDoEnter(var AMessage: TDispatchMessage); message PM_DO_ENTER;
    procedure PMResetFocus(var AMessage: TDispatchMessage); message PM_RESET_FOCUS;
    { Windows messages }
    procedure WMSetFocus(var Message: TWMSetFocus); message WM_SETFOCUS;
    procedure WMKillFocus(var Message: TWMKillFocus); message WM_KILLFOCUS;
    procedure WMKeyDown(var Message: TWMKeyDown); message WM_KEYDOWN;
    procedure WMKeyUp(var Message: TWMKeyUp); message WM_KEYUP;
    procedure WMLButtonDown(var Message: TWMLButtonDown); message WM_LBUTTONDOWN;
    procedure WMRButtonDown(var Message: TWMLButtonDown); message WM_RBUTTONDOWN;
    procedure WMMouseMove(var Message: TWMMouseMove); message WM_MOUSEMOVE;
    procedure WMLButtonUp(var Message: TWMLButtonUp); message WM_LBUTTONUP;
    procedure WMRButtonUp(var Message: TWMLButtonUp); message WM_RBUTTONUP;
    procedure WMLButtonDblClick(var Message: TWMLButtonDblClk); message WM_LBUTTONDBLCLK;
    procedure WMRButtonDblClick(var Message: TWMRButtonDblClk); message WM_RBUTTONDBLCLK;
    procedure WMMButtonDblClick(var Message: TWMMButtonDblClk); message WM_MBUTTONDBLCLK;
    { Overriden windows messages from the parent window}
    /// <summary>Message when control is about to be drawn to set text and background colors</summary>
    procedure WMTextColor(var Message: TMessage); message CN_CTLCOLOREDIT;
    /// <summary>Message when disabled control is about to be drawn to set text and background colors</summary>
    procedure WMDisabledTextColor(var Message: TMessage); message CN_CTLCOLORSTATIC;
  protected
    /// <summary>Searches ancestor TPresentedControl, which has native Win presentation </summary>
    /// <param name="APlatformControl">Will contains ancestor TPresentedControl, if it was found</param>
    /// <returns>Result of searching: True - found, False - not found</returns>
    function FindAncestorPresentedControl(out APlatformControl: TControl): Boolean; virtual; deprecated 'Use ZOrderManager.FindParentNativeControl instead.';
    /// <summary>Defines a class of model. If ancestors overrides model class, presentation can check class of model
    /// in moment, when presented control send a model.</summary>
    function DefineModelClass: TDataModelClass; virtual;
    procedure CreateHandle; override;
    procedure DestroyHandle; override;
  public
    constructor Create(AOwner: TComponent); overload; override;
    constructor Create(AOwner: TComponent; const AModel: TDataModel; const AControl: TControl); overload; virtual;
    destructor Destroy; override;
    /// <summary>Returns true if native presentation has ZOrderManager. Form provides ZOrderManager.</summary>
    function HasZOrderManager: Boolean;
    /// <summary>
    /// Link to Root form's ZOrderManager
    /// </summary>
    property ZOrderManager: TWinZOrderManager read GetZOrderManager;
    /// <summary>
    /// Returns True if native control links with FMX control. Returns False otherwise.
    /// </summary>
    function HasControl: Boolean; deprecated 'Native presentation guarantees the availability of the Control during the presentation''s lifetime.';
    /// <summary>
    /// Sets focus of native control, if native control doesn't have a focus
    /// </summary>
    procedure SetFocus; virtual;
    /// <summary>
    /// Resets focus of native control
    /// </summary>
    procedure ResetFocus; virtual;
    /// <summary>
    /// Returns true if the window has a focus
    /// </summary>
    function IsFocused: Boolean;
    /// <summary>Updates position and size of native control and refresh parent of handling window </summary>
    procedure UpdateOrderAndBounds;
  public
    /// <summary>
    /// Presented Control
    /// </summary>
    property Control: TControl read FControl;
    /// <summary>Model of native presentation.</summary>
    property Model: TDataModel read FModel;
    /// <summary>
    /// <summary>
    /// Parent control is control of form?
    /// </summary>
    property IsParentNativeForm: Boolean read FIsParentNativeForm;
    /// <summary>
    /// The root form, which contains this presentation
    /// </summary>
    property Form: TCommonCustomForm read FForm;
  end;
  TWinPresentationClass = class of TWinPresentation;

  /// <summary>Generics proxy for all styled presentations</summary>
  TWinPresentationProxy<TPresentation: TWinPresentation> = class(TPresentationProxy)
  protected
    function CreateReceiver: TObject; override;
  end;

implementation

uses
  System.SysUtils, System.UITypes, FMX.Platform.Win, FMX.Consts;

function InitWndProc(HWindow: HWND; Msg: UINT; WParam: WParam; LParam: LParam): LRESULT; stdcall;
{$IFDEF WIN64}
type
  TThunkProc = function(HWindow: HWND; Message: Longint; WParam: Winapi.Windows.WParam; LParam: Winapi.Windows.LParam):
    LRESULT; stdcall;
var
  WinControl: TWinView;
{$ENDIF}
begin
  TWinView.FCreationControl.FHandle := HWindow;
  SetWindowLongW(HWindow, GWL_WNDPROC, IntPtr(TWinView.FCreationControl.FObjectInstance));
  if (GetWindowLongW(HWindow, GWL_STYLE) and WS_CHILD <> 0) and (GetWindowLongW(HWindow, GWL_ID) = 0) then
    SetWindowLongW(HWindow, GWL_ID, HWindow);
{$IFDEF WIN32}
  asm
    PUSH    LParam
    PUSH    WParam
    PUSH    Msg
    PUSH    HWindow
    MOV     EAX,TWinView.FCreationControl
    MOV     TWinView.FCreationControl,0
    CALL    [EAX].TWinView.FObjectInstance
    MOV     Result,EAX
  end;
{$ENDIF}
{$IFDEF WIN64}
  WinControl := TWinView.FCreationControl;
  TWinView.FCreationControl := nil;
  Result := TThunkProc(WinControl.FObjectInstance)(HWindow, Msg, WParam, LParam);
{$ENDIF}
end;

{ TWinView }

constructor TWinView.Create(AOwner: TComponent);
begin
  inherited;
  FObjectInstance := MakeObjectInstance(WndProc);
end;

destructor TWinView.Destroy;
begin
  DestroyHandle;
  FreeObjectInstance(FObjectInstance);
  inherited Destroy;
end;

class destructor TWinView.DestroyClass;
begin
  DestroyContainerHandle;
end;

procedure TWinView.WMDestroy(var Message: TWMDestroy);
begin
  inherited;
  FHandle := NullHWnd;
  FDefWndProc := nil;
end;

procedure TWinView.WMWindowPosChanged(var Message: TWMWindowPosChanged);
begin
  inherited;
  if (Message.WindowPos.flags and SWP_NOSIZE = 0) then
    Resized;
end;

procedure TWinView.DefaultHandler(var Message);
begin
  if (FHandle <> NullHWnd) and (TMessage(Message).Msg < PM_BASE) then
  begin
    TMessage(Message).Result := CallWindowProc(FDefWndProc, FHandle, TMessage(Message).Msg, TMessage(Message).WParam,
      TMessage(Message).LParam)
  end
  else
    inherited DefaultHandler(Message);
end;

procedure TWinView.WndProc(var Message: TMessage);
begin
  try
    Dispatch(Message);
  except
    Application.HandleException(Self);
  end;
end;

{$IFDEF WIN64}
var
  UserLibrary: THandle;
{$ENDIF  }

procedure TWinView.CreateParams(var Params: TCreateParams);
begin
  FillChar(Params, SizeOf(Params), 0);
  Params.Style := WS_CHILD or WS_CLIPSIBLINGS or WS_CLIPCHILDREN or WS_VISIBLE;

  Params.ExStyle := Params.ExStyle or WS_EX_CONTROLPARENT;
  Params.X := 0;
  Params.Y := 0;
  Params.Width := 0;
  Params.Height := 0;

  Params.WndParent := ParentWindow;
  Params.WindowClass.Style := CS_VREDRAW + CS_HREDRAW + CS_DBLCLKS;
  Params.WindowClass.hCursor := LoadCursor(0, IDC_ARROW);
  Params.WindowClass.hbrBackground := 0;
  Params.WindowClass.hInstance := hInstance;
{$IFDEF WIN64}
  if UserLibrary = 0 then
    UserLibrary := LoadLibrary('User32.dll');
  Params.WindowClass.lpfnWndProc := GetProcAddress(UserLibrary, 'DefWindowProcW');
{$ELSE}
  Params.WindowClass.lpfnWndProc := @DefWindowProc;
{$ENDIF}
  StrPCopy(Params.WinClassName, ClassName);
end;

procedure TWinView.CreateSubClass(var Params: TCreateParams; ControlClassName: PChar);
const
  CS_OFF = CS_OWNDC or CS_CLASSDC or CS_PARENTDC or CS_GLOBALCLASS;
  CS_ON = CS_VREDRAW or CS_HREDRAW;
var
  SaveInstance: HINST;
begin
  if ControlClassName <> nil then
    with Params do
    begin
      {We need to save the hInstance, because GetClassInfo changes it
       and the hInstance must be correct later when we check whether the
       class is already registered}

      SaveInstance := WindowClass.hInstance;
      if not GetClassInfo(HInstance, ControlClassName, WindowClass) and
        not GetClassInfo(MainInstance, ControlClassName, WindowClass) and
        not GetClassInfo(0, ControlClassName, WindowClass) then
        GetClassInfo(WindowClass.hInstance, ControlClassName, WindowClass);

      WindowClass.hInstance := SaveInstance;
      WindowClass.style := WindowClass.style and not CS_OFF or CS_ON;
    end;
end;

procedure TWinView.CreateHandle;
var
  Params: TCreateParams;
  ClassRegistered: Boolean;
  TempClass: TWndClass;
begin
  if FHandle = NullHWnd then
  begin
    CreateParams(Params);
    with Params do
    begin
      if (WndParent = NullHWnd) and (Style and WS_CHILD <> 0) then
        WndParent := ContainerHandle
      else
        if GetWindowLong(WndParent, GWL_EXSTYLE) or WS_EX_LAYERED <> 0 then
          WndParent := ContainerHandle;

      FDefWndProc := WindowClass.lpfnWndProc;
      ClassRegistered := GetClassInfo(WindowClass.hInstance, WinClassName, TempClass);
      if not ClassRegistered or (TempClass.lpfnWndProc <> @InitWndProc) then
      begin
        if ClassRegistered then
          Winapi.Windows.UnregisterClass(WinClassName, WindowClass.hInstance);
        WindowClass.lpfnWndProc := @InitWndProc;
        WindowClass.lpszClassName := WinClassName;
        if Winapi.Windows.RegisterClass(WindowClass) = 0 then
          RaiseLastOSError;
      end;
      FCreationControl := Self;
      FHandle := CreateWindowEx(ExStyle, WinClassName, Caption, Style, X, Y, Width, Height, WndParent, 0,
        WindowClass.hInstance, Param);
    end;
    if FHandle = NullHWnd then
      RaiseLastOSError;
    if (GetWindowLong(FHandle, GWL_STYLE) and WS_CHILD <> 0) and (GetWindowLong(FHandle, GWL_ID) = 0) then
      SetWindowLong(FHandle, GWL_ID, FHandle);
  end;
end;

procedure TWinView.DestroyHandle;
begin
  if FHandle <> NullHWnd then
  try
    if not Winapi.Windows.DestroyWindow(FHandle) then
      RaiseLastOSError;
  finally
    FHandle := NullHWnd;
    FDefWndProc := nil;
  end;
end;

procedure TWinView.RecreateWnd;
begin
  // to-do recreate all children
  if FHandle <> NullHWnd then
  begin
    DestroyHandle;
    CreateHandle;
  end;
end;

class procedure TWinView.CreateContainerHandle;
const
  FMContainerClass = 'FMContainer';
var
  WindowClass: TWndClass;
begin
  if FContainerHandle = NullHWnd then
  begin
    FillChar(WindowClass, SizeOf(WindowClass), 0);
    WindowClass.lpszClassName := FMContainerClass;
    WindowClass.lpfnWndProc := @DefWindowProc;
    WindowClass.hInstance := HInstance;
    if Winapi.Windows.RegisterClass(WindowClass) = 0 then
      RaiseLastOSError;

    FContainerHandle := CreateWindowEx(WS_EX_TOOLWINDOW, WindowClass.lpszClassName, nil, WS_POPUP or WS_CAPTION or
      WS_CLIPSIBLINGS or WS_SYSMENU or WS_MINIMIZEBOX, GetSystemMetrics(SM_CXSCREEN) div 2,
      GetSystemMetrics(SM_CYSCREEN) div 2, 0, 0, 0, 0, HInstance, nil);
  end;
end;

class procedure TWinView.DestroyContainerHandle;
begin
  if FContainerHandle <> NullHWnd then
    DestroyWindow(FContainerHandle);
end;

procedure TWinView.SetParentWindow(const Value: HWND);
begin
  if HandleAllocated and (Value <> NullHWnd) then
    Winapi.Windows.SetParent(FHandle, Value)
  else
    Winapi.Windows.SetParent(ContainerHandle, Value);
end;

function TWinView.HandleAllocated: Boolean;
begin
  Result := FHandle <> NullHWnd;
end;

procedure TWinView.Resized;
begin
end;

class function TWinView.GetContainerHandle: HWnd;
begin
  if FContainerHandle = NullHWnd then
    CreateContainerHandle;
  Result := FContainerHandle;
end;

function TWinView.GetHandle: HWND;
begin
  if (FHandle = NullHWnd) and not (csDestroying in ComponentState) then
    CreateHandle;
  Result := FHandle;
end;

function TWinView.GetParentWindow: HWND;
begin
  if HandleAllocated then
    Result := Winapi.Windows.GetParent(FHandle)
  else
    Exit(NullHWnd);

  if Result = ContainerHandle then 
    Result := NullHWnd;
end;

function TWinView.GetScale: Single;
begin
  Result := GetWndScale(FHandle);
end;

function TWinView.GetSize: TSize;
var
  R: TRect;
begin
  GetWindowRect(FHandle, R);
  Result := R.Size;
end;

{ TWinPresentation.TInterfacedHandle }

constructor TWinPresentation.TInterfacedHandle.Create(const AView: TWinPresentation);
begin
  inherited Create;
  FView := AView;
end;

{ TWinPresentation }

constructor TWinPresentation.Create(AOwner: TComponent);
begin
  inherited;
  FInterfacedHandle := TInterfacedHandle.Create(Self);
  FIsParentNativeForm := False;
  TMessageManager.DefaultManager.SubscribeToMessage(TBeforeDestroyFormHandle, BeforeDestroyMessageListener);
  TMessageManager.DefaultManager.SubscribeToMessage(TAfterCreateFormHandle, AfterCreateMessageListener);
end;

procedure TWinPresentation.AfterCreateMessageListener(const Sender: TObject; const AMessage: System.Messaging.TMessage);
begin
  if (AMessage is TAfterCreateFormHandle) and (TAfterCreateFormHandle(AMessage).Value = Form) then
  begin
    ZOrderManager.AddOrSetLink(Control, Handle, NullHWnd);
    // It's important to resynchronize native controls tree only in the end of event loop. Because when we add back
    // native controls to Z-Order manager we add it in a random order. But for correct synchronization we need to do it
    // only, when all native controls were added.
    TThread.ForceQueue(nil, procedure begin
      ZOrderManager.UpdateOrder(Control);
      // Also we should update bounds of controls only after resynchronize native controls tree.
      // Otherwise, we will get the wrong calculation of new positions of native controls.
      TThread.ForceQueue(nil, procedure begin
        ZOrderManager.UpdateBounds(Control);
      end);
    end);
  end;
end;

procedure TWinPresentation.BeforeDestroyMessageListener(const Sender: TObject; const AMessage: System.Messaging.TMessage);
begin
  if (AMessage is TBeforeDestroyFormHandle) and (TBeforeDestroyFormHandle(AMessage).Value = Form) then
    ZOrderManager.RemoveLink(Control);
end;

constructor TWinPresentation.Create(AOwner: TComponent; const AModel: TDataModel; const AControl: TControl);
begin
  FModel := AModel;
  if FModel is DefineModelClass then
    FModel.Receiver := Self
  else
    raise EPresentationWrongModel.CreateFmt(SWrongModelClassType, [DefineModelClass.ClassName, FModel.ClassName]);
  FControl := AControl;
  Create(AOwner);
end;

procedure TWinPresentation.CreateHandle;
begin
  inherited;
  if HasZOrderManager then
    ZOrderManager.AddOrSetLink(Control, Handle, NullHWnd);
end;

function TWinPresentation.DefineModelClass: TDataModelClass;
begin
  Result := TDataModel;
end;

function TWinPresentation.FindAncestorPresentedControl(out APlatformControl: TControl): Boolean;
begin
  Result := ZOrderManager.FindParentNativeControl(Control, APlatformControl);
end;

destructor TWinPresentation.Destroy;
begin
  TMessageManager.DefaultManager.Unsubscribe(TBeforeDestroyFormHandle, BeforeDestroyMessageListener);
  TMessageManager.DefaultManager.Unsubscribe(TAfterCreateFormHandle, AfterCreateMessageListener);
  inherited;
end;

procedure TWinPresentation.DestroyHandle;
begin
  if HasZOrderManager then
    ZOrderManager.RemoveLink(Control);
  inherited;
end;

function TWinPresentation.GetZOrderManager: TWinZOrderManager;
begin
  if HasZOrderManager then
    Result := WindowHandleToPlatform(Form.Handle).ZOrderManager
  else
    Result := nil;
end;

function TWinPresentation.HasZOrderManager: Boolean;
begin
  Result := (Form <> nil) and (Form.Handle <> nil);
end;

function TWinPresentation.HasControl: Boolean;
begin
  Result := FControl <> nil;
end;

function TWinPresentation.IsFocused: Boolean;
begin
  Result := GetFocus = Handle;
end;

procedure TWinPresentation.PMAbsoluteChanged(var AMessage: TDispatchMessage);
begin
  if HasZOrderManager then
    ZOrderManager.UpdateBounds(Control);
end;

procedure TWinPresentation.PMAncestorPresentationLoaded(var AMessage: TDispatchMessageWithValue<Boolean>);
begin
  UpdateOrderAndBounds;
end;

procedure TWinPresentation.PMAncestorPresentationUnloading(var AMessage: TDispatchMessageWithValue<TControl>);
begin
  UpdateOrderAndBounds;
end;

procedure TWinPresentation.PMAncesstorVisibleChanged(var AMessage: TDispatchMessageWithValue<Boolean>);
var
  LMessage:TDispatchMessageWithValue<Boolean>;
begin
  LMessage.Value := Control.Visible and Control.ParentedVisible;
  PMSetVisible(LMessage);
  if LMessage.Value then
    UpdateOrderAndBounds;
end;

procedure TWinPresentation.PMChangeOrder(var AMessage: TDispatchMessage);
begin
  if HasZOrderManager then
    ZOrderManager.UpdateOrder(Control);
end;

procedure TWinPresentation.PMDoEnter(var AMessage: TDispatchMessage);
begin
  SetFocus;
end;

procedure TWinPresentation.PMDoExit(var AMessage: TDispatchMessage);
begin
  ResetFocus;
end;

procedure TWinPresentation.PMGetAbsoluteEnabled(var AMessage: TDispatchMessageWithValue<Boolean>);
begin
  AMessage.Value := IsWindowEnabled(Handle);
end;

procedure TWinPresentation.PMGetNativeObject(var AMessage: TDispatchMessageWithValue<IInterface>);
begin
  AMessage.Value := FInterfacedHandle;
end;

procedure TWinPresentation.PMGetSize(var AMessage: TDispatchMessageWithValue<TSizeF>);
begin
  AMessage.Value := FControlSize;
end;

procedure TWinPresentation.PMGetVisible(var AMessage: TDispatchMessageWithValue<Boolean>);
begin
  AMessage.Value := IsWindowVisible(Handle);
end;

procedure TWinPresentation.PMRefreshParent(var AMessage: TDispatchMessage);
begin
  if HasZOrderManager then
    UpdateOrderAndBounds;
end;

procedure TWinPresentation.PMResetFocus(var AMessage: TDispatchMessage);
begin
  ResetFocus;
end;

procedure TWinPresentation.PMRootChanged(var AMessage: TDispatchMessageWithValue<IRoot>);
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
  begin
    ZOrderManager.AddOrSetLink(Control, Handle, NullHWnd);
    UpdateOrderAndBounds;
  end;
end;

procedure TWinPresentation.PMSetAbsoluteEnabled(var AMessage: TDispatchMessageWithValue<Boolean>);
begin
  EnableWindow(Handle, AMessage.Value);
end;

procedure TWinPresentation.PMSetSize(var AMessage: TDispatchMessageWithValue<TSizeF>);
begin
  FControlSize := AMessage.Value;
  UpdateOrderAndBounds;
  Resized;
end;

procedure TWinPresentation.PMSetVisible(var AMessage: TDispatchMessageWithValue<Boolean>);
begin
  if AMessage.Value then
    ShowWindow(Handle, SW_SHOW)
  else
    ShowWindow(Handle, SW_HIDE);
end;

procedure TWinPresentation.PMUnload(var AMessage: TDispatchMessage);
begin
  if HasZOrderManager then
    if csDestroying in Control.ComponentState then
      ZOrderManager.RemoveLinksForControlTree(Control)
    else
      ZOrderManager.RemoveLink(Control);
end;

procedure TWinPresentation.UpdateOrderAndBounds;
begin
  if not HasZOrderManager then
    Exit;

  ZOrderManager.UpdateOrderAndBounds(Control);
  FIsParentNativeForm := not ZOrderManager.IsNativeParentForm(Control);
end;

procedure TWinPresentation.WMDisabledTextColor(var Message: TMessage);
var
  BrushHandle: NativeInt;
begin
  BrushHandle := SetControlTextColor(Message.WParam, True);
  if BrushHandle > 0 then
    Message.Result := BrushHandle
  else
    inherited;
end;

procedure TWinPresentation.WMKeyDown(var Message: TWMKeyDown);
var
  KeyCode: Word;
  KeyChar: Char;
begin
  if Form <> nil then
  begin
    KeyCode := Message.CharCode;
    KeyChar := Char(Message.CharCode);
    Form.KeyDown(KeyCode, KeyChar, KeyDataToShiftState(Message.KeyData));
    if (KeyCode <> Message.CharCode) or (KeyChar <> Char(Message.CharCode)) then
      Message.Result := 0
    else
      inherited;
  end
  else
    inherited;
end;

procedure TWinPresentation.WMKeyUp(var Message: TWMKeyUp);
var
  KeyCode: Word;
  KeyChar: Char;
begin
  if Form <> nil then
  begin
    KeyCode := Message.CharCode;
    KeyChar := Char(Message.CharCode);
    Form.KeyUp(KeyCode, KeyChar, KeyDataToShiftState(Message.KeyData));
    if (KeyCode <> Message.CharCode) or (KeyChar <> Char(Message.CharCode)) then
      Message.Result := 0
    else
      inherited;
  end
  else
    inherited;
end;

procedure TWinPresentation.WMKillFocus(var Message: TWMKillFocus);
begin
  inherited;
  Control.ResetFocus;
end;

procedure TWinPresentation.CreateParams(var Params: TCreateParams);
begin
  inherited;
  if FControl.TabStop then
    Params.Style := Params.Style or WS_TABSTOP;
end;

function TWinPresentation.ExtractPoint(var Message: TWMMouse): TPoint;
begin
  Result := TPoint.Create(Message.XPos, Message.YPos);
  ClientToScreen(Handle, Result);
  if Form <> nil then
    ScreenToClient(WindowHandleToPlatform(Form.Handle).Wnd, Result);
end;

procedure TWinPresentation.WMLButtonDown(var Message: TWMLButtonDown);
var
  Point: TPoint;
begin
  try
    Point := ExtractPoint(Message);
    if Form <> nil then
    begin
      Form.MouseMove([], Point.X, Point.Y); // Require for correct IsMouseOver handle
      Form.MouseDown(TMouseButton.mbLeft, KeysToShiftState(Message.Keys), Point.X, Point.Y);
    end;
  finally
    inherited;
  end;
end;

procedure TWinPresentation.WMLButtonUp(var Message: TWMLButtonUp);
var
  Point: TPoint;
begin
  try
    Point := ExtractPoint(Message);
    if Form <> nil then
      Form.MouseUp(TMouseButton.mbLeft, KeysToShiftState(Message.Keys), Point.X, Point.Y);
    // Don't combine these if statements because in MouseUp the form can unload presentation!
    if Form <> nil then
      Form.MouseLeave;
  finally
    inherited;
  end;
end;

procedure TWinPresentation.WMMButtonDblClick(var Message: TWMMButtonDblClk);
var
  Point: TPoint;
begin
  try
    Point := ExtractPoint(Message);
    if Form <> nil then
      Form.MouseDown(TMouseButton.mbMiddle, KeysToShiftState(Message.Keys) + [ssDouble], Point.X, Point.Y);
  finally
    inherited;
  end;
end;

procedure TWinPresentation.WMMouseMove(var Message: TWMMouseMove);
var
  Point: TPoint;
begin
  try
    Point := ExtractPoint(Message);
    if Form <> nil then
      Form.MouseMove(KeysToShiftState(Message.Keys), Point.X, Point.Y);
  finally
    inherited;
  end;
end;

procedure TWinPresentation.WMLButtonDblClick(var Message: TWMLButtonDblClk);
var
  Point: TPoint;
begin
  try
    Point := ExtractPoint(Message);
    if Form <> nil then
      Form.MouseDown(TMouseButton.mbLeft, KeysToShiftState(Message.Keys) + [ssDouble], Point.X, Point.Y);
  finally
    inherited;
  end;
end;

procedure TWinPresentation.WMRButtonDblClick(var Message: TWMRButtonDblClk);
var
  Point: TPoint;
begin
  try
    Point := ExtractPoint(Message);
    if Form <> nil then
      Form.MouseDown(TMouseButton.mbRight, KeysToShiftState(Message.Keys) + [ssDouble], Point.X, Point.Y);
  finally
    inherited;
  end;
end;

procedure TWinPresentation.WMRButtonDown(var Message: TWMLButtonDown);
var
  Point: TPoint;
  ScreenPoint: TPoint;
begin
  try
    Point := ExtractPoint(Message);
    if (Control <> nil) and (Control.PopupMenu <> nil) and (Form <> nil) then
    begin
      ScreenPoint := Point;
      if ClientToScreen(WindowHandleToPlatform(Form.Handle).Wnd, ScreenPoint) then
        IControl(Control).ShowContextMenu(ScreenPoint);
    end;
    if Form <> nil then
    begin
      Form.MouseMove([], Point.X, Point.Y); // Require for correct IsMouseOver handle
      Form.MouseDown(TMouseButton.mbRight, KeysToShiftState(Message.Keys), Point.X, Point.Y);
    end;
  finally
    if (Control = nil) or (Control.PopupMenu = nil) then
      inherited;
  end;
end;

procedure TWinPresentation.WMRButtonUp(var Message: TWMLButtonUp);
var
  Point: TPoint;
begin
  try
    Point := ExtractPoint(Message);
    if Form <> nil then
      Form.MouseUp(TMouseButton.mbRight, KeysToShiftState(Message.Keys), Point.X, Point.Y);
    // Don't combine these if statements because in MouseUp the form can unload presentation!
    if Form <> nil then
      Form.MouseLeave;
  finally
    if (Control = nil) or (Control.PopupMenu = nil) then
      inherited;
  end;
end;

procedure TWinPresentation.WMSetFocus(var Message: TWMSetFocus);
begin
  inherited;
  Control.SetFocus;
end;

procedure TWinPresentation.WMTextColor(var Message: TMessage);
var
  BrushHandle: NativeInt;
begin
  BrushHandle := SetControlTextColor(Message.WParam, False);
  if BrushHandle > 0 then
    Message.Result := BrushHandle
  else
    inherited;
end;

procedure TWinPresentation.ResetFocus;
begin
  SendMessage(Handle, WM_KILLFOCUS, 0, 0);
end;

function TWinPresentation.SetControlTextColor(const DC: HDC; const Disabled: Boolean): NativeInt;
var
  TextSettings: ITextSettings;
begin
  if Supports(Control, ITextSettings, TextSettings) then
  begin
    SetTextColor(DC, TAlphaColors.ColorToRGB(TextSettings.ResultingTextSettings.FontColor));
    Result := GetSysColorBrush(COLOR_WINDOW);
  end
  else
    Result := -1;
end;

procedure TWinPresentation.SetFocus;
begin
  Winapi.Windows.SetFocus(Handle);
end;

{ TWinPresentationProxy<T> }

function TWinPresentationProxy<TPresentation>.CreateReceiver: TObject;
begin
  Result := TPresentation.Create(nil, Model, PresentedControl);
end;

end.

