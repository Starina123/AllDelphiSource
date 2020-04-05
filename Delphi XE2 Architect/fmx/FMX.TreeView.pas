{*******************************************************}
{                                                       }
{              Delphi FireMonkey Platform               }
{                                                       }
{ Copyright(c) 2011 Embarcadero Technologies, Inc.      }
{                                                       }
{*******************************************************}

unit FMX.TreeView;

{$I FMX.Defines.inc}

interface

uses
  System.Classes, System.Types, System.UITypes,
  FMX.Types, FMX.Layouts, FMX.ListBox, FMX.Controls;

type

{ TTreeViewItem }

  TCustomTreeView = class;

  TTreeViewItem = class(TTextControl, IItemsContainer)
  private
    FIsExpanded: Boolean;
    FButton: TCustomButton;
    FCheck: TCheckBox;
    FGlobalIndex: Integer;
    FIsChecked: Boolean;
    FIsSelected: Boolean;
    FContent: TContent;
    procedure SetIsExpanded(const Value: Boolean);
    procedure DoButtonClick(Sender: TObject);
    procedure DoCheckClick(Sender: TObject);
    function GetCount: Integer;
    procedure SetIsChecked(const Value: Boolean);
    procedure UpdateCheck;
    function GetTreeItem(Index: Integer): TTreeViewItem;
    procedure SetIsSelected(const Value: Boolean);
    { IItemContainer }
    function GetItemsCount: Integer;
    function GetItem(const AIndex: Integer): TFmxObject;
  protected
    procedure ChangeOrder; override;
    procedure ApplyStyle; override;
    procedure FreeStyle; override;
    procedure Realign; override;
    procedure DragEnd; override;
    function EnterChildren(AObject: TControl): Boolean; override;
    { TreeView }
    procedure ContentAddObject(AObject: TFmxObject); virtual;
    procedure ContentRemoveObject(AObject: TFmxObject); virtual;
  public
    constructor Create(AOwner: TComponent); override;
    procedure Paint; override;
    procedure AddObject(AObject: TFmxObject); override;
    procedure RemoveObject(AObject: TFmxObject); override;
    procedure Sort(Compare: TFmxObjectSortCompare); override;
    function ItemByPoint(const X, Y: Single): TTreeViewItem;
    function ItemByIndex(const Idx: Integer): TTreeViewItem;
    property Count: Integer read GetCount;
    property GlobalIndex: Integer read FGlobalIndex write FGlobalIndex;
    function TreeView: TCustomTreeView;
    function Level: Integer;
    function ParentItem: TTreeViewItem;
    property Items[Index: Integer]: TTreeViewItem read GetTreeItem; default;
  published
    property IsChecked: Boolean read FIsChecked write SetIsChecked;
    property IsExpanded: Boolean read FIsExpanded write SetIsExpanded;
    property IsSelected: Boolean read FIsSelected write SetIsSelected;
    property AutoTranslate default True;
    property Font;
    property StyleLookup;
    property Text;
    property TextAlign default TTextAlign.taLeading;
  end;

{ TTreeView }

  TOnCompareTreeViewItemEvent = function(Item1, Item2: TTreeViewItem): Integer of object;
  TOnTreeViewDragChange = procedure(SourceItem, DestItem: TTreeViewItem;
    var Allow: Boolean) of object;

