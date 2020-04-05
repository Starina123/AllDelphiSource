{*******************************************************}
{                                                       }
{              Delphi FireMonkey Platform               }
{                                                       }
{ Copyright(c) 2011 Embarcadero Technologies, Inc.      }
{                                                       }
{*******************************************************}

unit FMX_ListBox;

{$I FMX_Defines.inc}

interface

uses
  Classes, Types, UITypes,
  FMX_Types, FMX_Controls, FMX_Layouts, FMX_Objects;

{$SCOPEDENUMS ON}

type

  TCustomListBox = class;
  TCustomComboBox = class;

{ TListBoxItem }

  TListBoxItem = class(TTextControl)
  private
    FIsChecked: Boolean;
    FCheck: TCheckBox;
    FIsSelected: Boolean;
    FData: TObject;
    FIndex : Integer;
    procedure SetIsChecked(const Value: Boolean);
    procedure DoCheckClick(Sender: TObject);
    procedure UpdateCheck;
    procedure SetIsSelected(const Value: Boolean);
    function GetIndex: Integer;
    procedure SetIndex(const Value: Integer);
  protected
    function ListBox: TCustomListBox;
    function ComboBox: TCustomComboBox;
    procedure ApplyStyle; override;
    procedure FreeStyle; override;
    function GetParentComponent: TComponent; override;
    function EnterChildren(AObject: TControl): Boolean; override;
    procedure DragEnd; override;
    procedure Paint; override;
  public
    constructor Create(AOwner: TComponent); override;
    property Data: TObject read FData write FData;
    property Index: Integer read GetIndex write SetIndex stored False;
  published
    property IsChecked: Boolean read FIsChecked write SetIsChecked default False;
    property IsSelected: Boolean read FIsSelected write SetIsSelected default False;
    property AutoTranslate default True;
    property Font;
    property StyleLookup;
    property Text;
    property TextAlign default TTextAlign.taLeading;
    property WordWrap;
  end;

{ TCustomListBox }

  TListStyle = (lsVertical, lsHorizontal);

  TOnCompareListBoxItemEvent = procedure(Item1, Item2: TListBoxItem; var Result: Integer) of object;
  TOnListBoxDragChange = procedure(SourceItem, DestItem: TListBoxItem; var Allow: Boolean) of object;

  TCustomListBox = class(TScrollBox, IItemsContainer)
  private type
    TListBoxStrings = class(TWideStrings)
    private
      FListBox: TCustomListBox;
    protected
      {$IFDEF FPCCOMP}procedure Put(Index: Integer; const S: string); override;{$ELSE}procedure Put(Index: Integer; const S: WideString); override;{$ENDIF}
      {$IFDEF FPCCOMP}function Get(Index: Integer): string; override;{$ELSE}function Get(Index: Integer): WideString; override;{$ENDIF}
      function GetCount: Integer; override;
      function GetObject(Index: Integer): TObject; override;
      procedure PutObject(Index: Integer; AObject: TObject); override;
      procedure SetUpdateState(Updating: Boolean); override;
    public
      {$IFDEF FPCCOMP}function Add(const S: string): Integer; override;{$ELSE}function Add(const S: WideString): Integer; override;{$ENDIF}
      procedure Clear; override;
      procedure Delete(Index: Integer); override;
      procedure Exchange(Index1, Index2: Integer); override;
      {$IFDEF FPCCOMP}function IndexOf(const S: string): Integer; override;{$ELSE}function IndexOf(const S: WideString): Integer; override;{$ENDIF}
      {$IFDEF FPCCOMP}procedure Insert(Index: Integer; const S: string); override;{$ELSE}procedure Insert(Index: Integer; const S: WideString); override;{$ENDIF}
    end;
  private
    FMouseSelecting: Boolean;
    FOnChange: TNotifyEvent;
    FHideSelectionUnfocused: Boolean;
    FShowCheckboxes: Boolean;
    FOnChangeCheck: TNotifyEvent;
    FSorted: Boolean;
    FOnCompare: TOnCompareListBoxItemEvent;
    FMultiSelect: Boolean;
    FAlternatingRowBackground: Boolean;
    FAllowDrag: Boolean;
    FDragItem: TListBoxItem;
    FOnDragChange: TOnListBoxDragChange;
    function GetCount: Integer;
    function GetSelected: TListBoxItem;
    procedure SetColumns(const Value: Integer);
    procedure SetItemHeight(const Value: Single);
    procedure SetItemWidth(const Value: Single);
    procedure SetListStyle(const Value: TListStyle);
    procedure SetShowCheckboxes(const Value: Boolean);
    function GetListItem(Index: Integer): TListBoxItem;
    procedure SetSorted(const Value: Boolean);
    procedure SetAlternatingRowBackground(const Value: Boolean);
    procedure SetItems(Value: TWideStrings);
    procedure SetMultiSelect(const Value: Boolean);
    procedure SetAllowDrag(const Value: Boolean);
    { IItemContainer }
    function GetItemsCount: Integer;
    function GetItem(const AIndex: Integer): TFmxObject;
  protected
    FColumns: Integer;
    FItemWidth: Single;
    FItemHeight: Single;
    FListStyle: TListStyle;
    FFirstSelect: TListBoxItem;
    FSelection: TControl;
    FSelections: TList;
    FOddFill: TBrush;
    FItemIndex: Integer;
    FItems: TWideStrings;
    function CanObserve(const ID: Integer): Boolean; override;
    procedure DoChangeCheck(Item: TListBoxItem); dynamic;
    function CompareItems(Item1, Item2: TListBoxItem): Integer; virtual;
    procedure Change; dynamic;
    procedure SortItems; virtual;
    procedure SetItemIndex(const Value: Integer); virtual;
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Single); override;
    procedure MouseMove(Shift: TShiftState; X, Y: Single); override;
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Single); override;
    procedure KeyDown(var Key: Word; var KeyChar: System.WideChar; Shift: TShiftState); override;
    procedure KeyUp(var Key: Word; var KeyChar: System.WideChar; Shift: TShiftState); override;
    procedure DragOver(const Data: TDragObject; const Point: TPointF; var Accept: Boolean); override;
    procedure DragDrop(const Data: TDragObject; const Point: TPointF); override;
    procedure ApplyStyle; override;
    procedure FreeStyle; override;
    procedure DoEnter; override;
    procedure DoExit; override;
    function GetData: Variant; override;
    procedure SetData(const Value: Variant); override;
    function GetContentBounds: TRectF; override;
    procedure DoContentPaint(Sender: TObject; Canvas: TCanvas; const ARect: TRectF);
    procedure HScrollChange(Sender: TObject); override;
    procedure VScrollChange(Sender: TObject); override;
    procedure ContentAddObject(AObject: TFmxObject); override;
    procedure ContentBeforeRemoveObject(AObject: TFmxObject); override;
    procedure ContentRemoveObject(AObject: TFmxObject); override;
    procedure UpdateSelection;
    property CanFocus default True;
    property AllowDrag: Boolean read FAllowDrag write SetAllowDrag default False;
    property AlternatingRowBackground: Boolean read FAlternatingRowBackground write SetAlternatingRowBackground default False;
    property Columns: Integer read FColumns write SetColumns default 1;
    property HideSelectionUnfocused: Boolean read FHideSelectionUnfocused write FHideSelectionUnfocused default False;
    property ItemWidth: Single read FItemWidth write SetItemWidth;
    property ItemHeight: Single read FItemHeight write SetItemHeight;
    property ListStyle: TListStyle read FListStyle write SetListStyle
      default TListStyle.lsVertical;
    property MultiSelect: Boolean read FMultiSelect write SetMultiSelect default False;
    property Sorted: Boolean read FSorted write SetSorted default False;
    property ShowCheckboxes: Boolean read FShowCheckboxes write SetShowCheckboxes default False;
    property OnChange: TNotifyEvent read FOnChange write FOnChange;
    property OnChangeCheck: TNotifyEvent read FOnChangeCheck write FOnChangeCheck;
    property OnCompare: TOnCompareListBoxItemEvent read FOnCompare write FOnCompare;
    property OnDragChange: TOnListBoxDragChange read FOnDragChange write FOnDragChange;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Assign(Source: TPersistent); override;
    procedure Clear; virtual;
    function DragChange(SourceItem, DestItem: TListBoxItem): Boolean; dynamic;
    procedure SelectAll;
    procedure ClearSelection;
    procedure SelectRange(Item1, Item2: TListBoxItem);
    function ItemByPoint(const X, Y: Single): TListBoxItem;
    function ItemByIndex(const Idx: Integer): TListBoxItem;
    procedure Exchange(Item1, Item2: TListBoxItem);
    procedure AddObject(AObject: TFmxObject); override;
    procedure InsertObject(Index: Integer; AObject: TFmxObject); override;
    procedure RemoveObject(AObject: TFmxObject); override;
    procedure Sort(Compare: TFmxObjectSortCompare); override;
    property Count: Integer read GetCount;
    property Selected: TListBoxItem read GetSelected;
    property Items: TWideStrings read FItems write SetItems stored False;
    property ListItems[Index: Integer]: TListBoxItem read GetListItem;
    property ItemIndex: Integer read FItemIndex write SetItemIndex default -1;
  end;

