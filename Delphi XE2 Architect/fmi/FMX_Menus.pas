{*******************************************************}
{                                                       }
{              Delphi FireMonkey Platform               }
{                                                       }
{ Copyright(c) 2011 Embarcadero Technologies, Inc.      }
{                                                       }
{*******************************************************}

unit FMX_Menus;

{$I FMX_Defines.inc}

interface

uses
  Classes, Types, UITypes,
  FMX_Types, FMX_Forms, FMX_Controls;

type

{ Menus }

  TMenuItem = class;

  IMenuView = interface(IControl)
    ['{FC4740B4-03BF-400D-B9A4-6DE0D3D0BBD7}']
    function GetLoop: Boolean;
    procedure SetLoop(const Value: Boolean);
    function GetParentView: IMenuView;
    procedure SetParentView(const Value: IMenuView);
    function GetChildView: IMenuView;
    procedure SetChildView(const Value: IMenuView);
    function GetSelected: TMenuItem;
    procedure SetSelected(const Value: TMenuItem);
    function GetIsMenuBar: Boolean;
    { access }
    property IsMenuBar: Boolean read GetIsMenuBar;
    property Loop: Boolean read GetLoop write SetLoop;
    property ParentView: IMenuView read GetParentView write SetParentView;
    property ChildView: IMenuView read GetChildView write SetChildView;
    property Selected: TMenuItem read GetSelected write SetSelected;
  end;

{ TMenuItem }

  TMenuItem = class(TTextControl, IItemsContainer)
  private
    FContent: TContent;
    FIsSelected: Boolean;
    FPopupTimer: TTimer;
    FShortCut: TShortCut;
    FShortCutObject: TFmxObject;
    FSubmarkObject: TFmxObject;
    FCheckmarkObject: TFmxObject;
    FGlyphObject: TFmxObject;
    FBitmapObject: TFmxObject;
    FHandle: TFmxHandle;
    FIsChecked: Boolean;
    FBitmap: TBitmap;
    FAutoCheck: Boolean;
    FRadioItem: Boolean;
    FGroupIndex: Byte;
    procedure SetIsSelected(const Value: Boolean);
    function GetMenuView: IMenuView;
    procedure DoPopupTimer(Sender: TObject);
    procedure SetShortCut(const Value: TShortCut);
    procedure SetIsChecked(const Value: Boolean);
    procedure SetBitmap(const Value: TBitmap);
    procedure TurnSiblingsOff;
    procedure SetGroupIndex(const Value: Byte);
    procedure SetRadioItem(const Value: Boolean);
  protected
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Single); override;
    procedure DialogKey(var Key: Word; Shift: TShiftState); override;
    procedure Click; override;
    procedure SetText(const Value: WideString); override;
    function EnterChildren(AObject: TControl): Boolean; override;
    { IItemContainer }
    function GetItemsCount: Integer;
    function GetItem(const AIndex: Integer): TFmxObject;
    procedure SetVisible(const AValue: Boolean); override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure AddObject(AObject: TFmxObject); override;
    { menu }
    function CalcSize: TPointF;
    { TStyledControl }
    procedure ApplyStyle; override;
    procedure FreeStyle; override;
    { Menus }
    procedure Popup;
    procedure NeedPopup;
    function HavePopup: Boolean;
    property View: IMenuView read GetMenuView;
    { OS Menu }
    property Handle: TFmxHandle read FHandle write FHandle;
    property Font;
  published
    property Align stored False;
    property AutoCheck: Boolean read FAutoCheck write FAutoCheck default False;
    property Bitmap: TBitmap read FBitmap write SetBitmap;
    property IsChecked: Boolean read FIsChecked write SetIsChecked default False;
    property IsSelected: Boolean read FIsSelected write SetIsSelected stored False;
    property GroupIndex: Byte read FGroupIndex write SetGroupIndex default 0;
//    property Font;    RAID 282684
    property StyleLookup;
    property RadioItem: Boolean read FRadioItem write SetRadioItem default False;
    property ShortCut: TShortCut read FShortCut write SetShortCut;
    property TextAlign default TTextAlign.taLeading;
    property Text;
    property WordWrap default False;
  end;

{ TPopupMenu }

  TPopupMenu = class(TCustomPopupMenu, IItemsContainer)
  private
    FPopupPoint: TPoint;
    { IItemContainer }
    function GetItemsCount: Integer;
    function GetItem(const AIndex: Integer): TFmxObject;
    function GetObject: TFmxObject;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure CloseMenu; inline;
    procedure Popup(X, Y: Single); override;
    property PopupPoint: TPoint read FPopupPoint;
    procedure DialogKey(var Key: Word; Shift: TShiftState);
  end;