{ TTreeView }

  TCustomTreeView = class(TScrollBox, IItemsContainer)
  private
    FMouseSelecting: Boolean;
    FOnChange: TNotifyEvent;
    FSelected: TTreeViewItem;
    FItemHeight: Single;
    FCountExpanded: Integer;
    FHideSelectionUnfocused: Boolean;
    FGlobalCount: Integer;
    FShowCheckboxes: Boolean;
    FOnChangeCheck: TNotifyEvent;
    FSorted: Boolean;
    FOnCompare: TOnCompareTreeViewItemEvent;
    FMultiSelect: Boolean;
    FFirstSelect: TTreeViewItem;
    FSelection: TControl;
    FSelections: TList;
    FAllowDrag: Boolean;
    FDragItem: TTreeViewItem;
    FOnDragChange: TOnTreeViewDragChange;
    FGlobalList: TList;
    FAlternatingRowBackground: Boolean;
    FOddFill: TBrush;
    procedure SetItemHeight(const Value: Single);
    procedure SetShowCheckboxes(const Value: Boolean);
    function GetTreeItem(Index: Integer): TTreeViewItem;
    procedure SetSorted(const Value: Boolean);
    procedure SortItems;
    procedure ClearSelection;
    procedure SelectAll;
    procedure SelectRange(Item1, Item2: TTreeViewItem);
    procedure UpdateSelection;
    procedure SetAllowDrag(const Value: Boolean);
    function GetCount: Integer;
    { IItemContainer }
    function GetItemsCount: Integer;
    function GetItem(const AIndex: Integer): TFmxObject;
    procedure SetAlternatingRowBackground(const Value: Boolean);
  protected
    procedure Notification(AComponent: TComponent;
      Operation: TOperation); override;
    procedure SetSelected(const Value: TTreeViewItem); virtual;
    procedure ApplyStyle; override;
    procedure FreeStyle; override;
    procedure DoEnter; override;
    procedure DoExit; override;
    procedure HScrollChange(Sender: TObject); override;
    procedure VScrollChange(Sender: TObject); override;
    function GetContentBounds: TRectF; override;
    procedure UpdateGlobalIndexes;
    procedure DoContentPaint(Sender: TObject; Canvas: TCanvas; const ARect: TRectF);
    procedure ContentAddObject(AObject: TFmxObject); override;
    procedure ContentRemoveObject(AObject: TFmxObject); override;
    function GetItemRect(Item: TTreeViewItem): TRectF;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure EndUpdate; override;
    procedure Clear;
    procedure ExpandAll;
    procedure CollapseAll;
    function ItemByText(const AText: string): TTreeViewItem;
    function ItemByPoint(const X, Y: Single): TTreeViewItem;
    function ItemByIndex(const Idx: Integer): TTreeViewItem;
    function ItemByGlobalIndex(const Idx: Integer): TTreeViewItem;
    procedure AddObject(AObject: TFmxObject); override;
    procedure RemoveObject(AObject: TFmxObject); override;
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Single); override;
    procedure MouseMove(Shift: TShiftState; X, Y: Single); override;
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Single); override;
    procedure KeyDown(var Key: Word; var KeyChar: System.WideChar; Shift: TShiftState); override;
    procedure KeyUp(var Key: Word; var KeyChar: System.WideChar; Shift: TShiftState); override;
    procedure DragOver(const Data: TDragObject; const Point: TPointF; var Accept: Boolean); override;
    procedure DragDrop(const Data: TDragObject; const Point: TPointF); override;
    property Count: Integer read GetCount;
    property GlobalCount: Integer read FGlobalCount;
    property CountExpanded: Integer read FCountExpanded;
    property Selected: TTreeViewItem read FSelected write SetSelected;
    property Items[Index: Integer]: TTreeViewItem read GetTreeItem;
    property AllowDrag: Boolean read FAllowDrag write SetAllowDrag;
    property AlternatingRowBackground: Boolean read FAlternatingRowBackground write SetAlternatingRowBackground;
    property ItemHeight: Single read FItemHeight write SetItemHeight;
    property HideSelectionUnfocused: Boolean read FHideSelectionUnfocused write FHideSelectionUnfocused default False;
    property MultiSelect: Boolean read FMultiSelect write FMultiSelect default False;
    property ShowCheckboxes: Boolean read FShowCheckboxes write SetShowCheckboxes default False;
    property Sorted: Boolean read FSorted write SetSorted default False;
    property OnChange: TNotifyEvent read FOnChange write FOnChange;
    property OnChangeCheck: TNotifyEvent read FOnChangeCheck write FOnChangeCheck;
    property OnCompare: TOnCompareTreeViewItemEvent read FOnCompare write FOnCompare;
    property OnDragChange: TOnTreeViewDragChange read FOnDragChange write FOnDragChange;
  end;

  TTreeView = class(TCustomTreeView)
  published
    property StyleLookup;
    property CanFocus default True;
    property DisableFocusEffect;
    property TabOrder;
    property AllowDrag default False;
    property AlternatingRowBackground default False;
    property ItemHeight;
    property HideSelectionUnfocused default False;
    property MultiSelect default False;
    property ShowCheckboxes default False;
    property Sorted default False;
    property OnChange;
    property OnChangeCheck;
    property OnCompare;
    property OnDragChange;
  end;

implementation

uses System.Math, System.SysUtils, FMX.Ani;

type

{ TTreeViewItemContent }

  TTreeViewItemContent = class(TContent)
  public
    procedure AddObject(AObject: TFmxObject); override;
    procedure RemoveObject(AObject: TFmxObject); override;
  end;

procedure TTreeViewItemContent.AddObject(AObject: TFmxObject);
begin
  inherited;
  if (Parent <> nil) and (Parent is TTreeViewItem) then
    TTreeViewItem(Parent).ContentAddObject(AObject);
end;

procedure TTreeViewItemContent.RemoveObject(AObject: TFmxObject);
begin
  inherited;
  if (Parent <> nil) and (Parent is TTreeViewItem) then
    TTreeViewItem(Parent).ContentRemoveObject(AObject);
end;

{ TTreeViewItem }

constructor TTreeViewItem.Create(AOwner: TComponent);
begin
  inherited;
  Position.Point := PointF(5000, 5000);
  FAutoTranslate := True;
  TextAlign := TTextAlign.taLeading;
  Height := 19;
  HitTest := False;
  CanFocus := False;
  FContent := TTreeViewItemContent.Create(Self);
  FContent.Parent := Self;
  FContent.Stored := False;
  FContent.Locked := True;
  FContent.HitTest := False;
end;

procedure TTreeViewItem.Realign;
begin
  if (TreeView <> nil) and (TreeView.FUpdating > 0) then
    Exit;
  inherited;
end;

procedure TTreeViewItem.ChangeOrder;
begin
  inherited;
  if (TreeView <> nil) then
  begin
    TreeView.UpdateGlobalIndexes;
    if (TreeView.FUpdating = 0) then
      TreeView.Realign;
  end;
end;

procedure TTreeViewItem.ContentAddObject(AObject: TFmxObject);
begin
  if AObject is TTreeViewItem then
    if FUpdating = 0 then
    begin
      TreeView.UpdateGlobalIndexes;
      TreeView.Realign;
    end;