{ TListBox }

  TListBox = class(TCustomListBox)
  published
    property StyleLookup;
    property AllowDrag;
    property CanFocus;
    property DisableFocusEffect;
    property TabOrder;
    property AlternatingRowBackground;
    property Columns;
    property HideSelectionUnfocused;
    property Items;
    property ItemIndex;
    property ItemWidth;
    property ItemHeight;
    property ListStyle;
    property MultiSelect;
    property Sorted;
    property ShowCheckboxes;
    property BindingSource;
    property OnChange;
    property OnChangeCheck;
    property OnCompare;
    property OnDragChange;
  end;

{ TComboListBox }

  TComboListBox = class(TCustomListBox)
  protected
    FComboBox: TCustomComboBox;
    procedure KeyDown(var Key: Word; var KeyChar: System.WideChar; Shift: TShiftState); override;
    procedure MouseMove(Shift: TShiftState; X, Y: Single); override;
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Single); override;
    function GetObservers: TObservers; override;
  public
    constructor Create(AOwner: TComponent); override;
  end;

{ TCustomComboBox }

  TCustomComboBox = class(TStyledControl, IItemsContainer)
  private
    FDropDownCount: Integer;
    FOnChange: TNotifyEvent;
    FPlacement: TPlacement;
    procedure SetItemIndex(const Value: Integer);
    function GetItemIndex: Integer;
    function GetCount: Integer;
    procedure SetListBoxResource(const Value: WideString);
    function GetListBoxResource: WideString;
    function GetItemHeight: Single;
    procedure SetItemHeight(const Value: Single);
    function GetPlacement: TPlacement;
    function GetPlacementRectangle: TBounds;
    procedure SetPlacement(const Value: TPlacement);
    procedure SetPlacementRectangle(const Value: TBounds);
    procedure UpdateCurrentItem;
    function GetItems: TWideStrings;
    function GetListItem(Index: Integer): TListBoxItem;
    function GetSelected: TListBoxItem;
    procedure SetItems(const Value: TWideStrings);
    { IItemContainer }
    function GetItemsCount: Integer;
    function GetItem(const AIndex: Integer): TFmxObject;
  protected
    FPopup: TPopup;
    FListBox: TComboListBox;
    procedure Change; dynamic;
    function CreateListBox: TComboListBox; virtual;
    function CanObserve(const ID: Integer): Boolean; override;
    procedure GetChildren(Proc: TGetChildProc; Root: TComponent); override;
    procedure Notification(Component: TComponent; Operation: TOperation); override;
    procedure ApplyStyle; override;
    procedure DoContentPaint(Sender: TObject; Canvas: TCanvas; const ARect: TRectF); virtual;
    procedure DoExit; override;
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Single); override;
    procedure MouseWheel(Shift: TShiftState; WheelDelta: Integer; var Handled: Boolean); override;
    procedure KeyDown(var Key: Word; var KeyChar: System.WideChar; Shift: TShiftState); override;
    property Popup: TPopup read FPopup;
    property CanFocus default True;
    property ItemHeight: Single read GetItemHeight write SetItemHeight;
    property DropDownCount: Integer read FDropDownCount write FDropDownCount default 8;
    property Placement: TPlacement read GetPlacement write SetPlacement;
    property PlacementRectangle: TBounds read GetPlacementRectangle write SetPlacementRectangle;
    property ListBoxResource: WideString read GetListBoxResource write SetListBoxResource;
    property OnChange: TNotifyEvent read FOnChange write FOnChange;
  public
    constructor Create(AOwner: TComponent); override;
    procedure Realign; override;
    procedure Clear; virtual;
    procedure DropDown; virtual;
    procedure AddObject(AObject: TFmxObject); override;
    procedure Sort(Compare: TFmxObjectSortCompare); override;
    property ListBox: TComboListBox read FListBox;
    property Count: Integer read GetCount;
    property Selected: TListBoxItem read GetSelected;
    property Items: TWideStrings read GetItems write SetItems stored False;
    property ListItems[Index: Integer]: TListBoxItem read GetListItem;
    property ItemIndex: Integer read GetItemIndex write SetItemIndex;
  end;

{ TComboBox }

  TComboBox = class(TCustomComboBox)
  public
    property PlacementRectangle;
  published
    property CanFocus;
    property DisableFocusEffect;
    property TabOrder;
    property StyleLookup;
    property ItemIndex;
    property ItemHeight;
    property DropDownCount;
    property Placement default TPlacement.plBottom;
    property BindingSource;
    property ListBoxResource;
    property OnChange;
  end;

implementation

uses
  Math, SysUtils, FMX_Ani, FMX_Edit;

type
  THackObject = class(TControl);

{ TListBoxItem }

constructor TListBoxItem.Create(AOwner: TComponent);
begin
  inherited;
  Position.Point := PointF(5000, 5000);
  TextAlign := TTextAlign.taLeading;
  FAutoTranslate := True;
  FText := '';
  Height := 19;
  Width := 19;
  HitTest := False;
  SetAcceptsControls(False);
end;

procedure TListBoxItem.ApplyStyle;
var
  B: TFmxObject;
begin
  inherited;
  B := FindStyleResource('check');
  if (B <> nil) and (B is TCheckBox) then
  begin
    FCheck := TCheckBox(B);
    FCheck.IsChecked := IsChecked;
    FCheck.OnChange := DoCheckClick;
    if ListBox <> nil then
      FCheck.Visible := ListBox.ShowCheckboxes
    else
      FCheck.Visible := False;
  end;
  if IsSelected then
  begin
    StartTriggerAnimation(Self, 'IsSelected');
    ApplyTriggerEffect(Self, 'IsSelected');
  end;
end;

procedure TListBoxItem.FreeStyle;
begin
  inherited;
  FCheck := nil;
end;

procedure TListBoxItem.DoCheckClick(Sender: TObject);
begin
  if FCheck <> nil then
    FIsChecked := FCheck.IsChecked;
  if ListBox <> nil then
  begin
    ListBox.SetFocus;
    ListBox.ItemIndex := Index;
    ListBox.DoChangeCheck(Self);
  end;
end;

function TListBoxItem.ComboBox: TCustomComboBox;
var
  P: TFmxObject;
begin
  P := Parent;
  while (P <> nil) do
  begin
    if P is TCustomComboBox then
    begin
      Result := TCustomComboBox(P);
      Exit;
    end;
    P := P.Parent;
  end;
  Result := nil;
end;

function TListBoxItem.ListBox: TCustomListBox;
var
  P: TFmxObject;
begin
  P := Parent;
  while (P <> nil) do
  begin
    if P is TCustomListBox then
    begin
      Result := TCustomListBox(P);
      Exit;
    end;
    if P is TCustomComboBox then
    begin
      Result := TCustomComboBox(P).FListBox;
      Exit;
    end;
    P := P.Parent;
  end;
  Result := nil;
end;

procedure TListBoxItem.Paint;
var
  R: TRectF;
begin
  if (csDesigning in ComponentState) and not Locked and not FInPaintTo then
  begin
    R := LocalRect;
    InflateRect(R, -0.5, -0.5);
    Canvas.StrokeThickness := 1;
    Canvas.StrokeDash := TStrokeDash.sdDash;
    Canvas.Stroke.Kind := TBrushKind.bkSolid;
    Canvas.Stroke.Color := $A0909090;
    Canvas.DrawRect(R, 0, 0, AllCorners, AbsoluteOpacity);
    Canvas.StrokeDash := TStrokeDash.sdSolid;
  end;
end;

function TListBoxItem.GetIndex: Integer;
var
  I, C : Integer;
begin
  if ListBox <> nil then
  begin
    C := 0;
    for I := 0 to ListBox.Count - 1 do
    begin
      if ListBox.ListItems[I] is TListBoxItem then
      begin
        if ListBox.ListItems[I] = Self then
        begin
          FIndex := I;
          Result := FIndex;
          Exit;
        end;
      Inc(C);
      end;
    end;
  end;
  Result := FIndex;
end;

procedure TListBoxItem.SetIndex(const Value: Integer);
var
  I: Integer;
begin
  FIndex := Value;

  if ListBox <> nil then
  begin
    for I := 0 to ListBox.Count - 1 do
      if ListBox.ListItems[I] is TListBoxItem then
        ListBox.ListItems[I].FIndex := -1;
    ChangeOrder;
  end;
end;

function TListBoxItem.GetParentComponent: TComponent;
begin
  if (ComboBox <> nil) then
    Result := ComboBox
  else if (ListBox <> nil) then
    Result := ListBox
  else
    Result := inherited GetParentComponent;
end;

function TListBoxItem.EnterChildren(AObject: TControl): Boolean;
begin
  Result := inherited EnterChildren(AObject);
  if (ListBox <> nil) then
  begin
    if ListBox.MultiSelect then
      ListBox.ClearSelection;
    ListBox.ItemIndex := Index;
    Result := True;
  end;
end;

procedure TListBoxItem.UpdateCheck;
var
  i: Integer;
begin
  if (ListBox <> nil) and (FCheck <> nil) then
    FCheck.Visible := ListBox.ShowCheckboxes;
  if ChildrenCount > 0 then
    for i := 0 to ChildrenCount - 1 do
      if Children[i] is TListBoxItem then
        TListBoxItem(Children[i]).UpdateCheck;