{ TMenuBar }

  TMenuBar = class(TStyledControl, IMenuView, IItemsContainer)
  private
    { IMenuView }
    FLoop: Boolean;
    FParentView: IMenuView;
    FChildView: IMenuView;
    FSelected: TMenuItem;
    FUseOSMenu: Boolean;
    function GetLoop: Boolean;
    procedure SetLoop(const Value: Boolean);
    function GetParentView: IMenuView;
    procedure SetParentView(const Value: IMenuView);
    function GetChildView: IMenuView;
    procedure SetChildView(const Value: IMenuView);
    function GetSelected: TMenuItem;
    procedure SetSelected(const Value: TMenuItem);
    function GetIsMenuBar: Boolean;
    procedure SetUseOSMenu(const Value: Boolean);
  protected
    FContent: TControl;
    procedure Realign; override;
    procedure DialogKey(var Key: Word; Shift: TShiftState); override;
    { TComponent }
    procedure Loaded; override;
    { TStyledControl }
    procedure ApplyStyle; override;
    procedure FreeStyle; override;
    { IItemContainer }
    function GetItemsCount: Integer;
    function GetItem(const AIndex: Integer): TFmxObject;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure AddObject(AObject: TFmxObject); override;
    procedure StartMenuLoop;
  published
    property UseOSMenu: Boolean read FUseOSMenu write SetUseOSMenu default False;
  end;

{ TMainMenu }

  TMainMenu = class(TFmxObject, IItemsContainer)
  private
    { IItemContainer }
    function GetItemsCount: Integer;
    function GetItem(const AIndex: Integer): TFmxObject;
    function GetObject: TFmxObject;
  protected
    { TComponent }
    procedure Loaded; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure AddObject(AObject: TFmxObject); override;
    //added to enable the shortcut functionality of main menu items
    procedure DialogKey(var Key: Word; Shift: TShiftState);
  end;

{ TPopupBox }

  TPopupBox = class(TCustomButton)
  private
    FItems: TWideStrings;
    FItemIndex: Integer;
    FPopup: TPopupMenu;
    FOnChange: TNotifyEvent;
    procedure SetItems(const Value: TWideStrings);
    procedure SetItemIndex(const Value: Integer);
  protected
    procedure ApplyStyle; override;
    procedure Click; override;
    procedure DoItemsChanged(Sender: TObject); virtual;
    procedure DoItemClick(Sender: TObject);
    procedure DoPopup; virtual;
    function GetData: Variant; override;
    procedure SetData(const Value: Variant); override;
    procedure SetText(const Value: WideString); override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published
    property BindingSource;
    property CanFocus default True;
    property DisableFocusEffect;
    property TabOrder;
    property Text stored False;
    property Items: TWideStrings read FItems write SetItems;
    property ItemIndex: Integer read FItemIndex write SetItemIndex;
    property OnChange: TNotifyEvent read FOnChange write FOnChange;
  end;

function TextToShortcut(Text: WideString): integer;

implementation

uses SysUtils, Variants, FMX_Platform, FMX_Objects;

type

{ TMenuView }

  TMenuView = class(TStyledControl, IMenuView)
  private
    { IMenuView }
    FLoop: Boolean;
    FParentView, FChildView: IMenuView;
    FSelected: TMenuItem;
    function GetLoop: Boolean;
    procedure SetLoop(const Value: Boolean);
    function GetParentView: IMenuView;
    procedure SetParentView(const Value: IMenuView);
    function GetChildView: IMenuView;
    procedure SetChildView(const Value: IMenuView);
    function GetSelected: TMenuItem;
    procedure SetSelected(const Value: TMenuItem);
    function GetIsMenuBar: Boolean;
  protected
    FContent: TControl;
    procedure Realign; override;
    { TStyledControl }
    procedure ApplyStyle; override;
    procedure FreeStyle; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published
  end;

{ TMenuItem }

constructor TMenuItem.Create(AOwner: TComponent);
begin
  inherited;
  TextAlign := TTextAlign.taLeading;
  WordWrap := False;
  FBitmap := TBitmap.Create(0, 0);
  FContent := TContent.Create(Self);
  FContent.Parent := Self;
  FContent.Stored := False;
  FContent.Locked := True;
  FContent.HitTest := False;
  FContent.Visible := False;
end;

destructor TMenuItem.Destroy;
begin
  FBitmap.Free;
  FContent := nil; 
  inherited;
end;

procedure TMenuItem.DialogKey(var Key: Word; Shift: TShiftState);
var
  k: word;
  SState: TShiftState;
  P: TFMXObject;
begin
  //getting key from item's defined shortcut
  Platform.ShortCutToKey(ShortCut, k, SState);
  //checking if the key from Shortcut is the same with the typed one and has the same Shift state
  if (Key = k) and (Shift = SState) then
  begin
    if Assigned(OnClick) then
    begin
      OnClick(Self);
      {$IFDEF MACOS}
       //avoid insertion of the leter from shortcut on a editable component with focus on it
        Key:=0;
      {$ENDIF}
    end;
  end
  else
    inherited DialogKey(Key, Shift);
end;

function TMenuItem.EnterChildren(AObject: TControl): Boolean;
begin
  Result := inherited EnterChildren(AObject);
  IsSelected := True;
  Result := True;
end;

function TMenuItem.GetMenuView: IMenuView;
var
  View: IMenuView;
begin
  Result := nil;
  if (Parent <> nil) and (IInterface(Parent).QueryInterface(IMenuView, View) = S_OK) then
    Result := View;
end;

