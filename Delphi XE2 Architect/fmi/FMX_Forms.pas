{*******************************************************}
{                                                       }
{              Delphi FireMonkey Platform               }
{                                                       }
{ Copyright(c) 2011 Embarcadero Technologies, Inc.      }
{                                                       }
{*******************************************************}

unit FMX_Forms;

{$I FMX_Defines.inc}
{$MINENUMSIZE 4}
{$H+}

{$IFDEF MSWINDOWS}
{$HPPEMIT '#pragma link "d3d10.lib"'}
{$ENDIF}

interface

uses
{$IFDEF MSWINDOWS}
  Winapi.Messages,
{$ENDIF}
  TypInfo, Math, Classes, SysUtils, Types, UITypes, FMX_Types, FMX_Types3D;

{$SCOPEDENUMS ON}

type

  TCommonCustomForm = class;

  { Application }

  TExceptionEvent = procedure(Sender: TObject; E: Exception) of object;
  TIdleEvent = procedure(Sender: TObject; var Done: Boolean) of object;

  TCreateFormRec = record
    InstanceClass: TComponentClass;
    Reference: Pointer;
  end;

  { TApplication }

  TApplication = class(TComponent)
  private
    FOnException: TExceptionEvent;
    FRunning: Boolean;
    FTerminate: Boolean;
    FOnIdle: TIdleEvent;
    FTitle: WideString;
    FMainForm: TCommonCustomForm;
    FCreateForms: array of TCreateFormRec;
    FBiDiMode: TBiDiMode;
    FApplicationMenuItems: IItemsContainer;
    FStyleFileName: WideString;
    FDefaultStyles: TFmxObject;
    procedure Idle;
    procedure SetStyleFileName(const Value: WideString);
    procedure DestroyStyles;
  protected
  public
    MainFormOnTaskBar: Boolean;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure FormDestroyed(AForm: TCommonCustomForm);
    procedure RealCreateForms;
    procedure CreateForm(InstanceClass: TComponentClass; var Reference);
    procedure ProcessMessages;
    function DefaultStyles: TFmxObject;
    procedure DoIdle(var Done: Boolean);
    function HandleMessage: Boolean;
    procedure Run;
    procedure Terminate;
    procedure Initialize;
    procedure HandleException(Sender: TObject);
    procedure ShowException(E: Exception);
    property BiDiMode: TBiDiMode read FBiDiMode write FBiDiMode default bdLeftToRight;
    property Terminated: Boolean read FTerminate write FTerminate;
    property OnIdle: TIdleEvent read FOnIdle write FOnIdle;
    property StyleFileName: WideString read FStyleFileName write SetStyleFileName;
    property MainForm: TCommonCustomForm read FMainForm write FMainform;
    property Title: WideString read FTitle write FTitle; // deprecated
    property OnException: TExceptionEvent read FOnException write FOnException;
    property ApplicationMenuItems: IItemsContainer read FApplicationMenuItems write FApplicationMenuItems;
  end;


  { IDesignerHook }

{$IFDEF MSWINDOWS}
  IDesignerHook = interface(IDesignerNotify)
  ['{7A314BFB-1AD5-476A-AD08-944B9F3444A6}']
    function IsDesignMsg(Sender: TFmxObject; var Message: TMessage): Boolean;
    procedure UpdateBorder;
    procedure PaintGrid;
    procedure ValidateRename(AComponent: TComponent;
      const CurName, NewName: String);
    function UniqueName(const BaseName: WideString): WideString;
    function GetRoot: TComponent;
  end;
{$ELSE}
  IDesignerHook = interface
  end;
{$ENDIF}

  { Forms }

  TCloseEvent = procedure(Sender: TObject; var Action: TCloseAction) of object;
  TCloseQueryEvent = procedure(Sender: TObject; var CanClose: Boolean) of object;

  TFmxFormBorderStyle = (bsNone, bsSingle, bsSizeable, bsToolWindow, bsSizeToolWin);

  TFmxFormState = (fsRecreating, fsModal);
  TFmxFormStates = set of TFmxFormState;

  TFormPosition = (poDesigned, poDefault, poDefaultPosOnly, poDefaultSizeOnly,
    poScreenCenter, poDesktopCenter, poMainFormCenter, poOwnerFormCenter);

{ TCommonCustomForm }

  TCommonCustomForm = class(TFmxObject, IRoot, IContainerObject, IAlignRoot)
  private
    FDesigner: IDesignerHook;
    FCaption: WideString;
    FLeft: Integer;
    FTop: Integer;
    FOnClose: TCloseEvent;
    FOnCloseQuery: TCloseQueryEvent;
    FTransparency: Boolean;
    FHandle: TFmxHandle;
    FContextHandle: THandle;
    FBorderStyle: TFmxFormBorderStyle;
    FBorderIcons: TBorderIcons;
    FVisible: Boolean;
    FTopMost: Boolean;
    FOnActivate: TNotifyEvent;
    FOnDeactivate: TNotifyEvent;
    FShowActivated: Boolean;
    FModalResult: TModalResult;
    FFormState: TFmxFormStates;
    FStaysOpen: Boolean;
    FBiDiMode: TBiDiMode;
    FActive: Boolean;
    FOnCreate: TNotifyEvent;
    FOnDestroy: TNotifyEvent;
    FOnResize: TNotifyEvent;
    FTarget: IControl;
    FHovered, FCaptured, FFocused: IControl;
    FMousePos, FDownPos, FResizeSize, FDownSize: TPointF;
    FDragging, FResizing: Boolean;
    FActiveControl: TStyledControl;
    FHeight: Integer;
    FWidth: Integer;
    FCursor: TCursor;
    FPosition: TFormPosition;
    FWindowState: TWindowState;
    FLastWidth, FLastHeight: single;
    FDisableAlign: Boolean;
    FMargins: TBounds;
    FUpdating: Integer;
    FOnMouseDown: TMouseEvent;
    FOnMouseMove: TMouseMoveEvent;
    FOnMouseUp: TMouseEvent;
    FOnMouseWheel: TMouseWheelEvent;
    FOnKeyDown: TKeyEvent;
    FOnKeyUp: TKeyEvent;
    procedure SetDesigner(ADesigner: IDesignerHook);
    procedure SetLeft(const Value: Integer);
    procedure SetTop(const Value: Integer);
    procedure SetHeight(const Value: Integer);
    procedure SetWidth(const Value: Integer);
    procedure SetCaption(const Value: WideString);
    function GetClientHeight: Integer;
    function GetClientWidth: Integer;
    procedure SetTransparency(const Value: Boolean);
    procedure SetBorderStyle(const Value: TFmxFormBorderStyle);
    procedure SetBorderIcons(const Value: TBorderIcons);
    procedure SetVisible(const Value: Boolean);
    procedure SetTopMost(const Value: Boolean);
    procedure SetClientHeight(const Value: Integer);
    procedure SetClientWidth(const Value: Integer);
    procedure SetBiDiMode(const Value: TBiDiMode);
    procedure SetCursor(const Value: TCursor);
    procedure SetPosition(const Value: TFormPosition);
    procedure SetWindowState(const Value: TWindowState);
    function GetLeft: Integer;
    function GetTop: Integer;
    procedure MarginsChanged(Sender: TObject);
  protected
    function GetBackIndex: Integer; override;
    procedure InvalidateRect(R: TRectF);
    procedure Realign; virtual;
    procedure Recreate; virtual;
    procedure MouseCapture;
    procedure ReleaseCapture;
    procedure SetActive(const Value: Boolean); virtual;
    procedure DefineProperties(Filer: TFiler); override;
    function FindTarget(P: TPointF; const Data: TDragObject): IControl; virtual;
{$IFNDEF FPC}
    { IInterface }
    function QueryInterface(const IID: TGUID; out Obj): HResult; override;
{$ENDIF}
    { Handle }
    procedure CreateHandle; virtual;
    procedure DestroyHandle; virtual;
    procedure ResizeHandle; virtual;
    { IRoot }
    function GetObject: TFmxObject;
    function GetActiveControl: TStyledControl;
    procedure SetActiveControl(AControl: TStyledControl);
    procedure SetCaptured(const Value: IControl);
    procedure SetFocused(const Value: IControl);
    function GetCaptured: IControl;
    function GetFocused: IControl;
    function GetBiDiMode: TBiDiMode;
    procedure BeginInternalDrag(Source: TObject; ABitmap: TBitmap);
    { TFmxObject }
    procedure FreeNotification(AObject: TObject); override;
    { TComponent }
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
    procedure ValidateRename(AComponent: TComponent; const CurName, NewName: String); override;
    procedure GetChildren(Proc: TGetChildProc; Root: TComponent); override;
    { IContainerObject }
    function GetContainerWidth: Single;
    function GetContainerHeight: Single;
  public
    constructor Create(AOwner: TComponent); override;
    constructor CreateNew(AOwner: TComponent; Dummy: Integer = 0); virtual;
    destructor Destroy; override;
    procedure InitializeNewForm; virtual;
    procedure AfterConstruction; override;
    procedure BeforeDestruction; override;
    procedure AddObject(AObject: TFmxObject); override;
    { children }
    function ObjectAtPoint(P: TPointF): IControl; virtual;
    procedure PaintRects(const UpdateRects: array of TRectF); virtual;
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Single); virtual;
    procedure MouseMove(Shift: TShiftState; X, Y: Single); virtual;
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Single); virtual;
    procedure MouseWheel(Shift: TShiftState; WheelDelta: Integer; var Handled: Boolean); virtual;
    procedure MouseLeave; virtual;
    procedure KeyDown(var Key: Word; var KeyChar: System.WideChar; Shift: TShiftState); virtual;
    procedure KeyUp(var Key: Word; var KeyChar: System.WideChar; Shift: TShiftState); virtual;