end;

procedure TListBoxItem.SetIsChecked(const Value: Boolean);
begin
  if FIsChecked <> Value then
  begin
    FIsChecked := Value;
    if FCheck <> nil then
      FCheck.IsChecked := FIsChecked;
  end;
end;

procedure TListBoxItem.SetIsSelected(const Value: Boolean);
begin
  if FIsSelected <> Value then
  begin
    FIsSelected := Value;
    StartTriggerAnimation(Self, 'IsSelected');

    if FIsSelected and (ListBox <> nil) and not(ListBox.MultiSelect) then
      ListBox.FItemIndex := Index
    else if not FIsSelected and (ListBox <> nil) and not(ListBox.MultiSelect) and (ListBox.ItemIndex = Index) then
      ListBox.ItemIndex := -1
    else if ListBox <> nil then
      ListBox.UpdateSelection;
  end;
end;

procedure TListBoxItem.DragEnd;
begin
  inherited;
  DragLeave;
  if (ListBox <> nil) then
    ListBox.FDragItem := nil;
end;

{ TListBox }

constructor TCustomListBox.Create(AOwner: TComponent);
begin
  inherited;
  FItems := TListBoxStrings.Create;
  TListBoxStrings(FItems).FListBox := Self;
  FOddFill := TBrush.Create(TBrushKind.bkSolid, $20000000);
  FColumns := 1;
  FHideSelectionUnfocused := False;
  FContent.DisableDefaultAlign := True;
  FItemIndex := -1;
  CanFocus := True;
  AutoCapture := True;
  Width := 100;
  Height := 100;
  SetAcceptsControls(False);
end;

destructor TCustomListBox.Destroy;
begin
  FSelections.Free;
  FOddFill.Free;
  FItems.Free;
  inherited;
end;

procedure TCustomListBox.Assign(Source: TPersistent);
var
  i: Integer;
  Item: TListBoxItem;
begin
  if Source is TWideStrings then
  begin
    BeginUpdate;
    try
      Clear;
      for i := 0 to TWideStrings(Source).Count - 1 do
      begin
        Item := TListBoxItem.Create(Owner);
        Item.Parent := Self;
        Item.Text := TWideStrings(Source)[i];
      end;
    finally
      EndUpdate;
    end;
  end
  else
    inherited;
end;

procedure TCustomListBox.HScrollChange(Sender: TObject);
begin
  inherited;
  UpdateSelection;
end;

procedure TCustomListBox.VScrollChange(Sender: TObject);
begin
  inherited;
  UpdateSelection;
end;

function CompareListItem(Item1, Item2: TFmxObject): Integer;
begin
  if (Item1 is TListBoxItem) and (Item2 is TListBoxItem) and (TListBoxItem(Item1).ListBox <> nil) then
    Result := TListBoxItem(Item1).ListBox.CompareItems(TListBoxItem(Item1), TListBoxItem(Item2))
  else
    Result := 0;
end;

procedure TCustomListBox.Sort(Compare: TFmxObjectSortCompare);
var
  I : Integer;
  Item: TListBoxItem;
  obj: TFmxObject;
begin
  Item := nil;
  obj := GetItem(ItemIndex);
  if obj is TListBoxItem then
    Item := obj as TListBoxItem;

  inherited;
  Sorted := true;

  if not MultiSelect then
  begin
    for I := 0 to Count - 1 do
      if ItemByIndex(I) is TListBoxItem then
        ItemByIndex(I).IsSelected := false;

    // and re-select the previous selected item
    if Item <> nil then
    begin
      Item.IsSelected := true;
      FItemIndex := Item.Index;
    end;
  end;

  if not (csLoading in ComponentState) then
    Change;
end;

procedure TCustomListBox.SortItems;
begin
  if FSorted then
    FContent.Sort(CompareListItem);
end;

procedure TCustomListBox.DoContentPaint(Sender: TObject; Canvas: TCanvas; const ARect: TRectF);
var
  i: Integer;
  Item: TListBoxItem;
  P: TPointF;
  R: TRectF;
begin
  if (FContent <> nil) and (ContentLayout <> nil) then
  begin
    if FAlternatingRowBackground then
    begin
      Canvas.Fill.Assign(FOddFill);
      for i := 0 to (Count - 1) div Columns do
      begin
        if Odd(i) then
        begin
          if i * Columns > Count - 1 then
            Item := ItemByIndex(Count - 1)
          else
            Item := ItemByIndex(i * Columns);
          P := Item.LocalToAbsolute(PointF(0, 0));
          P := TControl(Sender).AbsoluteToLocal(P);
          R := RectF(P.X, P.Y, P.X + ContentLayout.Width, P.Y + Item.Height);
          if not IntersectRect(R, ARect) then
            Continue;
          Canvas.FillRect(R, 0, 0, [], AbsoluteOpacity);
        end;
      end;
    end;
  end;
end;

procedure TCustomListBox.ApplyStyle;
var
  T: TFmxObject;
begin
  inherited;
  T := FindStyleResource('content');
  if (T <> nil) and (T is TControl) then
  begin
    TControl(T).OnPainting := DoContentPaint;
  end;
  T := FindStyleResource('selection');
  if (T <> nil) and (T is TControl) then
  begin
    FSelection := TControl(T);
    FSelection.Visible := False;
    UpdateSelection;
  end;
  T := FindStyleResource('AlternatingRowBackground');
  if (T <> nil) and (T is TBrushObject) then
  begin
    FOddFill.Assign(TBrushObject(T).Brush);
  end;
  if (T <> nil) and (T is TControl) then
  begin
    TControl(T).Visible := False;
  end;
end;

procedure TCustomListBox.FreeStyle;
begin
  inherited;
  FSelection := nil;
  if FSelections <> nil then
    FSelections.Clear;
end;

procedure TCustomListBox.UpdateSelection;
var
  i: Integer;
  P: TPointF;
  R: TRectF;
  Sel: Boolean;
  SelRects: array of TRectF;
  Clone: TControl;
  Vis: Boolean;
  Item: TListBoxItem;
begin
  if FSelection = nil then
    Exit;
  // calc rects
  Vis := True;
  Sel := False;
  SetLength(SelRects, 0);
  for i := 0 to Count - 1 do
  begin
    Item := ItemByIndex(i);

    if (Item.IsSelected) and IntersectRect(Item.UpdateRect, UpdateRect) then
    begin
      P := Item.LocalToAbsolute(PointF(0, 0));
      if (FSelection.Parent <> nil) and (FSelection.Parent is TControl) then
        P := TControl(FSelection.Parent).AbsoluteToLocal(P);
      R := RectF(P.X, P.Y, P.X + Item.Width, P.Y + Item.Height);
      if (Length(SelRects) > 0) and (i > 0) and (ItemByIndex(i - 1).IsSelected) then
        SelRects[High(SelRects)] := UnionRect(R, SelRects[High(SelRects)])
      else
      begin
        SetLength(SelRects, Length(SelRects) + 1);
        SelRects[High(SelRects)] := R;
      end;
      Sel := True;
    end;
  end;
  // Create selection list
  if FSelections = nil then
    FSelections := TList.Create;
  // create selections
  if FSelections.Count < Length(SelRects) then
    for i := FSelections.Count to Length(SelRects) - 1 do
    begin
      Clone := TControl(FSelection.Clone(Self));
      Clone.StyleName := '';
      FSelections.Add(Clone);
      Clone.Parent := FSelection.Parent;
      Clone.Stored := False;
    end;
  // hide if not need
  if Length(SelRects) < FSelections.Count then
    for i := Length(SelRects) to FSelections.Count - 1 do
    begin
      TControl(FSelections[i]).Visible := False;
      TControl(FSelections[i]).DesignVisible := False;
    end;
  // Check visible
  if HideSelectionUnfocused and not IsFocused then
    Vis := False;
  // align selections
  for i := 0 to High(SelRects) do
  begin
    TControl(FSelections[i]).Visible := Vis;
    TControl(FSelections[i]).DesignVisible := Vis;
    if Vis then
      TControl(FSelections[i]).BoundsRect := SelRects[i];
  end;
end;

function TCustomListBox.CompareItems(Item1, Item2: TListBoxItem): Integer;
begin
  Result := CompareText(Item1.Text, Item2.Text);
  if Assigned(FOnCompare) then
    FOnCompare(Item1, Item2, Result);
end;

procedure TCustomListBox.ContentAddObject(AObject: TFmxObject);
begin
  inherited;
  if AObject is TListBoxItem then
    if FUpdating = 0 then
      Realign;
end;

procedure TCustomListBox.ContentBeforeRemoveObject(AObject: TFmxObject);
begin
  inherited;
  if AObject is TListBoxItem then
  begin
    // TListBoxItem.Index can be expensive so check FItemIndex before calling it
    if (FItemIndex > 0) and (FItemIndex > TListBoxItem(AObject).Index) then
    begin
      Dec(FItemIndex);
      UpdateSelection;
    end;
    TListBoxItem(AObject).IsSelected := False;
  end;
end;