function TMenuItem.HavePopup: Boolean;
begin
  Result := GetItemsCount > 0;
end;

procedure TMenuItem.MouseDown(Button: TMouseButton; Shift: TShiftState; X,
  Y: Single);
begin
  inherited;
  if Button = TMouseButton.mbLeft then
  begin
    NeedPopup;
  end;
end;

procedure TMenuItem.DoPopupTimer(Sender: TObject);
begin
  FPopupTimer.Enabled := False;
  Popup;
end;

procedure TMenuItem.NeedPopup;
begin
  if not HavePopup then Exit;

  if FPopupTimer = nil then
    FPopupTimer := TTimer.Create(nil);
  FPopupTimer.Parent := Self;
  FPopupTimer.Interval := 1;
  FPopupTimer.OnTimer := DoPopupTimer;
  FPopupTimer.Enabled := True;
end;

procedure TMenuItem.SetBitmap(const Value: TBitmap);
begin
  FBitmap.Assign(Value);
end;

procedure TMenuItem.SetGroupIndex(const Value: Byte);
begin
  if FGroupIndex <> Value then
  begin
    FGroupIndex := Value;
    if FIsChecked and FRadioItem then
      TurnSiblingsOff;
  end;
end;

procedure TMenuItem.TurnSiblingsOff;
var
  I: Integer;
  Item: TMenuItem;
begin
  if FParent <> nil then
    for I := 0 to FParent.ChildrenCount - 1 do
    begin
      if FParent.Children[I] is TMenuItem then
      begin
        Item := TMenuItem(FParent.Children[I]);
        if (Item <> Self) and Item.FRadioItem and (Item.GroupIndex = GroupIndex) then
          Item.SetIsChecked(False);
      end;
    end;
end;

procedure TMenuItem.SetIsChecked(const Value: Boolean);
begin
  if FIsChecked <> Value then
  begin
    FIsChecked := Value;
    if Value and FRadioItem then
      TurnSiblingsOff;
    if IsHandleValid(Handle) then
      Platform.UpdateMenuItem(Self)
    else
    begin
      StartTriggerAnimation(Self, 'IsChecked');
      ApplyTriggerEffect(Self, 'IsChecked');
    end;
  end;
end;

procedure TMenuItem.SetIsSelected(const Value: Boolean);
begin
  if FIsSelected <> Value then
  begin
    FIsSelected := Value;
    StartTriggerAnimation(Self, 'IsSelected');
    ApplyTriggerEffect(Self, 'IsSelected');
    if View <> nil then
    begin
      View.Selected := Self;
    end;
  end;
end;

procedure TMenuItem.SetRadioItem(const Value: Boolean);
begin
  if FRadioItem <> Value then
  begin
    FRadioItem := Value;
    if FIsChecked and FRadioItem then
      TurnSiblingsOff;
  end;
end;

procedure TMenuItem.SetShortCut(const Value: TShortCut);
begin
  if FShortCut <> Value then
  begin
    FShortCut := Value;
    if IsHandleValid(Handle) then
      Platform.UpdateMenuItem(Self)
  end;
end;

procedure TMenuItem.SetText(const Value: WideString);
begin
  if FText <> Value then
  begin
    inherited;
    if IsHandleValid(Handle) then
      Platform.UpdateMenuItem(Self)
    else
    begin
      if (Parent is TMenuBar) then
        TMenuBar(Parent).Realign;
    end;
  end;
end;

procedure TMenuItem.SetVisible(const AValue: Boolean);
begin
  inherited;
  if Parent is TMenuBar then
    TMenuBar(Parent).Realign;
  if IsHandleValid(Handle) then
    Platform.UpdateMenuItem(Self);
end;

procedure TMenuItem.AddObject(AObject: TFmxObject);
begin
  if (FContent <> nil) and (AObject is TMenuItem) then
  begin
    TMenuItem(AObject).Locked := True;
    FContent.AddObject(AObject);
    if IsHandleValid(Handle) then
      Platform.UpdateMenuItem(Self)
  end
  else
    inherited;
end;

procedure TMenuItem.ApplyStyle;
var
  O: TFmxObject;
begin
  inherited;
  O := FindStyleResource('glyph');
  if (O <> nil) and (O is TControl)  then
  begin
    FGlyphObject := O;
    TControl(FGlyphObject).Visible := not (FBitmap.IsEmpty) or ((View <> nil) and not View.GetIsMenuBar);
  end;
  O := FindStyleResource('checkmark');
  if (O <> nil) and (O is TControl) then
  begin
    FCheckmarkObject := O;
    if (View <> nil) and not View.GetIsMenuBar and IsChecked then
    begin
      ApplyTriggerEffect(Self, 'IsChecked');
      StartTriggerAnimation(Self, 'IsChecked');
    end;
    TControl(FCheckmarkObject).Visible := True;
  end;
  O := FindStyleResource('bitmap');
  if (O <> nil) and (O is TControl)  then
  begin
    FBitmapObject := O;
    if FBitmapObject is TImage then
      TImage(FBitmapObject).Bitmap.Assign(FBitmap);
    TControl(FBitmapObject).Visible := not (FBitmap.IsEmpty);
  end;
  O := FindStyleResource('shortcut');
  if (O <> nil) then
  begin
    FShortCutObject := O;
    if (FShortCutObject <> nil) and (FShortCutObject is TText) then
    begin
      TText(FShortCutObject).Text := Platform.ShortCutToText(FShortcut);
      TText(FShortCutObject).WordWrap := False;
      TText(FShortCutObject).Visible := (((View <> nil) and not View.GetIsMenuBar));
    end;
  end;
  O := FindStyleResource('submark');
  if (O <> nil) and (O is TControl) then
  begin
    FSubmarkObject := O;
    TControl(FSubmarkObject).Visible := (View <> nil) and not View.GetIsMenuBar and (GetItemsCount > 0);
  end;