end;

procedure TTreeViewItem.ContentRemoveObject(AObject: TFmxObject);
begin
  if AObject is TTreeViewItem then
  begin
    TTreeViewItem(AObject).IsSelected := False;
    if FUpdating = 0 then
    begin
      TreeView.UpdateGlobalIndexes;
      TreeView.Realign;
    end;
  end;
end;

procedure TTreeViewItem.DragEnd;
begin
  inherited;
  DragLeave;
  if (TreeView <> nil) and (TreeView.FDragItem <> nil) then
  begin
    TreeView.FDragItem.RemoveFreeNotify(TreeView);
    TreeView.FDragItem := nil;
  end;
end;

function TTreeViewItem.GetCount: Integer;
var
  i: Integer;
begin
  Result := 0;
  if FContent.ChildrenCount > 0 then
    for i := 0 to FContent.ChildrenCount - 1 do
      if FContent.Children[i] is TTreeViewItem then
      begin
        Inc(Result);
      end;
end;

procedure TTreeViewItem.AddObject(AObject: TFmxObject);
begin
  if AObject is TTreeViewItem then
  begin
    FContent.AddObject(AObject);
    if FUpdating = 0 then
    begin
      TreeView.UpdateGlobalIndexes;
      TreeView.Realign;
    end;
  end
  else
    inherited;
end;

procedure TTreeViewItem.RemoveObject(AObject: TFmxObject);
begin
  if (AObject is TTreeViewItem) and (TTreeViewItem(AObject).TreeView = TreeView) then
  begin
    TTreeViewItem(AObject).Parent := nil;
    TTreeViewItem(AObject).IsSelected := False;
    if FUpdating = 0 then
    begin
      TreeView.UpdateGlobalIndexes;
      TreeView.Realign;
    end;
  end
  else
    inherited;
end;

function TTreeViewItem.GetItem(const AIndex: Integer): TFmxObject;
begin
  Result := Items[AIndex];
end;

function TTreeViewItem.GetItemsCount: Integer;
begin
  Result := Count;
end;

function TTreeViewItem.ItemByPoint(const X, Y: Single): TTreeViewItem;
var
  i: Integer;
  P, P1: TPointF;
begin
  P := LocaltoAbsolute(PointF(X, Y));
  for i := 0 to Count - 1 do
    with ItemByIndex(i) do
    begin
      if not Visible then
        Continue;
      if pointInObject(P.X, P.Y) then
      begin
        Result := Self.ItemByIndex(i);
        Exit;
      end
      else if (Count > 0) and (IsExpanded) then
      begin
        P1 := AbsoluteToLocal(P);
        Result := ItemByPoint(P1.X, P1.Y);
        if Result <> nil then
          Exit;
      end;
    end;
  Result := nil;
end;

function TTreeViewItem.ItemByIndex(const Idx: Integer): TTreeViewItem;
var
  c, i: Integer;
begin
  c := 0;
  if FContent.ChildrenCount > 0 then
    for i := 0 to FContent.ChildrenCount - 1 do
      if FContent.Children[i] is TTreeViewItem then
      begin
        if c = Idx then
        begin
          Result := TTreeViewItem(FContent.Children[i]);
          Exit;
        end;
        Inc(c);
      end;
  Result := nil;
end;

procedure TTreeViewItem.Paint;
var
  R: TRectF;
begin
  inherited Paint;
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

function TTreeViewItem.ParentItem: TTreeViewItem;
begin
  if (Parent is TTreeViewItemContent) and (Parent.Parent is TTreeViewItem) then
    Result := TTreeViewItem(TTreeViewItemContent(Parent).Parent)
  else
    Result := nil;
end;

function TTreeViewItem.EnterChildren(AObject: TControl): Boolean;
begin
  Result := inherited EnterChildren(AObject);
  if (TreeView <> nil) then
  begin
    TreeView.Selected := Self;
    Result := True;
  end;
end;

function TTreeViewItem.Level: Integer;
var
  P: TFmxObject;
begin
  Result := 0;
  P := Parent;
  while (P <> nil) and not(P is TCustomTreeView) do
  begin
    Result := Result + 1;
    P := P.Parent;
    if (P is TContent) then
      P := P.Parent;
  end;
end;

function TTreeViewItem.TreeView: TCustomTreeView;
var
  P: TFmxObject;
begin
  P := Parent;
  while (P <> nil) do
  begin
    if P is TCustomTreeView then
    begin
      Result := TCustomTreeView(P);
      Exit;
    end;
    P := P.Parent;
  end;
  Result := nil;
end;

procedure TTreeViewItem.FreeStyle;
begin
  inherited;
  FButton := nil;
  FCheck := nil;
end;

procedure TTreeViewItem.ApplyStyle;
var
  B: TFmxObject;
begin
  inherited;
  B := FindStyleResource('button');
  if (B <> nil) and (B is TCustomButton) then
  begin
    FButton := TCustomButton(B);
    FButton.OnClick := DoButtonClick;
    FButton.Visible := Count > 0;
    if FButton.Visible then
    begin
      FButton.ApplyStyleLookup;
      FButton.StartTriggerAnimation(Self, 'IsExpanded');
    end;
  end;
  B := FindStyleResource('check');
  if (B <> nil) and (B is TCheckBox) then
  begin
    FCheck := TCheckBox(B);
    FCheck.IsChecked := IsChecked;
    FCheck.OnChange := DoCheckClick;
    if TreeView <> nil then
      FCheck.Visible := TreeView.ShowCheckboxes;
  end;
  if IsSelected then
  begin
    StartTriggerAnimation(Self, 'IsSelected');
    ApplyTriggerEffect(Self, 'IsSelected');
  end;