//    function GetImeWindowRect: TRectF; virtual;
    procedure Activate;
    procedure Deactivate;
    procedure DragEnter(const Data: TDragObject; const Point: TPointF); virtual;
    procedure DragOver(const Data: TDragObject; const Point: TPointF; var Accept: Boolean); virtual;
    procedure DragDrop(const Data: TDragObject; const Point: TPointF); virtual;
    procedure DragLeave; virtual;
    procedure EnterMenuLoop;
    { manully start }
    procedure StartWindowDrag; virtual;
    procedure StartWindowResize; virtual;
    { settings }
    procedure SetBounds(ALeft, ATop, AWidth, AHeight: Integer); virtual;
    function ClientToScreen(const Point: TPointF): TPointF;
    function ScreenToClient(const Point: TPointF): TPointF;
    function CloseQuery: Boolean; virtual;
    function ClientRect: TRectF;
    procedure Release;
    procedure Close;
    procedure Show;
    procedure Hide;
    function ShowModal: TModalResult;
    procedure CloseModal;
    procedure Invalidate;
    procedure BeginUpdate;
    procedure EndUpdate;
    property Handle: TFmxHandle read FHandle write FHandle;
    property ContextHandle: THandle read FContextHandle write FContextHandle;
    property ModalResult: TModalResult read FModalResult write FModalResult;
    property FormState: TFmxFormStates read FFormState;
    property Designer: IDesignerHook read FDesigner write SetDesigner;
    { IRoot }
    property Captured: IControl read FCaptured;
    property Focused: IControl read FFocused write SetFocused;
    property Hovered: IControl read FHovered;
    property Active: Boolean read FActive;
    property BiDiMode: TBiDiMode read GetBiDiMode write SetBiDiMode default bdLeftToRight;
    property Caption: WideString read FCaption write SetCaption;
    property Cursor: TCursor read FCursor write SetCursor default crDefault;
    property BorderStyle: TFmxFormBorderStyle read FBorderStyle write SetBorderStyle
      default TFmxFormBorderStyle.bsSizeable;
    property BorderIcons: TBorderIcons read FBorderIcons write SetBorderIcons
      default [TBorderIcon.biSystemMenu, TBorderIcon.biMinimize, TBorderIcon.biMaximize];
    property ClientHeight: Integer read GetClientHeight write SetClientHeight;
    property ClientWidth: Integer read GetClientWidth write SetClientWidth;
    property Margins: TBounds read FMargins write FMargins;
    property Position: TFormPosition read FPosition write SetPosition default TFormPosition.poDefaultPosOnly;
    property Width: Integer read FWidth write SetWidth stored False;
    property Height: Integer read FHeight write SetHeight stored False;
    property ShowActivated: Boolean read FShowActivated write FShowActivated default True;
    property StaysOpen: Boolean read FStaysOpen write FStaysOpen default True;
    property Transparency: Boolean read FTransparency write SetTransparency default False;
    property TopMost: Boolean read FTopMost write SetTopMost default False;
    property Visible: Boolean read FVisible write SetVisible default True;
    property WindowState: TWindowState read FWindowState write SetWindowState default TWindowState.wsNormal;
    property OnCreate: TNotifyEvent read FOnCreate write FOnCreate;
    property OnDestroy: TNotifyEvent read FOnDestroy write FOnDestroy;
    property OnClose: TCloseEvent read FOnClose write FOnClose;
    property OnCloseQuery: TCloseQueryEvent read FOnCloseQuery write FOnCloseQuery;
    property OnActivate: TNotifyEvent read FOnActivate write FOnActivate;
    property OnDeactivate: TNotifyEvent read FOnDeactivate write FOnDeactivate;
    property OnKeyDown: TKeyEvent read FOnKeyDown write FOnKeyDown;
    property OnKeyUp: TKeyEvent read FOnKeyUp write FOnKeyUp;
    property OnMouseDown: TMouseEvent read FOnMouseDown write FOnMouseDown;
    property OnMouseMove: TMouseMoveEvent read FOnMouseMove write FOnMouseMove;
    property OnMouseUp: TMouseEvent read FOnMouseUp write FOnMouseUp;
    property OnMouseWheel: TMouseWheelEvent read FOnMouseWheel write FOnMouseWheel;
    property OnResize: TNotifyEvent read FOnResize write FOnResize;
  published
    property Left: Integer read GetLeft write SetLeft;
    property Top: Integer read GetTop write SetTop;
  end;

  { TCustomForm }

  TCustomForm = class(TCommonCustomForm, IScene)
  private
    FCanvas: TCanvas;
    FFill: TBrush;
    FDrawing: Boolean;
    FStyleBook: TStyleBook;
    FUpdateRects: array of TRectF;
    FStyleLookup: WideString;
    FNeedStyleLookup: Boolean;
    FResourceLink: TControl;
    FOnPaint: TOnPaintEvent;
    procedure SetFill(const Value: TBrush);
    procedure FillChanged(Sender: TObject);
    { IScene }
    function GetCanvas: TCanvas;
    function GetUpdateRectsCount: Integer;
    function GetUpdateRect(const Index: Integer): TRectF;
    function GetTransparency: Boolean;
    function GetStyleBook: TStyleBook;
    procedure SetStyleBook(const Value: TStyleBook);
    function GetAnimatedCaret: Boolean;
    function LocalToScreen(P: TPointF): TPointF;
    function ScreenToLocal(P: TPointF): TPointF;
    procedure SetStyleLookup(const Value: WideString);
    procedure AddUpdateRect(R: TRectF);
  protected
    procedure Loaded; override;
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
    { TForm }
    procedure ApplyStyleLookup; virtual;
    { }
    procedure DoPaint(const Canvas: TCanvas; const ARect: TRectF); virtual;
    { resources }
    function GetStyleObject: TControl;
    { Handle }
    procedure CreateHandle; override;
    procedure DestroyHandle; override;
    procedure ResizeHandle; override;
    { inherited }
    procedure Realign; override;
    procedure PaintRects(const UpdateRects: array of TRectF); override;
//    function GetImeWindowRect: TRectF; override;
  public
    constructor Create(AOwner: TComponent); override;
    constructor CreateNew(AOwner: TComponent; Dummy: Integer = 0); override;
    destructor Destroy; override;
    procedure InitializeNewForm; override;
    procedure AddObject(AObject: TFmxObject); override;
    procedure UpdateStyle; override;
    property Canvas: TCanvas read FCanvas;
    property Fill: TBrush read FFill write SetFill;
    property StyleBook: TStyleBook read FStyleBook write SetStyleBook;
    property ActiveControl: TStyledControl read GetActiveControl write SetActiveControl;
    property StyleLookup: WideString read FStyleLookup write SetStyleLookup;
    property OnPaint: TOnPaintEvent read FOnPaint write FOnPaint;
  end;

  TForm = class(TCustomForm)
  published
    property BiDiMode;
    property Caption;
    property Cursor default crDefault;
    property BorderStyle default TFmxFormBorderStyle.bsSizeable;
    property BorderIcons default [TBorderIcon.biSystemMenu, TBorderIcon.biMinimize, TBorderIcon.biMaximize];
    property ClientHeight;
    property ClientWidth;
    property Left;
    property Top;
    property Margins;
    property Position default TFormPosition.poDefaultPosOnly;
    property Width;
    property Height;
    property ShowActivated default True;
    property StaysOpen default True;
    property Transparency;
    property TopMost default False;
    property Visible;
    property WindowState default TWindowState.wsNormal;
    property OnCreate;
    property OnDestroy;
    property OnClose;
    property OnCloseQuery;
    property OnActivate;
    property OnDeactivate;
    property OnKeyDown;
    property OnKeyUp;
    property OnMouseDown;
    property OnMouseMove;
    property OnMouseUp;
    property OnMouseWheel;
    property OnResize;
    property Fill;
    property StyleBook;
    property ActiveControl;
    property StyleLookup;
    property OnPaint;
  end;

  TCustomForm3D = class(TCommonCustomForm, IViewport3D)
  private
    FContext: TContext3D;
    FCamera: TCamera;
    FLights: TList;
    FDesignCamera: TCamera;
    FDesignCameraZ: TDummy;
    FDesignCameraX: TDummy;
    FDesignGrid: TControl3D;
    FFill: TAlphaColor;
    FMultisample: TMultisample;
    FUsingDesignCamera: Boolean;
    FDrawing: Boolean;
    FOnRender: TRenderEvent;
    FEffectBitmap: TBitmap;
    procedure SetFill(const Value: TAlphaColor);
    procedure SetMultisample(const Value: TMultisample);
    function GetFill: TAlphaColor;
  protected
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
    { Handle }
    procedure CreateHandle; override;
    procedure DestroyHandle; override;
    procedure ResizeHandle; override;
    { inherited }
    procedure Realign; override;
    procedure PaintRects(const UpdateRects: array of TRectF); override;
    function ObjectAtPoint(P: TPointF): IControl; override;
    function FindTarget(P: TPointF; const Data: TDragObject): IControl; override;
    { IViewport3D }
    function GetObject: TFmxObject;
    function GetContext: TContext3D;
    function GetScene: IScene;
    function GetDesignCamera: TCamera;
    procedure SetDesignCamera(const ACamera: TCamera);
    procedure NeedRender;
    { }
    function ScreenToLocal(P: TPointF): TPointF;
    function LocalToScreen(P: TPointF): TPointF;
  public
    constructor Create(AOwner: TComponent); override;
    constructor CreateNew(AOwner: TComponent; Dummy: Integer = 0); override;
    destructor Destroy; override;
    procedure InitializeNewForm; override;
    procedure AddObject(AObject: TFmxObject); override;
    procedure RemoveObject(AObject: TFmxObject); override;
    property Context: TContext3D read FContext write FContext;
    property Multisample: TMultisample read FMultisample write SetMultisample default TMultisample.ms4Samples;
    property Color: TAlphaColor read GetFill write SetFill default TAlphaColors.White;
    property Camera: TCamera read FCamera write FCamera;
    property UsingDesignCamera: Boolean read FUsingDesignCamera write FUsingDesignCamera default True;
    property OnRender: TRenderEvent read FOnRender write FOnRender;
  end;

  TForm3D = class(TCustomForm3D)
  published
    property BiDiMode;
    property Caption;
    property Cursor default crDefault;
    property BorderStyle default TFmxFormBorderStyle.bsSizeable;
    property BorderIcons default [TBorderIcon.biSystemMenu, TBorderIcon.biMinimize, TBorderIcon.biMaximize];
    property ClientHeight;
    property ClientWidth;
    property Left;
    property Top;
    property Margins;
    property Position default TFormPosition.poDefaultPosOnly;
    property Width;
    property Height;
    property ShowActivated default True;
    property StaysOpen default True;
    property Transparency;
    property TopMost default False;
    property Visible;
    property WindowState default TWindowState.wsNormal;
    property OnCreate;
    property OnDestroy;
    property OnClose;
    property OnCloseQuery;
    property OnActivate;
    property OnDeactivate;
    property OnKeyDown;
    property OnKeyUp;
    property OnMouseDown;
    property OnMouseMove;
    property OnMouseUp;
    property OnMouseWheel;
    property OnResize;
    property Multisample default TMultisample.ms4Samples;
    property Color default TAlphaColors.White;
    property Camera;
    property UsingDesignCamera default True;
    property OnRender;
  end;

  TScreen = class(TComponent)
  private
    FManagingDataModules: Boolean;
    FForms: TList;
    FDataModules: TList;
    procedure AddDataModule(DataModule: TDataModule);
    procedure AddForm(AForm: TCommonCustomForm);
    function GetForm(Index: Integer): TCommonCustomForm;
    function GetFormCount: Integer;
    procedure RemoveDataModule(DataModule: TDataModule);
    procedure RemoveForm(AForm: TCommonCustomForm);
    function GetDataModule(Index: Integer): TDataModule;
    function GetDataModuleCount: Integer;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    property FormCount: Integer read GetFormCount;
    property Forms[Index: Integer]: TCommonCustomForm read GetForm;
    property DataModuleCount: Integer read GetDataModuleCount;
    property DataModules[Index: Integer]: TDataModule read GetDataModule;
  end;

var
  Screen: TScreen;
  Application: TApplication;

implementation

uses
{$IFDEF MACOS}
  Macapi.ObjectiveC,
{$ENDIF}
  FMX_Dialogs, FMX_Platform, FMX_Menus, FMX_Objects3D, FMX_Layers3D;

