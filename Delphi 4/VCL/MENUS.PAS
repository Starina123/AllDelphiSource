
{*******************************************************}
{                                                       }
{       Borland Delphi Visual Component Library         }
{                                                       }
{       Copyright (c) 1995,98 Inprise Corporation       }
{                                                       }
{*******************************************************}

unit Menus;

{$S-,W-,R-}
{$C PRELOAD}

interface

uses Windows, SysUtils, Classes, Messages, Graphics, ImgList, ActnList;

type
  TMenuItem = class;

  EMenuError = class(Exception);
  TMenu = class;
  TMenuBreak = (mbNone, mbBreak, mbBarBreak);
  TMenuChangeEvent = procedure (Sender: TObject; Source: TMenuItem; Rebuild: Boolean) of object;
  TMenuDrawItemEvent = procedure (Sender: TObject; ACanvas: TCanvas;
    ARect: TRect; Selected: Boolean) of object;
  TMenuMeasureItemEvent = procedure (Sender: TObject; ACanvas: TCanvas;
    var Width, Height: Integer) of object;

{ TMenuActionLink }

  TMenuActionLink = class(TActionLink)
  protected
    FClient: TMenuItem;
    procedure AssignClient(AClient: TObject); override;
    function IsCaptionLinked: Boolean; override;
    function IsCheckedLinked: Boolean; override;
    function IsEnabledLinked: Boolean; override;
    function IsHelpContextLinked: Boolean; override;
    function IsHintLinked: Boolean; override;
    function IsImageIndexLinked: Boolean; override;
    function IsShortCutLinked: Boolean; override;
    function IsVisibleLinked: Boolean; override;
    function IsOnExecuteLinked: Boolean; override;
    procedure SetCaption(const Value: string); override;
    procedure SetChecked(Value: Boolean); override;
    procedure SetEnabled(Value: Boolean); override;
    procedure SetHelpContext(Value: THelpContext); override;
    procedure SetHint(const Value: string); override;
    procedure SetImageIndex(Value: Integer); override;
    procedure SetShortCut(Value: TShortCut); override;
    procedure SetVisible(Value: Boolean); override;
    procedure SetOnExecute(Value: TNotifyEvent); override;
  end;

  TMenuActionLinkClass = class of TMenuActionLink;

{ TMenuItem }

  TMenuItem = class(TComponent)
  private
    FCaption: string;
    FHandle: HMENU;
    FChecked: Boolean;
    FEnabled: Boolean;
    FDefault: Boolean;
    FRadioItem: Boolean;
    FVisible: Boolean;
    FGroupIndex: Byte;
    FImageIndex: Integer;
    FActionLink: TMenuActionLink;
    FBreak: TMenuBreak;
    FBitmap: TBitmap;
    FCommand: Word;
    FHelpContext: THelpContext;
    FHint: string;
    FItems: TList;
    FShortCut: TShortCut;
    FParent: TMenuItem;
    FMerged: TMenuItem;
    FMergedWith: TMenuItem;
    FMenu: TMenu;
    FStreamedRebuild: Boolean;
    FOnChange: TMenuChangeEvent;
    FOnClick: TNotifyEvent;
    FOnDrawItem: TMenuDrawItemEvent;
    FOnMeasureItem: TMenuMeasureItemEvent;
    procedure AppendTo(Menu: HMENU; ARightToLeft: Boolean);
    procedure DoActionChange(Sender: TObject);
    procedure ReadShortCutText(Reader: TReader);
    procedure MergeWith(Menu: TMenuItem);
    procedure RebuildHandle;
    procedure PopulateMenu;
    procedure SubItemChanged(Sender: TObject; Source: TMenuItem; Rebuild: Boolean);
    procedure TurnSiblingsOff;
    procedure WriteShortCutText(Writer: TWriter);
    procedure VerifyGroupIndex(Position: Integer; Value: Byte);
    function GetAction: TBasicAction;
    function GetBitmap: TBitmap;
    procedure SetAction(Value: TBasicAction);
    procedure SetBitmap(Value: TBitmap);
    procedure InitiateActions;
    function IsCaptionStored: Boolean;
    function IsCheckedStored: Boolean;
    function IsEnabledStored: Boolean;
    function IsHelpContextStored: Boolean;
    function IsHintStored: Boolean;
    function IsImageIndexStored: Boolean;
    function IsOnClickStored: Boolean;
    function IsShortCutStored: Boolean;
    function IsVisibleStored: Boolean;
  protected
    procedure ActionChange(Sender: TObject; CheckDefaults: Boolean); dynamic;
    procedure AssignTo(Dest: TPersistent); override;
    procedure DefineProperties(Filer: TFiler); override;
    procedure DoDrawText(ACanvas: TCanvas; const ACaption: string;
      var Rect: TRect; Selected: Boolean; Flags: Longint);
    procedure DrawItem(ACanvas: TCanvas; ARect: TRect; Selected: Boolean); virtual;
    function GetActionLinkClass: TMenuActionLinkClass; dynamic;
    function GetHandle: HMENU;
    function GetCount: Integer;
    procedure GetChildren(Proc: TGetChildProc; Root: TComponent); override;
    function GetItem(Index: Integer): TMenuItem;
    function GetMenuIndex: Integer;
    procedure MeasureItem(ACanvas: TCanvas; var Width, Height: Integer);
    procedure MenuChanged(Rebuild: Boolean); virtual;
    procedure Loaded; override;
    procedure Notification(AComponent: TComponent;
      Operation: TOperation); override;
    procedure SetBreak(Value: TMenuBreak);
    procedure SetCaption(const Value: string);
    procedure SetChecked(Value: Boolean);
    procedure SetChildOrder(Child: TComponent; Order: Integer); override;
    procedure SetDefault(Value: Boolean);
    procedure SetEnabled(Value: Boolean);
    procedure SetGroupIndex(Value: Byte);
    procedure SetImageIndex(Value: Integer);
    procedure SetMenuIndex(Value: Integer);
    procedure SetParentComponent(Value: TComponent); override;
    procedure SetRadioItem(Value: Boolean);
    procedure SetShortCut(Value: TShortCut);
    procedure SetVisible(Value: Boolean);
    property ActionLink: TMenuActionLink read FActionLink write FActionLink;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure InitiateAction; virtual;
    procedure Insert(Index: Integer; Item: TMenuItem);
    procedure Delete(Index: Integer);
    procedure Click; virtual;
    function IndexOf(Item: TMenuItem): Integer;
    function GetParentComponent: TComponent; override;
    function GetParentMenu: TMenu;
    function HasParent: Boolean; override;
    procedure Add(Item: TMenuItem);
    procedure Remove(Item: TMenuItem);
    property Command: Word read FCommand;
    property Handle: HMENU read GetHandle;
    property Count: Integer read GetCount;
    property Items[Index: Integer]: TMenuItem read GetItem; default;
    property MenuIndex: Integer read GetMenuIndex write SetMenuIndex;
    property Parent: TMenuItem read FParent;
  published
    property Action: TBasicAction read GetAction write SetAction;
    property Bitmap: TBitmap read GetBitmap write SetBitmap;
    property Break: TMenuBreak read FBreak write SetBreak default mbNone;
    property Caption: string read FCaption write SetCaption stored IsCaptionStored;
    property Checked: Boolean read FChecked write SetChecked stored IsCheckedStored default False;
    property Default: Boolean read FDefault write SetDefault default False;
    property Enabled: Boolean read FEnabled write SetEnabled stored IsEnabledStored default True;
    property GroupIndex: Byte read FGroupIndex write SetGroupIndex default 0;
    property HelpContext: THelpContext read FHelpContext write FHelpContext stored IsHelpContextStored default 0;
    property Hint: string read FHint write FHint stored IsHintStored;
    property ImageIndex: Integer read FImageIndex write SetImageIndex stored IsImageIndexStored default -1;
    property RadioItem: Boolean read FRadioItem write SetRadioItem default False;
    property ShortCut: TShortCut read FShortCut write SetShortCut stored IsShortCutStored default 0;
    property Visible: Boolean read FVisible write SetVisible stored IsVisibleStored default True;
    property OnClick: TNotifyEvent read FOnClick write FOnClick stored IsOnClickStored;
    property OnDrawItem: TMenuDrawItemEvent read FOnDrawItem write FOnDrawItem;
    property OnMeasureItem: TMenuMeasureItemEvent read FOnMeasureItem write FOnMeasureItem;
  end;

  TFindItemKind = (fkCommand, fkHandle, fkShortCut);

  TMenu = class(TComponent)
  private
    FBiDiMode: TBiDiMode;
    FItems: TMenuItem;
    FWindowHandle: HWND;
    FMenuImage: string;
    FOwnerDraw: Boolean;
    FParentBiDiMode: Boolean;
    FImageChangeLink: TChangeLink;
    FImages: TCustomImageList;
    FOnChange: TMenuChangeEvent;
    procedure SetBiDiMode(Value: TBiDiMode);
    procedure SetOwnerDraw(Value: Boolean);
    procedure SetImages(Value: TCustomImageList);
    procedure SetParentBiDiMode(Value: Boolean);
    procedure SetWindowHandle(Value: HWND);
    procedure ImageListChange(Sender: TObject);
    function IsBiDiModeStored: Boolean;
    function UpdateImage: Boolean;
  protected
    procedure AdjustBiDiBehavior;
    procedure DoChange(Source: TMenuItem; Rebuild: Boolean); virtual;
    procedure DoBiDiModeChanged;
    function DoGetMenuString(Menu: HMENU; ItemID: UINT; Str: PChar;
      MaxCount: Integer; Flag: UINT): Integer;
    procedure GetChildren(Proc: TGetChildProc; Root: TComponent); override;
    function GetHandle: HMENU; virtual;
    function IsOwnerDraw: Boolean;
    procedure Loaded; override;
    procedure MenuChanged(Sender: TObject; Source: TMenuItem; Rebuild: Boolean); virtual;
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
    procedure SetChildOrder(Child: TComponent; Order: Integer); override;
    procedure UpdateItems;
    property OnChange: TMenuChangeEvent read FOnChange write FOnChange;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function DispatchCommand(ACommand: Word): Boolean;
    function DispatchPopup(AHandle: HMENU): Boolean;
    function FindItem(Value: Integer; Kind: TFindItemKind): TMenuItem;
    function GetHelpContext(Value: Integer; ByCommand: Boolean): THelpContext;
    property Images: TCustomImageList read FImages write SetImages;
    function IsRightToLeft: Boolean;
    function IsShortCut(var Message: TWMKey): Boolean; dynamic;
    procedure ParentBiDiModeChanged; overload;
    procedure ParentBiDiModeChanged(AControl: TObject); overload;
    procedure ProcessMenuChar(var Message: TWMMenuChar);
    property BiDiMode: TBiDiMode read FBiDiMode write SetBiDiMode stored IsBiDiModeStored;
    property Handle: HMENU read GetHandle;
    property OwnerDraw: Boolean read FOwnerDraw write SetOwnerDraw default False;
    property ParentBiDiMode: Boolean read FParentBiDiMode write SetParentBiDiMode default True;
    property WindowHandle: HWND read FWindowHandle write SetWindowHandle;
  published
    property Items: TMenuItem read FItems;
  end;

  TMainMenu = class(TMenu)
  private
    FOle2Menu: HMENU;
    FAutoMerge: Boolean;
    procedure ItemChanged;
    procedure SetAutoMerge(Value: Boolean);
  protected
    procedure MenuChanged(Sender: TObject; Source: TMenuItem; Rebuild: Boolean); override;
    function GetHandle: HMENU; override;
  public
    procedure Merge(Menu: TMainMenu);
    procedure Unmerge(Menu: TMainMenu);
    procedure PopulateOle2Menu(SharedMenu: HMenu; Groups: array of Integer;
      var Widths: array of Longint);
    procedure GetOle2AcceleratorTable(var AccelTable: HAccel;
      var AccelCount: Integer; Groups: array of Integer);
    procedure SetOle2MenuHandle(Handle: HMENU);
  published
    property AutoMerge: Boolean read FAutoMerge write SetAutoMerge default False;
    property BiDiMode;
    property Images;
    property OwnerDraw;
    property ParentBiDiMode;
    property OnChange;
  end;

  TPopupAlignment = (paLeft, paRight, paCenter);
  TTrackButton = (tbRightButton, tbLeftButton);

  TPopupMenu = class(TMenu)
  private
    FPopupPoint: TPoint;
    FAlignment: TPopupAlignment;
    FAutoPopup: Boolean;
    FPopupComponent: TComponent;
    FTrackButton: TTrackButton;
    FOnPopup: TNotifyEvent;
    procedure DoPopup(Item: TObject);
    function GetHelpContext: THelpContext;
    procedure SetHelpContext(Value: THelpContext);
    procedure SetBiDiModeFromPopupControl;
  protected
    function UseRightToLeftAlignment: Boolean;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Popup(X, Y: Integer); virtual;
    property PopupComponent: TComponent read FPopupComponent write FPopupComponent;
    property TrackButton: TTrackButton read FTrackButton write FTrackButton default tbRightButton;
  published
    property Alignment: TPopupAlignment read FAlignment write FAlignment default paLeft;
    property AutoPopup: Boolean read FAutoPopup write FAutoPopup default True;
    property BiDiMode;
    property HelpContext: THelpContext read GetHelpContext write SetHelpContext default 0;
    property Images;
    property OwnerDraw;
    property ParentBiDiMode;
    property OnChange;
    property OnPopup: TNotifyEvent read FOnPopup write FOnPopup;
  end;