end;

procedure TTreeViewItem.DoCheckClick(Sender: TObject);
begin
  if FCheck <> nil then
    FIsChecked := FCheck.IsChecked;
  if TreeView <> nil then
  begin
    TreeView.SetFocus;
    TreeView.Selected := Self;
    if Assigned(TreeView.OnChangeCheck) then
      TreeView.OnChangeCheck(Self);
  end;
end;

procedure TTreeViewItem.UpdateCheck;
var
  i: Integer;
begin
  if (TreeView <> nil) and (FCheck <> nil) then
    FCheck.Visible := TreeView.ShowCheckboxes;
  if ChildrenCount > 0 then
    for i := 0 to ChildrenCount - 1 do
      if Children[i] is TTreeViewItem then
        TTreeViewItem(Children[i]).UpdateCheck;
end;

procedure TTreeViewItem.SetIsChecked(const Value: Boolean);
begin
  if FIsChecked <> Value then
  begin
    FIsChecked := Value;
    if FCheck <> nil then
      FCheck.IsChecked := FIsChecked;
  end;
end;

procedure TTreeViewItem.SetIsSelected(const Value: Boolean);
begin
  if FIsSelected <> Value then
  begin
    FIsSelected := Value;
    StartTriggerAnimation(Self, 'IsSelected');
    if TreeView <> nil then
      with Treeview do
      begin
        if (Selected = nil) and not (MultiSelect) then
          Selected := Self;
        UpdateSelection;
      end;
  end;
end;

procedure TTreeViewItem.Sort(Compare: TFmxObjectSortCompare);
begin
  FContent.Sort(Compare);
end;

procedure TTreeViewItem.DoButtonClick(Sender: TObject);
begin
  IsExpanded := not IsExpanded;
end;

procedure TTreeViewItem.SetIsExpanded(const Value: Boolean);
var
  i: Integer;
  Item: TTreeViewItem;
begin
  if FIsExpanded <> Value then
  begin
    FIsExpanded := Value;

    if FContent.ChildrenCount > 0 then
      for i := FContent.ChildrenCount - 1 downto 0 do
      begin
        Item := nil;
        if FContent.Children[i] is TTreeViewItem then
          Item := TTreeViewItem(FContent.Children[i]);

        if Item <> nil then
          Item.IsExpanded := True;
      end;

    if (FButton <> nil) and not(csLoading in ComponentState) then
    begin
      FButton.Visible := Count > 0;
      if FButton.Visible then
        FButton.StartTriggerAnimation(Self, 'IsExpanded');
    end;
    if TreeView <> nil then
      TreeView.Realign;
  end;
end;

function TTreeViewItem.GetTreeItem(Index: Integer): TTreeViewItem;
begin
  Result := ItemByIndex(Index);
end;

{ TTreeView }

constructor TCustomTreeView.Create(AOwner: TComponent);
begin
  inherited;
  FGlobalList := TList.Create;
  FGlobalList.Capacity := 100;
  FOddFill := TBrush.Create(TBrushKind.bkSolid, $20000000);
  CanFocus := True;
  AutoCapture := True;
  HideSelectionUnfocused := False;
  Width := 100;
  Height := 100;
  FItemHeight := 0;
  SetAcceptsControls(False);
end;

destructor TCustomTreeView.Destroy;
begin
  if FSelections <> nil then
    FreeAndNil(FSelections);
  FreeAndNil(FGlobalList);
  FreeAndNil(FOddFill);
  inherited;
end;

procedure TCustomTreeView.ApplyStyle;
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
  end;
  if (T <> nil) and (T is TControl) then
  begin
    TControl(T).Visible := False;
  end;
  UpdateSelection;
end;

procedure TCustomTreeView.FreeStyle;
begin
  inherited;
  FSelection := nil;
  if FSelections <> nil then
    FSelections.Clear;
end;

procedure TCustomTreeView.UpdateGlobalIndexes;
var
  GlobalIdx: Integer;

  procedure AlignItem(AItem: TTreeViewItem);
  var
    i: Integer;
    P: TPointF;
  begin
    if (AItem <> nil) then   //don't do anything if the item is nil
    begin
      AItem.GlobalIndex := GlobalIdx;
      GlobalIdx := GlobalIdx + 1;
      FGlobalList.Add(AItem);
      if AItem.Count > 0 then
      begin
        if AItem.IsExpanded then
          for i := 0 to AItem.Count - 1 do
            AlignItem(AItem.ItemByIndex(i));
      end;
    end;
  end;

var
  i: Integer;
begin
  FGlobalList.Clear;
  GlobalIdx := 0;
  for i := 0 to Count - 1 do
    AlignItem(ItemByIndex(i)); //not all the items are of type TTreeViewItem, so some may return nil
  FGlobalCount := GlobalIdx;
end;