end;

procedure TMenuItem.FreeStyle;
begin
  inherited;
  FCheckmarkObject := nil;
  FShortCutObject := nil;
  FGlyphObject := nil;
  FSubmarkObject := nil;
end;

function TMenuItem.CalcSize: TPointF;
var
  C: TCanvas;
begin
  if Text = '-' then
  begin
    StyleLookup := 'menuseparatorstyle';
    Result := PointF(0, 8);
    Exit;
  end;
  if Canvas = nil then
  begin
    C := GetMeasureBitmap.Canvas;
  end
  else
    C := Canvas;

  ApplyStyleLookup;

  Result := PointF(0, 23);
  if (FGlyphObject <> nil) and (FGlyphObject is TControl) and (TControl(FGlyphObject).Visible) then
  begin
    Result.X := Result.X + TControl(FGlyphObject).Width + TControl(FGlyphObject).Padding.Left + TControl(FGlyphObject).Padding.Right;
  end;
  if (FTextObject <> nil) and (FTextObject is TText) then
  begin
    C.Font.Assign(TText(FTextObject).Font);
    TText(FTextObject).Width := C.TextWidth(Text);
    Result.X := Result.X + TText(FTextObject).Width + TControl(FTextObject).Padding.Left + TControl(FTextObject).Padding.Right;
  end;
  if (FShortCutObject <> nil) and (FShortCutObject is TText) and (TControl(FShortCutObject).Visible) then
  begin
    C.Font.Assign(TText(FShortCutObject).Font);
    TText(FShortCutObject).Width := C.TextWidth(Platform.ShortCutToText(FShortcut));
    Result.X := Result.X + TText(FShortCutObject).Width + TControl(FShortCutObject).Padding.Left + TControl(FShortCutObject).Padding.Right;
  end;
  if (FSubmarkObject <> nil) and (FSubmarkObject is TControl) and (TControl(FSubmarkObject).Visible) then
  begin
    Result.X := Result.X + TControl(FSubmarkObject).Width + TControl(FSubmarkObject).Padding.Left + TControl(FSubmarkObject).Padding.Right;
  end;
end;

procedure TMenuItem.Click;
begin
  DoMouseLeave;
  if AutoCheck then
    IsChecked := not IsChecked;
  inherited;
end;

procedure TMenuItem.Popup;
var
  Popup: TPopup;
  Menu: TMenuView;
  Item: TMenuItem;
  i: Integer;
begin
  if FContent = nil then Exit;
  if FContent.ChildrenCount = 0 then Exit;

  IsSelected := True;
  Popup := TPopup.Create(nil);
  Menu := TMenuView.Create(nil);
  try
    if View <> nil then
    begin
      View.ChildView := Menu;
      Menu.FParentView := View;
    end;
    // set style
    if (Scene <> nil) and (Scene.StyleBook <> nil) then
      Popup.StyleBook := Scene.StyleBook;
    // create popup
    Popup.PlacementTarget := Self;
    if Parent is TMenuBar then
      Popup.Placement := TPlacement.plBottom
    else
      Popup.Placement := TPlacement.plRight;
    // create menu
    Menu.Parent := Popup;
    // copy items to menu
    Menu.BeginUpdate;
    for i := FContent.ChildrenCount - 1 downto 0 do
      if (FContent.Children[i] is TMenuItem) and TMenuItem(FContent.Children[i]).Visible then
      begin
        Item := TMenuItem(FContent.Children[i]);
        Item.Parent := Menu;
        Item.Index := 0;
      end;
    Menu.EndUpdate;
    // calc size
    Popup.BoundsRect := RectF(0, 0, Menu.Width, Menu.Height);
    // show
    Popup.Popup;
    // style
    if Menu.Scene <> nil then
      Menu.Scene.UpdateStyle;
    // correct size
    if (Popup.Parent <> nil) and (Popup.Parent is TCommonCustomForm) then
    begin
      Menu.Realign;
      TCommonCustomForm(Popup.Parent).ClientWidth := round(Menu.Width);
      TCommonCustomForm(Popup.Parent).ClientHeight := round(Menu.Height);
    end;
    // start loop
    Platform.StartMenuLoop(Menu);
    // copy back
    FContent.BeginUpdate;
    for i := Menu.ChildrenCount - 1 downto 0 do
      if (Menu.Children[i] is TMenuItem) and TMenuItem(Menu.Children[i]).Visible then
      begin
        Item := TMenuItem(Menu.Children[i]);
        Item.Parent := FContent;
        Item.Index := 0;
      end;
    FContent.EndUpdate;
  finally
    // hide popup
    Popup.ClosePopup;
    // hide
    if View <> nil then
    begin
      View.Selected := nil;
      View.ChildView := nil;
      Menu.FParentView := nil;
    end;
    Menu.Visible := False;
    Menu.Free;
    IsSelected := False;
    Popup.Free;
  end;