function ShortCut(Key: Word; Shift: TShiftState): TShortCut;
procedure ShortCutToKey(ShortCut: TShortCut; var Key: Word; var Shift: TShiftState);
function ShortCutToText(ShortCut: TShortCut): string;
function TextToShortCut(Text: string): TShortCut;

function NewMenu(Owner: TComponent; const AName: string; Items: array of TMenuItem): TMainMenu;
function NewPopupMenu(Owner: TComponent; const AName: string;
  Alignment: TPopupAlignment; AutoPopup: Boolean; Items: array of TMenuitem): TPopupMenu;
function NewSubMenu(const ACaption: string; hCtx: Word;
  const AName: string; Items: array of TMenuItem; AEnabled: Boolean = True): TMenuItem;
function NewItem(const ACaption: string; AShortCut: TShortCut;
  AChecked, AEnabled: Boolean; AOnClick: TNotifyEvent; hCtx: Word;
  const AName: string): TMenuItem;
function NewLine: TMenuItem;

{ StripHotkey removes the & escape char that marks the hotkey character in the
  string.  When the current locale is a Far East locale, this function also
  looks for and removes parens around the hotkey, common in Far East locales. }

function StripHotKey(const Text: string): string;

implementation

uses Controls, Forms, Consts;

const
  RightToLeftMenuFlag = MFT_RIGHTORDER or MFT_RIGHTJUSTIFY;

function FindPopupControl(const Pos: TPoint): TControl;
var
  Window: TWinControl;
begin
  Result := nil;
  Window := FindVCLWindow(Pos);
  if Window <> nil then
  begin
    Result := Window.ControlAtPos(Pos, False);
    if Result = nil then Result := Window;
  end;
end;

procedure Error(const S: string);
begin
  raise EMenuError.Create(S);
end;

procedure IndexError;
begin
  Error(SMenuIndexError);
end;

{ TShortCut processing routines }

function ShortCut(Key: Word; Shift: TShiftState): TShortCut;
begin
  Result := 0;
  if WordRec(Key).Hi <> 0 then Exit;
  Result := Key;
  if ssShift in Shift then Inc(Result, scShift);
  if ssCtrl in Shift then Inc(Result, scCtrl);
  if ssAlt in Shift then Inc(Result, scAlt);
end;

procedure ShortCutToKey(ShortCut: TShortCut; var Key: Word; var Shift: TShiftState);
begin
  Key := ShortCut and not (scShift + scCtrl + scAlt);
  Shift := [];
  if ShortCut and scShift <> 0 then Include(Shift, ssShift);
  if ShortCut and scCtrl <> 0 then Include(Shift, ssCtrl);
  if ShortCut and scAlt <> 0 then Include(Shift, ssAlt);
end;

type
  TMenuKeyCap = (mkcBkSp, mkcTab, mkcEsc, mkcEnter, mkcSpace, mkcPgUp,
    mkcPgDn, mkcEnd, mkcHome, mkcLeft, mkcUp, mkcRight, mkcDown, mkcIns,
    mkcDel, mkcShift, mkcCtrl, mkcAlt);

var
  MenuKeyCaps: array[TMenuKeyCap] of string = (
    SmkcBkSp, SmkcTab, SmkcEsc, SmkcEnter, SmkcSpace, SmkcPgUp,
    SmkcPgDn, SmkcEnd, SmkcHome, SmkcLeft, SmkcUp, SmkcRight,
    SmkcDown, SmkcIns, SmkcDel, SmkcShift, SmkcCtrl, SmkcAlt);

function GetSpecialName(ShortCut: TShortCut): string;
var
  ScanCode: Integer;
  KeyName: array[0..255] of Char;