function CompareTreeItem(Item1, Item2: TFmxObject): Integer;
begin
  if (Item1 is TTreeViewItem) and (Item2 is TTreeViewItem) then
  begin
    if (TTreeViewItem(Item1).TreeView <> nil) and
      Assigned(TTreeViewItem(Item1).TreeView.OnCompare) then
      Result := TTreeViewItem(Item1).TreeView.OnCompare(TTreeViewItem(Item1),
        TTreeViewItem(Item2))
    else
{$IFDEF KS_COMPILER5}
      Result := CompareText(TTreeViewItem(Item1).Text,
        TTreeViewItem(Item2).Text);
{$ELSE}
      Result := WideCompareText(TTreeViewItem(Item1).Text,
        TTreeViewItem(Item2).Text);
{$ENDIF}
  end
  else
    Result := 0;
end;

procedure TCustomTreeView.SortItems;
begin
  if not FSorted then
    Exit;
  FContent.Sort(CompareTreeItem);
end;

function TCustomTreeView.GetItemRect(Item: TTreeViewItem): TRectF;
var
  P: TPointF;
begin
  if Item <> nil then
  begin
    P := Item.LocaltoAbsolute(PointF(0, 0));
    P := FContent.AbsoluteToLocal(P);
    Result := RectF(0, 0, Item.Width, Item.Height);
    OffsetRect(Result, P.X, P.Y);
  end
  else
    Result := RectF(0, 0, 0, 0);
end;

function TCustomTreeView.GetItem(const AIndex: Integer): TFmxObject;
begin
  Result := Items[AIndex];
end;

function TCustomTreeView.GetItemsCount: Integer;
begin
  Result := Count;
end;

procedure TCustomTreeView.UpdateSelection;
var
  i: Integer;
  P: TPointF;
  R: TRectF;
  Sel: Boolean;
  SelRects: array of TRectF;
  Clone: TControl;
  Vis: Boolean;
begin
  if FSelection = nil then
    Exit;
  // calc rects
  Vis := True;
  Sel := False;
  SetLength(SelRects, 0);
  for i := 0 to GlobalCount - 1 do
  begin
    if (ItemByGlobalIndex(i).IsSelected) then
    begin
      P := ItemByGlobalIndex(i).LocaltoAbsolute(PointF(0, 0));
      if (FSelection.Parent <> nil) and (FSelection.Parent is TControl) then
        P := TControl(FSelection.Parent).AbsoluteToLocal(P);
      R := RectF(P.X, P.Y, P.X + ItemByGlobalIndex(i).Width,
        P.Y + ItemByGlobalIndex(i).Height);
      if (Length(SelRects) > 0) and (i > 0) and
        (ItemByGlobalIndex(i - 1).IsSelected) then
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
      FSelections.Add(Clone);
      Clone.Parent := FSelection.Parent;
    end;
  // hide if not need
  if Length(SelRects) < FSelections.Count then
    for i := Length(SelRects) to FSelections.Count - 1 do
    begin
      TControl(FSelections[i]).Visible := False;
    end;
  // Check visible
  if HideSelectionUnfocused and not IsFocused then
    Vis := False;
  // align selections
  for i := 0 to High(SelRects) do
  begin
    TControl(FSelections[i]).Visible := Vis;
    if Vis then
    begin
      with SelRects[i] do
        TControl(FSelections[i]).SetBounds(Left, Top, Right - Left, Bottom - Top);
    end;
  end;
end;

function TCustomTreeView.GetContentBounds: TRectF;
const
  StepX = 19;
var
  CurY, CurX: Single;
  R: TRectF;

  procedure HideItem(AItem: TTreeViewItem);
  var
    i: Integer;
  begin
    AItem.Visible := False;
    AItem.Opacity := 0;
    if AItem.Count > 0 then
      for i := 0 to AItem.Count - 1 do
        HideItem(AItem.ItemByIndex(i));
  end;

  procedure AlignItem(AItem: TTreeViewItem);
  var
    i: Integer;
    P: TPointF;
  begin
    if (AItem <> nil) then
    begin
      P := PointF(CurX, CurY);
      P := FContent.LocalToAbsolute(P);
      P := TControl(AItem.Parent).AbsoluteToLocal(P);
      if FItemHeight <> 0 then
        AItem.SetBounds(P.X + AItem.Padding.Left, P.Y + AItem.Padding.Top,
          R.Right - R.Left - AItem.Padding.Left - AItem.Padding.Right -
          (AItem.Level - 1) * StepX, FItemHeight)
      else
        AItem.SetBounds(P.X + AItem.Padding.Left, P.Y + AItem.Padding.Top,
          R.Right - R.Left - AItem.Padding.Left - AItem.Padding.Right -
          (AItem.Level  - 1) * StepX, AItem.Height);

      if AItem.FButton <> nil then
        AItem.FButton.Visible := AItem.Count > 0;

      CurY := CurY + AItem.Height + AItem.Padding.Top + AItem.Padding.Bottom;

      if AItem.Count > 0 then
      begin
        if AItem.IsExpanded then
        begin
          CurX := CurX + StepX;
          for i := 0 to AItem.Count - 1 do
          begin
            with AItem.ItemByIndex(i) do
            begin
              Visible := True;
              Opacity := 1;
            end;
            AlignItem(AItem.ItemByIndex(i));
          end;
          CurX := CurX - StepX;
        end
        else
        begin
          for i := 0 to AItem.Count - 1 do
            HideItem(AItem.ItemByIndex(i));
        end;
      end;
    end;
  end;