end;

{ IItemContainer }

function TMenuItem.GetItem(const AIndex: Integer): TFmxObject;
var
  i, C: Integer;
begin
  Result := nil;
  C := 0;
  for i := 0 to FContent.ChildrenCount - 1 do
    if FContent.Children[i] is TMenuItem then
    begin
      if C = AIndex then
      begin
        Result := FContent.Children[i];
        Break;
      end;
      C := C + 1;
    end;
end;

function TMenuItem.GetItemsCount: Integer;
var
  i: Integer;
begin
  Result := 0;
  for i := 0 to FContent.ChildrenCount - 1 do
    if (FContent.Children[i] is TMenuItem){ and TMenuItem(FContent.Children[I]).Visible} then
      Result := Result + 1;
end;

{ TMenuView }

constructor TMenuView.Create(AOwner: TComponent);
begin
  inherited;
  Width := 200;
  Height := 200;
end;

destructor TMenuView.Destroy;
begin
  inherited;
end;

procedure TMenuView.ApplyStyle;
var
  O: TFmxObject;
begin
  inherited;
  O := FindStyleResource('content');
  if (O <> nil) and (O is TControl) then
  begin
    FContent := TControl(O);
  end;
end;

procedure TMenuView.FreeStyle;
begin
  inherited;
  FContent := nil;
end;

function TMenuView.GetChildView: IMenuView;
begin
  Result := FChildView;
end;

function TMenuView.GetIsMenuBar: Boolean;
begin
  Result := False;
end;

function TMenuView.GetLoop: Boolean;
begin
  Result := FLoop;
end;

function TMenuView.GetParentView: IMenuView;
begin
  Result := FParentView;
end;

function TMenuView.GetSelected: TMenuItem;
begin
  Result := FSelected;
end;

procedure TMenuView.Realign;
var
  MarginR, ContentR, R: TRectF;
  P: TPointF;
  i: Integer;
  Size: TPointF;
  S: TPointF;
begin
  inherited ;
  if FUpdating > 0 then
    Exit;
  if csLoading in ComponentState then
    Exit;
  if FDisableAlign then
    Exit;

  FDisableAlign := True;
  try
    ApplyStyleLookup;
    if (FContent <> nil) and (FResourceLink <> nil) then
    begin
      TControl(FResourceLink).BoundsRect := RectF(0, 0, Width, Height);
      ContentR.TopLeft := AbsoluteToLocal(FContent.LocalToAbsolute(PointF(0, 0)));
      with AbsoluteToLocal(FContent.LocalToAbsolute(PointF(FContent.Width, FContent.Height))) do
        ContentR.BottomRight := PointF(Self.Width - X, Self.Height - Y);
    end
    else
      ContentR := RectF(0, 0, 0, 0);

    if FResourceLink <> nil then
      with TControl(FResourceLink) do
        MarginR := RectF(Margins.Left, Margins.Top, Margins.Bottom, Margins.Right)
    else
        MarginR := RectF(0, 0, 0, 0);
    { calc items size }
    Size := PointF(0, 0);
    if ChildrenCount > 0 then
      for i := 0 to ChildrenCount - 1 do
      begin
        if Children[i] is TMenuItem then
          with TMenuItem(Children[i]) do
          begin
            P := CalcSize;
            Size.Y := Size.Y + P.Y + Padding.Top + Padding.Bottom;
            if P.X + Padding.Left + Padding.Right > Size.X then
              Size.X := P.X + Padding.Left + Padding.Right;
          end;
      end;
    SetBounds(Position.X, Position.Y, Size.X + ContentR.Left + ContentR.Right,
          Size.Y + ContentR.Top + ContentR.Bottom);
    if FResourceLink <> nil then
      with TControl(FResourceLink) do
        SetBounds(MarginR.Left, MarginR.Top, Self.Width - MarginR.Left - MarginR.Right,
          Self.Height - MarginR.Top - MarginR.Bottom);
    { align }
    Size := PointF(0, 0);
    if ChildrenCount > 0 then
      for i := 0 to (ChildrenCount - 1) do
      begin
        if Children[i] is TMenuItem then
          with TMenuItem(Children[i]) do
          begin
            P := CalcSize;
            SetBounds(ContentR.Left + Padding.Left, ContentR.Top + Size.Y, Self.Width - Padding.Left - Padding.Right - ContentR.Left - ContentR.Right, P.Y - Padding.Top - Padding.Bottom);
            Size.Y := Size.Y + Height + Padding.Top + Padding.Bottom;
          end;
      end;
  finally
    FDisableAlign := False;
  end;
end;