procedure TCustomListBox.ContentRemoveObject(AObject: TFmxObject);
begin
  inherited;
  if AObject is TListBoxItem then
  begin
    if FUpdating = 0 then
      Realign;
  end;
end;

function TCustomListBox.GetContentBounds: TRectF;
var
  R: TRectF;
  i, j, Idx: Integer;
  RowHeight, ColWidth, CurY: Single;
begin
  Result := LocalRect;
  if FUpdating > 0 then
    Exit;
  if ContentLayout = nil then
    Exit;
  R := ContentLayout.LocalRect;
  { FContent }
  if FContent <> nil then
  begin
    { Sort if need }
    SortItems;
    { Set Selection }
    if not MultiSelect and (Selected <> nil) then
      Selected.IsSelected := True;
    { Align }
    case FListStyle of
      TListStyle.lsVertical:
        begin
          { correct items size }
          if FItemWidth <> 0 then
          begin
            FColumns := trunc((R.Right - R.Left) / FItemWidth);
            if FColumns < 1 then
              FColumns := 1;
            if FContent.ChildrenCount > 0 then
              for i := 0 to (FContent.ChildrenCount - 1) do
                with TListBoxItem(FContent.Children[i]) do
                begin
                  if FItemHeight <> 0 then
                    SetBounds(Position.X, Position.Y, FItemWidth, FItemHeight)
                  else
                    SetBounds(Position.X, Position.Y, FItemWidth, Height);
                end;
          end;
          if (FItemWidth = 0) and (FItemHeight <> 0) then
          begin
            if FContent.ChildrenCount > 0 then
              for i := 0 to (FContent.ChildrenCount - 1) do
                if FContent.Children[i] is TListBoxItem then
                  with TListBoxItem(FContent.Children[i]) do
                  begin
                    SetBounds(Position.X, Position.Y, Width, FItemHeight)
                  end;
          end;
          { calc items size }
          CurY := 0;
          if FContent.ChildrenCount > 0 then
            for i := 0 to (FContent.ChildrenCount - 1) div FColumns do
            begin
              RowHeight := 0;
              for j := 0 to FColumns - 1 do
              begin
                if (i * FColumns) + j > FContent.ChildrenCount - 1 then
                  Continue;
                if FContent.Children[(i * FColumns) + j] is TListBoxItem then
                  with TListBoxItem(FContent.Children[(i * FColumns) + j]) do
                  begin
                    if Height + Padding.Top + Padding.Bottom > RowHeight then
                      RowHeight := Height + Padding.Top + Padding.Bottom;
                  end;
              end;
              // set correct height
              for j := 0 to FColumns - 1 do
              begin
                if (i * FColumns) + j > FContent.ChildrenCount - 1 then
                  Continue;
                if FContent.Children[(i * FColumns) + j] is TListBoxItem then
                  with TListBoxItem(FContent.Children[(i * FColumns) + j]) do
                  begin
                    Height := RowHeight - Padding.Top - Padding.Bottom;
                  end;
              end;
              CurY := CurY + RowHeight;
            end;
          FContent.Height := CurY;
          { align }
          CurY := 0;
          Idx := 0;
          if FContent.ChildrenCount > 0 then
            for i := 0 to (FContent.ChildrenCount - 1) div FColumns do
            begin
              RowHeight := 0;
              for j := 0 to FColumns - 1 do
              begin
                if (i * FColumns) + j > FContent.ChildrenCount - 1 then
                  Continue;

                if FItemWidth <> 0 then
                  ColWidth := FItemWidth
                else
                  ColWidth := (R.Right - R.Left) / FColumns;

                if FContent.Children[(i * FColumns) + j] is TListBoxItem then
                  with TListBoxItem(FContent.Children[(i * FColumns) + j]) do
                  begin
                    SetBounds(Padding.Left + (j * ColWidth), CurY + Padding.Top,
                      ColWidth - Padding.Left - Padding.Right, Height);

                    if Height + Padding.Top + Padding.Bottom > RowHeight then
                      RowHeight := Height + Padding.Top + Padding.Bottom;
                    Inc(Idx);
                  end;
              end;
              CurY := CurY + RowHeight;
            end;
          if CurY > 0 then
            R.Bottom := R.Top + CurY;
          if FItemWidth <> 0 then
            R.Right := R.Left + (FItemWidth * FColumns);
        end;
      TListStyle.lsHorizontal:
        begin
          { correct items size }
          if FItemHeight <> 0 then
          begin
            FColumns := trunc((R.Bottom - R.Top - Padding.Top - Padding.Bottom)
              / FItemHeight);
            if FColumns < 1 then
              FColumns := 1;
            if FContent.ChildrenCount > 0 then
              for i := 0 to (FContent.ChildrenCount - 1) do
                with TListBoxItem(FContent.Children[i]) do
                begin
                  if FItemWidth <> 0 then
                    SetBounds(Position.X, Position.Y, FItemWidth, FItemHeight)
                  else
                    SetBounds(Position.X, Position.Y, Width, FItemHeight);
                end;
          end;
          if (FItemHeight = 0) and (FItemWidth <> 0) then
          begin
            if FContent.ChildrenCount > 0 then
              for i := 0 to (FContent.ChildrenCount - 1) do
                with TListBoxItem(FContent.Children[i]) do
                begin
                  SetBounds(Position.X, Position.Y, FItemWidth, Height)
                end;
          end;
          { calc items size }
          CurY := 0;
          if FContent.ChildrenCount > 0 then
            for i := 0 to (FContent.ChildrenCount - 1) div FColumns do
            begin
              ColWidth := 0;
              if FItemHeight <> 0 then
                RowHeight := FItemHeight
              else
                RowHeight := (R.Bottom - R.Top) / FColumns;
              for j := 0 to FColumns - 1 do
                if FContent.Children[(i * FColumns) + j] is TListBoxItem then
                  with TListBoxItem(FContent.Children[(i * FColumns) + j]) do
                  begin
                    if ColWidth < Width + Padding.Left + Padding.Right then
                      ColWidth := Width + Padding.Left + Padding.Right;
                  end;
              // calc width
              for j := 0 to FColumns - 1 do
                if FContent.Children[(i * FColumns) + j] is TListBoxItem then
                  with TListBoxItem(FContent.Children[(i * FColumns) + j]) do
                  begin
                    Width := ColWidth - (Padding.Left + Padding.Right);
                  end;

              CurY := CurY + ColWidth;
            end;
          { selection }
          if FItemIndex > Count - 1 then
            FItemIndex := Count - 1;
          { align }
          CurY := 0;
          Idx := 0;
          if FContent.ChildrenCount > 0 then
            for i := 0 to (FContent.ChildrenCount - 1) div FColumns do
            begin
              ColWidth := 0;
              if FItemHeight <> 0 then
                RowHeight := FItemHeight
              else
                RowHeight := (R.Bottom - R.Top) / FColumns;
              for j := 0 to FColumns - 1 do
                if FContent.Children[(i * FColumns) + j] is TListBoxItem then
                  with TListBoxItem(FContent.Children[(i * FColumns) + j]) do
                  begin
                    if VScrollBar <> nil then
                      SetBounds(CurY + Padding.Left - VScrollBar.Value, Padding.Top + (j * RowHeight), Width,
                        RowHeight - Padding.Top - Padding.Bottom)
                    else
                      SetBounds(CurY + Padding.Left, Padding.Top + (j * RowHeight), Width,
                        RowHeight - Padding.Top - Padding.Bottom);
                    if ColWidth < Width + Padding.Left + Padding.Right then
                      ColWidth := Width + Padding.Left + Padding.Right;
                    Inc(Idx);
                  end;
              CurY := CurY + ColWidth;
            end;
          if CurY > 0 then
            R.Right := R.Left + CurY;
          if FItemHeight <> 0 then
            R.Bottom := R.Top + (FItemHeight * FColumns);
        end;
    end;
  end;
  UpdateSelection;
  Result := R;
end;

function TCustomListBox.GetCount: Integer;
var
  I: Integer;
begin
  Result := 0;
  if (FContent <> nil) and (FContent.ChildrenCount > 0) then
    for I := 0 to FContent.ChildrenCount - 1 do
      if FContent.Children[I] is TListBoxItem then
        Inc(Result);
end;

function TCustomListBox.ItemByIndex(const Idx: Integer): TListBoxItem;
var
  I, C: Integer;
begin
  C := 0;
  if (FContent <> nil) and (FContent.ChildrenCount > 0) then
    for I := 0 to FContent.ChildrenCount - 1 do
      if FContent.Children[I] is TListBoxItem then
      begin
        if C = Idx then
        begin
          Result := TListBoxItem(FContent.Children[I]);
          Exit;
        end;
        Inc(C);
      end;
  Result := nil;
end;

function TCustomListBox.ItemByPoint(const X, Y: Single): TListBoxItem;
var
  i: Integer;
  P: TPointF;
begin
  P := LocalToAbsolute(PointF(X, Y));
  for i := 0 to Count - 1 do
    with ItemByIndex(i) do
    begin
      if not Visible then
        Continue;
      if PointInObject(P.X, P.Y) then
      begin
        Result := Self.ItemByIndex(i);
        Exit;
      end
    end;
  Result := nil;
end;