var
  i: Integer;
  c: Integer;
  P: TPointF;
  Sel: TTreeViewItem;
begin
  Result := LocalRect;
  UpdateGlobalIndexes;
  if FUpdating > 0 then
    Exit;
  if ContentLayout = nil then
    Exit;
  R := ContentLayout.LocalRect;
  { content }
  FCountExpanded := 0;
  if FContent <> nil then
  begin
    { Sort if need }
    SortItems;
    { align }
    CurY := 0;
    CurX := 0;
    for i := 0 to Count - 1 do
      AlignItem(ItemByIndex(i));
    R.Bottom := R.Top + CurY;
  end;
  if R.Bottom = R.Top then
    R.Bottom := R.Top + 1;
  Result := R;
  UpdateSelection;
end;

procedure TCustomTreeView.HScrollChange(Sender: TObject);
begin
  inherited;
  UpdateSelection;
end;

procedure TCustomTreeView.VScrollChange(Sender: TObject);
begin
  inherited;
  UpdateSelection;
end;

function TCustomTreeView.ItemByIndex(const Idx: Integer): TTreeViewItem;
var
  c, i: Integer;
begin
  c := 0;
  if (FContent <> nil) and (FContent.ChildrenCount > 0) then
    for i := 0 to FContent.ChildrenCount - 1 do
      if FContent.Children[i] is TTreeViewItem then
      begin
        if c = Idx then
        begin
          Result := TTreeViewItem(FContent.Children[i]);
          Exit;
        end;
        Inc(c);
      end;
  Result := nil;
end;

function TCustomTreeView.ItemByGlobalIndex(const Idx: Integer): TTreeViewItem;
begin
  Result := TTreeViewItem(FGlobalList[Idx]);
end;

function TCustomTreeView.ItemByPoint(const X, Y: Single): TTreeViewItem;
var
  i: Integer;
  P, P1: TPointF;
begin
  P := LocaltoAbsolute(PointF(X, Y));
  if (FContent <> nil) and (FContent.ChildrenCount > 0) then
    for i := 0 to FContent.ChildrenCount - 1 do
      if FContent.Children[i] is TTreeViewItem then
      begin
        if not TTreeViewItem(FContent.Children[i]).Visible then
          Continue;
        if not IntersectRect(TTreeViewItem(FContent.Children[i]).UpdateRect,
          UpdateRect) then
          Continue;
        if TTreeViewItem(FContent.Children[i]).pointInObject(P.X, P.Y) then
        begin
          Result := TTreeViewItem(FContent.Children[i]);
          Exit;
        end
        else if (TTreeViewItem(FContent.Children[i]).IsExpanded) and
          (TTreeViewItem(FContent.Children[i]).Count > 0) then
        begin
          P1 := TTreeViewItem(FContent.Children[i]).AbsoluteToLocal(P);
          Result := TTreeViewItem(FContent.Children[i]).ItemByPoint(P1.X, P1.Y);
          if Result <> nil then
            Exit;
        end;
      end;
  Result := nil;
end;

function TCustomTreeView.ItemByText(const AText: string): TTreeViewItem;
var
  Item: TTreeViewItem;
  i: Integer;
begin
  for i := 0 to GlobalCount - 1 do
  begin
    Item := ItemByGlobalIndex(i);
    if CompareText(AText, Item.Text) = 0 then
    begin
      Result := Item;
      Exit;
    end;
  end;
  Result := nil;
end;

procedure TCustomTreeView.KeyDown(var Key: Word; var KeyChar: System.WideChar; Shift: TShiftState);
begin
  inherited;
  if (Count > 0) and (Selected <> nil) then
  begin
    case Key of
      vkAdd:
        Selected.IsExpanded := True;
      vkSubtract:
        Selected.IsExpanded := False;
      vkHome:
        Selected := ItemByGlobalIndex(0);
      vkEnd:
        Selected := ItemByGlobalIndex(GlobalCount - 1);
      vkUp:
        if Selected.GlobalIndex > 0 then
          Selected := ItemByGlobalIndex(Selected.GlobalIndex - 1);
      vkDown:
        if Selected.GlobalIndex < GlobalCount - 1 then
          Selected := ItemByGlobalIndex(Selected.GlobalIndex + 1);
    else
      Exit;
    end;
    Key := 0;
  end;
end;

procedure TCustomTreeView.KeyUp(var Key: Word; var KeyChar: System.WideChar; Shift: TShiftState);
begin
  inherited;
end;

procedure TCustomTreeView.DragOver(const Data: TDragObject; const Point: TPointF;
  var Accept: Boolean);
var
  Obj: TTreeViewItem;
begin
  inherited;
  with AbsoluteToLocal(Point) do
    Obj := ItemByPoint(X, Y);
  if (Obj <> FDragItem) then
  begin
    if FDragItem <> nil then
    begin
      FDragItem.DragLeave;
      FDragItem.RemoveFreeNotify(Self);
    end;
    FDragItem := Obj;
    if FDragItem <> nil then
    begin
      FDragItem.AddFreeNotify(Self);
      FDragItem.DragEnter(Data, Point);
      Accept := True;
    end
    else
      Accept := False;
  end
  else
    Accept := True;

  if FDragItem = Selected then
    Accept := False;