procedure DoneApplication;
begin
  Application.DestroyComponents;
  Application.DestroyStyles;
end;

{ TApplication }

constructor TApplication.Create(AOwner: TComponent);
begin
  inherited;
  if not Assigned(Classes.ApplicationHandleException) then
    Classes.ApplicationHandleException := HandleException;
  if not Assigned(Classes.ApplicationShowException) then
    Classes.ApplicationShowException := ShowException;
end;

procedure TApplication.CreateForm(InstanceClass: TComponentClass; var Reference);
begin
  SetLength(FCreateForms, Length(FCreateForms) + 1);
  FCreateForms[High(FCreateForms)].InstanceClass := InstanceClass;
  FCreateForms[High(FCreateForms)].Reference := @Reference;
end;

procedure TApplication.RealCreateForms;
var
  Instance: TComponent;
  I: Integer;
begin
  // only one form are created
  if Length(FCreateForms) > 0 then
  begin
    for I := 0 to High(FCreateForms) do
    begin
      Instance := TComponent(FCreateForms[I].InstanceClass.NewInstance);
      TComponent(FCreateForms[I].Reference^) := Instance;
      try
        Instance.Create(Self);
      except
        TComponent(FCreateForms[I].Reference^) := nil;
        raise;
      end;
      if (FMainForm = nil) and (Instance is TCommonCustomForm) then
      begin
        FMainForm := TCommonCustomForm(Instance);
        FMainForm.Visible := True;
      end;
    end;
    SetLength(FCreateForms, 0);
  end;
end;

destructor TApplication.Destroy;
type
  TExceptionEvent = procedure(E: Exception) of object;
var
  P: TNotifyEvent;
  E: TExceptionEvent;
begin
  Classes.WakeMainThread := nil;
  P := HandleException;
  if @P = @Classes.ApplicationHandleException then
    Classes.ApplicationHandleException := nil;
  E := ShowException;
  if @E = @Classes.ApplicationShowException then
    Classes.ApplicationShowException := nil;
  if FMainForm <> nil then
    FMainForm.Free;
  inherited;
end;

procedure TApplication.DestroyStyles;
begin
  FreeAndNil(FDefaultStyles);
end;

procedure TApplication.FormDestroyed(AForm: TCommonCustomForm);
begin
  if FMainForm = AForm then
    FMainForm := nil;
end;

function IsClass(Obj: TObject; Cls: TClass): Boolean;
var
  Parent: TClass;
begin
  Parent := Obj.ClassType;
  while (Parent <> nil) and (Parent.ClassName <> Cls.ClassName) do
    Parent := Parent.ClassParent;
  Result := Parent <> nil;
end;

procedure TApplication.HandleException(Sender: TObject);
var
  O: TObject;
begin
  O := ExceptObject;
  if IsClass(O, Exception) then
  begin
    if not IsClass(O, EAbort) then
      if Assigned(FOnException) then
        FOnException(Sender, Exception(O))
      else
        ShowException(Exception(O));
  end else
    SysUtils.ShowException(O, ExceptAddr);
end;

function TApplication.DefaultStyles: TFmxObject;
var
  S: TStream;
  SR: TSearchRec;
begin
  if FDefaultStyles = nil then
  begin
    if (FStyleFileName <> '') and FileExists(FStyleFileName) then
    begin
      S := TFileStream.Create(FStyleFileName, fmOpenRead);
      try
        FDefaultStyles := CreateObjectFromStream(nil, S);
      finally
        S.Free;
      end;
      // load custom styles
      if FDefaultStyles <> nil then
        if FindFirst(ChangeFileExt(FStyleFileName, '.*.Style'), $FFFF, SR) = 0 then
        begin
          try
            repeat
              S := TFileStream.Create(ExtractFilePath(FStyleFileName) + SR.Name, fmOpenRead);
              try
                MergeObjectFromStream(FDefaultStyles, S);
              finally
                S.Free;
              end;
            until FindNext(SR) <> 0;
          finally
            FindClose(SR);
          end;
        end;
    end;
    { load default styles - important - because not default styles can be incomplete }
    if (FDefaultStyles = nil) and FindRCData(HInstance, 'defaultstyle') then
    begin
      S := TResourceStream.Create(HInstance, 'defaultstyle', RT_RCDATA);
      try
        FDefaultStyles := CreateObjectFromStream(nil, S);
      finally
        S.Free;
      end;
    end;
  end;
  Result := FDefaultStyles;
end;

procedure TApplication.SetStyleFileName(const Value: WideString);
var
  i: integer;
begin
  if FStyleFileName <> Value then
  begin
    FStyleFileName := Value;
    if FRunning then
    begin
      // Force loading in run-time only
      FreeAndNil(FDefaultStyles);
      DefaultStyles;
      // Update forms
      if SceneList <> nil then
        for i := 0 to SceneList.Count - 1 do
          IScene(SceneList[i]).UpdateStyle;
    end;
  end;
end;

procedure TApplication.ShowException(E: Exception);
var
  Msg: WideString;
  SubE: Exception;
begin
  Msg := E.Message;
{$IFNDEF FPC}
  while True do
  begin
    SubE := E.GetBaseException;
    if SubE <> E then
    begin
      E := SubE;
      if E.Message <> '' then
        Msg := E.Message;
    end
    else
      Break;
  end;
{$ENDIF}
  if (Msg <> '') and (Msg[Length(Msg)] > '.') then Msg := Msg + '.';
  ShowMessage(Msg);
//  MessageBox(PWideChar(Msg), PWideChar(GetTitle), MB_OK + MB_ICONSTOP);
end;

function TApplication.HandleMessage: Boolean;
begin
  Result := Platform.HandleMessage;
  if not Result then
    Idle;
end;

procedure TApplication.DoIdle(var Done: Boolean);
begin
  if Assigned(FOnIdle) then
    FOnIdle(Self, Done);
end;

procedure TApplication.Idle;
var
  Done: Boolean;
begin
  Done := True;
  try
    DoIdle(Done);
    if Done then
    begin
      // App idle
    end;
  except
    HandleException(Self);
  end;


{$IFDEF FPC}
  if (GetCurrentThreadId = MainThreadID) and CheckSynchronize then
{$ELSE}
  if (TThread.CurrentThread.ThreadID = MainThreadID) and CheckSynchronize then
{$ENDIF}
    Done := False;

  if Done then
    Platform.WaitMessage;
end;

procedure TApplication.Run;
begin
  FRunning := True;
  AddExitProc(DoneApplication);
  try
    Platform.Run;
  finally
    FRunning := False;
  end;
end;

procedure TApplication.Terminate;
begin
  // Terminated is set to true in Platform.Terminate
  if CallTerminateProcs then
    Platform.Terminate;
end;

procedure TApplication.Initialize;
begin
  if InitProc <> nil then TProcedure(InitProc);
end;

procedure TApplication.ProcessMessages;
begin
  while Platform.HandleMessage do { loop };
end;

{ TCustomCommonForm }

constructor TCommonCustomForm.Create(AOwner: TComponent);
begin
  GlobalNameSpace.BeginWrite;
  try
    inherited;
    InitializeNewForm;
    if (ClassType <> TCommonCustomForm) and not(csDesigning in ComponentState) then
    begin
      if not InitInheritedComponent(Self, TCommonCustomForm) then
        raise EResNotFound.Create('Resource not found ' + ClassName);
    end;
  finally
    GlobalNameSpace.EndWrite;
  end;
end;

constructor TCommonCustomForm.CreateNew(AOwner: TComponent; Dummy: Integer);
begin
  inherited Create(AOwner);
  InitializeNewForm;
end;

procedure TCommonCustomForm.InitializeNewForm;
begin
  FUpdating := 0;
{$IFNDEF FMI}
  FWidth := 600;
  FHeight := 400;
{$ELSE}
  FWidth := 320;
  FHeight := 480;
{$ENDIF}
  FMargins := TBounds.Create(RectF(0, 0, 0, 0));
  FMargins.OnChange := MarginsChanged;
  FBorderIcons := [TBorderIcon.biSystemMenu, TBorderIcon.biMinimize, TBorderIcon.biMaximize];
  FBorderStyle := TFmxFormBorderStyle.bsSizeable;
  FShowActivated := True;
  FStaysOpen := True;
  FPosition := TFormPosition.poDefaultPosOnly;
  CreateHandle;
  Screen.AddForm(Self);
end;

destructor TCommonCustomForm.Destroy;
begin
  Application.FormDestroyed(Self);
  if FTarget <> nil then
  begin
    FTarget.RemoveFreeNotify(Self);
    FTarget := nil;
  end;
  if FHovered <> nil then
  begin
    FHovered.RemoveFreeNotify(Self);
    FHovered := nil;
  end;
  if FFocused <> nil then
  begin
    FFocused.RemoveFreeNotify(Self);
    FFocused := nil;
  end;
  if FCaptured <> nil then
  begin
    FCaptured.RemoveFreeNotify(Self);
    FCaptured := nil;
  end;
  FMargins.Free;
  DestroyHandle;
  Screen.RemoveForm(Self);
  inherited;
end;

procedure TCommonCustomForm.CreateHandle;
begin
  FHandle := Platform.CreateWindow(Self);
  if TFmxFormState.fsRecreating in FormState then
    Platform.SetWindowRect(Self, RectF(Left, Top, Left + Width, Top + Height));
end;

procedure TCommonCustomForm.DestroyHandle;
begin
  Platform.DestroyWindow(Self);
end;

procedure TCommonCustomForm.AfterConstruction;
begin
  inherited;
  if Assigned(FOnCreate) then
    FOnCreate(Self);
end;

procedure TCommonCustomForm.BeforeDestruction;
begin
  if Assigned(FOnDestroy) then
    FOnDestroy(Self);
  inherited;
end;

procedure TCommonCustomForm.MarginsChanged(Sender: TObject);
begin
  Realign;
end;

procedure TCommonCustomForm.Realign;
begin
end;

procedure TCommonCustomForm.Recreate;
begin
  if (csDesigning in ComponentState) or (FUpdating > 0) then Exit;

  FFormState := FFormState + [TFmxFormState.fsRecreating];
  DestroyHandle;
  CreateHandle;
  if Visible then
    Platform.ShowWindow(Self);
  FFormState := FFormState - [TFmxFormState.fsRecreating];
end;

procedure TCommonCustomForm.PaintRects(const UpdateRects: array of TRectF);
begin
end;

{$IFNDEF FPC}
function TCommonCustomForm.QueryInterface(const IID: TGUID; out Obj): HResult;
begin
  // Route the QueryInterface through the Designer first
  if (Designer = nil) or (Designer.QueryInterface(IID, Obj) <> 0) then
    Result := inherited QueryInterface(IID, Obj)
  else
    Result := 0;
end;
{$ENDIF}

function TCommonCustomForm.CloseQuery: Boolean;
begin
  Result := True;
  if Assigned(FOnCloseQuery) then
    FOnCloseQuery(Self, Result);
end;

procedure TCommonCustomForm.Close;
var
  CloseAction: TCloseAction;