//calculate the number of visible items of a list
function NoVisibleItems(const AHeight: single; const AItemHeight:single; const NoCol: integer): Integer;
begin
  Result:= Trunc(AHeight / AItemHeight) * NoCol;
end;

procedure TCustomListBox.KeyDown(var Key: Word; var KeyChar: System.WideChar; Shift: TShiftState);
var
  i: Integer;
  NoVisItems: Integer;
begin
  if Observers.IsObserving(TObserverMapping.EditLinkID) then
    if (KeyChar > ' ') or
      (Key in [vkHome, vkEnd, vkUp, vkDown, vkRight, vkLeft]) then
      if TLinkObservers.EditLinkIsReadOnly(Observers) then
        Exit
      else
        TLinkObservers.EditLinkEdit(Observers);
  inherited;
  if Count > 0 then
  begin
    if KeyChar <> #0 then
    begin
      for i := 0 to Count - 1 do
        if (ItemByIndex(I).Text <> '') and (WideLowerCase(ItemByIndex(I).Text[1]) = WideLowerCase(KeyChar)) then
        begin
          ItemIndex := i;
          Break;
        end;
      KeyChar := #0;
    end;
    case Key of
      vkHome:
        ItemIndex := 0;
      vkEnd:
        ItemIndex := Count - FColumns;
      vkUp:
        If ItemIndex > 0 then
        begin
          ItemIndex := ItemIndex - FColumns;
          if ItemIndex < 0 then
            ItemIndex := 0;
        end;
      vkDown:
        begin
          If ItemIndex < Count - 1 then
            ItemIndex := ItemIndex + FColumns;
          if ItemIndex > Count - 1 then
            ItemIndex := Count - 1;
        end;
      vkLeft:
        If ItemIndex > 0 then
          ItemIndex := ItemIndex - 1;
      vkRight:
        If ItemIndex < Count - 1 then
          ItemIndex := ItemIndex + 1;
      vkPrior:
        begin
          if ItemIndex > 0 then
          begin
            //calculate the number of visible items of the List Box
            NoVisItems:= NoVisibleItems(Height, ItemByIndex(Selected.FIndex).Height, FColumns) ;
            // updating the index after PageUp key is pressed
            ItemIndex:= ItemIndex - NoVisItems;
          end;
          if ItemIndex < 0 then
            ItemIndex:= 0;
        end;
      vkNext:
        begin
          if ItemIndex < Count - 1 then
          begin
            //calculate the number of visible items of the List Box
            NoVisItems:= NoVisibleItems(Height, ItemByIndex(Selected.FIndex).Height, FColumns);
            //updating the index after PageDown key is pressed
            ItemIndex:= ItemIndex + NoVisItems;
          end;
          if ItemIndex > Count -1 then
            ItemIndex:= Count - 1;
        end
    else
      Exit;
    end;
    TLinkObservers.ListSelectionChanged(Observers);
    Key := 0;
  end;
end;

procedure TCustomListBox.KeyUp(var Key: Word; var KeyChar: System.WideChar; Shift: TShiftState);
begin
  inherited;
end;

procedure TCustomListBox.MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Single);
var
  Item: TListBoxItem;
begin
  if Observers.IsObserving(TObserverMapping.EditLinkID) then
    if TLinkObservers.EditLinkIsReadOnly(Observers) then
      Exit
    else
      TLinkObservers.EditLinkEdit(Observers);
  inherited;
  if (Button = TMouseButton.mbLeft) and not MouseTracking then
  begin
    Item := ItemByPoint(X, Y);
    if Item <> nil then
    begin
      if MultiSelect then
      begin
{$IFDEF MACOS}
        if ssCommand in Shift then
{$ELSE}
        if ssCtrl in Shift then
{$ENDIF}
          Item.IsSelected := not Item.IsSelected
        else if ssShift in Shift then
        begin
          SelectRange(Selected, Item);
          ItemIndex := Item.Index;
        end
        else
        begin
          SelectRange(Item, Item);
          ItemIndex := Item.Index;
        end;
        FFirstSelect := Item;
      end
      else
      begin
        if ItemIndex <> Item.Index then
          ItemIndex := Item.Index
        else if AllowDrag then
          Root.BeginInternalDrag(Selected, Item.MakeScreenshot);
      end;
      if Assigned(Item.OnClick) then
        Item.OnClick(Item)
    end;
    FMouseSelecting := True;
  end
  else
    if (Button = TMouseButton.mbLeft) and MouseTracking and MultiSelect then
    begin
      Item := ItemByPoint(X, Y);
      if (Item <> nil) then
        Item.IsSelected := not Item.IsSelected;
    end;
  TLinkObservers.ListSelectionChanged(Observers);
end;

procedure TCustomListBox.MouseMove(Shift: TShiftState; X, Y: Single);
var
  Item: TListBoxItem;
begin
  inherited;
  if (ssLeft in Shift) and FMouseSelecting then
  begin
    Item := ItemByPoint(X, Y);
    if Item <> nil then
    begin
      if Selected = Item then
        Exit;
      if Observers.IsObserving(TObserverMapping.EditLinkID) then
        if TLinkObservers.EditLinkIsReadOnly(Observers) then
          Exit
        else
          TLinkObservers.EditLinkEdit(Observers);
      if MultiSelect then
      begin
{$IFDEF MACOS}
        if ssCommand in Shift then
{$ELSE}
        if ssCtrl in Shift then
{$ENDIF}
          Item.IsSelected := not Item.IsSelected
        else
          SelectRange(FFirstSelect, Item);
        ItemIndex := Item.Index;
      end
      else
        ItemIndex := Item.Index;
      TLinkObservers.ListSelectionChanged(Observers);
    end;
  end;
end;

procedure TCustomListBox.MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Single);
var
  Item: TListBoxItem;
begin
  inherited;
  FFirstSelect := nil;
  if MouseTracking and (FLastDelta.X = 0) and (FLastDelta.Y = 0) then
  begin
    Item := ItemByPoint(X, Y);
    if Item <> nil then
      ItemIndex := Item.Index;
  end;
  FMouseSelecting := False;
end;

function TCustomListBox.CanObserve(const ID: Integer): Boolean;
begin
  Result := False;
  if ID = TObserverMapping.EditLinkID then
    Result := True
  else if ID = TObserverMapping.PositionLinkID then
    Result := True;
end;

function TCustomListBox.GetSelected: TListBoxItem;
begin
  Result := ItemByIndex(FItemIndex);
end;

procedure TCustomListBox.SetItemIndex(const Value: Integer);
var
  Item: TListBoxItem;
begin
  if FItemIndex <> Value then
  begin
    Item := ItemByIndex(ItemIndex);
    FUpdating := FUpdating + 1;
    try
      // if not MultiSelect, de-select the previous selected item
      if (Item <> nil) and (not MultiSelect) then
        Item.IsSelected := False;

      // set and get the new list item
      FItemIndex := Value;
      Item := ItemByIndex(FItemIndex);

      if (Item <> nil) and (FContent <> nil) and (FVScrollBar <> nil) and (ContentLayout <> nil) then
      begin
        if FContent.Position.Y + Item.Position.Y + Item.Padding.Top + Item.Padding.Bottom + Item.Height >
          ContentLayout.Position.Y + ContentLayout.Height then
          VScrollBar.Value := VScrollBar.Value + (FContent.Position.Y + Item.Position.Y + Item.Padding.Top +
            Item.Padding.Bottom + Item.Height - ContentLayout.Position.Y - ContentLayout.Height);
        if FContent.Position.Y + Item.Position.Y < ContentLayout.Position.Y then
          VScrollBar.Value := VScrollBar.Value + FContent.Position.Y + Item.Position.Y - ContentLayout.Position.Y;
      end;
      if (Item <> nil) and (FContent <> nil) and (FHScrollBar <> nil) and (ContentLayout <> nil) then
      begin
        if FContent.Position.X + Item.Position.X + Item.Padding.Left + Item.Padding.Right + Item.Width >
          ContentLayout.Position.X + ContentLayout.Width then
          HScrollBar.Value := HScrollBar.Value + (FContent.Position.X + Item.Position.X + Item.Padding.Left +
            Item.Padding.Right + Item.Width - ContentLayout.Position.X - ContentLayout.Width);
        if FContent.Position.X + Item.Position.X < 0 then
          HScrollBar.Value := HScrollBar.Value + FContent.Position.X + Item.Position.X - ContentLayout.Position.X;
      end;
      // select it
      if (Item <> nil) then
        Item.IsSelected := True;
    finally
      FUpdating := FUpdating - 1;
    end;

    if (FUpdating = 0) then
    begin
      if Assigned(FBindingObjects) then
        ToBindingObjects;
      if not (csLoading in ComponentState) then
        Change;
    end;
    UpdateSelection;
  end;
end;

procedure TCustomListBox.SetItems(Value: TWideStrings);
begin
  Items.Assign(Value);
end;

procedure TCustomListBox.DoChangeCheck(Item: TListBoxItem);
begin
  if Assigned(FOnChangeCheck) then
    FOnChangeCheck(Item);
end;

procedure TCustomListBox.Change;
begin
  if Assigned(FOnChange) then
    FOnChange(ItemByIndex(FItemIndex));
end;