procedure TMenuView.SetChildView(const Value: IMenuView);
begin
  FChildView := Value;
end;

procedure TMenuView.SetLoop(const Value: Boolean);
begin
  FLoop := Value;
  Repaint;
end;

procedure TMenuView.SetParentView(const Value: IMenuView);
begin
  FParentView := Value;
end;

procedure TMenuView.SetSelected(const Value: TMenuItem);
begin
  if FSelected <> Value then
  begin
    if FSelected <> nil then
      FSelected.IsSelected := False;
    FSelected := Value;
    if FSelected <> nil then
      FSelected.IsSelected := True;
  end;
end;

{ TPopupMenu }

constructor TPopupMenu.Create(AOwner: TComponent);
begin
  inherited;
end;

destructor TPopupMenu.Destroy;
begin
  inherited;
end;

procedure TPopupMenu.DialogKey(var Key: Word; Shift: TShiftState);
var
  I: integer;
  MItem: TMenuItem;
begin
  for I := GetItemsCount - 1 downto 0 do
  begin
    MItem:= TMenuItem(GetItem(I));
    MItem.DialogKey(Key, Shift);
  end;
end;

{ IItemContainer }

function TPopupMenu.GetItem(const AIndex: Integer): TFmxObject;
var
  i, C: Integer;
begin
  Result := nil;
  C := 0;
  for i := 0 to ChildrenCount - 1 do
    if Children[i] is TMenuItem then
    begin
      if C = AIndex then
      begin
        Result := Children[i];
        Break;
      end;
      C := C + 1;
    end;
end;

function TPopupMenu.GetItemsCount: Integer;
var
  i: Integer;
begin
  Result := 0;
  for i := 0 to ChildrenCount - 1 do
    if Children[i] is TMenuItem then
      Result := Result + 1;
end;

function TPopupMenu.GetObject: TFmxObject;
begin
  Result := Self;
end;

procedure TPopupMenu.CloseMenu;
begin
end;

procedure TPopupMenu.Popup(X, Y: Single);
var
  Popup: TPopup;
  Menu: TMenuView;
  Item: TMenuItem;
  i: Integer;
begin
  Popup := TPopup.Create(nil);
  Menu := TMenuView.Create(nil);
  try
    // create popup
    Popup.Parent := Parent;
    if Parent is TMenuBar then
      Popup.Placement := TPlacement.plBottom
    else
      Popup.Placement := TPlacement.plRight;
    // create menu
    Menu.Parent := Popup;
    // copy items to menu
    Menu.BeginUpdate;
    for i := ChildrenCount - 1 downto 0 do
      if Children[i] is TMenuItem then
        if TMenuItem(Children[i]).Visible then
        begin
          Item := TMenuItem(Children[i]);
          Item.Parent := Menu;
          Item.Index := 0;
        end;
    Menu.EndUpdate;
    // calc size
    Popup.BoundsRect := RectF(0, 0, Menu.Width * Popup.AbsoluteMatrix.m11, Menu.Height * Popup.AbsoluteMatrix.m11);

    Popup.PlacementRectangle.Left := X;
    Popup.PlacementRectangle.Top := Y;
    Popup.Placement := TPlacement.plAbsolute;
//    Popup.PlacementTarget := Self;
    // show
    Popup.Popup;
    // correct size
    if (Popup.Parent <> nil) and (Popup.Parent is TCommonCustomForm) then
    begin
      Menu.Realign;
      TCommonCustomForm(Popup.Parent).ClientWidth := round(Menu.Width * Popup.AbsoluteMatrix.m11);
      TCommonCustomForm(Popup.Parent).ClientHeight := round(Menu.Height * Popup.AbsoluteMatrix.m11);
    end;
    // start loop
    Platform.StartMenuLoop(Menu);
    // copy back
    for i := Menu.ChildrenCount - 1 downto 0 do
      if Menu.Children[i] is TMenuItem then
      begin
        Item := TMenuItem(Menu.Children[i]);
        Item.Parent := Self;
        Item.Index := 0;
      end;
  finally
    // hide popup
    Popup.ClosePopup;
    Menu.Visible := False;
    Menu.Free;
    Popup.Free;
  end;
end;

{ TMenuBar }

constructor TMenuBar.Create(AOwner: TComponent);
begin
  inherited;
  FStyleLookup := 'menubarstyle';
  Width := 500;
  Height := 40;
  SetAcceptsControls(False);
end;

destructor TMenuBar.Destroy;
begin
  inherited;
end;

procedure TMenuBar.DialogKey(var Key: Word; Shift: TShiftState);
begin
  inherited DialogKey(Key, Shift);
end;

procedure TMenuBar.AddObject(AObject: TFmxObject);
begin
  inherited;
  if AObject is TMenuItem then
  begin
    if FUseOSMenu and not (csDesigning in ComponentState) then
    begin
      if (Root <> nil) and (Root.GetObject is TCommonCustomForm) then
        Platform.CreateOSMenu(TCommonCustomForm(Root.GetObject), Self);
    end
    else
      Realign;
  end;
end;

procedure TMenuBar.ApplyStyle;
var
  O: TFmxObject;