end;

procedure TCustomTreeView.DragDrop(const Data: TDragObject; const Point: TPointF);
var
  Obj: TTreeViewItem;
  Allow: Boolean;
begin
  inherited;
  if FDragItem <> nil then
  begin
    FDragItem.DragLeave;
    FDragItem.RemoveFreeNotify(Self);
    FDragItem := nil;
  end;
  with AbsoluteToLocal(Point) do
    Obj := ItemByPoint(X, Y);
  if Obj = nil then
  begin
    // to root
    Allow := True;
    if Assigned(OnDragChange) then
      OnDragChange(TTreeViewItem(Data.Source), nil, Allow);
    if Allow then
    begin
      TTreeViewItem(Data.Source).Parent := Self;
      Realign;
    end;
  end
  else
  begin
    Allow := True;
    if Assigned(OnDragChange) then
      OnDragChange(TTreeViewItem(Data.Source), Obj, Allow);
    if Allow then
    begin
      if not Obj.IsExpanded then
        Obj.IsExpanded := True;
      TTreeViewItem(Data.Source).Parent := Obj;
      Realign;
    end;
  end;
end;

procedure TCustomTreeView.MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Single);
var
  Item: TTreeViewItem;
begin
  inherited;
  if Button = TMouseButton.mbLeft then
  begin
    Item := ItemByPoint(X, Y);
    if Item <> nil then
    begin
      if MultiSelect then
      begin
        if ssCtrl in Shift then
          Item.IsSelected := not Item.IsSelected
        else if ssShift in Shift then
        begin
          SelectRange(Selected, Item);
          Selected := Item;
        end
        else
        begin
          SelectRange(Item, Item);
          Selected := Item;
        end;
        FFirstSelect := Item;
      end
      else
      begin
        if Selected <> Item then
          Selected := Item
        else if AllowDrag then
          Root.BeginInternalDrag(Selected, Selected.MakeScreenshot);
      end;
    end;
    FMouseSelecting := True;
  end;
end;

procedure TCustomTreeView.MouseMove(Shift: TShiftState; X, Y: Single);
begin
  inherited;
end;

procedure TCustomTreeView.MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
  inherited;
  FFirstSelect := nil;
  FMouseSelecting := False;
end;

procedure TCustomTreeView.Clear;
var
  i: Integer;
begin
  BeginUpdate;
  if FContent <> nil then
    if FContent.ChildrenCount > 0 then
      for i := FContent.ChildrenCount - 1 downto 0 do
        if FContent.Children[i] is TTreeViewItem then
          TFmxObject(FContent.Children[i]).Free;
  FScrollDesign.Y := 0;
  FScrollDesign.X := 0;
  FSelected := nil;
  UpdateGlobalIndexes;
  UpdateSelection;
  EndUpdate;
end;

procedure TCustomTreeView.SelectRange(Item1, Item2: TTreeViewItem);
var
  i: Integer;
begin
  if Item1 = nil then
    Exit;
  if Item2 = nil then
    Exit;
  for i := 0 to Min(Item1.GlobalIndex, Item2.GlobalIndex) - 1 do
    ItemByGlobalIndex(i).IsSelected := False;
  for i := Max(Item1.GlobalIndex, Item2.GlobalIndex) + 1 to GlobalCount - 1 do
    ItemByGlobalIndex(i).IsSelected := False;
  for i := Min(Item1.GlobalIndex, Item2.GlobalIndex) to Max(Item1.GlobalIndex,
    Item2.GlobalIndex) do
    ItemByGlobalIndex(i).IsSelected := True;
end;

procedure TCustomTreeView.ClearSelection;
var
  i: Integer;
begin
  for i := 0 to GlobalCount - 1 do
    ItemByGlobalIndex(i).IsSelected := False;
end;

procedure TCustomTreeView.SelectAll;
var
  i: Integer;
begin
  for i := 0 to GlobalCount - 1 do
    ItemByGlobalIndex(i).IsSelected := True;
end;

procedure TCustomTreeView.DoContentPaint(Sender: TObject; Canvas: TCanvas;
  const ARect: TRectF);
var
  i: Integer;
  Item: TTreeViewItem;
  P: TPointF;
  R: TRectF;
begin
  if (FContent <> nil) and (ContentLayout <> nil) then
  begin
    if FAlternatingRowBackground then
    begin
      Canvas.Fill.Assign(FOddFill);
      for i := 0 to GlobalCount - 1  do
      begin
        if Odd(i) then
        begin
          if i > GlobalCount - 1 then
            Item := ItemByIndex(Count - 1)
          else
            Item := ItemByGlobalIndex(i);
          P := Item.LocalToAbsolute(PointF(0, 0));
          P := TControl(Sender).AbsoluteToLocal(P);
          R := RectF(0, P.Y, ContentLayout.Width, P.Y + Item.Height);
          if not IntersectRect(R, ARect) then
            Continue;
          Canvas.FillRect(R, 0, 0, [], AbsoluteOpacity);
        end;
      end;
    end;
  end;
end;

procedure TCustomTreeView.DoEnter;
begin
  inherited;
  if HideSelectionUnfocused and (Selected <> nil) then
    UpdateSelection;