procedure TCustomListBox.Clear;
var
  i: Integer;
begin
  BeginUpdate;
  if FContent <> nil then
    if FContent.ChildrenCount > 0 then
      for i := FContent.ChildrenCount - 1 downto 0 do
        if FContent.Children[i] is TListBoxItem then
          TFmxObject(FContent.Children[i]).Free;
  FScrollDesign := PointF(0, 0);
  EndUpdate;
end;

procedure TCustomListBox.SelectRange(Item1, Item2: TListBoxItem);
var
  i: Integer;
begin
  if Item1 = nil then
    Exit;
  if Item2 = nil then
    Exit;
  for i := 0 to Min(Item1.Index, Item2.Index) - 1 do
    ItemByIndex(i).IsSelected := False;
  for i := Max(Item1.Index, Item2.Index) + 1 to Count - 1 do
    ItemByIndex(i).IsSelected := False;
  for i := Min(Item1.Index, Item2.Index) to Max(Item1.Index, Item2.Index) do
    ItemByIndex(i).IsSelected := True;
end;

procedure TCustomListBox.ClearSelection;
var
  i: Integer;
begin
  for i := 0 to Count - 1 do
    ItemByIndex(i).IsSelected := False;
end;

procedure TCustomListBox.SelectAll;
var
  i: Integer;
begin
  for i := 0 to Count - 1 do
    ItemByIndex(i).IsSelected := True;
end;

function TCustomListBox.GetData: Variant;
begin
  if Selected <> nil then
    Result := Selected.Text
  else
    Result := '';
end;

procedure TCustomListBox.SetData(const Value: Variant);
begin
  if Selected <> nil then
    Selected.Text := Value;
end;

procedure TCustomListBox.DoEnter;
begin
  inherited;
  if HideSelectionUnfocused and (Selected <> nil) then
    UpdateSelection;
end;

procedure TCustomListBox.DoExit;
begin
  inherited;
  if HideSelectionUnfocused and (Selected <> nil) then
    UpdateSelection;
  if Observers.IsObserving(TObserverMapping.EditLinkID) then
    if TLinkObservers.EditLinkIsEditing(Observers) then
      TLinkObservers.EditLinkUpdate(Observers);
end;

function TCustomListBox.DragChange(SourceItem, DestItem: TListBoxItem): Boolean;
begin
  Result := True;
  if Assigned(FOnDragChange) then
    FOnDragChange(SourceItem, DestItem, Result);
end;

procedure TCustomListBox.DragDrop(const Data: TDragObject; const Point: TPointF);
var
  Obj: TListBoxItem;
  Allow: Boolean;
begin
  inherited;
  if FDragItem <> nil then
  begin
    FDragItem.DragLeave;
    FDragItem := nil;
  end;
  with AbsoluteToLocal(Point) do
    Obj := ItemByPoint(X, Y);
  if (Obj <> nil) and DragChange(TListBoxItem(Data.Source), Obj) then
    Exchange(TListBoxItem(Data.Source), Obj);
end;

procedure TCustomListBox.DragOver(const Data: TDragObject; const Point: TPointF; var Accept: Boolean);
var
  Obj: TListBoxItem;
begin
  inherited;
  with AbsoluteToLocal(Point) do
    Obj := ItemByPoint(X, Y);
  if (Obj <> FDragItem) then
  begin
    if FDragItem <> nil then
      FDragItem.DragLeave;
    FDragItem := Obj;
    if FDragItem <> nil then
    begin
      FDragItem.DragEnter(Data, Point);
      Accept := True;
    end else
      Accept := False;
  end else
    Accept := True;

  if FDragItem = Selected then
    Accept := False;
end;

procedure TCustomListBox.Exchange(Item1, Item2: TListBoxItem);
begin
  if Item1.Index = FItemIndex then
    FItemIndex := Item2.Index
  else if Item2.Index = FItemIndex then
    FItemIndex := Item1.Index;
  FContent.Exchange(Item1, Item2);
end;

procedure TCustomListBox.AddObject(AObject: TFmxObject);
begin
  if (FContent <> nil) and (AObject is TListBoxItem) then
    FContent.AddObject(AObject)
  else
    inherited;
end;

procedure TCustomListBox.InsertObject(Index: Integer; AObject: TFmxObject);
begin
  if (FContent <> nil) and (AObject is TListBoxItem) then
    FContent.InsertObject(Index, AObject)
  else
    inherited;
end;


procedure TCustomListBox.RemoveObject(AObject: TFmxObject);
begin
  if (AObject is TListBoxItem) and (TListBoxItem(AObject).ListBox = Self) then
    TListBoxItem(AObject).Parent := nil
  else
    inherited;
end;

procedure TCustomListBox.SetColumns(const Value: Integer);
begin
  if FColumns <> Value then
  begin
    FColumns := Value;
    if FColumns < 1 then
      FColumns := 1;
    Realign;
  end;
end;

procedure TCustomListBox.SetAlternatingRowBackground(const Value: Boolean);
begin
  if FAlternatingRowBackground <> Value then
  begin
    FAlternatingRowBackground := Value;
    Repaint;
  end;
end;

procedure TCustomListBox.SetMultiSelect(const Value: Boolean);
begin
  if FMultiSelect <> Value then
  begin
    FMultiSelect := Value;
    if not FMultiSelect then
      ClearSelection;
  end;
end;

procedure TCustomListBox.SetItemHeight(const Value: Single);
begin
  if FItemHeight <> Value then
  begin
    FItemHeight := Value;
    Realign;
  end;
end;

procedure TCustomListBox.SetItemWidth(const Value: Single);
begin
  if FItemWidth <> Value then
  begin
    FItemWidth := Value;
    Realign;
  end;
end;

procedure TCustomListBox.SetListStyle(const Value: TListStyle);
begin
  if FListStyle <> Value then
  begin
    FListStyle := Value;
    Realign;
  end;
end;

procedure TCustomListBox.SetShowCheckboxes(const Value: Boolean);
var
  i: Integer;
begin
  if FShowCheckboxes <> Value then
  begin
    FShowCheckboxes := Value;
    for i := 0 to Count - 1 do
      if ItemByIndex(i) <> nil then
        ItemByIndex(i).UpdateCheck;
  end;
end;

function TCustomListBox.GetListItem(Index: Integer): TListBoxItem;
begin
  Result := ItemByIndex(Index);
end;

procedure TCustomListBox.SetSorted(const Value: Boolean);
begin
  if FSorted <> Value then
  begin
    FSorted := Value;
    SortItems;
    Realign;
  end;
end;

procedure TCustomListBox.SetAllowDrag(const Value: Boolean);
begin
  if FAllowDrag <> Value then
  begin
    FAllowDrag := Value;
    if FAllowDrag then
      EnableDragHighlight := True;
  end;
end;

function TCustomListBox.GetItem(const AIndex: Integer): TFmxObject;
begin
  Result := ItemByIndex(AIndex);
end;

function TCustomListBox.GetItemsCount: Integer;
begin
  Result := Count;
end;

{ TComboListBox }

constructor TComboListBox.Create(AOwner: TComponent);
begin
  inherited;
  if AOwner is TCustomComboBox then
    FComboBox := TCustomComboBox(AOwner);
  HideSelectionUnfocused := False;
end;

function TComboListBox.GetObservers: TObservers;
begin
  if FComboBox <> nil then
    Result := FComboBox.Observers
  else
    Result := inherited;
end;

procedure TComboListBox.KeyDown(var Key: Word; var KeyChar: System.WideChar; Shift: TShiftState);
begin
  inherited;
  if Key = vkReturn then
  begin
    if (Parent is TPopup) and TPopup(Parent).IsOpen and (FComboBox <> nil) then
    begin
      FComboBox.ItemIndex := ItemIndex;
      TPopup(Parent).IsOpen := False;
    end;
  end;
end;

procedure TComboListBox.MouseMove(Shift: TShiftState; X, Y: Single);
var
  Item: TListBoxItem;
begin
  inherited;
  //if (Shift <> [ssLeft]) then
  begin
    Item := ItemByPoint(X, Y);
    if Item <> nil then
    begin
      if Selected = Item then
        Exit;
      if Observers.IsObserving(TObserverMapping.EditLinkID) then
        if TLinkObservers.EditLinkIsReadOnly(Observers) then
          Exit
        else
          if not TLinkObservers.EditLinkEdit(Observers) then
            Exit;
      if MultiSelect then
      begin
{$IFDEF MACOS}
        if ssCommand in Shift then
{$ELSE}
        if ssCtrl in Shift then
{$ENDIF}
          Item.IsSelected := not Item.IsSelected
        else
          SelectRange(FFirstSelect, Item);
        ItemIndex := Item.Index;
      end
      else
        ItemIndex := Item.Index;
      FComboBox.Repaint;
    end;
  end;
end;

procedure TComboListBox.MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
  inherited;
  if (Parent is TPopup) and TPopup(Parent).IsOpen and (FComboBox <> nil) then
  begin
    if PointInRect(PointF(X, Y), LocalRect) and (ItemByPoint(X, Y) <> nil) then
      if Observers.IsObserving(TObserverMapping.EditLinkID) then
      begin
        if TLinkObservers.EditLinkIsEditing(Observers) then
          FComboBox.ItemIndex := ItemByPoint(X, Y).Index;
      end
      else
        FComboBox.ItemIndex := ItemByPoint(X, Y).Index;
    TPopup(Parent).IsOpen := False;
  end;