begin
  inherited;
  O := FindStyleResource('content');
  if (O <> nil) and (O is TControl) then
  begin
    FContent := TControl(O);
  end;
end;

procedure TMenuBar.FreeStyle;
begin
  inherited;
  FContent := nil;
end;

function TMenuBar.GetChildView: IMenuView;
begin
  Result := FChildView;
end;

function TMenuBar.GetIsMenuBar: Boolean;
begin
  Result := True;
end;

function TMenuBar.GetItem(const AIndex: Integer): TFmxObject;
var
  i, C: Integer;
begin
  Result := nil;
  C := 0;
  for i := 0 to ChildrenCount - 1 do
    if Children[i] is TMenuItem then
    begin
      if C = AIndex then
      begin
        Result := Children[i];
        Break;
      end;
      C := C + 1;
    end;
end;

function TMenuBar.GetItemsCount: Integer;
var
  i: Integer;
begin
  Result := 0;
  for i := 0 to ChildrenCount - 1 do
    if Children[i] is TMenuItem then
      Result := Result + 1;
end;

function TMenuBar.GetLoop: Boolean;
begin
  Result := FLoop;
end;

procedure TMenuBar.SetChildView(const Value: IMenuView);
begin
  FChildView := Value;
end;

procedure TMenuBar.SetLoop(const Value: Boolean);
begin
  FLoop := Value;
  Repaint;
end;

procedure TMenuBar.SetParentView(const Value: IMenuView);
begin
  FParentView := Value;
end;

procedure TMenuBar.SetSelected(const Value: TMenuItem);
begin
  if FSelected <> Value then
  begin
    if FSelected <> nil then
      FSelected.IsSelected := False;
    FSelected := Value;
    if FSelected <> nil then
      FSelected.IsSelected := True;
  end;
end;

procedure TMenuBar.SetUseOSMenu(const Value: Boolean);
begin
  if FUseOSMenu <> Value then
  begin
    FUseOSMenu := Value;
    if not (csLoading in ComponentState) and not (csDesigning in ComponentState) then
    begin
      if FUseOSMenu then
      begin
        Visible := False;
        if Root.GetObject is TCommonCustomForm then
          Platform.CreateOSMenu(TCommonCustomForm(Root.GetObject), Self);
      end
      else
      begin
        Visible := True;
        if Root.GetObject is TCommonCustomForm then
          Platform.CreateOSMenu(TCommonCustomForm(Root.GetObject), nil);
      end;
    end;
  end;
end;

procedure TMenuBar.StartMenuLoop;
begin
  if not UseOSMenu then
    Platform.StartMenuLoop(Self);
end;

function TMenuBar.GetParentView: IMenuView;
begin
  Result := FParentView;
end;

function TMenuBar.GetSelected: TMenuItem;
begin
  Result := FSelected;
end;

procedure TMenuBar.Loaded;
begin
  inherited;
  if FUseOSMenu and not (csDesigning in ComponentState) then
  begin
    Visible := False;
    if (Root <> nil) and (Root.GetObject is TCommonCustomForm) then
      Platform.CreateOSMenu(TCommonCustomForm(Root.GetObject), Self);
  end;
end;

procedure TMenuBar.Realign;
var
  R, ContentR: TRectF;
  P: TPointF;
  i: Integer;
  CurX: Single;
begin
  inherited ;
  if FUpdating > 0 then
    Exit;
  if csLoading in ComponentState then
    Exit;
  if FDisableAlign then
    Exit;

  FDisableAlign := True;
  try
    ApplyStyleLookup;
    if (FContent <> nil) and (FResourceLink <> nil) then
    begin
      TControl(FResourceLink).BoundsRect := RectF(0, 0, Width, Height);
      ContentR.TopLeft := AbsoluteToLocal(FContent.LocalToAbsolute(PointF(0, 0)));
      with AbsoluteToLocal(FContent.LocalToAbsolute(PointF(FContent.Width, FContent.Height))) do
        ContentR.BottomRight := PointF(Self.Width - X, Self.Height - Y);
    end
    else
      ContentR := RectF(0, 0, 0, 0);
    CurX := 0;
    if ChildrenCount > 0 then
      for i := 0 to (ChildrenCount - 1) do
      begin
        if (Children[i] is TMenuItem) and (TMenuItem(Children[i]).Visible) then
          with TMenuItem(Children[i]) do
          begin
            P := CalcSize;
            SetBounds(ContentR.Left + CurX, ContentR.Top + Padding.Top, P.X - Padding.Left - Padding.Right,
              Self.Height - Padding.Top - Padding.Bottom - ContentR.Top - ContentR.Bottom);
            CurX := CurX + Width + Padding.Left + Padding.Right;
          end;
      end;
  finally
    FDisableAlign := False;
  end;
end;

{ TMainMenu }

constructor TMainMenu.Create(AOwner: TComponent);
begin
  inherited;
end;

destructor TMainMenu.Destroy;
begin
  inherited;
end;

procedure TMainMenu.DialogKey(var Key: Word; Shift: TShiftState);
var
  I: integer;
  MItem: TMenuItem;