begin
  if TFmxFormState.fsModal in FFormState then
    ModalResult := mrCancel
  else if CloseQuery then
  begin
    CloseAction := TCloseAction.caHide;
    if Assigned(FOnClose) then
      FOnClose(Self, CloseAction);
    if CloseAction <> TCloseAction.caNone then
      if Application.MainForm = Self then
        Application.Terminate
      else if CloseAction = TCloseAction.caHide then
        Hide
      else if CloseAction = TCloseAction.caMinimize then
        // WindowState := wsMinimized
      else
        Release;
  end;
end;

procedure TCommonCustomForm.Show;
begin
  if not (csDesigning in ComponentState) then
  begin
    case FPosition of
      TFormPosition.poScreenCenter:
        begin
          with Platform.GetScreenSize do
            SetBounds(System.Round((X - Width) / 2), System.Round((Y - Height) / 2), Width, Height);
        end;
    end;
  end;
  Platform.ShowWindow(Self);
  FVisible := True;
end;

procedure TCommonCustomForm.Hide;
begin
  Platform.HideWindow(Self);
  FVisible := False;
end;

function TCommonCustomForm.ShowModal: TModalResult;
begin
  FFormState := FFormState + [TFmxFormState.fsModal];
  Result := Platform.ShowWindowModal(Self);
  FFormState := FFormState - [TFmxFormState.fsModal];

  // recreate the underlying WinApi handle in order to make the window
  // unowned; the recreation cannot be done in Platform.ShowWindowModal because
  // the parent of the window is chosen depending on fsModal in FormState and
  // inside the ShowWindowModal call fsModal is set - which is not what we need
  if not (csDestroying in ComponentState) then
    Recreate;
end;

procedure TCommonCustomForm.CloseModal;
var
  CloseAction: TCloseAction;
begin
  try
    CloseAction := TCloseAction.caNone;
    if CloseQuery then
    begin
      CloseAction := TCloseAction.caHide;
      if Assigned(FOnClose) then
        FOnClose(Self, CloseAction);
    end;
    case CloseAction of
      TCloseAction.caNone:
        ModalResult := mrNone;
      TCloseAction.caFree:
        Release;
    end;
  except
    ModalResult := mrNone;
    Application.HandleException(Self);
  end;
end;

procedure TCommonCustomForm.Release;
begin
  Platform.ReleaseWindow(Self);
end;

procedure TCommonCustomForm.SetBounds(ALeft, ATop, AWidth, AHeight: Integer);
var
  NR, PR: TRectF;
  SizeChanged: Boolean;
begin
  if (ALeft <> FLeft) or (ATop <> FTop) or (AWidth <> FWidth) or (AHeight <> FHeight) then
  begin
    SizeChanged := (AWidth <> FWidth) or (AHeight <> FHeight);

    FTop := ATop;
    FLeft := ALeft;
    FWidth := AWidth;
    FHeight := AHeight;
    NR := RectF(FLeft, FTop, FLeft + FWidth, FTop + FHeight);

    // This procedure can be called by the platform in response to a change coming
    // from another source. Check to see if the actual size reported by the
    // platform indicates we actually need to change the value;
    PR := Platform.GetWindowRect(Self);
    if not EqualRect(PR, NR) then
    begin
      Platform.SetWindowRect(Self, NR);
    end;
    if SizeChanged or (csDesigning in ComponentState) then
      ResizeHandle;

    if Assigned(FOnResize) then
      FOnResize(Self);
  end;
end;

function IsDialogKey(Key: Word): boolean;
begin
  Result:= True;
  if {(key in [vkF1..vkF24]) or }(Key = vkCapital) or (Key = vkSnapshot) or
    (Key = vkPause) or (Key = vkScroll) or (Key = vkMenu) or (Key = vkLWin) or (Key = vkRWin) or (key = 0) then

    Result:= False;
end;

procedure TCommonCustomForm.KeyDown(var Key: Word; var KeyChar: System.WideChar; Shift: TShiftState);
var
  List: TList;
  i, CurIdx: Integer;
  K: Word;
  Ch: System.WideChar;
  TabDirection : Integer;