end;

{ TComboBox }

constructor TCustomComboBox.Create(AOwner: TComponent);
begin
  inherited;
  DropDownCount := 8;
  CanFocus := True;
  FPopup := TPopup.Create(Self);
  FPopup.PlacementTarget := Self;
  FPopup.StaysOpen := False;
  FPopup.Stored := False;
  FPopup.Parent := Self;
  FPopup.Locked := True;
  FPopup.DesignVisible := False;
  FPopup.DragWithParent := True;
  FListBox := CreateListBox;
  FListBox.Parent := Popup;
  FListBox.Stored := False;
  FListBox.Align := TAlignLayout.alClient;
  FListBox.ShowCheckboxes := False;
  Width := 100;
  Height := 22;
  SetAcceptsControls(False);
end;

function TCustomComboBox.CreateListBox: TComboListBox;
begin
  Result := TComboListBox.Create(Self);
end;

function TCustomComboBox.CanObserve(const ID: Integer): Boolean;
begin
  Result := FListBox.CanObserve(ID);
end;

procedure TCustomComboBox.ApplyStyle;
var
  T: TFmxObject;
begin
  inherited;
  T := FindStyleResource('Content');
  if (T <> nil) and (T is TContent) then
  begin
    TContent(T).OnPaint := DoContentPaint;
    UpdateCurrentItem;
  end;
end;

procedure TCustomComboBox.Realign;
begin
  inherited;
  if FDisableAlign then
    Exit;
  FDisableAlign := True;
  { FContent }
  if FPopup <> nil then
    FPopup.Width := Width;
  FDisableAlign := False;
end;

procedure TCustomComboBox.UpdateCurrentItem;
var
  C: TFmxObject;
  Item: TListBoxItem;
  NewHeight: Single;
begin
  if (FListBox = nil) then Exit;
  Item := FListBox.ItemByIndex(FListBox.ItemIndex);
  if Item <> nil then
  begin
    C := FindStyleResource('Content');
    if (C <> nil) and (C is TControl) then
    begin
      if Item.Height <> 0 then
        NewHeight := Item.Height
      else if ItemHeight = 0 then
        NewHeight := TControl(C).Height
      else
        NewHeight := ItemHeight;
      Item.SetBounds(Item.Position.X, Item.Position.Y, Item.Width, NewHeight);
      Item.ApplyStyleLookup;
    end;
  end;
end;

procedure TCustomComboBox.DoContentPaint(Sender: TObject; Canvas: TCanvas; const ARect: TRectF);
var
  SOpacity: Single;
  Item: TListBoxItem;
  SaveSize: TPointF;
  SaveScene: IScene;
begin
  if FListBox <> nil then
  begin
    Item := FListBox.ItemByIndex(FListBox.ItemIndex);
    if Item <> nil then
    begin
      SOpacity := Item.FAbsoluteOpacity;
      SaveSize := PointF(Item.Width, Item.Height);
      SaveScene := Item.Scene;
      Item.SetNewScene(Scene);
      try
        THackObject(Item).FWidth := ARect.Width;
        THackObject(Item).FLastWidth := ARect.Width;
        THackObject(Item).FHeight := ARect.Height;
        THackObject(Item).FLastHeight := ARect.Height;
        Item.FAbsoluteOpacity := Opacity;
        Item.RecalcOpacity;
        Item.Realign;
        Item.FRecalcOpacity := False;
        Item.PaintTo(Canvas, ARect, Sender as TFmxObject);
        Item.FAbsoluteOpacity := SOpacity;
        Item.RecalcOpacity;
        // Do not assign directly to FHeight/FWidth, because
        // children sizes have to be updated after Realign
        Item.Height := SaveSize.Y;
        Item.Width := SaveSize.X;
        THackObject(Item).FLastWidth := SaveSize.X;
        THackObject(Item).FLastHeight := SaveSize.Y;
      finally
        Item.SetNewScene(SaveScene);
      end;
    end;
  end;
end;

procedure TCustomComboBox.DoExit;
begin
  inherited;
  if Observers.IsObserving(TObserverMapping.EditLinkID) then
    if TLinkObservers.EditLinkIsEditing(Observers) then
      TLinkObservers.EditLinkUpdate(Observers);
end;

procedure TCustomComboBox.DropDown;
var
  H, BorderHeight: single;
  Num, Count, i: Integer;
  Item: TListBoxItem;

  procedure UpdateItem(Index: Integer);
  var
    C: TFmxObject;
    Item: TListBoxItem;
    NewHeight: Single;
  begin
    if (FListBox = nil) then Exit;
    Item := FListBox.ItemByIndex(FListBox.ItemIndex);
    if Item <> nil then
    begin
      C := FindStyleResource('Content');
      if (C <> nil) and (C is TControl) then
      begin
        if Item.Height <> 0 then
          NewHeight := Item.Height
        else if ItemHeight = 0 then
          NewHeight := TControl(C).Height
        else
          NewHeight := ItemHeight;
        Item.SetBounds(Item.Position.X, Item.Position.Y, Item.Width, NewHeight);
        Item.ApplyStyleLookup;
      end;
    end;
  end;


begin
  if not FPopup.IsOpen then
  begin
    FPopup.Width := Width;
    // Resize list items to match the dimensions of the control
    if FListbox <> nil then
    begin
      for i := 0 to FListbox.Count - 1 do
        UpdateItem(i);
    end;

    // calc content rect
    FListbox.ApplyStyleLookup;
    FListbox.GetContentBounds;
    BorderHeight := (FListbox.Height - FListbox.AbsoluteToLocal(FListbox.ContentLayout.LocalToAbsolute(PointF(0, FListbox.ContentLayout.Height))).Y) +
      FListbox.AbsoluteToLocal(FListbox.ContentLayout.LocalToAbsolute(PointF(0, 0))).Y;
    //
    Count := DropDownCount;
    if FListBox.Count < Count then
      Count := FListBox.Count;
    if FListBox.ItemHeight > 0 then
      FPopup.Height := (Count * FListBox.ItemHeight) + BorderHeight
    else
    begin
      if Count < DropDownCount then
        FPopup.Height := FListbox.FContent.Height + BorderHeight
      else
      begin
        H := 0;
        Num := 0;
        for i := 0 to FListbox.Count - 1 do
        begin
          Item := FListbox.ListItems[i];
          if Item.Position.Y >= 0 then
          begin
            H := H + Item.Height;
            Num := Num + 1;
          end;
          if Num >= Count then Break;
        end;
        FPopup.Height := H + BorderHeight;
      end;
    end;
    FPopup.IsOpen := True;
    if FPopup.IsOpen then
      FListBox.SetFocus;
  end else
    FPopup.IsOpen := False;
end;

procedure TCustomComboBox.MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
  inherited;
  if Button = TMouseButton.mbLeft then
    DropDown;
end;

procedure TCustomComboBox.MouseWheel(Shift: TShiftState; WheelDelta: Integer; var Handled: Boolean);
begin
  inherited;
  if WheelDelta < 0 then
  begin
    if ItemIndex < Count - 1 then
      ItemIndex := ItemIndex + 1
  end else
  begin
    if ItemIndex > 0 then
      ItemIndex := ItemIndex - 1;
  end;
  Handled := True;
end;

procedure TCustomComboBox.Notification(Component: TComponent; Operation: TOperation);
begin
  inherited Notification(Component, Operation);
  if (Operation = opRemove) and (FListBox = Component) then
    FListBox := nil;
end;

procedure TCustomComboBox.KeyDown(var Key: Word; var KeyChar: System.WideChar; Shift: TShiftState);
var
  i: Integer;
  NoVisItems: Integer;
begin
  if Observers.IsObserving(TObserverMapping.EditLinkID) then
    if (KeyChar > ' ') or
      (Key in [vkHome, vkEnd, vkUp, vkDown, vkRight, vkLeft]) then
      if TLinkObservers.EditLinkIsReadOnly(Observers) then
        Exit
      else
        TLinkObservers.EditLinkEdit(Observers);
  inherited;
  if Count > 0 then
  begin
    if KeyChar <> #0 then
    begin
      for i := 0 to Count - 1 do
        if (FListBox.ListItems[i].Text <> '') and (WideLowerCase(FListBox.ListItems[i].Text[1]) = WideLowerCase(KeyChar)) then
        begin
          ItemIndex := i;
          Break;
        end;
      KeyChar := #0;
    end;
    case Key of
      vkHome:
        ItemIndex := 0;
      vkEnd:
        ItemIndex := Count - 1;
      vkUp:
        If ItemIndex > 0 then
        begin
          ItemIndex := ItemIndex - 1;
          if ItemIndex < 0 then
            ItemIndex := 0;
        end;
      vkDown:
        begin
          if ssAlt in Shift then
          begin
            DropDown;
          end
          else
          begin
            If ItemIndex < Count - 1 then
              ItemIndex := ItemIndex + 1;
            if ItemIndex > Count - 1 then
              ItemIndex := Count - 1;
          end;
        end;
      vkLeft:
        If ItemIndex > 0 then
          ItemIndex := ItemIndex - 1;
      vkRight:
        If ItemIndex < Count - 1 then
          ItemIndex := ItemIndex + 1;
      vkF4:
        DropDown;
      vkPrior:
        begin
          if ItemIndex > 0 then
          begin
            //calculate the number of visible items of the List Box
            NoVisItems:= DropDownCount;
            // updating the index after PageUp key is pressed
            ItemIndex:= ItemIndex - NoVisItems;
          end;
          if ItemIndex < 0 then
            ItemIndex:= 0;
        end;
      vkNext:
        begin
          if ItemIndex < Count - 1 then
          begin
            //calculate the number of visible items of the List Box
            NoVisItems:= DropDownCount;
            //updating the index after PageDown key is pressed
            ItemIndex:= ItemIndex + NoVisItems;
          end;
          if ItemIndex > Count -1 then
            ItemIndex:= Count - 1;
        end
    else
      Exit;
    end;
    TLinkObservers.ListSelectionChanged(Observers);
    Key := 0;
  end;