begin
  for I := GetItemsCount - 1 downto 0 do
  begin
    MItem:= TMenuItem(GetItem(I));
    MItem.DialogKey(Key, Shift);
  end;
end;

procedure TMainMenu.Loaded;
begin
  inherited;
  if not (csDesigning in ComponentState) then
  begin
    if Assigned(Root) and (Root.GetObject is TCommonCustomForm) then
      Platform.CreateOSMenu(TCommonCustomForm(Root.GetObject), Self);
  end;
end;

procedure TMainMenu.AddObject(AObject: TFmxObject);
begin
  inherited;
  if (AObject is TMenuItem) and not (csDesigning in ComponentState) then
  begin
    if Assigned(Root) and (Root.GetObject is TCommonCustomForm) then
      Platform.CreateOSMenu(TCommonCustomForm(Root.GetObject), Self);
  end;
end;

{ IItemContainer }

function TMainMenu.GetItem(const AIndex: Integer): TFmxObject;
var
  i, C: Integer;
begin
  Result := nil;
  C := 0;
  for i := 0 to ChildrenCount - 1 do
    if Children[i] is TMenuItem then
    begin
      if C = AIndex then
      begin
        Result := Children[i];
        Break;
      end;
      C := C + 1;
    end;
end;

function TMainMenu.GetItemsCount: Integer;
var
  i: Integer;
begin
  Result := 0;
  for i := 0 to ChildrenCount - 1 do
    if Children[i] is TMenuItem then
      Result := Result + 1;
end;

function TMainMenu.GetObject: TFmxObject;
begin
  Result := Self;
end;

{ TPopupBox }

constructor TPopupBox.Create(AOwner: TComponent);
begin
  inherited;
  CanFocus := True;
  Height := 21;
  FItems := TWideStringList.Create;;
  TWideStringList(FItems).OnChange := DoItemsChanged;
  FPopup := TPopupMenu.Create(nil);
  FPopup.Stored := False;
  FPopup.Parent := Self;
  FItemIndex := -1;
  FText := '';
end;

destructor TPopupBox.Destroy;
begin
  FreeAndNil(FPopup);
  FreeAndNil(FItems);
  inherited;
end;

function TPopupBox.GetData: Variant;
begin
  Result := Text;
end;

procedure TPopupBox.SetData(const Value: Variant);
var
  S: WideString;
begin
  if VarIsNull(Value) then
    ItemIndex := -1
  else if VarIsEvent(Value) then
    OnChange := VariantToEvent(Value)
  else if VarIsNumeric(Value) then
    ItemIndex := Value
  else if VarIsStr(Value) then
  begin
    S := VarToWideStr(Value);
    if FItems.IndexOf(S) < 0 then
      Text := S
    else
      ItemIndex := FItems.IndexOf(S);
  end;
end;

procedure TPopupBox.ApplyStyle;
begin
  inherited;
end;

procedure TPopupBox.Click;
begin
  inherited;
  DoPopup;
end;

procedure TPopupBox.DoPopup;
var
  Item: TMenuItem;
  VP: TPointF;
  i: Integer;
begin
  FPopup.DeleteChildren;
  for i := 0 to FItems.Count - 1 do
  begin
    Item := TMenuItem.Create(Self);
    Item.Parent := FPopup;
    Item.Text := FItems[i];
    Item.RadioItem := True;
    Item.AutoCheck := True;
    Item.IsChecked := i = FItemIndex;
    Item.OnClick := DoItemClick;
    Item.Tag := i;
  end;
  if Scene <> nil then
  begin
    VP := LocalToAbsolute(PointF(0, trunc((Height / 2) - ((FItems.Count * 20) div 2))));
    VP := Scene.LocalToScreen(VP);
    FPopup.Popup(Round(VP.X), Round(VP.Y));
  end;
end;

procedure TPopupBox.DoItemClick(Sender: TObject);
begin
  ItemIndex := TMenuItem(Sender).Tag;
end;

procedure TPopupBox.DoItemsChanged(Sender: TObject);
begin
  Repaint;
end;

procedure TPopupBox.SetItemIndex(const Value: Integer);
begin
  if FItemIndex <> Value then
  begin
    FItemIndex := Value;
    if (FItemIndex >= 0) and (Items.Count > 0) then
      Text := Items[FItemIndex]
    else
    begin
      Text := '';
      FItemIndex := -1;
    end;
    if Assigned(FOnChange) then
      FOnChange(Self);
  end;
end;

procedure TPopupBox.SetText(const Value: WideString);
begin
  if FItems.Count > 0 then
  begin
    FItemIndex := Items.IndexOf(Value);
    if FItemIndex >= 0 then
      inherited SetText(Value)
    else
      inherited SetText('')
  end
  else
  begin
    FItemIndex := -1;
    inherited SetText('')
  end;
end;

procedure TPopupBox.SetItems(const Value: TWideStrings);
begin
  FItems.Assign(Value);
end;

function TextToShortcut(Text: WideString): integer;
begin
  Result:= Platform.TextToShortCut(Text);
end;

initialization
  RegisterFmxClasses([TMenuItem, TMenuView, TPopupMenu, TMenuBar, TPopupBox]);
end.