begin
  Result := '';
  ScanCode := MapVirtualKey(WordRec(ShortCut).Lo, 0) shl 16;
  if ScanCode <> 0 then
  begin
    GetKeyNameText(ScanCode, KeyName, SizeOf(KeyName));
    if (KeyName[1] = #0) and (KeyName[0] <> #0) then
      GetSpecialName := KeyName;
  end;
end;

function ShortCutToText(ShortCut: TShortCut): string;
var
  Name: string;
begin
  case WordRec(ShortCut).Lo of
    $08, $09:
      Name := MenuKeyCaps[TMenuKeyCap(Ord(mkcBkSp) + WordRec(ShortCut).Lo - $08)];
    $0D: Name := MenuKeyCaps[mkcEnter];
    $1B: Name := MenuKeyCaps[mkcEsc];
    $20..$28:
      Name := MenuKeyCaps[TMenuKeyCap(Ord(mkcSpace) + WordRec(ShortCut).Lo - $20)];
    $2D..$2E:
      Name := MenuKeyCaps[TMenuKeyCap(Ord(mkcIns) + WordRec(ShortCut).Lo - $2D)];
    $30..$39: Name := Chr(WordRec(ShortCut).Lo - $30 + Ord('0'));
    $41..$5A: Name := Chr(WordRec(ShortCut).Lo - $41 + Ord('A'));
    $60..$69: Name := Chr(WordRec(ShortCut).Lo - $60 + Ord('0'));
    $70..$87: Name := 'F' + IntToStr(WordRec(ShortCut).Lo - $6F);
  else
    Name := GetSpecialName(ShortCut);
  end;
  if Name <> '' then
  begin
    Result := '';
    if ShortCut and scShift <> 0 then Result := Result + MenuKeyCaps[mkcShift];
    if ShortCut and scCtrl <> 0 then Result := Result + MenuKeyCaps[mkcCtrl];
    if ShortCut and scAlt <> 0 then Result := Result + MenuKeyCaps[mkcAlt];
    Result := Result + Name;
  end
  else Result := '';
end;

{ This function is *very* slow.  Use sparingly.  Return 0 if no VK code was
  found for the text }

function TextToShortCut(Text: string): TShortCut;

  { If the front of Text is equal to Front then remove the matching piece
    from Text and return True, otherwise return False }

  function CompareFront(var Text: string; const Front: string): Boolean;
  begin
    Result := False;
    if (Length(Text) >= Length(Front)) and
      (AnsiStrLIComp(PChar(Text), PChar(Front), Length(Front)) = 0) then
    begin
      Result := True;
      Delete(Text, 1, Length(Front));
    end;
  end;

var
  Key: TShortCut;
  Shift: TShortCut;
begin
  Result := 0;
  Shift := 0;
  while True do
  begin
    if CompareFront(Text, MenuKeyCaps[mkcShift]) then Shift := Shift or scShift
    else if CompareFront(Text, '^') then Shift := Shift or scCtrl
    else if CompareFront(Text, MenuKeyCaps[mkcCtrl]) then Shift := Shift or scCtrl
    else if CompareFront(Text, MenuKeyCaps[mkcAlt]) then Shift := Shift or scAlt
    else Break;
  end;
  if Text = '' then Exit;
  for Key := $08 to $255 do { Copy range from table in ShortCutToText }
    if AnsiCompareText(Text, ShortCutToText(Key)) = 0 then
    begin
      Result := Key or Shift;
      Exit;
    end;
end;

{ Menu command managment }

var
  CommandPool: TBits;

function UniqueCommand: Word;
begin
  Result := CommandPool.OpenBit;
  CommandPool[Result] := True;
end;

{ Used to populate or merge menus }

procedure IterateMenus(Func: Pointer; Menu1, Menu2: TMenuItem);
var
  I, J: Integer;
  IIndex, JIndex: Byte;
  Menu1Size, Menu2Size: Integer;
  Done: Boolean;

  function Iterate(var I: Integer; MenuItem: TMenuItem; AFunc: Pointer): Boolean;
  var
    Item: TMenuItem;
  begin
    if MenuItem = nil then Exit;
    Result := False;
    while not Result and (I < MenuItem.Count) do
    begin
      Item := MenuItem[I];
      if Item.GroupIndex > IIndex then Break;
      asm
                MOV     EAX,Item
                MOV     EDX,[EBP+8]
                PUSH    DWORD PTR [EDX]
                CALL    DWORD PTR AFunc
                ADD     ESP,4
                MOV     Result,AL
      end;
      Inc(I);
    end;
  end;

begin
  I := 0;
  J := 0;
  Menu1Size := 0;
  Menu2Size := 0;
  if Menu1 <> nil then Menu1Size := Menu1.Count;
  if Menu2 <> nil then Menu2Size := Menu2.Count;
  Done := False;
  while not Done and ((I < Menu1Size) or (J < Menu2Size)) do
  begin
    IIndex := High(Byte);
    JIndex := High(Byte);
    if (I < Menu1Size) then IIndex := Menu1[I].GroupIndex;
    if (J < Menu2Size) then JIndex := Menu2[J].GroupIndex;
    if IIndex <= JIndex then Done := Iterate(I, Menu1, Func)
    else
    begin
      IIndex := JIndex;
      Done := Iterate(J, Menu2, Func);
    end;
    while (I < Menu1Size) and (Menu1[I].GroupIndex <= IIndex) do Inc(I);
    while (J < Menu2Size) and (Menu2[J].GroupIndex <= IIndex) do Inc(J);
  end;
end;

{ TMenuActionLink }

procedure TMenuActionLink.AssignClient(AClient: TObject);
begin
  FClient := AClient as TMenuItem;
end;

function TMenuActionLink.IsCaptionLinked: Boolean;
begin
  Result := inherited IsCaptionLinked and
    (FClient.Caption = (Action as TCustomAction).Caption);
end;

function TMenuActionLink.IsCheckedLinked: Boolean;
begin
  Result := inherited IsCheckedLinked and
    (FClient.Checked = (Action as TCustomAction).Checked);
end;

function TMenuActionLink.IsEnabledLinked: Boolean;
begin
  Result := inherited IsEnabledLinked and
    (FClient.Enabled = (Action as TCustomAction).Enabled);
end;

function TMenuActionLink.IsHelpContextLinked: Boolean;
begin
  Result := inherited IsHelpContextLinked and
    (FClient.HelpContext = (Action as TCustomAction).HelpContext);
end;

function TMenuActionLink.IsHintLinked: Boolean;
begin
  Result := inherited IsHintLinked and
    (FClient.Hint = (Action as TCustomAction).Hint);
end;

function TMenuActionLink.IsImageIndexLinked: Boolean;
begin
  Result := inherited IsImageIndexLinked and
    (FClient.ImageIndex = (Action as TCustomAction).ImageIndex);
end;

function TMenuActionLink.IsShortCutLinked: Boolean;
begin
  Result := inherited IsShortCutLinked and
    (FClient.ShortCut = (Action as TCustomAction).ShortCut);
end;

function TMenuActionLink.IsVisibleLinked: Boolean;
begin
  Result := inherited IsVisibleLinked and
    (FClient.Visible = (Action as TCustomAction).Visible);
end;

function TMenuActionLink.IsOnExecuteLinked: Boolean;
begin
  Result := inherited IsOnExecuteLinked and
    (@FClient.OnClick = @Action.OnExecute);
end;

procedure TMenuActionLink.SetCaption(const Value: string);
begin
  if IsCaptionLinked then FClient.Caption := Value;
end;

procedure TMenuActionLink.SetChecked(Value: Boolean);
begin
  if IsCheckedLinked then FClient.Checked := Value;
end;

procedure TMenuActionLink.SetEnabled(Value: Boolean);
begin
  if IsEnabledLinked then FClient.Enabled := Value;
end;

procedure TMenuActionLink.SetHelpContext(Value: THelpContext);
begin
  if IsHelpContextLinked then FClient.HelpContext := Value;
end;

procedure TMenuActionLink.SetHint(const Value: string);
begin
  if IsHintLinked then FClient.Hint := Value;
end;

procedure TMenuActionLink.SetImageIndex(Value: Integer);
begin
  if IsImageIndexLinked then FClient.ImageIndex := Value;
end;

procedure TMenuActionLink.SetShortCut(Value: TShortCut);
begin
  if IsShortCutLinked then FClient.ShortCut := Value;
end;

procedure TMenuActionLink.SetVisible(Value: Boolean);
begin
  if IsVisibleLinked then FClient.Visible := Value;
end;

procedure TMenuActionLink.SetOnExecute(Value: TNotifyEvent);
begin
  if IsOnExecuteLinked then FClient.OnClick := Value;
end;

{ TMenuItem }

constructor TMenuItem.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FVisible := True;
  FEnabled := True;
  FCommand := UniqueCommand;
  FImageIndex := -1;
end;

destructor TMenuItem.Destroy;
begin
  if FParent <> nil then
  begin
    FParent.Remove(Self);
    FParent := nil;
  end;
  while Count > 0 do Items[0].Free;
  if FHandle <> 0 then
  begin
    MergeWith(nil);
    DestroyMenu(FHandle);
  end;
  FItems.Free;
  FActionLink.Free;
  FActionLink := nil;
  if FCommand <> 0 then CommandPool[FCommand] := False;
  if Assigned(FBitmap) then FBitmap.Free;
  inherited Destroy;
end;

const
  Checks: array[Boolean] of DWORD = (MF_UNCHECKED, MF_CHECKED);
  Enables: array[Boolean] of DWORD = (MF_DISABLED or MF_GRAYED, MF_ENABLED);
  Breaks: array[TMenuBreak] of DWORD = (0, MF_MENUBREAK, MF_MENUBARBREAK);
  Separators: array[Boolean] of DWORD = (MF_STRING, MF_SEPARATOR);

procedure TMenuItem.AppendTo(Menu: HMENU; ARightToLeft: Boolean);
const
  IBreaks: array[TMenuBreak] of DWORD = (MFT_STRING, MFT_MENUBREAK, MFT_MENUBARBREAK);
  IChecks: array[Boolean] of DWORD = (MFS_UNCHECKED, MFS_CHECKED);
  IDefaults: array[Boolean] of DWORD = (0, MFS_DEFAULT);
  IEnables: array[Boolean] of DWORD = (MFS_DISABLED or MFS_GRAYED, MFS_ENABLED);
  IRadios: array[Boolean] of DWORD = (MFT_STRING, MFT_RADIOCHECK);
  ISeparators: array[Boolean] of DWORD = (MFT_STRING, MFT_SEPARATOR);
  IRTL: array[Boolean] of DWORD = (0, RightToLeftMenuFlag);
  IOwnerDraw: array[Boolean] of DWORD = (MFT_STRING, MFT_OWNERDRAW);
var
  MenuItemInfo: TMenuItemInfo;
  Caption: string;
  NewFlags: Integer;
  IsOwnerDraw: Boolean;
  ParentMenu: TMenu;
begin
  if FVisible then
  begin
    Caption := FCaption;
    if GetCount > 0 then MenuItemInfo.hSubMenu := GetHandle
    else if (FShortCut <> scNone) and ((Parent = nil) or
      (Parent.Parent <> nil) or not (Parent.Owner is TMainMenu)) then
      Caption := Caption + #9 + ShortCutToText(FShortCut);
    if Lo(GetVersion) >= 4 then
    begin
      MenuItemInfo.cbSize := 44; // Required for Windows 95
      MenuItemInfo.fMask := MIIM_CHECKMARKS or MIIM_DATA or MIIM_ID or
        MIIM_STATE or MIIM_SUBMENU or MIIM_TYPE;
      ParentMenu := GetParentMenu;
      IsOwnerDraw := Assigned(ParentMenu) and ParentMenu.IsOwnerDraw or
        Assigned(FBitmap) and not FBitmap.Empty;
      MenuItemInfo.fType := IRadios[FRadioItem] or IBreaks[FBreak] or
        ISeparators[FCaption = '-'] or IRTL[ARightToLeft] or
        IOwnerDraw[IsOwnerDraw];
      MenuItemInfo.fState := IChecks[FChecked] or IEnables[FEnabled]
        or IDefaults[FDefault];
      MenuItemInfo.wID := Command;
      MenuItemInfo.hSubMenu := 0;
      MenuItemInfo.hbmpChecked := 0;
      MenuItemInfo.hbmpUnchecked := 0;
      MenuItemInfo.dwTypeData := PChar(Caption);
      if GetCount > 0 then MenuItemInfo.hSubMenu := GetHandle;
      InsertMenuItem(Menu, DWORD(-1), True, MenuItemInfo);
    end
    else
    begin
      NewFlags := Breaks[FBreak] or Checks[FChecked] or Enables[FEnabled] or
        Separators[FCaption = '-'] or MF_BYPOSITION;
      if GetCount > 0 then
        InsertMenu(Menu, DWORD(-1), MF_POPUP or NewFlags, GetHandle,
          PChar(FCaption))
      else
        InsertMenu(Menu, DWORD(-1), NewFlags, Command, PChar(Caption));
    end;
  end;
end;

procedure TMenuItem.PopulateMenu;
var 
  MenuRightToLeft: Boolean;
    
  function AddIn(MenuItem: TMenuItem): Boolean;
  begin
    MenuItem.AppendTo(FHandle, MenuRightToLeft);
    Result := False;
  end;

begin    // all menu items use BiDiMode of their root menu
  MenuRightToLeft := (FMenu <> nil) and FMenu.IsRightToLeft;
  IterateMenus(@AddIn, FMerged, Self);
end;

procedure TMenuItem.ReadShortCutText(Reader: TReader);
begin
  ShortCut := TextToShortCut(Reader.ReadString);
end;

procedure TMenuItem.MergeWith(Menu: TMenuItem);
begin
  if FMerged <> Menu then
  begin
    if FMerged <> nil then FMerged.FMergedWith := nil;
    FMerged := Menu;
    if FMerged <> nil then FMerged.FMergedWith := Self;
    RebuildHandle;
  end;
end;

procedure TMenuItem.Loaded;
begin
  inherited Loaded;
  if Action <> nil then ActionChange(Action, True);
  if FStreamedRebuild then RebuildHandle;
end;

procedure TMenuItem.RebuildHandle;
begin
  if csDestroying in ComponentState then Exit;
  if csReading in ComponentState then
    FStreamedRebuild := True
  else
  begin
    if FMergedWith <> nil then
      FMergedWith.RebuildHandle
    else
    begin
      while GetMenuItemCount(Handle) > 0 do RemoveMenu(Handle, 0, MF_BYPOSITION);
      PopulateMenu;
      MenuChanged(False);
    end;
  end;
end;

procedure TMenuItem.VerifyGroupIndex(Position: Integer; Value: Byte);
var
  I: Integer;
begin
  for I := 0 to GetCount - 1 do
    if I < Position then
    begin
      if Items[I].GroupIndex > Value then Error(SGroupIndexTooLow)
    end
    else
      { Ripple change to menu items at Position and after }
      if Items[I].GroupIndex < Value then Items[I].FGroupIndex := Value;
end;

procedure TMenuItem.WriteShortCutText(Writer: TWriter);
begin
  {Writer.WriteString(ShortCutToText(ShortCut));}
end;

function TMenuItem.GetHandle: HMENU;
begin
  if FHandle = 0 then
  begin
    if Owner is TPopupMenu then
      FHandle := CreatePopupMenu
    else
      FHandle := CreateMenu;
    if FHandle = 0 then raise EMenuError.Create(SOutOfResources);
    PopulateMenu;
  end;
  Result := FHandle;
end;

procedure TMenuItem.DefineProperties(Filer: TFiler);
begin
  inherited DefineProperties(Filer);
  Filer.DefineProperty('ShortCutText', ReadShortCutText, WriteShortCutText, False);
end;

procedure TMenuItem.DoDrawText(ACanvas: TCanvas; const ACaption: string;
  var Rect: TRect; Selected: Boolean; Flags: Longint);
var
  Text: string;
  R: TRect;
  ParentMenu: TMenu;
begin
  ParentMenu := GetParentMenu;
  if (ParentMenu <> nil) and (ParentMenu.IsRightToLeft) then
  begin
    if Flags and DT_LEFT = DT_LEFT then
      Flags := Flags and (not DT_LEFT) or DT_RIGHT
    else if Flags and DT_RIGHT = DT_RIGHT then
      Flags := Flags and (not DT_RIGHT) or DT_LEFT;
    Flags := Flags or DT_RTLREADING;
  end;
  Text := ACaption;
  if (Flags and DT_CALCRECT <> 0) and ((Text = '') or
    (Text[1] = '&') and (Text[2] = #0)) then Text := Text + ' ';
  with ACanvas do
  begin
    if Text = '-' then
    begin
      if Flags and DT_CALCRECT = 0 then
      begin
        R := Rect;
        Inc(R.Top, 4);
        DrawEdge(Handle, R, EDGE_ETCHED, BF_TOP);
      end;
    end
    else
    begin
      Brush.Style := bsClear;
      if Default then
        Font.Style := Font.Style + [fsBold];
      if not Enabled then
      begin
        if not Selected then
        begin
          OffsetRect(Rect, 1, 1);
          Font.Color := clBtnHighlight;
          DrawText(Handle, PChar(Text), Length(Text), Rect, Flags);
          OffsetRect(Rect, -1, -1);
        end;
        Font.Color := clBtnShadow;
      end;
      DrawText(Handle, PChar(Text), Length(Text), Rect, Flags);
    end;
  end;
end;

procedure TMenuItem.DrawItem(ACanvas: TCanvas; ARect: TRect; Selected: Boolean);
const
  Alignments: array[TPopupAlignment] of Word = (DT_LEFT, DT_RIGHT, DT_CENTER);
  EdgeStyle: array[Boolean] of Longint = (BDR_RAISEDINNER, BDR_SUNKENOUTER);
var
  TopLevel: Boolean;
  ImageList: TCustomImageList;
  ParentMenu: TMenu;
  Alignment: TPopupAlignment;
  DrawImage, DrawGlyph: Boolean;
  GlyphRect, SaveRect: TRect;
  DrawStyle: Longint;
  Glyph: TBitmap;
  OldBrushColor: TColor;
begin
  ParentMenu := GetParentMenu;
  if (ParentMenu <> nil) and ParentMenu.IsOwnerDraw and
    Assigned(FOnDrawItem) then
    FOnDrawItem(Self, ACanvas, ARect, Selected)
  else
  begin
    TopLevel := GetParentComponent is TMainMenu;
    with ACanvas do
    begin
      ImageList := ParentMenu.Images;
      if not Selected then FillRect(ARect);
      if ParentMenu is TMenu then
        Alignment := paLeft
      else if ParentMenu is TPopupMenu then
        Alignment := TPopupMenu(ParentMenu).Alignment
      else
        Alignment := paLeft;
      GlyphRect.Left := ARect.Left + 1;
      GlyphRect.Top := ARect.Top + 1;
      if Caption = '-' then
      begin
        FillRect(ARect);
        GlyphRect.Left := 0;
        GlyphRect.Right := -4;
        DrawGlyph := False;
      end
      else
      begin
        DrawImage := (ImageList <> nil) and ((ImageIndex > -1) and
          (ImageIndex < ImageList.Count) or Checked and ((FBitmap = nil) or
          FBitmap.Empty));
        if DrawImage or Assigned(FBitmap) and not FBitmap.Empty then
        begin
          DrawGlyph := True;

          if DrawImage then
          begin
            GlyphRect.Right := GlyphRect.Left + ImageList.Width;
            GlyphRect.Bottom := GlyphRect.Top + ImageList.Height;
          end
          else
          begin
            { Need to add BitmapWidth/Height properties for TMenuItem if we're to
              support them.  Right now let's hardcode them to 16x16. }
            GlyphRect.Right := GlyphRect.Left + 16;
            GlyphRect.Bottom := GlyphRect.Top + 16;
          end;

          { Draw background pattern brush if selected }
          if Checked then
          begin
            Inc(GlyphRect.Right);
            Inc(GlyphRect.Bottom);
            OldBrushColor := Brush.Color;
            if not Selected then
            begin
              OldBrushColor := Brush.Color;
              Brush.Bitmap := AllocPatternBitmap(clBtnFace, clBtnHighlight);
              FillRect(GlyphRect);
            end
            else
            begin
              Brush.Color := clBtnFace;
              FillRect(GlyphRect);
            end;
            Brush.Color := OldBrushColor;
            Inc(GlyphRect.Left);
            Inc(GlyphRect.Top);
          end;

          if DrawImage then
          begin
            if (ImageIndex > -1) and (ImageIndex < ImageList.Count) then
              ImageList.Draw(ACanvas, GlyphRect.Left, GlyphRect.Top, ImageIndex,
                Enabled)
            else
            begin
              { Draw a menu check }
              Glyph := TBitmap.Create;
              try
                Glyph.Transparent := True;
                Glyph.Handle := LoadBitmap(0, PChar(OBM_CHECK));
                OldBrushColor := Font.Color;
                Font.Color := clBtnText;
                Draw(GlyphRect.Left + (GlyphRect.Right - GlyphRect.Left - Glyph.Width) div 2 + 1,
                  GlyphRect.Top + (GlyphRect.Bottom - GlyphRect.Top - Glyph.Height) div 2 + 1, Glyph);
                Font.Color := OldBrushColor;
              finally
                Glyph.Free;
              end;
            end;
          end
          else
          begin
            SaveRect := GlyphRect;
            { Make sure image is within glyph bounds }
            if FBitmap.Width < GlyphRect.Right - GlyphRect.Left then
              with GlyphRect do
              begin
                Left := Left + ((Right - Left) - FBitmap.Width) div 2 + 1;
                Right := Left + FBitmap.Width;
              end;
            if FBitmap.Height < GlyphRect.Bottom - GlyphRect.Top then
              with GlyphRect do
              begin
                Top := Top + ((Bottom - Top) - FBitmap.Height) div 2 + 1;
                Bottom := Top + FBitmap.Height;
              end;
            StretchDraw(GlyphRect, FBitmap);
            GlyphRect := SaveRect;
          end;

          if Checked then
          begin
            Dec(GlyphRect.Right);
            Dec(GlyphRect.Bottom);
          end;
        end
        else
        begin
          if (ImageList <> nil) and not TopLevel then
          begin
            GlyphRect.Right := GlyphRect.Left + ImageList.Width;
            GlyphRect.Bottom := GlyphRect.Top + ImageList.Height;
          end
          else
          begin
            GlyphRect.Right := GlyphRect.Left;
            GlyphRect.Bottom := GlyphRect.Top;
          end;
          DrawGlyph := False;
        end;
      end;
      with GlyphRect do
      begin
        Dec(Left);
        Dec(Top);
        Inc(Right, 2);
        Inc(Bottom, 2);
      end;

      if Checked or Selected and DrawGlyph then
        DrawEdge(Handle, GlyphRect, EdgeStyle[Checked], BF_RECT);

      if Selected then
      begin
        if DrawGlyph then ARect.Left := GlyphRect.Right + 1;
        Brush.Color := clHighlight;
        FillRect(ARect);
      end;
      if not Selected or not DrawGlyph then
        ARect.Left := GlyphRect.Right + 1;
      Inc(ARect.Left, 2);
      Dec(ARect.Right, 1);

      DrawStyle := DT_EXPANDTABS or DT_SINGLELINE or Alignments[Alignment];
      { Calculate vertical layout }
      SaveRect := ARect;
      DoDrawText(ACanvas, Caption, ARect, Selected, DrawStyle or DT_CALCRECT or DT_NOCLIP);
      OffsetRect(ARect, 0, ((SaveRect.Bottom - SaveRect.Top) - (ARect.Bottom - ARect.Top)) div 2);
      DoDrawText(ACanvas, Caption, ARect, Selected, DrawStyle);
      if (ShortCut <> 0) and not TopLevel then
      begin
        ARect.Left := ARect.Right;
        ARect.Right := SaveRect.Right - 10;
        DoDrawText(ACanvas, ShortCutToText(ShortCut), ARect, Selected, DT_RIGHT);
      end;
    end;
  end;
end;

procedure TMenuItem.MeasureItem(ACanvas: TCanvas; var Width, Height: Integer);
const
  Alignments: array[TPopupAlignment] of Word = (DT_LEFT, DT_RIGHT, DT_CENTER);
var
  Alignment: TPopupAlignment;
  ImageList: TCustomImageList;
  ParentMenu: TMenu;
  DrawGlyph: Boolean;
  TopLevel: Boolean;
  DrawStyle: Integer;
  Text: string;
  R: TRect;

  procedure GetMenuSize;
  var
    NonClientMetrics: TNonClientMetrics;
  begin
    NonClientMetrics.cbSize := sizeof(NonClientMetrics);
    if SystemParametersInfo(SPI_GETNONCLIENTMETRICS, 0, @NonClientMetrics, 0) then
    begin
      Width := NonClientMetrics.iMenuWidth;
      Height := NonClientMetrics.iMenuHeight;
    end;
  end;

begin
  if GetParentComponent is TMainMenu then
  begin
    TopLevel := True;
    GetMenuSize;
  end
  else TopLevel := False;
  ParentMenu := GetParentMenu;
  ImageList := ParentMenu.Images;
  if Caption = '-' then
  begin
    Height := 5;
    Width := -2;
    DrawGlyph := False;
  end
  else if Assigned(ImageList) and ((ImageIndex > -1) or not TopLevel) then
  begin
    Width := ImageList.Width;
    if not TopLevel then
      Height := ImageList.Height;
    DrawGlyph := True;
  end
  else if Assigned(FBitmap) and not FBitmap.Empty then
  begin
    Width := 16;
    if not TopLevel then
      Height := 16;
    DrawGlyph := True;
  end
  else
  begin
    Width := -7;
    DrawGlyph := False;
  end;
  if DrawGlyph and not TopLevel then
    Inc(Width, 15);
  if not TopLevel then
    Inc(Height, 3);
  FillChar(R, SizeOf(R), 0);
  if ParentMenu is TMenu then
    Alignment := paLeft
  else if ParentMenu is TPopupMenu then
    Alignment := TPopupMenu(ParentMenu).Alignment
  else
    Alignment := paLeft;
  if ShortCut <> 0 then
    Text := Concat(Caption, ShortCutToText(ShortCut)) else
    Text := Caption;
  DrawStyle := Alignments[Alignment] or DT_EXPANDTABS or DT_SINGLELINE or
    DT_NOCLIP or DT_CALCRECT;
  DoDrawText(ACanvas, Text, R, False, DrawStyle);
  Inc(Width, R.Right - R.Left + 7);
  if Assigned(FOnMeasureItem) then FOnMeasureItem(Self, ACanvas, Width, Height);
end;

function TMenuItem.HasParent: Boolean;
begin
  Result := True;
end;

procedure TMenuItem.SetBreak(Value: TMenuBreak);
begin
  if FBreak <> Value then
  begin
    FBreak := Value;
    MenuChanged(True);
  end;
end;

procedure TMenuItem.SetCaption(const Value: string);
begin
  if FCaption <> Value then
  begin
    FCaption := Value;
    MenuChanged(True);
  end;
end;

procedure TMenuItem.TurnSiblingsOff;
var
  I: Integer;
  Item: TMenuItem;
begin
  if FParent <> nil then
    for I := 0 to FParent.Count - 1 do
    begin
      Item := FParent[I];
      if (Item <> Self) and Item.FRadioItem and (Item.GroupIndex = GroupIndex) then
        Item.SetChecked(False);
    end;
end;
  
procedure TMenuItem.SetChecked(Value: Boolean);
begin
  if FChecked <> Value then
  begin
    FChecked := Value;
    if (FParent <> nil) and not (csReading in ComponentState) then
      CheckMenuItem(FParent.Handle, FCommand, MF_BYCOMMAND or Checks[Value]);
    if Value and FRadioItem then
      TurnSiblingsOff;
  end;
end;

procedure TMenuItem.SetEnabled(Value: Boolean);
begin
  if FEnabled <> Value then
  begin
    FEnabled := Value;
    if ((Win32Platform = VER_PLATFORM_WIN32_NT) and (Count <> 0)) or
      ((Parent <> nil) and Assigned(Parent.FMergedWith)) then
      MenuChanged(True)
    else
    begin
      if (FParent <> nil) and not (csReading in ComponentState) then
        EnableMenuItem(FParent.Handle, FCommand, MF_BYCOMMAND or Enables[Value]);
      MenuChanged(False);
    end;
  end;
end;

procedure TMenuItem.SetGroupIndex(Value: Byte);
begin
  if FGroupIndex <> Value then
  begin
    if Parent <> nil then Parent.VerifyGroupIndex(Parent.IndexOf(Self), Value);
    FGroupIndex := Value;
    if FChecked and FRadioItem then
      TurnSiblingsOff;
  end;
end;

function TMenuItem.GetAction: TBasicAction;
begin
  if FActionLink <> nil then
    Result := FActionLink.Action else
    Result := nil;
end;

function TMenuItem.GetActionLinkClass: TMenuActionLinkClass;
begin
  Result := TMenuActionLink;
end;

function TMenuItem.GetCount: Integer;
begin
  if FItems = nil then Result := 0
  else Result := FItems.Count;
end;

function TMenuItem.GetItem(Index: Integer): TMenuItem;
begin
  if FItems = nil then IndexError;
  Result := FItems[Index];
end;

procedure TMenuItem.SetShortCut(Value: TShortCut);
begin
  if FShortCut <> Value then
  begin
    FShortCut := Value;
    MenuChanged(True);
  end;
end;

procedure TMenuItem.SetVisible(Value: Boolean);
begin
  if Value <> FVisible then
  begin
    FVisible := Value;
    MenuChanged(True);
  end;
end;

procedure TMenuItem.SetImageIndex(Value: Integer);
begin
  if Value <> FImageIndex then
  begin
    FImageIndex := Value;
    MenuChanged(True);
  end;
end;

function TMenuItem.GetMenuIndex: Integer;
begin
  Result := -1;
  if FParent <> nil then Result := FParent.IndexOf(Self);
end;

procedure TMenuItem.SetMenuIndex(Value: Integer);
var
  Parent: TMenuItem;
  Count: Integer;
begin
  if FParent <> nil then
  begin
    Count := FParent.Count;
    if Value < 0 then Value := 0;
    if Value >= Count then Value := Count - 1;
    if Value <> MenuIndex then
    begin
      Parent := FParent;
      Parent.Remove(Self);
      Parent.Insert(Value, Self);
    end;
  end;
end;

procedure TMenuItem.GetChildren(Proc: TGetChildProc; Root: TComponent);
var
  I: Integer;
begin
  for I := 0 to Count - 1 do Proc(Items[I]);
end;

procedure TMenuItem.SetChildOrder(Child: TComponent; Order: Integer);
begin
  (Child as TMenuItem).MenuIndex := Order;
end;

procedure TMenuItem.SetDefault(Value: Boolean);
var
  I: Integer;
begin
  if FDefault <> Value then
  begin
    if Value and (FParent <> nil) then
      for I := 0 to FParent.Count - 1 do
        if FParent[I].Default then FParent[I].FDefault := False;
    FDefault := Value;
    MenuChanged(True);
  end;
end;

procedure TMenuItem.InitiateAction;
begin
  if FActionLink <> nil then FActionLink.Update;
end;

procedure TMenuItem.Insert(Index: Integer; Item: TMenuItem);
begin
  if Item.FParent <> nil then
    raise EMenuError.Create(SMenuReinserted);
  if FItems = nil then FItems := TList.Create;
  if (Index - 1 >= 0) and (Index - 1 < FItems.Count) then
    if Item.GroupIndex < TMenuItem(FItems[Index - 1]).GroupIndex then
      Item.GroupIndex := TMenuItem(FItems[Index - 1]).GroupIndex;
  VerifyGroupIndex(Index, Item.GroupIndex);
  FItems.Insert(Index, Item);
  Item.FParent := Self;
  Item.FOnChange := SubItemChanged;
  if FHandle <> 0 then RebuildHandle;
  MenuChanged(Count = 1);
end;

procedure TMenuItem.Delete(Index: Integer);
var
  Cur: TMenuItem;
begin
  if (Index < 0) or (FItems = nil) or (Index >= GetCount) then IndexError;
  Cur := FItems[Index];
  FItems.Delete(Index);
  Cur.FParent := nil;
  Cur.FOnChange := nil;
  if FHandle <> 0 then RebuildHandle;
  MenuChanged(Count = 0);
end;

procedure TMenuItem.Click;
begin
  if Enabled then
  begin
    { Call OnClick if assigned and not equal to associated action's OnExecute.
      If associated action's OnExecute assigned then call it, otherwise, call
      OnClick. }
    if Assigned(FOnClick) and (Action <> nil) and (@FOnClick <> @Action.OnExecute) then
      FOnClick(Self)
    else if not (csDesigning in ComponentState) and (ActionLink <> nil) then
      FActionLink.Execute
    else if Assigned(FOnClick) then
      FOnClick(Self);
  end;
end;

function TMenuItem.IndexOf(Item: TMenuItem): Integer;
begin
  Result := -1;
  if FItems <> nil then Result := FItems.IndexOf(Item);
end;

procedure TMenuItem.Add(Item: TMenuItem);
begin
  Insert(GetCount, Item);
end;

procedure TMenuItem.Remove(Item: TMenuItem);
var
  I: Integer;
begin
  I := IndexOf(Item);
  if I = -1 then raise EMenuError.Create(SMenuNotFound);
  Delete(I);
end;

procedure TMenuItem.MenuChanged(Rebuild: Boolean);
var
  Source: TMenuItem;
begin
  if (Parent = nil) and (Owner is TMenu) then
    Source := nil else
    Source := Self;
  if Assigned(FOnChange) then FOnChange(Self, Source, Rebuild);
end;

procedure TMenuItem.SubItemChanged(Sender: TObject; Source: TMenuItem; Rebuild: Boolean);
begin
  if Rebuild and ((FHandle <> 0) or Assigned(FMergedWith)) then RebuildHandle;
  if Parent <> nil then Parent.SubItemChanged(Self, Source, False)
  else if Owner is TMainMenu then TMainMenu(Owner).ItemChanged;
end;

function TMenuItem.GetBitmap: TBitmap;
begin
  if FBitmap = nil then FBitmap := TBitmap.Create;
  FBitmap.Transparent := True;
  Result := FBitmap;
end;

procedure TMenuItem.SetAction(Value: TBasicAction);
begin
  if Value = nil then
  begin
    FActionLink.Free;
    FActionLink := nil;
  end
  else
  begin
    if FActionLink = nil then
      FActionLink := GetActionLinkClass.Create(Self);
    FActionLink.Action := Value;
    FActionLink.OnChange := DoActionChange;
    ActionChange(Value, csLoading in Value.ComponentState);
    Value.FreeNotification(Self);
  end;
end;

procedure TMenuItem.SetBitmap(Value: TBitmap);
begin
  if FBitmap = nil then FBitmap := TBitmap.Create;
  FBitmap.Assign(Value);
  MenuChanged(False);
end;

procedure TMenuItem.InitiateActions;
var
  I: Integer;
begin
  for I := 0 to Count - 1 do
    Items[I].InitiateAction;
end;

function TMenuItem.GetParentComponent: TComponent;
begin
  if (FParent <> nil) and (FParent.FMenu <> nil) then
    Result := FParent.FMenu else
    Result := FParent;
end;

procedure TMenuItem.SetParentComponent(Value: TComponent);
begin
  if FParent <> nil then FParent.Remove(Self);
  if Value <> nil then
    if Value is TMenu then
      TMenu(Value).Items.Add(Self)
    else if Value is TMenuItem then
      TMenuItem(Value).Add(Self);
end;

function TMenuItem.GetParentMenu: TMenu;
var
  MenuItem: TMenuItem;
begin
  MenuItem := Self;
  while Assigned(MenuItem.FParent) do MenuItem := MenuItem.FParent;
  Result := MenuItem.FMenu
end;

procedure TMenuItem.SetRadioItem(Value: Boolean);
begin
  if FRadioItem <> Value then
  begin
    FRadioItem := Value;
    if FChecked and FRadioItem then
      TurnSiblingsOff;
    MenuChanged(True);
  end;
end;

procedure TMenuItem.ActionChange(Sender: TObject; CheckDefaults: Boolean);
begin
  if Action is TCustomAction then
    with TCustomAction(Sender) do
    begin
      if not CheckDefaults or (Self.Caption = '') then
        Self.Caption := Caption;
      if not CheckDefaults or (Self.Checked = False) then
        Self.Checked := Checked;
      if not CheckDefaults or (Self.Enabled = True) then
        Self.Enabled := Enabled;
      if not CheckDefaults or (Self.HelpContext = 0) then
        Self.HelpContext := HelpContext;
      if not CheckDefaults or (Self.Hint = '') then
        Self.Hint := Hint;
      if not CheckDefaults or (Self.ImageIndex = -1) then
        Self.ImageIndex := ImageIndex;
      if not CheckDefaults or (Self.ShortCut = scNone) then
        Self.ShortCut := ShortCut;
      if not CheckDefaults or (Self.Visible = True) then
        Self.Visible := Visible;
      if not CheckDefaults or not Assigned(Self.OnClick) then
        Self.OnClick := OnExecute;
    end;
end;

procedure TMenuItem.DoActionChange(Sender: TObject);
begin
  if Sender = Action then ActionChange(Sender, False);
end;

function TMenuItem.IsCaptionStored: Boolean;
begin
  Result := (ActionLink = nil) or not FActionLink.IsCaptionLinked;
end;

function TMenuItem.IsCheckedStored: Boolean;
begin
  Result := (ActionLink = nil) or not FActionLink.IsCheckedLinked;
end;

function TMenuItem.IsEnabledStored: Boolean;
begin
  Result := (ActionLink = nil) or not FActionLink.IsEnabledLinked;
end;

function TMenuItem.IsHintStored: Boolean;
begin
  Result := (ActionLink = nil) or not FActionLink.IsHintLinked;
end;

function TMenuItem.IsHelpContextStored: Boolean;
begin
  Result := (ActionLink = nil) or not FActionLink.IsHelpContextLinked;
end;

function TMenuItem.IsImageIndexStored: Boolean;
begin
  Result := (ActionLink = nil) or not FActionLink.IsImageIndexLinked;
end;

function TMenuItem.IsShortCutStored: Boolean;
begin
  Result := (ActionLink = nil) or not FActionLink.IsShortCutLinked;
end;

function TMenuItem.IsVisibleStored: Boolean;
begin
  Result := (ActionLink = nil) or not FActionLink.IsVisibleLinked;
end;

function TMenuItem.IsOnClickStored: Boolean;
begin
  Result := (ActionLink = nil) or not FActionLink.IsOnExecuteLinked;
end;

procedure TMenuItem.AssignTo(Dest: TPersistent);
begin
  if Dest is TCustomAction then
    with TCustomAction(Dest) do
    begin
      Enabled := Self.Enabled;
      HelpContext := Self.HelpContext;
      Hint := Self.Hint;
      ImageIndex := Self.ImageIndex;
      Caption := Self.Caption;
      Visible := Self.Visible;
      OnExecute := Self.OnClick;
    end
  else inherited AssignTo(Dest);
end;

procedure TMenuItem.Notification(AComponent: TComponent;
  Operation: TOperation);
begin
  inherited Notification(AComponent, Operation);
  if (Operation = opRemove) and (AComponent = Action) then Action := nil;
end;

{ TMenu }

constructor TMenu.Create(AOwner: TComponent);
begin
  FItems := TMenuItem.Create(Self);
  FItems.FOnChange := MenuChanged;
  FItems.FMenu := Self;
  FImageChangeLink := TChangeLink.Create;
  FImageChangeLink.OnChange := ImageListChange;
  FParentBiDiMode := True;
  inherited Create(AOwner);
  ParentBiDiModeChanged;
end;

destructor TMenu.Destroy;
begin
  FItems.Free;
  FImageChangeLink.Free;
  inherited Destroy;
end;

procedure TMenu.GetChildren(Proc: TGetChildProc; Root: TComponent);
begin
  FItems.GetChildren(Proc, Root);
end;

function TMenu.GetHandle: HMENU;
begin
  Result := FItems.GetHandle;
end;

procedure TMenu.SetChildOrder(Child: TComponent; Order: Integer);
begin
  FItems.SetChildOrder(Child, Order);
end;

procedure TMenu.UpdateItems;

  function UpdateItem(MenuItem: TMenuItem): Boolean;
  begin
    Result := False;
    IterateMenus(@UpdateItem, MenuItem.FMerged, MenuItem);
    MenuItem.SubItemChanged(MenuItem, MenuItem, True);
  end;

begin
  IterateMenus(@UpdateItem, Items.FMerged, Items);
end;

function TMenu.FindItem(Value: Integer; Kind: TFindItemKind): TMenuItem;
var
  FoundItem: TMenuItem;

  function Find(Item: TMenuItem): Boolean;
  var
    I: Integer;
  begin
    Result := False;
    if ((Kind = fkCommand) and (Value = Item.Command)) or
      ((Kind = fkHandle) and (Value = Integer(Item.FHandle))) or
      ((Kind = fkShortCut) and (Value = Item.ShortCut)) then
    begin
      FoundItem := Item;
      Result := True;
      Exit;
    end
    else
      for I := 0 to Item.GetCount - 1 do
        if Find(Item[I]) then
        begin
          Result := True;
          Exit;
        end;
  end;

begin
  FoundItem := nil;
  IterateMenus(@Find, Items.FMerged, Items);
  Result := FoundItem;
end;

function TMenu.GetHelpContext(Value: Integer; ByCommand: Boolean): THelpContext;
var
  Item: TMenuItem;
  Kind: TFindItemKind;
begin
  Result := 0;
  Kind := fkHandle;
  if ByCommand then Kind := fkCommand;
  if (Kind = fkHandle) and (Self is TPopupMenu) and
    (Integer(TPopupMenu(Self).Handle) = Value) then
    Result := TPopupMenu(Self).HelpContext
  else
  begin
    Item := FindItem(Value, Kind);
    while (Item <> nil) and (Item.FHelpContext = 0) do
      Item := Item.FParent;
    if Item <> nil then Result := Item.FHelpContext;
  end;
end;

function TMenu.DispatchCommand(ACommand: Word): Boolean;
var
  Item: TMenuItem;
begin
  Result := False;
  Item := FindItem(ACommand, fkCommand);
  if Item <> nil then
  begin
    Item.Click;
    Result := True;
  end;
end;

function TMenu.DispatchPopup(AHandle: HMENU): Boolean;
var
  Item: TMenuItem;
begin
  Result := False;
  Item := FindItem(AHandle, fkHandle);
  if Item <> nil then
  begin
    if not (csDesigning in Item.ComponentState) then Item.InitiateActions;
    Item.Click;
    Result := True;
  end
  else if not (csDesigning in ComponentState) and (Self is TPopupMenu) then
    Items.InitiateActions;
end;

function TMenu.IsOwnerDraw: Boolean;
begin
  Result := OwnerDraw or (Images <> nil);
end;

function TMenu.IsShortCut(var Message: TWMKey): Boolean;
type
  TClickResult = (crDisabled, crClicked, crShortCutMoved);
const
  AltMask = $20000000;
var
  ShortCut: TShortCut;
  ShortCutItem: TMenuItem;
  ClickResult: TClickResult;

  function DoClick(Item: TMenuItem): TClickResult;
  begin
    Result := crClicked;
    if Item.Parent <> nil then Result := DoClick(Item.Parent);
    if Result = crClicked then
      if Item.Enabled then
        try
          if not (csDesigning in ComponentState) then Item.InitiateActions;
          Item.Click;
          if (Item <> ShortCutItem) and (ShortCutItem.ShortCut <> ShortCut) then
            Result := crShortCutMoved;
        except
          Application.HandleException(Self);
        end
      else Result := crDisabled;
  end;

begin
//! Moved checking FWindowHandle to TWinControl and TForm.  This way we can
//! call this method on menus which aren't necessarily allocated.  More
//! specifically, we can make toolbar menus much more dynamic. [rbr]

//!  Result := False;
//!  if FWindowHandle <> 0 then
  begin
    ShortCut := Byte(Message.CharCode);
    if GetKeyState(VK_SHIFT) < 0 then Inc(ShortCut, scShift);
    if GetKeyState(VK_CONTROL) < 0 then Inc(ShortCut, scCtrl);
    if Message.KeyData and AltMask <> 0 then Inc(ShortCut, scAlt);
    repeat
      ClickResult := crDisabled;
      ShortCutItem := FindItem(ShortCut, fkShortCut);
      if ShortCutItem <> nil then
        ClickResult := DoClick(ShortCutItem);
    until ClickResult <> crShortCutMoved;
    Result := ShortCutItem <> nil;
  end;
end;

function TMenu.IsBiDiModeStored: Boolean;
begin
  Result := not FParentBiDiMode;
end;

procedure TMenu.DoBiDiModeChanged;
var
  Menu: HMENU;
  MenuItemInfo: TMenuItemInfo;
  Buffer: array[0..79] of Char;
begin
  if (not SysLocale.MiddleEast) or (WindowHandle = 0) then Exit;
  Menu := GetHandle;
  MenuItemInfo.cbSize := 44; // Required for Windows 95
  MenuItemInfo.fMask := MIIM_TYPE;
  MenuItemInfo.dwTypeData := Buffer;
  MenuItemInfo.cch := SizeOf(Buffer);
  if GetMenuItemInfo(Menu, 0, True, MenuItemInfo) then
  begin
    if LongBool(MenuItemInfo.fType and RightToLeftMenuFlag) = IsRightToLeft then
      Exit;  // Nothing to do
    // clear and set the flag
    MenuItemInfo.fType := (MenuItemInfo.fType and (not RightToLeftMenuFlag))
      or (RightToLeftMenuFlag * DWORD(IsRightToLeft));
    MenuItemInfo.fMask := MIIM_TYPE;
    if SetMenuItemInfo(Menu, 0, True, MenuItemInfo) then
      DrawMenuBar(WindowHandle);
  end;
end;

function TMenu.UpdateImage: Boolean;
var
  Image: array[0..511] of Char;

  procedure BuildImage(Menu: HMENU);
  var
    P, ImageEnd: PChar;
    I, C: Integer;
    State: Word;
  begin
    C := GetMenuItemCount(Menu);
    P := Image;
    ImageEnd := @Image[SizeOf(Image) - 5];
    I := 0;
    while (I < C) and (P < ImageEnd) do
    begin
      DoGetMenuString(Menu, I, P, ImageEnd - P, MF_BYPOSITION);
      P := StrEnd(P);
      State := GetMenuState(Menu, I, MF_BYPOSITION);
      if State and MF_DISABLED <> 0 then P := StrECopy(P, '$');
      if State and MF_MENUBREAK <> 0 then P := StrECopy(P, '@');
      if State and MF_GRAYED <> 0 then P := StrECopy(P, '#');
      P := StrECopy(P, ';');
      Inc(I);
    end;
  end;

begin
  Result := False;
  Image[0] := #0;
  if FWindowHandle <> 0 then BuildImage(Handle);
  if (FMenuImage = '') or (StrComp(PChar(FMenuImage), Image) <> 0) then
  begin
    Result := True;
    FMenuImage := Image;
  end;
end;

procedure TMenu.SetOwnerDraw(Value: Boolean);
begin
  if Value <> FOwnerDraw then
  begin
    FOwnerDraw := Value;
    UpdateItems;
  end;
end;

procedure TMenu.AdjustBiDiBehavior;
var
  SaveBiDi: TBiDiMode;
  SaveParentBiDi: Boolean;
begin
  if not SysLocale.MiddleEast then Exit;
  SaveBiDi := FBiDiMode;
  SaveParentBiDi := FParentBidiMode;
  try
    if BiDiMode = bdLeftToRight then
      BiDiMode := bdRightToLeft { Do not use FBiDiMode }
    else
      BiDiMode := bdLeftToRight; { Do not use FBiDiMode }
  finally
    BiDiMode := SaveBiDi; { Do not use FBiDiMode }
    FParentBidiMode := SaveParentBiDi;
  end;
end;

procedure TMenu.SetWindowHandle(Value: HWND);
begin
  FWindowHandle := Value;
  UpdateImage;
  { When menus are created, if BiDiMode does not follow the parent,
    main menu headers are displayed in reversed order. Changing BiDiMode
    twice fixes this. }
  if (SysLocale.MiddleEast) and (Value <> 0) then
    if FParentBiDiMode then
      ParentBiDiModeChanged
    else
      AdjustBiDiBehavior;
end;

procedure TMenu.DoChange(Source: TMenuItem; Rebuild: Boolean);
begin
  if Assigned(FOnChange) then FOnChange(Self, Source, Rebuild);
end;

procedure TMenu.Loaded;
begin
  inherited Loaded;
  DoChange(nil, False);
end;

procedure TMenu.MenuChanged(Sender: TObject; Source: TMenuItem; Rebuild: Boolean);
begin
  if ComponentState * [csLoading, csDestroying] = [] then DoChange(Source, Rebuild);
end;

procedure TMenu.ImageListChange(Sender: TObject);
begin
  if Sender = Images then UpdateItems;
end;

procedure TMenu.SetImages(Value: TCustomImageList);
begin
  if FImages <> nil then FImages.UnRegisterChanges(FImageChangeLink);
  FImages := Value;
  if FImages <> nil then
  begin
    FImages.RegisterChanges(FImageChangeLink);
    FImages.FreeNotification(Self);
  end;
  UpdateItems;
end;

procedure TMenu.Notification(AComponent: TComponent;
  Operation: TOperation);
begin
  inherited Notification(AComponent, Operation);
  if (AComponent = Images) and (Operation = opRemove) then Images := nil;
end;

function TMenu.IsRightToLeft: Boolean;
begin
  Result := SysLocale.MiddleEast and (BiDiMode <> bdLeftToRight);
end;

procedure TMenu.ProcessMenuChar(var Message: TWMMenuChar);
var
  C, I, First, Hilite, Next: Integer;
  State: Word;

  function IsAccelChar(Menu: HMENU; State: Word; I: Integer; C: Char): Boolean;
  var
    Item: TMenuItem;
    Id: UINT;
  begin
    Item := nil;
    if State and MF_POPUP <> 0 then
    begin
      Menu := GetSubMenu(Menu, I);
      Item := FindItem(Menu, fkHandle);
    end
    else
    begin
      Id := GetMenuItemID(Menu, I);
      if Id <> $FFFFFFFF then
        Item := FindItem(Id, fkCommand);
    end;
    if Item <> nil then
      Result := IsAccel(Ord(C), Item.Caption) else
      Result := False;
  end;

  function IsInitialChar(Menu: HMENU; State: Word; I: Integer; C: Char): Boolean;
  var
    Item: TMenuItem;
  begin
    if State and MF_POPUP <> 0 then
    begin
      Menu := GetSubMenu(Menu, I);
      Item := FindItem(Menu, fkHandle);
    end
    else
    begin
      Item := FindItem(Menu, fkHandle);
      if Item <> nil then
        Item := Item.Items[I];
    end;
    if (Item <> nil) and (Item.Caption <> '') then
      Result := AnsiCompareText(Item.Caption[1], C) = 0 else
      Result := False;
  end;

begin
  with Message do
  begin
    Result := MNC_IGNORE; { No item found: beep }
    First := -1;
    Hilite := -1;
    Next := -1;
    C := GetMenuItemCount(Menu);
    for I := 0 to C - 1 do
    begin
      State := GetMenuState(Menu, I, MF_BYPOSITION);
      if IsAccelChar(Menu, State, I, User) then
      begin
        if State and MF_DISABLED <> 0 then
        begin
          { Close the menu if this is the only disabled item to choose from.
            Otherwise, ignore the item. }
          if First < 0 then First := -2;
          Continue;
        end;
        if First < 0 then
        begin
          First := I;
          Result := MNC_EXECUTE;
        end
        else
          Result := MNC_SELECT;
        if State and MF_HILITE <> 0 then
          Hilite := I
        else if Hilite >= 0 then
          Next := I;
      end;
    end;
    { We found a single disabled item. End the selection. }
    if First < -1 then
    begin
      Result := MNC_CLOSE shl 16;
      Exit;
    end;

    { If we can't find accelerators, then look for initial letters }
    if First < 0 then
    for I := 0 to C - 1 do
      begin
        State := GetMenuState(Menu, I, MF_BYPOSITION);
        if IsInitialChar(Menu, State, I, User) then
        begin
          if State and MF_DISABLED <> 0 then
          begin
            Result := MNC_CLOSE shl 16;
            Exit;
          end;
          if First < 0 then
          begin
            First := I;
            Result := MNC_EXECUTE;
          end
          else
            Result := MNC_SELECT;
          if State and MF_HILITE <> 0 then
            Hilite := I
          else if Hilite >= 0 then
            Next := I;
        end;
      end;

    if (Result = MNC_EXECUTE) then
      Result := Result shl 16 or First
    else if Result = MNC_SELECT then
    begin
      if Next < 0 then
        Next := First;
      Result := Result shl 16 or Next;
    end;
  end;
end;

{ Returns the proper caption for a menu item when the menu is owner-drawn. }
function TMenu.DoGetMenuString(Menu: HMENU; ItemID: UINT; Str: PChar;
  MaxCount: Integer; Flag: UINT): Integer;
var
  Item: TMenuItem;
  State: Word;
begin
  if IsOwnerDraw then
  begin
    Item := nil;
    State := GetMenuState(Menu, ItemID, Flag);
    if State and MF_POPUP <> 0 then
    begin
      Menu := GetSubMenu(Menu, ItemID);
      Item := FindItem(Menu, fkHandle);
    end
    else
    begin
      ItemID := GetMenuItemID(Menu, ItemID);
      if ItemID <> $FFFFFFFF then
        Item := FindItem(ItemID, fkCommand);
    end;
    if Item <> nil then
    begin
      Str[0] := #0;
      StrPLCopy(Str, Item.Caption, MaxCount);
      Result := StrLen(Str);
    end
    else
      Result := 0;
  end
  else
    Result := GetMenuString(Menu, ItemID, Str, MaxCount, Flag);
end;

procedure TMenu.SetBiDiMode(Value: TBiDiMode);
begin
  if FBiDiMode <> Value then
  begin
    FBiDiMode := Value;
    FParentBiDiMode := False;
    DoBiDiModeChanged;
  end;
end;

procedure TMenu.SetParentBiDiMode(Value: Boolean);
begin
  if Value <> FParentBiDiMode then
  begin
    FParentBiDiMode := Value;
    ParentBiDiModeChanged;
  end;
end;

procedure TMenu.ParentBiDiModeChanged;
var
  AForm: TWinControl;
begin
  if FParentBiDiMode then
  begin
    AForm := FindControl(WindowHandle);
    if AForm <> nil then
    begin
      BiDiMode := AForm.BiDiMode;
      FParentBiDiMode := True;
    end;
  end;
end;

procedure TMenu.ParentBiDiModeChanged(AControl: TObject);
begin
  if FParentBiDiMode then
  begin
    BiDiMode := (AControl as TControl).BiDiMode;
    FParentBiDiMode := True;
  end;
end;

{ TMainMenu }

procedure TMainMenu.SetAutoMerge(Value: Boolean);
begin
  if FAutoMerge <> Value then
  begin
    FAutoMerge := Value;
    if FWindowHandle <> 0 then
      SendMessage(FWindowHandle, CM_MENUCHANGED, 0, 0);
  end;
end;

procedure TMainMenu.MenuChanged(Sender: TObject; Source: TMenuItem; Rebuild: Boolean);
begin
  if (FWindowHandle <> 0) and UpdateImage then DrawMenuBar(FWindowHandle);
  inherited MenuChanged(Sender, Source, Rebuild);
end;

procedure TMainMenu.Merge(Menu: TMainMenu);
begin
  if Menu <> nil then
    FItems.MergeWith(Menu.FItems) else
    FItems.MergeWith(nil);
end;

procedure TMainMenu.Unmerge(Menu: TMainMenu);
begin
  if (Menu <> nil) and (FItems.FMerged = Menu.FItems) then
    FItems.MergeWith(nil);
end;

procedure TMainMenu.ItemChanged;
begin
  MenuChanged(nil, nil, False);
  if FWindowHandle <> 0 then
    SendMessage(FWindowHandle, CM_MENUCHANGED, 0, 0);
end;

function TMainMenu.GetHandle: HMENU;
begin
  if FOle2Menu <> 0 then
    Result := FOle2Menu else
    Result := inherited GetHandle;
end;

procedure TMainMenu.GetOle2AcceleratorTable(var AccelTable: HAccel;
  var AccelCount: Integer; Groups: array of Integer);
var
  NumAccels: Integer;
  AccelList, AccelPtr: PAccel;

  procedure ProcessAccels(Item: TMenuItem);
  var
    I: Integer;
    Virt: Byte;
  begin
    if Item.ShortCut <> 0 then
      if AccelPtr <> nil then
      begin
        Virt := FNOINVERT or FVIRTKEY;
        if Item.ShortCut and scCtrl <> 0 then Virt := Virt or FCONTROL;
        if Item.ShortCut and scAlt <> 0 then Virt := Virt or FALT;
        if Item.ShortCut and scShift <> 0 then Virt := Virt or FSHIFT;
        AccelPtr^.fVirt := Virt;
        AccelPtr^.key := Item.ShortCut and $FF;
        AccelPtr^.cmd := Item.Command;
        Inc(AccelPtr);
      end else
        Inc(NumAccels)
    else
      for I := 0 to Item.GetCount - 1 do ProcessAccels(Item[I]);
  end;

  function ProcessAccelItems(Item: TMenuItem): Boolean;
  var
    I: Integer;
  begin
    for I := 0 to High(Groups) do
      if Item.GroupIndex = Groups[I] then
      begin
        ProcessAccels(Item);
        Break;
      end;
    Result := False;
  end;

begin
  NumAccels := 0;
  AccelPtr := nil;
  IterateMenus(@ProcessAccelItems, Items.FMerged, Items);
  AccelTable := 0;
  if NumAccels <> 0 then
  begin
    GetMem(AccelList, NumAccels * SizeOf(TAccel));
    AccelPtr := AccelList;
    IterateMenus(@ProcessAccelItems, Items.FMerged, Items);
    AccelTable := CreateAcceleratorTable(AccelList^, NumAccels);
    FreeMem(AccelList);
  end;
  AccelCount := NumAccels;
end;

{ Similar to regular TMenuItem.PopulateMenus except that it only adds
  the specified groups to the menu handle }

procedure TMainMenu.PopulateOle2Menu(SharedMenu: HMenu;
  Groups: array of Integer; var Widths: array of Longint);
var
  NumGroups: Integer;
  J: Integer;
  MenuRightToLeft: Boolean;
    
  function AddOle2(Item: TMenuItem): Boolean;
  var
    I: Integer;
  begin
    for I := 0 to NumGroups do
    begin
      if Item.GroupIndex = Groups[I] then
      begin
        Inc(Widths[Item.GroupIndex]);
        Item.AppendTo(SharedMenu, MenuRightToLeft);
      end;
    end;
    Result := False;
  end;
    
begin
  MenuRightToLeft := IsRightToLeft;
  NumGroups := High(Groups);
  for J := 0 to High(Widths) do Widths[J] := 0;
  IterateMenus(@AddOle2, Items.FMerged, Items);
end;

procedure TMainMenu.SetOle2MenuHandle(Handle: HMENU);
begin
  FOle2Menu := Handle;
  ItemChanged;
end;

{ TPopupMenu }

type
  TPopupList = class(TList)
  private
    procedure WndProc(var Message: TMessage);
  public
    Window: HWND;
    procedure Add(Popup: TPopupMenu);
    procedure Remove(Popup: TPopupMenu);
  end;

var
  PopupList: TPopupList;

procedure TPopupList.WndProc(var Message: TMessage);
var
  I, Item: Integer;
  MenuItem: TMenuItem;
  FindKind: TFindItemKind;
  ContextID: Integer;
  Canvas: TCanvas;
  SaveFont: HFONT;
  DC: HDC;

  function GetMenuFont: HFONT;
  var
    NonClientMetrics: TNonClientMetrics;
  begin
    NonClientMetrics.cbSize := sizeof(NonClientMetrics);
    if SystemParametersInfo(SPI_GETNONCLIENTMETRICS, 0, @NonClientMetrics, 0) then
      Result := CreateFontIndirect(NonClientMetrics.lfMenuFont)
    else
      Result := GetStockObject(SYSTEM_FONT);
  end;

begin
  try
    case Message.Msg of
      WM_COMMAND:
        for I := 0 to Count - 1 do
          if TPopupMenu(Items[I]).DispatchCommand(Message.wParam) then Exit;
      WM_INITMENUPOPUP:
        for I := 0 to Count - 1 do
          with TWMInitMenuPopup(Message) do
            if TPopupMenu(Items[I]).DispatchPopup(MenuPopup) then Exit;
      WM_MENUSELECT:
        with TWMMenuSelect(Message) do
        begin
          FindKind := fkCommand;
          if MenuFlag and MF_POPUP <> 0 then FindKind := fkHandle;
          for I := 0 to Count - 1 do
          begin
            if FindKind = fkHandle then
            begin
              if Menu <> 0 then
                Item := GetSubMenu(Menu, IDItem) else
                Item := -1;
            end
            else
              Item := IDItem;
            MenuItem := TPopupMenu(Items[I]).FindItem(Item, FindKind);
            if MenuItem <> nil then
            begin
              Application.Hint := MenuItem.Hint;
              Exit;
            end;
          end;
          Application.Hint := '';
        end;
      WM_HELP:
        with PHelpInfo(Message.LParam)^ do
        begin
          for I := 0 to Count - 1 do
          begin
            if hItemHandle = TMenu(Items[I]).Handle then
              MenuItem := TMenu(Items[I]).Items
            else
              MenuItem := TPopupMenu(Items[I]).FindItem(hItemHandle, fkHandle);
            if MenuItem <> nil then
            begin
              ContextID := TMenu(Items[I]).GetHelpContext(iCtrlID, True);
              if ContextID = 0 then
                ContextID := TMenu(Items[I]).GetHelpContext(hItemHandle, False);
              if Screen.ActiveForm = nil then Exit;
              if (ContextID = 0) then
                ContextID := Screen.ActiveForm.HelpContext;
              if (biHelp in Screen.ActiveForm.BorderIcons) then
                Application.HelpCommand(HELP_CONTEXTPOPUP, ContextID)
              else
                Application.HelpContext(ContextID);
              Exit;
            end;
          end;
        end;
      WM_DRAWITEM:
        with PDrawItemStruct(Message.LParam)^ do
        begin
          for I := 0 to Count - 1 do
          begin
            MenuItem := TPopupMenu(Items[I]).FindItem(itemID, fkCommand);
            if MenuItem <> nil then
            begin
              Canvas := TControlCanvas.Create;
              with Canvas do
              try
                SaveFont := SelectObject(hDC, GetStockObject(SYSTEM_FONT));
                try
                  Handle := hDC;
                  Font.Handle := GetMenuFont;
                  if itemState and ODS_SELECTED <> 0 then
                  begin
                    Brush.Color := clHighlight;
                    Font.Color := clHighlightText
                  end
                  else
                  begin
                    Brush.Color := clMenu;
                    Font.Color := clMenuText;
                  end;
                  MenuItem.DrawItem(Canvas, rcItem, itemState and ODS_SELECTED <> 0);
                finally
                  Handle := 0;
                  if SaveFont <> 0 then SelectObject(hDC, SaveFont);
                end;
              finally
                Canvas.Free;
              end;
              Exit;
            end;
          end;
        end;
      WM_MEASUREITEM:
        with PMeasureItemStruct(Message.LParam)^ do
        begin
          for I := 0 to Count - 1 do
          begin
            MenuItem := TPopupMenu(Items[I]).FindItem(itemID, fkCommand);
            if MenuItem <> nil then
            begin
              DC := GetWindowDC(Window);
              try
                Canvas := TControlCanvas.Create;
                with Canvas do
                try
                  SaveFont := SelectObject(DC, GetStockObject(SYSTEM_FONT));
                  try
                    Handle := DC;
                    Font.Handle := GetMenuFont;
                    MenuItem.MeasureItem(Canvas, Integer(itemWidth),
                      Integer(itemHeight));
                  finally
                    Handle := 0;
                    if SaveFont <> 0 then SelectObject(DC, SaveFont);
                  end;
                finally
                  Canvas.Free;
                end;
              finally
                ReleaseDC(Window, DC);
              end;
              Exit;
            end;
          end;
        end;
      WM_MENUCHAR:
        for I := 0 to Count - 1 do
          with TPopupMenu(Items[I]) do
            if (Handle = HMENU(Message.LParam)) or
              (FindItem(Message.LParam, fkHandle) <> nil) then
            begin
              ProcessMenuChar(TWMMenuChar(Message));
              Exit;
            end;
    end;
    with Message do Result := DefWindowProc(Window, Msg, wParam, lParam);
  except
    Application.HandleException(Self);
  end;
end;

procedure TPopupList.Add(Popup: TPopupMenu);
begin
  if Count = 0 then Window := AllocateHWnd(WndProc);
  inherited Add(Popup);
end;

procedure TPopupList.Remove(Popup: TPopupMenu);
begin
  inherited Remove(Popup);
  if Count = 0 then DeallocateHWnd(Window);
end;

constructor TPopupMenu.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FPopupPoint.X := -1;
  FPopupPoint.Y := -1;
  FItems.OnClick := DoPopup;
  FWindowHandle := Application.Handle;
  FAutoPopup := True;
  PopupList.Add(Self);
end;

destructor TPopupMenu.Destroy;
begin
  PopupList.Remove(Self);
  inherited Destroy;
end;

procedure TPopupMenu.DoPopup(Item: TObject);
begin
  if Assigned(FOnPopup) then FOnPopup(Item);
end;

function TPopupMenu.GetHelpContext: THelpContext;
begin
  Result := FItems.HelpContext;
end;

procedure TPopupMenu.SetHelpContext(Value: THelpContext);
begin
  FItems.HelpContext := Value;
end;

procedure TPopupMenu.SetBiDiModeFromPopupControl;
var
  AControl: TControl;
begin
  if not SysLocale.MiddleEast then Exit;
  if FParentBiDiMode then
  begin
    { Use the setting from the control that activated the popup.
      If there is no control, then use Application }
    AControl := FindPopupControl(FPopupPoint);
    if AControl <> nil then
    begin
      BiDiMode := AControl.BiDiMode;
      FParentBiDiMode := True;
    end
    else
    begin
      BiDiMode := Application.BiDiMode;
      FParentBiDiMode := True;
    end;
  end;
end;

function TPopupMenu.UseRightToLeftAlignment: Boolean;
var
  AControl: TControl;
begin
  Result := False;
  if not SysLocale.MiddleEast then Exit;
  if FParentBiDiMode then
  begin
    { Use the setting from the control that activated the popup.
      If there is no control, then use Application }
    AControl := FindPopupControl(FPopupPoint);
    if AControl <> nil then
      Result := AControl.UseRightToLeftAlignment
    else
      Result := Application.UseRightToLeftAlignment;
  end
  else
    Result := (FBiDiMode = bdRightToLeft);
end;

procedure TPopupMenu.Popup(X, Y: Integer);
const
  Flags: array[Boolean, TPopupAlignment] of Word =
    ((TPM_LEFTALIGN, TPM_RIGHTALIGN, TPM_CENTERALIGN),
     (TPM_RIGHTALIGN, TPM_LEFTALIGN, TPM_CENTERALIGN));
  Buttons: array[TTrackButton] of Word = (TPM_RIGHTBUTTON, TPM_LEFTBUTTON);
begin
  FPopupPoint := Point(X, Y);
  SetBiDiModeFromPopupControl;
  DoPopup(Self);
  FItems.RebuildHandle;
  AdjustBiDiBehavior;
  TrackPopupMenu(FItems.Handle,
    Flags[UseRightToLeftAlignment, FAlignment] or Buttons[FTrackButton], X, Y,
    0 { reserved }, PopupList.Window, nil);
end;

{ Menu building functions }

procedure InitMenuItems(AMenu: TMenu; Items: array of TMenuItem);
var
  I: Integer;

  procedure SetOwner(Item: TMenuItem);
  var
    I: Integer;
  begin
    if Item.Owner = nil then AMenu.Owner.InsertComponent(Item);
    for I := 0 to Item.Count - 1 do
      SetOwner(Item[I]);
  end;

begin
  for I := Low(Items) to High(Items) do
  begin
    SetOwner(Items[I]);
    AMenu.FItems.Add(Items[I]);
  end;
end;

function NewMenu(Owner: TComponent; const AName: string; Items: array of TMenuItem): TMainMenu;
begin
  Result := TMainMenu.Create(Owner);
  Result.Name := AName;
  InitMenuItems(Result, Items);
end;

function NewPopupMenu(Owner: TComponent; const AName: string;
  Alignment: TPopupAlignment; AutoPopup: Boolean; Items: array of TMenuItem): TPopupMenu;
begin
  Result := TPopupMenu.Create(Owner);
  Result.Name := AName;
  Result.AutoPopup := AutoPopup;
  Result.Alignment := Alignment;
  InitMenuItems(Result, Items);
end;

function NewSubMenu(const ACaption: string; hCtx: Word;
  const AName: string; Items: array of TMenuItem; AEnabled: Boolean): TMenuItem;
var
  I: Integer;
begin
  Result := TMenuItem.Create(nil);
  for I := Low(Items) to High(Items) do
    Result.Add(Items[I]);
  Result.Caption := ACaption;
  Result.HelpContext := hCtx;
  Result.Name := AName;
  Result.Enabled := AEnabled;
end;

function NewItem(const ACaption: string; AShortCut: TShortCut;
  AChecked, AEnabled: Boolean; AOnClick: TNotifyEvent; hCtx: Word;
  const AName: string): TMenuItem;
begin
  Result := TMenuItem.Create(nil);
  with Result do
  begin
    Caption := ACaption;
    ShortCut := AShortCut;
    OnClick := AOnClick;
    HelpContext := hCtx;
    Checked := AChecked;
    Enabled := AEnabled;
    Name := AName;
  end;
end;

function NewLine: TMenuItem;
begin
  Result := TMenuItem.Create(nil);
  Result.Caption := '-';
end;

function StripHotKey(const Text: string): string;
var
  I: Integer;
begin
  Result := Text;
  I := 1;
  while I <= Length(Result) do
  begin
    if Result[I] in LeadBytes then
      Inc(I)
    else if Result[I] = '&' then
      if SysLocale.FarEast and
        ((I > 1) and (Length(Result)-I >= 2) and
         (Result[I-1] = '(') and (Result[I+2] = ')')) then
        Delete(Result, I-1, 4)
      else
        Delete(Result, I, 1);
    Inc(I);
  end;
end;

initialization
  RegisterClasses([TMenuItem]);
  CommandPool := TBits.Create;
  PopupList := TPopupList.Create;
finalization
  PopupList.Free;
  CommandPool.Free;
end.