end;

procedure TCustomComboBox.Change;
begin
  if Assigned(FOnChange) then
    FOnChange(Self);
end;

procedure TCustomComboBox.Clear;
begin
  if FListBox <> nil then
    FListBox.Clear;
end;

procedure TCustomComboBox.AddObject(AObject: TFmxObject);
begin
  if (FListBox <> nil) and ((AObject is TListBoxItem)) then
  begin
    FListBox.AddObject(AObject);
  end else
    inherited;
end;

function TCustomComboBox.GetItemIndex: Integer;
begin
  if FListBox <> nil then
    Result := FListBox.ItemIndex
  else
    Result := -1;
end;

function TCustomComboBox.GetCount: Integer;
begin
  if FListBox <> nil then
    Result := FListBox.Count
  else
    Result := 0;
end;

procedure TCustomComboBox.SetItemIndex(const Value: Integer);
begin
  if FListBox <> nil then
  begin
    FListBox.ItemIndex := Value;
    if Assigned(FBindingObjects) then
      ToBindingObjects;
    if not (csLoading in ComponentState) then
      Change;
    UpdateCurrentItem;
    if (FResourceLink <> nil) and (FResourceLink is TControl) then
      TControl(FResourceLink).UpdateEffects;
    Repaint;
  end;
end;

procedure TCustomComboBox.SetItems(const Value: TWideStrings);
begin
  FListBox.Items.Assign(Value);
end;

procedure TCustomComboBox.GetChildren(Proc: TGetChildProc; Root: TComponent);
var
  j: Integer;
begin
  inherited;
  if (FListBox <> nil) and (FListBox.FContent <> nil) then
    if (FListBox.FContent.ChildrenCount > 0) then
    begin
      for j := 0 to FListBox.FContent.ChildrenCount - 1 do
        if FListBox.FContent.Children[j].Stored then
          Proc(TComponent(FListBox.FContent.Children[j]));
    end;
end;

function TCustomComboBox.GetListBoxResource: WideString;
begin
  Result := FListBox.StyleLookup;
end;

function TCustomComboBox.GetListItem(Index: Integer): TListBoxItem;
begin
  Result := FListBox.ListItems[Index];
end;

function TCustomComboBox.GetPlacement: TPlacement;
begin
  Result := FPopup.Placement;
end;

function TCustomComboBox.GetPlacementRectangle: TBounds;
begin
  Result := FPopup.PlacementRectangle;
end;

function TCustomComboBox.GetSelected: TListBoxItem;
begin
  Result := FListBox.Selected;
end;

procedure TCustomComboBox.SetListBoxResource(const Value: WideString);
begin
  FListBox.StyleLookup := Value;
end;

procedure TCustomComboBox.SetPlacement(const Value: TPlacement);
begin
  FPopup.Placement := Value;
end;

procedure TCustomComboBox.SetPlacementRectangle(const Value: TBounds);
begin
  FPopup.PlacementRectangle := Value;
end;

procedure TCustomComboBox.Sort(Compare: TFmxObjectSortCompare);
var
  Item: TListBoxItem;
  obj: TFmxObject;
  I : Integer;
begin
  if FListBox <> nil then
  begin
    Item := nil;
    obj := GetItem(FListBox.ItemIndex);
    if obj is TListBoxItem then
      Item := obj as TListBoxItem;

    FListBox.Sort(Compare);
    FListBox.Sorted := true;

    // deselect all items if not MultiSelect
    if not FListBox.MultiSelect then
    begin
      for I := 0 to FListBox.Count - 1 do
        if ListBox.ListItems[I] is TListBoxItem then
          ListBox.ListItems[I].IsSelected := false;

      // and re-select the previous selected item
      if Item <> nil then
        Item.IsSelected := true;
    end;

    if not (csLoading in ComponentState) then
      Change;
  end;
end;

function TCustomComboBox.GetItems: TWideStrings;
begin
  Result := FListBox.Items;
end;

function TCustomComboBox.GetItemsCount: Integer;
begin
  Result := Count;
end;

function TCustomComboBox.GetItem(const AIndex: Integer): TFmxObject;
begin
  Result := FListBox.ListItems[AIndex];
end;

function TCustomComboBox.GetItemHeight: Single;
begin
  Result := FListBox.ItemHeight;
end;

procedure TCustomComboBox.SetItemHeight(const Value: Single);
begin
  if FListBox.ItemHeight <> Value then
  begin
    FListBox.ItemHeight := Value;
    UpdateCurrentItem;
  end;
end;

{ TCustomListBox.TListBoxStrings }

function TCustomListBox.TListBoxStrings{$IFDEF FPCCOMP}.Add(const S: string): Integer;{$ELSE}.Add(const S: WideString): Integer;{$ENDIF}
var
  Item: TListBoxItem;
begin
  Item := TListBoxItem.Create(FListBox);
  try
    Item.Text := S;
    Result := FListBox.Count;
    FListBox.AddObject(Item);
    if (FListBox.Parent <> nil) and (FListBox.Parent is TPopup) and
      (FListBox.Parent.Parent is TComboEdit) then
      TComboEdit(FListBox.Parent.Parent).Items.Add(S);
  except
    Item.Free;
    raise;
  end;
end;

procedure TCustomListBox.TListBoxStrings.Clear;
var
  I: Integer;
  Item: TListBoxItem;
begin
  if not (csDestroying in FListBox.ComponentState) then
    for I := FListBox.Count - 1 downto 0 do
    begin
      Item := FListBox.ListItems[I];
      FListBox.RemoveObject(Item);
      Item.Free;
    end;
end;

procedure TCustomListBox.TListBoxStrings.Delete(Index: Integer);
var
  Item: TListBoxItem;
begin
  Item := FListBox.ListItems[Index];
  FListBox.RemoveObject(Item);
  Item.Free;
end;

procedure TCustomListBox.TListBoxStrings.Exchange(Index1, Index2: Integer);
begin
  with FListBox do
    Exchange(ItemByIndex(Index1), ItemByIndex(Index2));
end;

function TCustomListBox.TListBoxStrings{$IFDEF FPCCOMP}.Get(Index: Integer): string;{$ELSE}.Get(Index: Integer): WideString;{$ENDIF}
begin
  Result := FListBox.ListItems[Index].Text;
end;

function TCustomListBox.TListBoxStrings.GetCount: Integer;
begin
  Result := FListBox.Count;
end;

function TCustomListBox.TListBoxStrings.GetObject(Index: Integer): TObject;
begin
  Result := FListBox.ListItems[Index].Data;
end;

function TCustomListBox.TListBoxStrings{$IFDEF FPCCOMP}.IndexOf(const S: string): Integer;{$ELSE}.IndexOf(const S: WideString): Integer;{$ENDIF}
var
  I: Integer;
begin
  for I := 0 to FListBox.Count - 1 do
    if SameText(FListBox.ListItems[I].Text, S) then
      Exit(I);
  Result := -1;
end;

procedure TCustomListBox.TListBoxStrings{$IFDEF FPCCOMP}.Insert(Index: Integer; const S: string);{$ELSE}.Insert(Index: Integer; const S: WideString);{$ENDIF}
var
  Item: TListBoxItem;
begin
  Item := TListBoxItem.Create(FListBox);
  try
    Item.Text := S;
    FListBox.InsertObject(Index, Item);
  except
    Item.Free;
    raise;
  end;
end;

procedure TCustomListBox.TListBoxStrings{$IFDEF FPCCOMP}.Put(Index: Integer; const S: string);{$ELSE}.Put(Index: Integer; const S: WideString);{$ENDIF}
begin
  FListBox.ListItems[Index].Text := S;
end;

procedure TCustomListBox.TListBoxStrings.PutObject(Index: Integer; AObject: TObject);
begin
  FListBox.ListItems[Index].Data := AObject;
end;

procedure TCustomListBox.TListBoxStrings.SetUpdateState(Updating: Boolean);
begin
  if Updating then
    FListBox.BeginUpdate
  else
    FListBox.EndUpdate;
end;

initialization
  RegisterFmxClasses([TCustomListBox, TCustomComboBox, TListBoxItem, TListBox, TComboBox]);
end.