begin
  { dialog key }
  if IsDialogKey(Key) then
  begin
    for i := ChildrenCount - 1 downto 0 do
    begin
      if Children[i].IsIControl then
        Children[i].AsIControl.DialogKey(Key, Shift)
      else
        if Children[i] is TMainMenu then
		      TMainMenu(Children[i]).DialogKey(Key, Shift)
        else if Children[i] is TPopupMenu then
          TPopupMenu(Children[i]).DialogKey(Key, Shift);

      if Key = 0 then
        Exit;
    end;

    if Key = 0 then
      Exit;
  end;

  { change focus }
  if (Key = vkTab) then
  begin
    Key := 0;
    List := TList.Create;
    GetTabOrderList(List, True);

    if ssShift in Shift then
      TabDirection := -1
    else
      TabDirection := 1;

    CurIdx := List.IndexOf(Pointer(FFocused));
    for i := 0 to List.Count-1 do
    begin
      Inc(CurIdx, TabDirection);
      if (TabDirection > 0) and (CurIdx >= List.Count) then
        CurIdx := 0
      else
      if (TabDirection < 0) and (CurIdx < 0) then
        CurIdx := List.Count - 1;

      if IControl(List[CurIdx]).CheckForAllowFocus then
      begin
        IControl(List[CurIdx]).SetFocus;
        break;
      end;
    end;

    List.Free;
    Exit;
  end;

  { focused handler }
  if FFocused <> nil then
    FFocused.KeyDown(Key, KeyChar, Shift);
  if Assigned(FOnKeyDown) and ((Key <> 0) or (KeyChar <> #0)) then
    FOnKeyDown(Self, Key, KeyChar, Shift);
end;

procedure TCommonCustomForm.KeyUp(var Key: Word; var KeyChar: System.WideChar; Shift: TShiftState);
begin
  { focused handler }
  if FFocused <> nil then
    FFocused.KeyUp(Key, KeyChar, Shift);
  if Assigned(FOnKeyUp) and ((Key <> 0) or (KeyChar <> #0)) then
    FOnKeyUp(Self, Key, KeyChar, Shift);
end;

function TCommonCustomForm.ObjectAtPoint(P: TPointF): IControl;
var
  i: Integer;
  Obj: TFmxObject;
  NewObj: IControl;
begin
  Result := nil;
  for i := ChildrenCount - 1 downto 0 do
  begin
    Obj := Children[i];
    if IInterface(Obj).QueryInterface(IControl, NewObj) <> 0 then
      Continue;
    if not NewObj.GetVisible and not(csDesigning in ComponentState) then
      Continue;
    NewObj := NewObj.ObjectAtPoint(P);
    if NewObj <> nil then
    begin
      Result := NewObj;
      Exit;
    end;
  end;
end;

procedure TCommonCustomForm.MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Single);
var
  P: TPointF;
  R: TRectF;
  Obj: IControl;
  SG: ISizeGrip;
  NewCursor: TCursor;
  i: Integer;
begin
  { translate coord }
  FMousePos := PointF(X, Y);
  FDownPos := FMousePos;
  if Assigned(FOnMouseDown) then
    FOnMouseDown(Self, Button, Shift, X, Y);
  Obj := IControl(ObjectAtPoint(ClientToScreen(FMousePos)));
  if (Obj <> nil) then
    if (IInterface(Obj).QueryInterface(ISizeGrip, SG) = 0) then
      StartWindowResize
    else
    begin
      P := Obj.ScreenToLocal(ClientToScreen(PointF(FMousePos.X, FMousePos.Y)));
      Obj.MouseDown(Button, Shift, P.X, P.Y);
      if (Obj.DragMode = TDragMode.dmAutomatic) then
        Obj.BeginAutoDrag;
      NewCursor := Obj.Cursor;
    end
  else // use the form cursor only if no control has been clicked
    NewCursor := Cursor;

  Platform.SetCursor(Self, NewCursor);
end;

procedure TCommonCustomForm.MouseLeave;
begin
  MouseMove([], -1, -1);
end;

procedure TCommonCustomForm.MouseMove(Shift: TShiftState; X, Y: Single);
var
  R: TRectF;
  P, P1: TPointF;
  Obj: IControl;
  SG: ISizeGrip;
  NewCursor: TCursor;
begin
  NewCursor := Cursor;
  { drag }
  if FDragging then
  begin
    SetBounds(round(Left + (X - FDownPos.X)), round(Top + (Y - FDownPos.Y)), Width, Height);
    Exit;
  end;
  if FResizing then
  begin
    FResizeSize.X := round(FResizeSize.X + (X - FMousePos.X));
    FResizeSize.Y := round(FResizeSize.Y + (Y - FMousePos.Y));
    SetBounds(Left, Top, round(FResizeSize.X), round(FResizeSize.Y));
    Cursor := crSizeNWSE;
    FMousePos := PointF(X, Y);
    Exit;
  end;
  if Assigned(FOnMouseMove) then
    FOnMouseMove(Self, Shift, X, Y);
  { translate coord }
  FMousePos := PointF(X, Y);
  if (FCaptured <> nil) then
  begin
    if ((FCaptured.QueryInterface(ISizeGrip, SG) = 0) and Assigned(SG)) then
      Platform.SetCursor(Self, crSizeNWSE)
    else
      Platform.SetCursor(Self, FCaptured.Cursor);
    P := FCaptured.ScreenToLocal(ClientToScreen(PointF(FMousePos.X, FMousePos.Y)));
    FCaptured.MouseMove(Shift, P.X, P.Y);
    Exit;
  end;

  Obj := ObjectAtPoint(ClientToScreen(FMousePos));
  if (Obj <> nil) then
  begin

    if (Obj <> FHovered) then
    begin
      if FHovered <> nil then
      begin
        FHovered.DoMouseLeave;
        FHovered.RemoveFreeNotify(Self);
      end;
      FHovered := Obj;
      FHovered.DoMouseEnter;
      FHovered.AddFreeNotify(Self);
    end;

    P := Obj.ScreenToLocal(ClientToScreen(PointF(FMousePos.X, FMousePos.Y)));
    Obj.MouseMove(Shift, P.X, P.Y);
    if ((Obj.QueryInterface(ISizeGrip, SG) = 0) and Assigned(SG)) then
      NewCursor := crSizeNWSE
    else
      NewCursor := Obj.Cursor;
  end
  else
  begin
    if FHovered <> nil then
    begin
      FHovered.DoMouseLeave;
      FHovered.RemoveFreeNotify(Self);
      FHovered := nil;
    end;
  end;
  // set cursor
  Platform.SetCursor(Self, NewCursor);
  FDownPos := FMousePos;
end;

procedure TCommonCustomForm.MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Single);
var
  P: TPointF;
  Obj: IControl;
  NewCursor: TCursor;
begin
  { drag }
  if FDragging then
  begin
    FDragging := False;
    ReleaseCapture;
  end;
  if FResizing then
  begin
    FResizing := False;
    ReleaseCapture;
  end;
  if (FCaptured <> nil) then
  begin
    P := FCaptured.ScreenToLocal(ClientToScreen(PointF(FMousePos.X, FMousePos.Y)));
    FCaptured.MouseUp(Button, Shift, P.X, P.Y);
    ReleaseCapture;
    Exit;
  end;
  if Assigned(FOnMouseUp) then
    FOnMouseUp(Self, Button, Shift, X, Y);
  Obj := ObjectAtPoint(ClientToScreen(FMousePos));
  if (Obj <> nil) then
  begin
    P := Obj.ScreenToLocal(ClientToScreen(PointF(FMousePos.X, FMousePos.Y)));
    Obj.MouseUp(Button, Shift, P.X, P.Y);

    // we are over a control; use its cursor
    NewCursor := Obj.Cursor;
  end
  else // the mouse is over the form; use the form cursor
    NewCursor := Cursor;

  // update the cursor
  Platform.SetCursor(Self, NewCursor);
end;

procedure TCommonCustomForm.MouseWheel(Shift: TShiftState; WheelDelta: Integer; var Handled: Boolean);
var
  Obj: IControl;
  MousePos: TPointF;
begin
  MousePos := Platform.GetMousePos;
  { event }
  if (FCaptured <> nil) then
  begin
    FCaptured.MouseWheel(Shift, WheelDelta, Handled);
    Exit;
  end;
  if Assigned(FOnMouseWheel) then
    FOnMouseWheel(Self, Shift, WheelDelta, Handled);
  if not Handled then 
  begin
    Obj := ObjectAtPoint(MousePos);
    while (Obj <> nil) do
    begin
      Obj.MouseWheel(Shift, WheelDelta, Handled);
      if Handled then
        Break;
      if (Obj.Parent <> nil) and (Obj.Parent.IsIControl) then
        Obj := Obj.Parent.AsIControl
      else
        Obj := nil;
    end;
  end;
end;

procedure TCommonCustomForm.Notification(AComponent: TComponent;
  Operation: TOperation);
begin
  inherited;
{$IFDEF WIN32}
  if FDesigner <> nil then
    FDesigner.Notification(AComponent, Operation);
{$ENDIF}
end;

procedure TCommonCustomForm.GetChildren(Proc: TGetChildProc; Root: TComponent);
var
  I: Integer;
  OwnedComponent: TComponent;
begin
  inherited GetChildren(Proc, Root);
  if Root = Self then
    for I := 0 to ComponentCount - 1 do
    begin
      OwnedComponent := Components[I];
      if OwnedComponent is TFmxObject then
      begin
        if TFmxObject(OwnedComponent).Parent = nil then
          Proc(OwnedComponent);
      end
      else
        if not OwnedComponent.HasParent then Proc(OwnedComponent);
    end;
end;

{ Drag and Drop }

function TCommonCustomForm.FindTarget(P: TPointF; const Data: TDragObject): IControl;
var
  i: Integer;
  Obj: TFmxObject;
  NewObj: IControl;
begin
  Result := nil;
  for i := 0 to ChildrenCount - 1 do
    if Supports(Children[i], IControl, NewObj) and NewObj.Visible and NewObj.HitTest then
    begin
      NewObj := NewObj.FindTarget(P, Data);

      if Assigned(NewObj) then
        Exit(NewObj);
    end;
end;

procedure TCommonCustomForm.FreeNotification(AObject: TObject);
begin
  inherited ;
  if (FHovered <> nil) and (FHovered.GetObject = AObject) then
    FHovered := nil;
  if (FTarget <> nil) and (FTarget.GetObject = AObject) then
    FTarget := nil;
  if (FCaptured <> nil) and (FCaptured.GetObject = AObject) then
    FCaptured := nil;
  if (FFocused <> nil) and (FFocused.GetObject = AObject) then
    FFocused := nil;
end;

procedure TCommonCustomForm.DragDrop(const Data: TDragObject; const Point: TPointF);
begin
  if FTarget <> nil then
    FTarget.DragDrop(Data, FTarget.ScreenToLocal(Point));
end;

procedure TCommonCustomForm.DragEnter(const Data: TDragObject; const Point: TPointF);
var
  NewTarget: IControl;
begin
  NewTarget := FindTarget(Point, Data);
  if (NewTarget <> FTarget) then
  begin
    if FTarget <> nil then
    begin
      FTarget.DragLeave;
      FTarget.RemoveFreeNotify(Self);
    end;
    FTarget := NewTarget;
    if FTarget <> nil then
    begin
      FTarget.AddFreeNotify(Self);
      FTarget.DragEnter(Data, FTarget.ScreenToLocal(Point));
    end;
  end;
end;

procedure TCommonCustomForm.DragLeave;
begin
  if FTarget <> nil then
  begin
    FTarget.DragLeave;
    FTarget.RemoveFreeNotify(Self);
  end;
  FTarget := nil;
end;

procedure TCommonCustomForm.DragOver(const Data: TDragObject; const Point: TPointF; var Accept: Boolean);
var
  NewTarget: IControl;
begin
  NewTarget := FindTarget(Point, Data);
  if (NewTarget <> FTarget) then
  begin
    if FTarget <> nil then
    begin
      FTarget.DragLeave;
      FTarget.RemoveFreeNotify(Self);
    end;
    FTarget := NewTarget;
    if FTarget <> nil then
    begin
      FTarget.AddFreeNotify(Self);
      FTarget.DragEnter(Data, FTarget.ScreenToLocal(Point));
    end;
  end;
  if FTarget <> nil then
    FTarget.DragOver(Data, FTarget.ScreenToLocal(Point), Accept);
end;

procedure TCommonCustomForm.EndUpdate;
var
  I: Integer;
begin
  FUpdating := FUpdating - 1;
  for I := 0 to ChildrenCount - 1 do
    if (Children[I] is TControl) then
      TControl(FChildren[I]).EndUpdate;
  if FUpdating = 0 then
    Recreate;
end;

procedure TCommonCustomForm.EnterMenuLoop;
var
  List: TList;
  i: Integer;
begin
  List := TList.Create;
  AddControlsToList(List);
  for i := 0 to List.Count - 1 do
    if (TStyledControl(List[i]) is TMenuBar) then
    begin
      TMenuBar(List[i]).StartMenuLoop;
      Break;
    end;
  List.Free;
end;

procedure TCommonCustomForm.SetCaption(const Value: WideString);
begin
  if FCaption <> Value then
  begin
    FCaption := Value;
    Platform.SetWindowCaption(Self, FCaption);

{$IFDEF WIN32}
    if (csDesigning in ComponentState) and (FDesigner <> nil) then
      FDesigner.UpdateBorder;
{$ENDIF}
  end;
end;

procedure TCommonCustomForm.SetHeight(const Value: Integer);
begin
  SetBounds(Left, Top, Width, Value);
end;

procedure TCommonCustomForm.SetLeft(const Value: Integer);
begin
  if (csDesigning in ComponentState) then
  begin
    DesignInfo := (DesignInfo and $FFFF0000) or (Cardinal(Value) and $FFFF);
    if not (csLoading in ComponentState) and (Position <> TFormPosition.poDefaultSizeOnly) then
      Position := TFormPosition.poDesigned;
  end
  else
    SetBounds(Value, Top, Width, Height);
end;

procedure TCommonCustomForm.SetPosition(const Value: TFormPosition);
begin
  if FPosition <> Value then
  begin
    FPosition := Value;
  end;
end;

procedure TCommonCustomForm.SetTop(const Value: Integer);
begin
  if (csDesigning in ComponentState) then
  begin
    DesignInfo := (DesignInfo and $0000FFFF) or (Value shl 16);
    if not (csLoading in ComponentState) and (Position <> TFormPosition.poDefaultSizeOnly) then
      Position := TFormPosition.poDesigned;
  end
  else
    SetBounds(Left, Value, Width, Height);
end;

procedure TCommonCustomForm.SetWidth(const Value: Integer);
begin
  SetBounds(Left, Top, Value, Height);
end;

procedure TCommonCustomForm.SetWindowState(const Value: TWindowState);
begin
  if FWindowState <> Value then
  begin
    FWindowState := Value;
    if not (csDesigning in ComponentState) then
      Platform.SetWindowState(Self, FWindowState);
  end;
end;

procedure TCommonCustomForm.MouseCapture;
begin
  Platform.SetCapture(Self);
end;

procedure TCommonCustomForm.ReleaseCapture;
begin
  Platform.ReleaseCapture(Self);
end;

procedure TCommonCustomForm.ResizeHandle;
begin
end;

procedure TCommonCustomForm.Invalidate;
begin
  InvalidateRect(ClientRect);
end;

procedure TCommonCustomForm.InvalidateRect(R: TRectF);
begin
  if csDestroying in ComponentState then
    Exit;
  Platform.InvalidateWindowRect(Self, R);
end;

function TCommonCustomForm.GetClientHeight: Integer;
begin
  Result := round(Platform.GetClientSize(Self).Y);
end;

function TCommonCustomForm.GetClientWidth: Integer;
begin
  Result := round(Platform.GetClientSize(Self).X);
end;

function TCommonCustomForm.GetContainerHeight: Single;
begin
  Result := ClientHeight;
end;

function TCommonCustomForm.GetContainerWidth: Single;
begin
  Result := ClientWidth;
end;

//function TCommonCustomForm.GetImeWindowRect: TRectF;
//begin
//  Result := RectF(0, 0, ClientWidth, ClientHeight);
//end;

function TCommonCustomForm.GetTop: Integer;
begin
  if (csDesigning in ComponentState) and (Parent <> nil) then
    Result := SmallInt((DesignInfo and $FFFF0000) shr 16)
  else
    Result := FTop;
end;

function TCommonCustomForm.GetLeft: Integer;
begin
  if (csDesigning in ComponentState) then
    Result := SmallInt(DesignInfo and $0000FFFF)
  else
    Result := FLeft;
end;

procedure TCommonCustomForm.SetClientHeight(const Value: Integer);
begin
  Platform.SetClientSize(Self, PointF(ClientWidth, Value));
end;

procedure TCommonCustomForm.SetClientWidth(const Value: Integer);
begin
  Platform.SetClientSize(Self, PointF(Value, ClientHeight));
end;

procedure TCommonCustomForm.SetCursor(const Value: TCursor);
begin
  FCursor := Value;
end;

procedure TCommonCustomForm.SetDesigner(ADesigner: IDesignerHook);
begin
  FDesigner := ADesigner;
end;

procedure TCommonCustomForm.SetTransparency(const Value: Boolean);
begin
  if FTransparency <> Value then
  begin
    FTransparency := Value;
    Recreate;
  end;
end;

procedure TCommonCustomForm.SetBorderStyle(const Value: TFmxFormBorderStyle);
begin
  if FBorderStyle <> Value then
  begin
    FBorderStyle := Value;
    Recreate;
{$IFDEF WIN32}
    if (csDesigning in ComponentState) and (FDesigner <> nil) then
      FDesigner.UpdateBorder;
{$ENDIF}
  end;
end;

procedure TCommonCustomForm.SetBiDiMode(const Value: TBiDiMode);
begin
  FBiDiMode := Value;
end;

procedure TCommonCustomForm.SetBorderIcons(const Value: TBorderIcons);
begin
  if FBorderIcons <> Value then
  begin
    FBorderIcons := Value;
    Recreate;
{$IFDEF WIN32}
    if (csDesigning in ComponentState) and (FDesigner <> nil) then
      FDesigner.UpdateBorder;
{$ENDIF}
  end;
end;

procedure TCommonCustomForm.SetVisible(const Value: Boolean);
begin
  if FVisible <> Value then
  begin
    FVisible := Value;
    if FVisible then
      Show
    else
      Hide;
  end;
end;

function TCommonCustomForm.ClientRect: TRectF;
begin
  Result := RectF(0, 0, ClientWidth, ClientHeight);
end;

function TCommonCustomForm.ClientToScreen(const Point: TPointF): TPointF;
begin
  Result := Platform.ClientToScreen(Self, Point);
end;

function TCommonCustomForm.ScreenToClient(const Point: TPointF): TPointF;
begin
  Result := Platform.ScreenToClient(Self, Point);
end;

procedure TCommonCustomForm.SetTopMost(const Value: Boolean);
begin
  if FTopMost <> Value then
  begin
    FTopMost := Value;
    Recreate;
  end;
end;

procedure TCommonCustomForm.Activate;
var
  TSC: ITextServiceControl;
begin
  if FFocused <> nil then
  begin
    if Supports(FFocused, ITextServiceControl, TSC) then
      TSC.GetTextService.EnterControl(Handle);
  end;
  if Assigned(FOnActivate) then
    FOnActivate(Self);
  FActive := True;
end;

procedure TCommonCustomForm.Deactivate;
begin
  if Assigned(FOnDeactivate) then
    FOnDeactivate(Self);
  FActive := False;
end;

procedure TCommonCustomForm.SetActive(const Value: Boolean);
begin
  if FActive <> Value then
  begin
    FActive := Value;
  end;
  ApplyTriggerEffect(Self, 'IsActive');
  StartTriggerAnimation(Self, 'IsActive');
end;

procedure TCommonCustomForm.DefineProperties(Filer: TFiler);
begin
  inherited;
end;

procedure TCommonCustomForm.StartWindowDrag;
begin
  if (csDesigning in ComponentState) then Exit;
  FDragging := True;
  FDownPos := FMousePos;
  MouseCapture;
end;

procedure TCommonCustomForm.StartWindowResize;
begin
  if (csDesigning in ComponentState) then Exit;
  FResizing := True;
  FDownPos := FMousePos;
  FResizeSize := PointF(Width, Height);
  FDownSize := FResizeSize;
  MouseCapture;
end;

procedure TCommonCustomForm.ValidateRename(AComponent: TComponent; const CurName, NewName: String);
begin
  inherited;
{$IFDEF WIN32}
  if FDesigner <> nil then
    FDesigner.ValidateRename(AComponent, CurName, NewName);
{$ENDIF}
end;

{ IRoot }

procedure TCommonCustomForm.AddObject(AObject: TFmxObject);
var
  Obj: IAlignableObject;
begin
  inherited;
  if AObject = nil then Exit;
  AObject.SetRoot(Self);
  if Supports(AObject, IAlignableObject, Obj) then
  begin
    if (Obj.Align <> TAlignLayout.alNone) then
      Realign
    else
      Invalidate;
  end;
end;

function TCommonCustomForm.GetObject: TFmxObject;
begin
  Result := Self;
end;

function TCommonCustomForm.GetActiveControl: TStyledControl;
begin
  Result := FActiveControl;
end;

function TCommonCustomForm.GetBackIndex: Integer;
begin
  Result := 1;
end;

function TCommonCustomForm.GetBiDiMode: TBiDiMode;
begin
  Result := FBiDiMode;
end;

function TCommonCustomForm.GetCaptured: IControl;
begin
  Result := FCaptured;
end;

procedure TCommonCustomForm.SetCaptured(const Value: IControl);
begin
  if FCaptured <> Value then
  begin
    if FCaptured <> nil then
    begin
      ReleaseCapture;
      FCaptured.RemoveFreeNotify(Self);
    end;
    FCaptured := Value;
    if FCaptured <> nil then
    begin
      MouseCapture;
      FCaptured.AddFreeNotify(Self);
    end;
  end;
end;

function TCommonCustomForm.GetFocused: IControl;
begin
  Result := FFocused;
end;

procedure TCommonCustomForm.SetFocused(const Value: IControl);
var
  TSControl: ITextServiceControl;
begin
  if FFocused <> Value then
  begin
    if FFocused <> nil then
    begin
      FFocused.DoExit;
      if Supports(FFocused, ITextServiceControl, TSControl) then
        TSControl.GetTextService.ExitControl(Handle);
      FFocused.RemoveFreeNotify(Self);
    end;
    FFocused := Value;
    if FFocused <> nil then
    begin
      if Supports(FFocused, ITextServiceControl, TSControl) then
        TSControl.GetTextService.EnterControl(Handle);
      FFocused.DoEnter;
      FFocused.AddFreeNotify(Self);
    end;
  end;
end;

procedure TCommonCustomForm.BeginInternalDrag(Source: TObject; ABitmap: FMX_Types.TBitmap);
var
  D: TDragObject;
begin
  Fillchar(D, SizeOf(D), 0);
  D.Source := Source;
  if Source is TFmxObject then
    D.Data := TFmxObject(Source).Data;
  Platform.BeginDragDrop(Self, D, ABitmap);
end;

procedure TCommonCustomForm.BeginUpdate;
var
  I: Integer;
begin
  FUpdating := FUpdating + 1;
  for I := 0 to ChildrenCount - 1 do
    if (Children[I] is TControl) then
      TControl(FChildren[I]).BeginUpdate;
end;

procedure TCommonCustomForm.SetActiveControl(AControl: TStyledControl);
begin
  if AControl <> FActiveControl then
  begin
    FActiveControl := AControl;
    if (FActiveControl <> nil) and not(csLoading in ComponentState) then
      FActiveControl.SetFocus;
  end;
end;

{ TCustomForm }

procedure TCustomForm.InitializeNewForm;
begin
  inherited;
  AddScene(Self);
  FStyleLookup := 'backgroundstyle';
  FNeedStyleLookup := True;
  FFill := TBrush.Create(TBrushKind.bkNone, TAlphaColors.White);
  FFill.OnChanged := FillChanged;
end;

destructor TCustomForm.Destroy;
begin
  RemoveScene(Self);
  DeleteChildren;
  if FChildren <> nil then
    FreeAndNil(FChildren);
  FreeAndNil(FFill);
  inherited;
end;

// Required to force Delphi-style initialization when used from C++.
constructor TCustomForm.Create(AOwner: TComponent);
begin
  inherited;
end;

constructor TCustomForm.CreateNew(AOwner: TComponent; Dummy: Integer);
begin
  inherited;
end;

procedure TCustomForm.CreateHandle;
begin
  inherited;
  if DefaultCanvasClass <> nil then
    FCanvas := DefaultCanvasClass.CreateFromWindow(Handle, ClientWidth, ClientHeight);
end;

procedure TCustomForm.DestroyHandle;
begin
  FreeAndNil(FCanvas);
  inherited;
end;

procedure TCustomForm.DoPaint(const Canvas: TCanvas; const ARect: TRectF);
begin
  if Assigned(FOnPaint) then
    FOnPaint(Self, Canvas, ClientRect);
end;

procedure TCustomForm.Loaded;
begin
  inherited;
end;

procedure TCustomForm.AddUpdateRect(R: TRectF);
begin
  if csLoading in ComponentState then
    Exit;
  if csDestroying in ComponentState then
    Exit;
  if not IntersectRect(R, RectF(0, 0, ClientWidth, ClientHeight)) then
    Exit;
  InvalidateRect(R);
end;

procedure TCustomForm.PaintRects(const UpdateRects: array of TRectF);
var
  I, J: Integer;
  R: TRectF;
  CallOnPaint, AllowPaint: Boolean;
  State: Pointer;
begin
  if FDrawing then
    Exit;
  SetLength(FUpdateRects, Length(UpdateRects));
  Move(UpdateRects[0], FUpdateRects[0], SizeOf(FUpdateRects[0]) * Length(FUpdateRects));
  if Length(FUpdateRects) > 0 then
  begin
    FDrawing := True;
    try
      ApplyStyleLookup;
      { Split rects if rects too more }
      if (Length(FUpdateRects) > 20) then
      begin
        for I := 1 to High(FUpdateRects) do
          FUpdateRects[0] := UnionRect(FUpdateRects[0], FUpdateRects[I]);
        SetLength(FUpdateRects, 1);
      end;
      { draw back }
      if Canvas.BeginScene(@FUpdateRects) then
      try
          if (FFill.Kind = TBrushKind.bkNone) or ((FFill.Color and $FF000000 = 0) and
            (FFill.Kind = TBrushKind.bkSolid)) then
          begin
            for I := 0 to High(FUpdateRects) do
              if Transparency then
                Canvas.ClearRect(FUpdateRects[I], 0)
              else
                Canvas.ClearRect(FUpdateRects[I], FFill.Color and $FFFFFF);
          end else
          begin
            if Transparency then
              for I := 0 to High(FUpdateRects) do
                Canvas.ClearRect(FUpdateRects[I], 0);
            Canvas.Fill.Assign(FFill);
            Canvas.FillRect(RectF(-1, -1, Width + 1, Height + 1), 0, 0, AllCorners, 1);
          end;
          { children }
          CallOnPaint := False;
          for I := 0 to ChildrenCount - 1 do
            if (Children[I] is TControl) and
              ((TControl(FChildren[I]).Visible) or (not TControl(FChildren[I]).Visible and (csDesigning in ComponentState) and not TControl(FChildren[I]).Locked)) then
              with TControl(FChildren[I]) do
              begin
                if (Self.Children[I] = FResourceLink) then
                begin
                  if Self.Transparency then Continue;
                  if (Self.Fill.Kind <> TBrushKind.bkNone) then Continue;
                  if (Self.Fill.Kind = TBrushKind.bkSolid) and (Self.Fill.Color <> Fill.DefaultColor) then Continue;
                end;
                if (csDesigning in ComponentState) and not DesignVisible then
                  Continue;
                if (RectWidth(UpdateRect) = 0) or (RectHeight(UpdateRect) = 0) then
                  Continue;
                AllowPaint := False;
                if (csDesigning in ComponentState) or InPaintTo then
                  AllowPaint := True;
                if not AllowPaint then
                begin
                  R := UnionRect(ChildrenRect, UpdateRect);
                  for J := 0 to High(FUpdateRects) do
                    if IntersectRect(FUpdateRects[J], R) then
                    begin
                      AllowPaint := True;
                      Break;
                    end;
                end;
                if AllowPaint then
                begin
                  if not HasAfterPaintEffect then
                    ApplyEffect;
                  Painting;
                  DoPaint;
                  AfterPaint;
                  if HasAfterPaintEffect then
                    ApplyEffect;
                end;
                { Call OnPaint after style painted }
                if (Self.Children[I] = FResourceLink) then
                begin
                  Self.Canvas.SetMatrix(IdentityMatrix);
                  Self.DoPaint(Self.Canvas, ClientRect);
                  CallOnPaint := True;
                end;
              end;
          { Call OnPaint if style not loaded }
          if not CallOnPaint then
          begin
            Canvas.SetMatrix(IdentityMatrix);
            DoPaint(Canvas, ClientRect);
          end;
          { draw grid }
{$IFDEF WIN32}
          if (csDesigning in ComponentState) and (FDesigner <> nil) then
          begin
            Canvas.SetMatrix(IdentityMatrix);
            FDesigner.PaintGrid;
          end;
{$ENDIF}
      finally
        Canvas.EndScene;
      end;
      { flush buffer }
      if Canvas.Buffered then
        for I := 0 to High(FUpdateRects) do
        begin
          R := FUpdateRects[I];
          Canvas.FlushBufferRect(0, 0, ContextHandle, FUpdateRects[I]);
        end;
    finally
      SetLength(FUpdateRects, 0);
      FDrawing := False;
    end;
  end;
end;

procedure TCustomForm.Realign;
begin
  AlignObjects(Self, FMargins, FCanvas.Width, FCanvas.Height, FLastWidth, FLastHeight, FDisableAlign);
  InvalidateRect(ClientRect);
end;

procedure TCustomForm.AddObject(AObject: TFmxObject);
begin
  inherited;
  if AObject = nil then Exit;
  if AObject is TControl then
    TControl(AObject).SetNewScene(Self);
{  if (AObject is TControl) and (TControl(AObject).Align <> TAlignLayout.alNone) then
    FNeedAlign := True;}
  if (AObject is TControl) then
  begin
    TControl(AObject).RecalcOpacity;
    TControl(AObject).RecalcAbsolute;
    TControl(AObject).RecalcUpdateRect;
  end;
end;

procedure TCustomForm.Notification(AComponent: TComponent; Operation: TOperation);
begin
  inherited;
  if (Operation = opRemove) and (AComponent = FStyleBook) then
    StyleBook := nil;
end;

procedure TCustomForm.SetFill(const Value: TBrush);
begin
  FFill.Assign(Value);
end;

procedure TCustomForm.SetStyleLookup(const Value: WideString);
begin
  FStyleLookup := Value;
  FNeedStyleLookup := True;
  if not (csLoading in ComponentState) then
  begin
    ApplyStyleLookup;
  end;
end;

procedure TCustomForm.FillChanged(Sender: TObject);
begin
  SetLength(FUpdateRects, 0);
  AddUpdateRect(RectF(0, 0, ClientWidth, ClientHeight));
end;

function TCustomForm.GetCanvas: TCanvas;
begin
  Result := FCanvas;
end;

function TCustomForm.GetUpdateRectsCount: Integer;
begin
  Result := Length(FUpdateRects);
end;

function TCustomForm.GetUpdateRect(const Index: Integer): TRectF;
begin
  Result := FUpdateRects[Index];
end;

//function TCustomForm.GetImeWindowRect: TRectF;
//begin
//  if (FFocused <> nil) and (FFocused.GetObject is TControl) then
//  begin
//    Result := TControl(FFocused.GetObject).AbsoluteRect;
//  end
//  else
//    Result := inherited GetImeWindowRect;
//end;

function TCustomForm.GetStyleObject: TControl;
var
  Obj: TFmxObject;
  ResourceObject: TControl;
  S: TStream;
  StyleName: WideString;
begin
  ResourceObject := nil;
  if (FStyleLookup <> '') then
  begin
    { style }
    Obj := nil;
    if (FStyleBook <> nil) and (FStyleBook.Root <> nil) then
      Obj := TControl(FStyleBook.Root.FindStyleResource(FStyleLookup));
    if Obj = nil then
      if Application.DefaultStyles <> nil then
        Obj := TControl(Application.DefaultStyles.FindStyleResource(FStyleLookup));
    if Obj = nil then
      Obj := FMX_Types.FindStyleResource(FStyleLookup);
    if (Obj <> nil) and (Obj is TControl) then
    begin
      ResourceObject := TControl(Obj.Clone(nil));
      ResourceObject.StyleName := '';
    end;
  end;
  if (ResourceObject = nil) and (Application.DefaultStyles <> nil) then
  begin
    if FStyleLookup <> '' then
    begin
      StyleName := FStyleLookup;
      ResourceObject := TControl(FindStyleResource(StyleName));
      if ResourceObject <> nil then
        ResourceObject := TControl(ResourceObject.Clone(nil));
    end;
    if ResourceObject = nil then
    begin
      StyleName := ClassName + 'style';
      Delete(StyleName, 1, 1); // just remove T
      ResourceObject := TControl(FindStyleResource(StyleName));
      if ResourceObject <> nil then
        ResourceObject := TControl(ResourceObject.Clone(nil));
    end;
    if (ResourceObject = nil) and (Application.DefaultStyles <> nil) then
    begin
      if FStyleLookup <> '' then
      begin
        StyleName := FStyleLookup;
        ResourceObject := TControl(Application.DefaultStyles.FindStyleResource(StyleName));
        if ResourceObject <> nil then
          ResourceObject := TControl(ResourceObject.Clone(nil));
      end;
      if ResourceObject = nil then
      begin
        StyleName := ClassName + 'style';
        Delete(StyleName, 1, 1); // just remove T
        ResourceObject := TControl(Application.DefaultStyles.FindStyleResource(StyleName));
        if ResourceObject <> nil then
          ResourceObject := TControl(ResourceObject.Clone(nil))
        else
        begin
          // try parent Class
          StyleName := ClassParent.ClassName + 'style';
          Delete(StyleName, 1, 1); // just remove T
          ResourceObject := TControl(Application.DefaultStyles.FindStyleResource(StyleName));
          if ResourceObject <> nil then
            ResourceObject := TControl(ResourceObject.Clone(nil));
        end;
      end;
    end;
  end;
  Result := ResourceObject;
end;

procedure TCustomForm.ApplyStyleLookup;
var
  ResourceObject: TControl;
begin
  if FNeedStyleLookup then
  begin
    FNeedStyleLookup := False;
    ResourceObject := GetStyleObject;
    if ResourceObject <> nil then
    begin
      if FResourceLink <> nil then
      begin
        FResourceLink.Free;
        FResourceLink := nil;
      end;
      ResourceObject.Align := TAlignLayout.alContents;
      ResourceObject.DesignVisible := True;
      FResourceLink := ResourceObject;
      AddObject(ResourceObject);
      { bring to front }
      FChildren.Remove(ResourceObject);
      FChildren.Insert(0, ResourceObject);
      Realign;
      { }
      ResourceObject.Stored := False;
      ResourceObject.Lock;
    end;
  end;
end;

function TCustomForm.GetStyleBook: TStyleBook;
begin
  Result := FStyleBook;
end;

function TCustomForm.GetTransparency: Boolean;
begin
  Result := Transparency;
end;

procedure TCustomForm.UpdateStyle;
var
  i: Integer;
begin
  for i := 0 to ChildrenCount - 1 do
    Children[i].UpdateStyle;
  FNeedStyleLookup := True;
  if not (csLoading in ComponentState) and not (csDestroying in ComponentState) then
    ApplyStyleLookup;
end;

procedure TCustomForm.SetStyleBook(const Value: TStyleBook);
begin
  if FStyleBook <> Value then
  begin
    if FStyleBook <> nil then
      FStyleBook.RemoveSceneUpdater(Self);
    FStyleBook := Value;
    if FStyleBook <> nil then
      FStyleBook.AddSceneUpdater(Self);
    UpdateStyle;
  end;
end;

function TCustomForm.GetAnimatedCaret: Boolean;
begin
  Result := True;
end;

procedure TCustomForm.ResizeHandle;
begin
  inherited;
  if (Canvas <> nil) and (ClientWidth > 0) and (ClientHeight > 0) then
  begin
    Canvas.ResizeBuffer(ClientWidth, ClientHeight);
    Realign;
  end;
end;

function TCustomForm.ScreenToLocal(P: TPointF): TPointF;
begin
  Result := ScreenToClient(P);
end;

function TCustomForm.LocalToScreen(P: TPointF): TPointF;
begin
  Result := ClientToScreen(P);
end;

{ TCustomForm3D }

procedure TCustomForm3D.InitializeNewForm;
begin
  FMultisample := TMultisample.ms4Samples;
  inherited;
  FUsingDesignCamera := True;
  FFill := TAlphaColors.White;
  FLights := TList.Create;

  FDesignCameraZ := TDummy.Create(nil);
  with FDesignCameraZ do
  begin
    Tag := $FFFE;
    Locked := True;
    Stored := False;
  end;
  AddObject(FDesignCameraZ);

  FDesignCameraX := TDummy.Create(nil);
  with FDesignCameraX do
  begin
    Tag := $FFFE;
    Parent := FDesignCameraZ;
    Locked := True;
    Stored := False;
    RotationAngle.X := -20;
  end;

  FDesignCamera := TCamera.Create(nil);
  with FDesignCamera do
  begin
    Tag := $FFFE;
    Parent := FDesignCameraX;
    Locked := True;
    Stored := False;
    Position.Point := Point3D(0, 0, -20);
  end;
end;

destructor TCustomForm3D.Destroy;
begin
  FreeAndNil(FEffectBitmap);
  FLights.Free;
  DeleteChildren;
  if (FContext <> nil) then
    FreeAndNil(FContext);
  if FChildren <> nil then
    FreeAndNil(FChildren);
  inherited;
end;

// Required to force Delphi-style initialization when used from C++.
constructor TCustomForm3D.Create(AOwner: TComponent);
begin
  inherited;
end;

constructor TCustomForm3D.CreateNew(AOwner: TComponent; Dummy: Integer);
begin
  inherited;
end;

procedure TCustomForm3D.CreateHandle;
begin
  inherited;
  if DefaultContextClass <> nil then
    FContext := DefaultContextClass.CreateFromWindow(Handle, ClientWidth, ClientHeight, FMultisample, True);
end;

procedure TCustomForm3D.ResizeHandle;
begin
  inherited;
  if (Context <> nil) and (ClientWidth > 0) and (ClientHeight > 0) then
  begin
    Context.SetSize(ClientWidth, ClientHeight);
    Realign;
  end;
end;

procedure TCustomForm3D.DestroyHandle;
begin
  FreeAndNil(FContext);
  inherited;
end;

procedure TCustomForm3D.PaintRects(const UpdateRects: array of TRectF);
var
  i: Integer;
  Ver: TVertexBuffer;
  Ind: TIndexBuffer;
begin
  if Context = nil then
    Exit;
  if FDrawing then Exit;
  FDrawing := True;
  try
    if Context.BeginScene then
    try
      { set matrix and camera }
      if Camera <> nil then
        Context.SetCamera(Camera);
      { Design Camera }
      if (csDesigning in ComponentState) or FUsingDesignCamera and (FDesignCamera <> nil) then
        Context.SetCamera(FDesignCamera);
      { set states }
      Context.ResetScene;
      { start }
      Context.Clear([TClearTarget.ctColor, TClearTarget.ctDepth], FFill, 1.0, 0);
      if Assigned(FOnRender) then
        FOnRender(Self, Context);
      if FChildren <> nil then
      begin
        for i := 0 to FChildren.Count - 1 do
        begin
          if not (TFmxObject(FChildren[i]) is TControl3D) then Continue;
          if TControl3D(FChildren[i]).Visible or (not TControl3D(FChildren[i]).Visible and (csDesigning in TControl3D(FChildren[i]).ComponentState) and not TControl3D(FChildren[i]).Locked) then
          begin
            if not (TObject(FChildren[i]) is TControl3D) then
              Continue;
            if (csDesigning in ComponentState) and not TControl3D(FChildren[i]).DesignVisible then
              Continue;
            TControl3D(FChildren[i]).DoRender;
          end;
        end;
        { post-processing }
        for i := 0 to FChildren.Count - 1 do
          if (TFmxObject(FChildren[i]) is TEffect) and (TEffect(FChildren[i]).Enabled) then 
          begin
            if FEffectBitmap = nil then
              FEffectBitmap := TBitmap.Create(FContext.Width, FContext.Height);
            FEffectBitmap.Assign(Context);
            TEffect(FChildren[i]).ProcessEffect(nil, FEffectBitmap, 1);
            // create quad
            Ver := TVertexBuffer.Create([TVertexFormat.vfVertex, TVertexFormat.vfTexCoord0], 4);
            with Context.PixelToPixelPolygonOffset do
            begin
              Ver.Vertices[0] := Point3D(X, Y, 0);
              Ver.TexCoord0[0] := PointF(0.0, 0.0);
              Ver.Vertices[1] := Point3D(FEffectBitmap.Width + X, Y, 0);
              Ver.TexCoord0[1] := PointF(1.0, 0.0);
              Ver.Vertices[2] := Point3D(FEffectBitmap.Width + X, FEffectBitmap.Height + Y, 0);
              Ver.TexCoord0[2] := PointF(1.0, 1.0);
              Ver.Vertices[3] := Point3D(X, FEffectBitmap.Height + Y, 0);
              Ver.TexCoord0[3] := PointF(0.0, 1.0);
            end;
            Ind := TIndexBuffer.Create(6);
            Ind[0] := 0;
            Ind[1] := 1;
            Ind[2] := 3;
            Ind[3] := 3;
            Ind[4] := 1;
            Ind[5] := 2;
            // params
            Context.SetMatrix(IdentityMatrix3D);
            Context.SetContextState(TContextState.cs2DScene);
            Context.SetContextState(TContextState.csAllFace);
            Context.SetContextState(TContextState.csLightOff);
            Context.SetContextState(TContextState.csAlphaBlendOff);
            Context.SetContextState(TContextState.csAlphaTestOff);
            Context.SetContextState(TContextState.csZWriteOff);
            Context.SetContextState(TContextState.csZTestOff);
            Context.SetContextState(TContextState.csTexLinear);
            Context.SetContextState(TContextState.csTexReplace);
            // texture
            Context.SetTextureUnit(0, FEffectBitmap);
            // render quad
            Context.DrawTrianglesList(Ver, Ind, 1);
            Ind.Free;
            Ver.Free; 
          end;
      end;
    finally
      { buffer }
      Context.EndScene;
    end;
  finally
    { off flag }
    FDrawing := False;
  end;
end;

procedure TCustomForm3D.AddObject(AObject: TFmxObject);
begin
  inherited;
  if AObject is TControl3D then
    TControl3D(AObject).SetNewViewport(Self);
  if (csDesigning in ComponentState) and (AObject is TCamera) and (AObject.Tag <> $FFFE) then
    Camera := TCamera(AObject);
end;

procedure TCustomForm3D.RemoveObject(AObject: TFmxObject);
begin
  inherited;
  if AObject is TControl3D then
    TControl3D(AObject).SetNewViewport(nil);
end;

procedure TCustomForm3D.Notification(AComponent: TComponent; Operation: TOperation);
begin
  inherited;
  if (Operation = opRemove) and (AComponent = FCamera) then
    FCamera := nil;
end;

function TCustomForm3D.ObjectAtPoint(P: TPointF): IControl;
var
  i: Integer;
  Obj: TFmxObject;
  NewObj: IControl;
  D: TObjectAtPointData;
begin
  Result := nil;
  // first screen projection
  GlobalDistance := $FFFF;
  GlobalProjection := TProjection.pjScreen;
  for i := ChildrenCount - 1 downto 0 do
  begin
    Obj := Children[i];
    if IInterface(Obj).QueryInterface(IControl, NewObj) <> 0 then
      Continue;
    if not NewObj.GetVisible and not(csDesigning in ComponentState) then
      Continue;
    NewObj := NewObj.ObjectAtPoint(P);
    if NewObj <> nil then
      Result := NewObj;
  end;
  if Result = nil then
  begin
    // second camera projection
    GlobalDistance := $FFFF;
    GlobalProjection := TProjection.pjCamera;
    for i := ChildrenCount - 1 downto 0 do
    begin
      Obj := Children[i];
      if IInterface(Obj).QueryInterface(IControl, NewObj) <> 0 then
        Continue;
      if not NewObj.GetVisible and not(csDesigning in ComponentState) then
        Continue;
      NewObj := NewObj.ObjectAtPoint(P);
      if NewObj <> nil then
        Result := NewObj;
    end;
  end;
end;

function TCustomForm3D.FindTarget(P: TPointF; const Data: TDragObject): IControl;
var
  i: Integer;
  Obj: TFmxObject;
  NewObj: IControl;
begin
  Result := nil;
  // first screen projection
  GlobalDistance := $FFFF;
  GlobalProjection := TProjection.pjScreen;
  for i := ChildrenCount - 1 downto 0 do
  begin
    Obj := Children[i];
    if IInterface(Obj).QueryInterface(IControl, NewObj) <> 0 then
      Continue;
    if not NewObj.Visible then Continue;
    NewObj := NewObj.FindTarget(P, Data);
    if NewObj <> nil then
      Result := NewObj;
  end;
  if Result = nil then
  begin
    // second camera projection
    GlobalDistance := $FFFF;
    GlobalProjection := TProjection.pjCamera;
    for i := ChildrenCount - 1 downto 0 do
    begin
      Obj := Children[i];
      if IInterface(Obj).QueryInterface(IControl, NewObj) <> 0 then
        Continue;
      if not NewObj.Visible then Continue;
      NewObj := NewObj.FindTarget(P, Data);
      if NewObj <> nil then
        Result := NewObj;
    end;
  end;
end;

function TCustomForm3D.GetFill: TAlphaColor;
begin
  Result := FFill;
end;

procedure TCustomForm3D.SetFill(const Value: TAlphaColor);
begin
  if FFill <> Value then
  begin
    FFill := Value;
    NeedRender;
  end;
end;

function TCustomForm3D.ScreenToLocal(P: TPointF): TPointF;
begin
  Result := ScreenToClient(P);
end;

function TCustomForm3D.LocalToScreen(P: TPointF): TPointF;
begin
  Result := ClientToScreen(P);
end;

procedure TCustomForm3D.SetMultisample(const Value: TMultisample);
begin
  if FMultisample <> Value then
  begin
    FMultisample := Value;
    Recreate;
  end;
end;

{ IViewport3D }

function TCustomForm3D.GetObject: TFmxObject;
begin
  Result := Self;
end;

function TCustomForm3D.GetContext: TContext3D;
begin
  Result := FContext;
end;

function TCustomForm3D.GetScene: IScene;
begin
  Result := nil;
end;

function TCustomForm3D.GetDesignCamera: TCamera;
begin
  Result := FDesignCamera;
end;

procedure TCustomForm3D.SetDesignCamera(const ACamera: TCamera);
begin
  FDesignCamera := ACamera;
end;

procedure TCustomForm3D.NeedRender;
begin
  InvalidateRect(RectF(0, 0, ClientWidth, FContext.Height)); // because is a HW context
end;

procedure TCustomForm3D.Realign;
begin
  AlignObjects(Self, FMargins, FContext.Width, FContext.Height, FLastWidth, FLastHeight, FDisableAlign);
  InvalidateRect(ClientRect);
end;

constructor TScreen.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  // Let VCL manage datamodules if it is around
  if (not Assigned(Classes.AddDataModule))
    and (not Assigned(Classes.RemoveDataModule)) then
  begin
    Classes.AddDataModule := AddDataModule;
    Classes.RemoveDataModule := RemoveDataModule;
    FManagingDataModules := True
  end
  else
    FManagingDataModules := False;

  FForms := TList.Create;
  FDataModules := TList.Create;
end;

procedure TScreen.AddDataModule(DataModule: TDataModule);
begin
  FDataModules.Add(DataModule);
end;

procedure TScreen.AddForm(AForm: TCommonCustomForm);

  function FindUniqueFormName(const Name: WideString): WideString;
  var
    I: Integer;
  begin
    I := 0;
    Result := Name;
    while FindGlobalComponent(Result) <> nil do
    begin
      Inc(I);
      Result := Format('%s_%d', [Name, I]);
    end;
  end;

begin
  if Length(AForm.Name) = 0 then
    AForm.Name := FindUniqueFormName('form')
  else
    AForm.Name := FindUniqueFormName(AForm.Name);
  FForms.Add(AForm);
end;

procedure TScreen.RemoveDataModule(DataModule: TDataModule);
begin
  FDataModules.Remove(DataModule);
end;

procedure TScreen.RemoveForm(AForm: TCommonCustomForm);
begin
  FForms.Remove(AForm);
end;

function TScreen.GetDataModule(Index: Integer): TDataModule;
begin
  Result := TDataModule(FDataModules[Index]);
end;

function TScreen.GetDataModuleCount: Integer;
begin
  Result := FDataModules.Count;
end;

function TScreen.GetForm(Index: Integer): TCommonCustomForm;
begin
  Result := TCommonCustomForm(FForms[Index]);
end;

function TScreen.GetFormCount: Integer;
begin
  Result := FForms.Count;
end;

destructor TScreen.Destroy;
var
  I: Integer;
begin
  FreeAndNil(FDataModules);
  FreeAndNil(FForms);

  if FManagingDataModules then
  begin
    Classes.AddDataModule := nil;
    Classes.RemoveDataModule := nil;
  end;

  inherited Destroy;
end;

function FindGlobalComponent(const Name: string): TComponent;
var
  I: Integer;
begin
  for I := 0 to Screen.FormCount - 1 do
  begin
    Result := Screen.Forms[I];
    if not (csInline in Result.ComponentState) and
      (CompareText(Name, Result.Name) = 0) then Exit;
  end;
  for I := 0 to Screen.DataModuleCount - 1 do
  begin
    Result := Screen.DataModules[I];
    if CompareText(Name, Result.Name) = 0 then Exit;
  end;
  Result := nil;
end;

initialization
  RegisterFmxClasses([TApplication], [TApplication]);
  Screen := TScreen.Create(nil);
  Platform := PlatformClass.Create(nil);
  Classes.RegisterFindGlobalComponentProc(FindGlobalComponent);

finalization
  Classes.UnregisterFindGlobalComponentProc(FindGlobalComponent);
  FreeAndNil(Screen);
  // Platform global is freed in FMX_Types
end.