end;

procedure TCustomTreeView.DoExit;
begin
  inherited;
  if HideSelectionUnfocused and (Selected <> nil) then
    UpdateSelection;
end;

procedure TCustomTreeView.AddObject(AObject: TFmxObject);
begin
  if (FContent <> nil) and ((AObject is TTreeViewItem)) then
  begin
    FContent.AddObject(AObject);
  end
  else
    inherited;
end;

procedure TCustomTreeView.RemoveObject(AObject: TFmxObject);
begin
  if (AObject is TTreeViewItem) and (TTreeViewItem(AObject).TreeView = Self) then
  begin
    TTreeViewItem(AObject).Parent := nil;
  end
  else
    inherited;
end;

procedure TCustomTreeView.ContentAddObject(AObject: TFmxObject);
begin
  inherited;
  if AObject is TTreeViewItem then
    if FUpdating = 0 then
    begin
      UpdateGlobalIndexes;
      Realign;
    end;
end;

procedure TCustomTreeView.ContentRemoveObject(AObject: TFmxObject);
begin
  inherited;
  if AObject is TTreeViewItem then
  begin
    TTreeViewItem(AObject).IsSelected := False;
    if AObject = FSelected then
      FSelected := nil;
    if FUpdating = 0 then
    begin
      UpdateGlobalIndexes;
      Realign;
      UpdateSelection;
    end;
  end;
end;

procedure TCustomTreeView.SetSelected(const Value: TTreeViewItem);
var
  i: TFmxObject;
  P: TPointF;
begin
  if FSelected <> Value then
  begin
    if (FSelected <> nil) and not MultiSelect then
      FSelected.IsSelected := False;

    FSelected := Value;
    if (FSelected <> nil) and (FContent <> nil) then
    begin
      i := FSelected.Parent;
      while ((i <> nil) and not(i is TCustomTreeView)) do
      begin
        if (i is TTreeViewItem) then
          TTreeViewItem(i).IsExpanded := True;
        i := i.Parent;
      end;
      if (FContent <> nil) and (ContentLayout <> nil) and (VScrollBar <> nil)
      then
      begin
        P := ContentLayout.AbsoluteToLocal
          (FSelected.LocaltoAbsolute(PointF(0, 0)));
        if P.Y < 0 then
          VScrollBar.Value := VScrollBar.Value + P.Y;
        if P.Y + FSelected.Padding.Top + FSelected.Padding.Bottom +
          FSelected.Height > ContentLayout.Height then
          VScrollBar.Value := VScrollBar.Value +
            (P.Y + FSelected.Padding.Top + FSelected.Padding.Bottom +
            FSelected.Height - ContentLayout.Height);
      end;
      FSelected.IsSelected := True;
    end;
    if Assigned(FOnChange) then
      FOnChange(Self);
  end;
end;

procedure TCustomTreeView.Notification(AComponent: TComponent; Operation: TOperation);
begin
  inherited;
  if (Operation = opRemove) and (AComponent = FSelected) then
    FSelected := nil;
  if (Operation = opRemove) and (AComponent = FDragItem) then
    FDragItem := nil;
end;

procedure TCustomTreeView.SetItemHeight(const Value: Single);
begin
  if FItemHeight <> Value then
  begin
    FItemHeight := Value;
    Realign;
  end;
end;

procedure TCustomTreeView.CollapseAll;
var
  i: Integer;
  Item: TTreeViewItem;
begin
  BeginUpdate;
  for i := GlobalCount - 1 downto 0 do
  begin
    Item := ItemByGlobalIndex(i);
    if Item <> nil then
      Item.IsExpanded := False;
  end;
  EndUpdate;
end;

procedure TCustomTreeView.ExpandAll;
var
  i: Integer;
  Item: TTreeViewItem;
begin
  BeginUpdate;
  for i := GlobalCount - 1 downto 0 do
  begin
    Item := ItemByGlobalIndex(i);
    if Item <> nil then
      Item.IsExpanded := True;
  end;
  EndUpdate;
end;

procedure TCustomTreeView.SetShowCheckboxes(const Value: Boolean);
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

function TCustomTreeView.GetTreeItem(Index: Integer): TTreeViewItem;
begin
  Result := ItemByIndex(Index);
end;

procedure TCustomTreeView.SetSorted(const Value: Boolean);
begin
  if FSorted <> Value then
  begin
    FSorted := Value;
    Realign;
  end;
end;

procedure TCustomTreeView.SetAllowDrag(const Value: Boolean);
begin
  if FAllowDrag <> Value then
  begin
    FAllowDrag := Value;
    if FAllowDrag then
      EnableDragHighlight := True;
  end;
end;

procedure TCustomTreeView.SetAlternatingRowBackground(const Value: Boolean);
begin
  if FAlternatingRowBackground <> Value then
  begin
    FAlternatingRowBackground := Value;
    Repaint;
  end;
end;

procedure TCustomTreeView.EndUpdate;
begin
  inherited;
end;

function TCustomTreeView.GetCount: Integer;
begin
  Result := 0;
  if (FContent <> nil) then
    Result := FContent.ChildrenCount;
end;

initialization
  RegisterFmxClasses([TTreeView, TTreeViewItem]);
end.
