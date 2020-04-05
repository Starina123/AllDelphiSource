{*******************************************************}
{                                                       }
{              Delphi FireMonkey Platform               }
{                                                       }
{ Copyright(c) 2011 Embarcadero Technologies, Inc.      }
{                                                       }
{*******************************************************}

unit FMX_Grid;

{$I FMX_Defines.inc}

interface

uses
  Classes, Types, UITypes,
  FMX_Types, FMX_Controls, FMX_Layouts, FMX_Edit, FMX_ExtCtrls, FMX_Menus;

type

  TCustomGrid = class;
  THeader = class;

{ THeaderItem }

  THeaderItem = class(TCustomCornerButton)
  private
    FSplitter: TControl;
    FLeftSplitter: TControl;
  protected
    procedure DragOver(const Data: TDragObject; const Point: TPointF; var Accept: Boolean); override;
    procedure DragDrop(const Data: TDragObject; const Point: TPointF); override;
    procedure DragEnd; override;
    procedure DoSplitterMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Single);
    procedure DoLeftSplitterMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Single);
    function Header: THeader;
  public
    constructor Create(AOwner: TComponent); override;
  published
    property CanFocus default False;
    property TextAlign default TTextAlign.taLeading;
    property DragMode default TDragMode.dmAutomatic;
  end;

{ THeader }

  TOnRealignItemEvent = procedure(Sender: TObject; OldIndex, NewIndex: Integer) of object;
  TOnResizeItemEvent = procedure(Sender: TObject; var NewSize: Single) of object;

  THeader = class(TStyledControl, IItemsContainer)
  private
    FOnRealignItem: TOnRealignItemEvent;
    FOnResizeItem: TOnResizeItemEvent;
    FOffset: Single; // hscroll offset used in grid
    FLastItem: THeaderItem;
    FRadius: Single;
    FSides: TSides;
    function GetHeaderItem(Index: Integer): THeaderItem;
    procedure SetRadius(const Value: Single);
    procedure SetSides(const Value: TSides);
    function GetCount: Integer;
    { IItemContainer }
    function GetItemsCount: Integer;
    function GetItem(const AIndex: Integer): TFmxObject;
  public
    constructor Create(AOwner: TComponent); override;
    procedure Paint; override;
    procedure AddObject(AObject: TFmxObject); override;
    procedure Realign; override;
    property Count: Integer read GetCount;
    property Items[Index: Integer]: THeaderItem read GetHeaderItem;
  published
    property CanFocus default False;
    property ClipChildren default True;
    property OnRealignItem: TOnRealignItemEvent read FOnRealignItem write FOnRealignItem;
    property OnResizeItem: TOnResizeItemEvent read FOnResizeItem write FOnResizeItem;
    property Radius: Single read FRadius write SetRadius;
    property Sides: TSides read FSides write SetSides;
  end;

{ Cell Classes }

  TTextCell = class(TEdit)
  end;

  TCheckCell = class(TCheckBox)
  end;

  TProgressCell = class(TProgressBar)
  end;

  TPopupCell = class(TPopupBox)
  end;

  TImageCell = class(TImageControl)
  end;

{ TColumn }

  TColumn = class(TStyledControl)
  private
    FReadOnly: Boolean;
    FEditMode: Integer;
    FApplyImmediately: boolean;
    procedure SetHeader(const Value: WideString);
    procedure TextChangeProc(Sender: TObject);
    procedure TextTypingProc(Sender: TObject);
  protected
    FCellControls: array of TStyledControl;
    FUpdateColumn: Boolean;
    FHeader: WideString;
    FSaveData: Variant;
    FDisableChange: Boolean;
    function Grid: TCustomGrid;
    procedure UpdateColumn; virtual;
    procedure UpdateSelected;
    procedure ClearColumn;
    function CreateCellControl: TStyledControl; virtual;
    procedure SetVisible(const Value: Boolean); override;
    procedure DoTextChanged(Sender: TObject);
    procedure DoTextExit(Sender: TObject);
    procedure DoCanFocus(Sender: TObject; var ACanFocus: Boolean);
    procedure DoEnter(Sender: TObject); reintroduce;
    procedure DoKeyDown(Sender: TObject; var Key: Word;
      var KeyChar: System.WideChar; Shift: TShiftState);
  public
    constructor Create(AOwner: TComponent); override;
    function CellControlByPoint(X, Y: Single): TStyledControl;
    function CellControlByRow(Row: Integer): TStyledControl;
    property InEditMode: Integer read FEditMode;
    property ApplyImmediately: boolean read FApplyImmediately write FApplyImmediately default True;
  published
    property StyleLookup;
    property Header: WideString read FHeader write SetHeader;
    property ReadOnly: Boolean read FReadOnly write FReadOnly default False;
    property HitTest default False;
    property Visible: Boolean read FVisible write SetVisible default True;
  end;

{ TCheckColumn }

  TCheckColumn = class(TColumn)
  private
    procedure DoCheckChanged(Sender: TObject);
  protected
    function CreateCellControl: TStyledControl; override;
  public
    constructor Create(AOwner: TComponent); override;
  end;

{ TProgressColumn }

  TProgressColumn = class(TColumn)
  private
    FMin: Single;
    FMax: Single;
  protected
    function CreateCellControl: TStyledControl; override;
  public
    constructor Create(AOwner: TComponent); override;
  published
    property Min: Single read FMin write FMin;
    property Max: Single read FMax write FMax;
  end;

{ TPopupColumn }

  TPopupColumn = class(TColumn)
  private
    FItems: TWideStrings;
    procedure SetItems(const Value: TWideStrings);
  protected
    function CreateCellControl: TStyledControl; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published
    property Items: TWideStrings read FItems write SetItems;
  end;

{ TImageColumn }

  TImageColumn = class(TColumn)
  protected
    function CreateCellControl: TStyledControl; override;
  public
    constructor Create(AOwner: TComponent); override;
  end;

{ TCustomGrid }

  TOnGetValue = procedure(Sender: TObject; const Col, Row: Integer;
    var Value: Variant) of object;
  TOnSetValue = procedure(Sender: TObject; const Col, Row: Integer;
    const Value: Variant) of object;
  TOnEdititingDone = procedure(Sender: TObject; const Col, Row: Integer)
    of object;

  TCustomGrid = class(TScrollBox, IItemsContainer)
  private
    FItemHeight: Single;
    FSelection: TControl;
    FFocus: TControl;
    FRowCount: Integer;
    FOnGetValue: TOnGetValue;
    FOnSetValue: TOnSetValue;
    FSelections: TList;
    FAlternatingRowBackground: Boolean;
    FOddFill: TBrush;
    FLineFill: TBrush;
    FShowHorzLines: Boolean;
    FShowVertLines: Boolean;
    FReadOnly: Boolean;
    FColumnIndex: Integer;
    FHeader: THeader;
    FShowHeader: Boolean;
    FShowSelectedCell: Boolean;
    FOnEdititingDone: TOnEdititingDone;
    FOnSelChanged: TNotifyEvent;
    FRowPressed: integer;
    FColPressed: integer;
    FSelMoved: boolean;
    function GetColumnCount: Integer;
    function GetVisibleColumnCount: Integer;
    function GetColumn(Index: Integer): TColumn;
    procedure SetRowCount(const Value: Integer);
    procedure SetRowHeight(const Value: Single);
    function GetVisibleRows: Integer;
    procedure SetAlternatingRowBackground(const Value: Boolean);
    procedure SetShowHorzLines(const Value: Boolean);
    procedure SetShowVertLines(const Value: Boolean);
    procedure SetColumnIndex(const Value: Integer);
    procedure SetShowHeader(const Value: Boolean);
    procedure SetShowSelectedCell(const Value: Boolean);
    { IItemContainer }
    function GetItemsCount: Integer;
    function GetItem(const AIndex: Integer): TFmxObject;
    function GetReadOnly: Boolean;
    procedure SetReadOnly(const Value: Boolean);
    procedure MouseToCell(const X, Y: Single; var Col, Row: Integer);
    procedure SelCell(Col, Row: Integer; Need: boolean = false);
  protected
    FSelected: Integer;
    FRowHeight: Single;
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
    procedure ApplyStyle; override;
    procedure FreeStyle; override;
    procedure KeyDown(var Key: Word; var KeyChar: System.WideChar; Shift: TShiftState); override;
    procedure HScrollChange(Sender: TObject); override;
    procedure VScrollChange(Sender: TObject); override;
    function GetContentBounds: TRectF; override;
    procedure UpdateColumns; virtual;
    procedure UpdateHeader;
    procedure UpdateSelection;
    procedure Reset; virtual;
    procedure DoContentPaint(Sender: TObject; Canvas: TCanvas; const ARect: TRectF);
    procedure DoContentPaint2(Sender: TObject; Canvas: TCanvas; const ARect: TRectF);
    procedure ContentRemoveObject(AObject: TFmxObject); override;
    { observers }
    function CanObserve(const ID: Integer): Boolean; override;
    procedure ObserverAdded(const ID: Integer; const Observer: IObserver); override;
    procedure ObserverToggle(const AObserver: IObserver; const Value: Boolean);
    function ObserverCurrent: TVarRec;
    { data }
    function GetTopRow: Integer; virtual;
    procedure SetTopRow(const Value: Integer); virtual;
    function GetValue(Col, Row: Integer): Variant; virtual;
    procedure SetValue(Col, Row: Integer; const Value: Variant); virtual;
    function IsSelected(Row: Integer): Boolean;
    procedure SetSelected(const Value: Integer); virtual;
    function CanEditAcceptKey(Key: System.WideChar): Boolean; virtual;
    function CanEditModify: Boolean; virtual;
    { header }
    procedure DoRealignItem(Sender: TObject; OldIndex, NewIndex: Integer);
    procedure DoResizeItem(Sender: TObject; var NewSize: Single);
    procedure DoSelChanged; virtual;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function ColumnByIndex(const Idx: Integer): TColumn;
    function ColumnByPoint(const X, Y: Single): TColumn;
    function RowByPoint(const X, Y: Single): Integer;
    procedure AddObject(AObject: TFmxObject); override;
    property TopRow: Integer read GetTopRow write SetTopRow;
    property VisibleRows: Integer read GetVisibleRows;
    property ColumnCount: Integer read GetColumnCount;
    property ColumnIndex: Integer read FColumnIndex write SetColumnIndex;
    property Columns[Index: Integer]: TColumn read GetColumn;
    property RowCount: Integer read FRowCount write SetRowCount;
    property Selected: Integer read FSelected write SetSelected;
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Single); override;
    procedure MouseMove(Shift: TShiftState; X, Y: Single); override;
    property OnGetValue: TOnGetValue read FOnGetValue write FOnGetValue;
    property OnSetValue: TOnSetValue read FOnSetValue write FOnSetValue;
  published
    property StyleLookup;
    property AlternatingRowBackground: Boolean read FAlternatingRowBackground
      write SetAlternatingRowBackground default False;
    property CanFocus default True;
    property DisableFocusEffect default True;
    property RowHeight: Single read FRowHeight write SetRowHeight;
    property ShowSelectedCell: Boolean read FShowSelectedCell write SetShowSelectedCell default True;
    property ShowVertLines: Boolean read FShowVertLines write SetShowVertLines default True;
    property ShowHorzLines: Boolean read FShowHorzLines write SetShowHorzLines default True;
    property ShowHeader: Boolean read FShowHeader write SetShowHeader default True;
    property ReadOnly: Boolean read GetReadOnly write SetReadOnly default False;
    property TabOrder;
    property OnEdititingDone: TOnEdititingDone read FOnEdititingDone write FOnEdititingDone;
    property OnSelChanged: TNotifyEvent read FOnSelChanged write FOnSelChanged;
  end;

{ TGrid }

  TGrid = class(TCustomGrid)
  published
    property RowCount;
    property OnGetValue;
    property OnSetValue;
  end;

{ TStringColumn }

  TStringColumn = class(TColumn)
  private
    FCells: array of string;
  published
    procedure UpdateColumn; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  end;

{ TStringGrid }

  TStringGrid = class(TCustomGrid)
  private
    function GetCells(ACol, ARow: Integer): WideString;
    procedure SetCells(ACol, ARow: Integer; const Value: WideString);
  protected
    function GetValue(Col, Row: Integer): Variant; override;
    procedure SetValue(Col, Row: Integer; const Value: Variant); override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    property Cells[ACol, ARow: Integer]: WideString read GetCells write SetCells;
  published
    property RowCount;
  end;

implementation

uses FMX_Ani, Math, Variants, SysUtils;

type
  THackControl = class(TControl);

{ THeaderItem }

constructor THeaderItem.Create(AOwner: TComponent);
begin
  inherited;
  CanFocus := False;
  TextAlign := TTextAlign.taLeading;
  DragMode := TDragMode.dmAutomatic;
  FSplitter := TControl.Create(Self);
  FSplitter.Parent := Self;
  FSplitter.Width := 3;
  FSplitter.Align := TAlignLayout.alRight;
  FSplitter.Locked := True;
  FSplitter.Stored := False;
  FSplitter.HitTest := True;
  FSplitter.AutoCapture := True;
  FSplitter.Cursor := crSizeWE;
  FSplitter.OnMouseMove := DoSplitterMouseMove;
  FLeftSplitter := TControl.Create(Self);
  FLeftSplitter.Parent := Self;
  FLeftSplitter.Width := 3;
  FLeftSplitter.Align := TAlignLayout.alLeft;
  FLeftSplitter.Locked := True;
  FLeftSplitter.Stored := False;
  FLeftSplitter.HitTest := True;
  FLeftSplitter.AutoCapture := True;
  FLeftSplitter.Cursor := crSizeWE;
  FLeftSplitter.OnMouseMove := DoLeftSplitterMouseMove;
end;

procedure THeaderItem.DoSplitterMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Single);
var
  NewSize: Single;
begin
  if THackControl(FSplitter).FPressed then
  begin
    NewSize := AbsoluteToLocal(FSplitter.LocalToAbsolute(PointF(X, Y))).X;
    if NewSize < 0 then
      NewSize := 0;

    if (Parent <> nil) and (Parent is THeader) then
    begin
      if Assigned(THeader(Parent).OnResizeItem) then
        THeader(Parent).OnResizeItem(Self, NewSize);
    end;
    Width := NewSize;
    if (Parent <> nil) and (Parent is THeader) then
      THeader(Parent).Realign;
  end;
end;

procedure THeaderItem.DoLeftSplitterMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Single);
var
  P: TPointF;
  LeftItem: THeaderItem;
begin
  LeftItem := nil;
  if (Index > 0) and THackControl(FLeftSplitter).FPressed then
  begin
    if (Parent <> nil) and (Parent is THeader) then
      LeftItem := THeaderItem(THeader(Parent).Children[Index - 1]);
    if LeftItem = nil then
      Exit;

    P := FLeftSplitter.LocalToAbsolute(PointF(X, Y));

    P := LeftItem.FSplitter.AbsoluteToLocal(P);
    THackControl(LeftItem.FSplitter).FPressed := True;
    LeftItem.DoSplitterMouseMove(Sender, Shift, P.X, P.Y);
    THackControl(LeftItem.FSplitter).FPressed := False;
  end;
end;

procedure THeaderItem.DragDrop(const Data: TDragObject; const Point: TPointF);
var
  NewIndex, OldIndex: Integer;
begin
  inherited;
  NewIndex := Index;
  OldIndex := TFmxObject(Data.Source).Index;
  TFmxObject(Data.Source).Index := Index;
  if (Header <> nil) and Assigned(Header.OnRealignItem) then
    Header.OnRealignItem(TFmxObject(Data.Source), OldIndex, NewIndex);
end;

procedure THeaderItem.DragEnd;
begin
  inherited;
end;

procedure THeaderItem.DragOver(const Data: TDragObject; const Point: TPointF;
  var Accept: Boolean);
begin
  Accept := (Data.Source is THeaderItem) and
    (THeaderItem(Data.Source).Header = Header) and (DragMode <> TDragMode.dmManual);
end;

function THeaderItem.Header: THeader;
begin
  if (Parent <> nil) and (Parent is THeader) then
    Result := THeader(Parent)
  else
    Result := nil;
end;

{ THeader }

procedure THeader.AddObject(AObject: TFmxObject);
begin
  inherited;
  if AObject is THeaderItem then
    Realign;
end;

constructor THeader.Create(AOwner: TComponent);
begin
  inherited;
  ClipChildren := True;
  FSides := AllSides;
  FLastItem := THeaderItem.Create(nil);
  FLastItem.Parent := Self;
  FLastItem.Stored := False;
  FLastItem.Locked := True;
  FLastItem.Width := 50;
  FLastItem.DragMode := TDragMode.dmManual;
  FLastItem.FSplitter.Visible := False;
  SetAcceptsControls(False);
end;

function THeader.GetCount: Integer;
var
  i: Integer;
begin
  Result := 0;
  for i := 0 to ChildrenCount - 1 do
    if Children[i] is THeaderItem then
      Result := Result + 1;
end;

function THeader.GetHeaderItem(Index: Integer): THeaderItem;
var
  i, C: Integer;
begin
  Result := nil;
  C := 0;
  for i := 0 to ChildrenCount - 1 do
    if Children[i] is THeaderItem then
    begin
      if C = Index then
      begin
        Result := THeaderItem(Children[i]);
        Break;
      end;
      C := C + 1;
    end;
end;

function THeader.GetItem(const AIndex: Integer): TFmxObject;
begin
  Result := Items[AIndex];
end;

function THeader.GetItemsCount: Integer;
begin
  Result := Count;
end;

procedure THeader.Paint;
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

procedure THeader.Realign;
var
  R: TRectF;

  procedure DoPosition(Control: TControl);
  begin
    if not Control.Visible then
      Exit;
    with R do
    begin
      Control.SetBounds(Left, Top, Control.Width, Height);
      if Control <> FLastItem then
        Left := Left + Control.Width;
    end;
  end;

  procedure DoAlign;
  var
    i: Integer;
  begin
    for i := 0 to ChildrenCount - 1 do
    begin
      if not(TControl(Children[i]) is THeaderItem) then
        Continue;
      DoPosition(TControl(Children[i]));
      // sides
      THeaderItem(Children[i]).Sides := FSides;
      // corners
      THeaderItem(Children[i]).XRadius := Radius;
      THeaderItem(Children[i]).YRadius := Radius;
      if i = 0 then
      begin
        THeaderItem(Children[i]).Corners := [TCorner.crTopLeft];
        THeaderItem(Children[i]).Sides := THeaderItem(Children[i]).Sides +
          (FSides * [TSide.sdLeft]) - [TSide.sdRight];
      end
      else if Children[i] = FLastItem then
      begin
        THeaderItem(Children[i]).Corners := [TCorner.crTopRight];
        THeaderItem(Children[i]).Sides := THeaderItem(Children[i]).Sides +
          [TSide.sdLeft];
      end
      else
      begin
        THeaderItem(Children[i]).Corners := [];
        THeaderItem(Children[i]).Sides := THeaderItem(Children[i]).Sides +
          [TSide.sdLeft] - [TSide.sdRight];
      end;
    end;
  end;

begin
//  inherited;
  if csDestroying in ComponentState then
    Exit;
  if FDisableAlign then
    Exit;
  if ChildrenCount = 0 then
    Exit;
  FDisableAlign := True;
  try
    FLastItem.Index := FChildren.Count - 1;

    R := RectF(FOffset, 0, FWidth, FHeight);
    R := Margins.MarginRect(R);
    DoAlign;

    if R.Left > R.Right then
      FLastItem.Width := 0
    else
      FLastItem.Width := R.Right - R.Left;
  finally
    FDisableAlign := False;
  end;
end;

procedure THeader.SetRadius(const Value: Single);
begin
  if FRadius <> Value then
  begin
    FRadius := Value;
    Realign;
  end;
end;

procedure THeader.SetSides(const Value: TSides);
begin
  if FSides <> Value then
  begin
    FSides := Value;
    Realign;
  end;
end;

{ TColumn }

constructor TColumn.Create(AOwner: TComponent);
begin
  inherited;
  FAutoTranslate := True;
  Width := 100;
  HitTest := False;
  CanFocus := False;
  FEditMode := -1;
  FApplyImmediately := True;
end;

procedure TColumn.TextTypingProc(Sender: TObject);
begin
  if ApplyImmediately then
    DoTextChanged(Sender);
end;

procedure TColumn.TextChangeProc(Sender: TObject);
begin
  if not ApplyImmediately then
    DoTextChanged(Sender);
end;

function TColumn.CreateCellControl: TStyledControl;
begin
  Result := TTextCell.Create(Self);
  //TTextCell(Result).OnTyping := DoTextChanged;
  TTextCell(Result).OnTyping := TextTypingProc;
  TTextCell(Result).OnChange := TextChangeProc;
  TTextCell(Result).OnExit := DoTextExit;
end;

procedure TColumn.DoTextExit(Sender: TObject);
begin
  if (Grid <> nil) and Grid.Observers.IsObserving(TObserverMapping.EditGridLinkID) then
    if TLinkObservers.EditGridLinkIsEditing(Grid.Observers) then
      TLinkObservers.EditGridLinkUpdate(Grid.Observers);
end;

procedure TColumn.DoTextChanged(Sender: TObject);
begin
  if Grid = nil then
    Exit;
  if FUpdateColumn then
    Exit;
  if FDisableChange then
    Exit;
  with StringToPoint(AnsiString(TFmxObject(Sender).TagString)) do
  begin
    Grid.SetValue(trunc(X), trunc(Y), TStyledControl(Sender).Data);
    if Assigned(Grid.FOnEdititingDone) then
      Grid.FOnEdititingDone(Grid, trunc(X), trunc(Y));
  end;
end;

procedure TColumn.DoCanFocus(Sender: TObject; var ACanFocus: Boolean);
begin
  if Grid = nil then
    Exit;
  ACanFocus := Grid.CanEditModify;
  if ACanFocus and ReadOnly then
    ACanFocus := False;
end;

procedure TColumn.DoEnter(Sender: TObject);
begin
  if Grid = nil then
    Exit;
  Grid.ColumnIndex := Index;
  FSaveData := TFmxObject(Sender).Data;
  FEditMode := 1;
end;

procedure TColumn.DoKeyDown(Sender: TObject; var Key: Word;
  var KeyChar: System.WideChar; Shift: TShiftState);
begin
  if (Grid <> nil) and (FEditMode = -1) then
    DoEnter(Sender);

  if (Grid <> nil) and Grid.Observers.IsObserving(TObserverMapping.EditGridLinkID) then
  begin
    if Grid.ReadOnly then
    begin
      Key := 0;
      KeyChar := #0;
      Exit;
    end;

    if (Key = vkUp) or (Key = vkDown) or (Key = vkRight) or (Key = vkLeft) then
      if TLinkObservers.EditGridLinkIsEditing(Grid.Observers) then
      begin
        try
          TLinkObservers.EditGridLinkUpdate(Grid.Observers);
        except
          TLinkObservers.EditGridLinkReset(Grid.Observers);
          Grid.Reset;
          SetFocus;
          raise;
        end;
      end;
  end;

  if (KeyChar <> #0) and (Grid <> nil) and not Grid.CanEditAcceptKey(KeyChar)
  then
    KeyChar := #0;

  if (Grid <> nil) and (FEditMode = 1) then
  begin
    FEditMode := 0;
  end
  else if (KeyChar = #13) and (Grid <> nil) and (FEditMode = 0) then
  begin
    Grid.Reset;
    FEditMode := -1;
    Grid.SetFocus;
  end
  else if (Key = vkReturn) and (Grid <> nil) then
    Grid.SetFocus;

  if (Key = vkEscape) and (Grid <> nil) then
  begin
    try
      if Grid.Observers.IsObserving(TObserverMapping.EditGridLinkID) then
        TLinkObservers.EditGridLinkReset(Grid.Observers);
    finally
      FDisableChange := True;
      try
        TFmxObject(Sender).Data := FSaveData;
      finally
        FDisableChange := False;
      end;
      Grid.Reset;
    end;
  end;
  if (Key = vkUp) or (Key = vkDown) and (Grid <> nil) then
  begin
    Grid.SetFocus;
    Grid.KeyDown(Key, KeyChar, Shift);
  end;
  if Grid.Observers.IsObserving(TObserverMapping.EditGridLinkID) then
  begin
    if (Key = vkBack) or (Key = vkDelete) or ((Key = vkInsert) and (ssShift in Shift)) then
    begin
      if TLinkObservers.EditGridLinkEdit(Grid.Observers) then
        TLinkObservers.EditGridLinkModified(Grid.Observers)
      else
      begin
        Key := 0;
        KeyChar := #0;
        TLinkObservers.EditGridLinkReset(Grid.Observers);
        Exit;
      end;
    end;

    if (KeyChar >= #32) and
      not TLinkObservers.EditGridLinkIsValidChar(Grid.Observers, KeyChar) then
    begin
      KeyChar := #0;
      Exit;
    end;
    case KeyChar of
      ^H, ^V, ^X, #32..High(Char):
        if not TLinkObservers.EditGridLinkEdit(Grid.Observers) then
        begin
          Key := 0;
          KeyChar := #0;
          TLinkObservers.EditGridLinkReset(Grid.Observers);
          Exit;
        end
        else
          TLinkObservers.EditGridLinkModified(Grid.Observers);
    end;

    if Key = vkReturn then
    begin
      try
        TLinkObservers.EditGridLinkUpdate(Grid.Observers);
      except
        TLinkObservers.EditGridLinkReset(Grid.Observers);
        Grid.Reset;
        Grid.SetFocus;
        raise;
      end;
    end;
  end;
end;

function TColumn.Grid: TCustomGrid;
var
  P: TFmxObject;
begin
  P := Parent;
  while (P <> nil) do
  begin
    if P is TCustomGrid then
    begin
      Result := TCustomGrid(P);
      Exit;
    end;
    P := P.Parent;
  end;
  Result := nil;
end;

procedure TColumn.ClearColumn;
var
  i: Integer;
begin
  for i := 0 to High(FCellControls) do
    FCellControls[i].Free;
  SetLength(FCellControls, 0);
end;

function TColumn.CellControlByPoint(X, Y: Single): TStyledControl;
var
  i: Integer;
  P: TPointF;
begin
  Result := nil;
  if Grid = nil then
    Exit;

  P := Grid.LocalToAbsolute(PointF(X, Y));
  for i := 0 to High(FCellControls) do
    if FCellControls[i].Visible and (FCellControls[i].PointInObject(P.X, P.Y))
    then
    begin
      Result := FCellControls[i];
      Exit;
    end;
end;

function TColumn.CellControlByRow(Row: Integer): TStyledControl;
var
  i: Integer;
begin
  Result := nil;
  if Grid = nil then
    Exit;

  for i := 0 to High(FCellControls) do
    if (FCellControls[i].Visible) and
      (trunc(StringToPoint(AnsiString(FCellControls[i].TagString)).Y) = Row) then
    begin
      Result := FCellControls[i];
      Exit;
    end;
end;

procedure TColumn.UpdateColumn;
var
  i, C, X: Integer;
  V: Variant;
begin
  if Grid = nil then
    Exit;

  FUpdateColumn := True;
  try
    { Create controls }
    if Length(FCellControls) < Min(Grid.RowCount, Grid.VisibleRows) then
    begin
      C := High(FCellControls);
      SetLength(FCellControls, Min(Grid.RowCount, Grid.VisibleRows));
      for i := C + 1 to Min(Grid.RowCount, Grid.VisibleRows) - 1 do
      begin
        FCellControls[i] := CreateCellControl;
        FCellControls[i].Parent := Self;
        FCellControls[i].HitTest := False;
        FCellControls[i].Visible := False;
        FCellControls[i].Locked := True;
        FCellControls[i].Stored := False;
        FCellControls[i].OnCanFocus := DoCanFocus;
        FCellControls[i].OnEnter := DoEnter;
        FCellControls[i].OnKeyDown := DoKeyDown;
      end;
    end;
    { Hide if need }
    if Length(FCellControls) > Min(Grid.RowCount, Grid.VisibleRows) then
    begin
      for i := Min(Grid.RowCount, Grid.VisibleRows) to High(FCellControls) do
        FCellControls[i].Visible := False;
    end;
    { Update Data }
    if Position.X < 1 then
      X := 0
    else
      X := 1;
    for i := 0 to Min(Grid.RowCount, Grid.VisibleRows) - 1 do
    begin
      if Grid.TopRow + i >= Grid.RowCount then
        Break;

      V := Grid.GetValue(Index, Grid.TopRow + i);

      FCellControls[i].Visible := True;
      FCellControls[i].SetBounds(X, i * Grid.RowHeight, Width - X, Grid.RowHeight);
      FCellControls[i].TagString :=
        String(PointToString(PointF(Index, Grid.TopRow + i)));
      FCellControls[i].Data := V;
    end;
    UpdateSelected;
  finally
    FUpdateColumn := False;
  end;
end;

procedure TColumn.UpdateSelected;
var
  i, N: Integer;
  EnableFocus: boolean;
  lGrid: TCustomGrid;
begin
  lGrid := Grid;
  if (lGrid = nil) then Exit;

  EnableFocus := (not ReadOnly) and
                 (Enabled) and
                 (not lGrid.ReadOnly) and
                 (lGrid.Enabled) and
                 (lGrid.ColumnIndex = Index) and
                 (lGrid.IsFocused);

  N := MinIntValue([High(FCellControls), lGrid.RowCount - 1, lGrid.VisibleRows - 1]);

  if EnableFocus then
    for i := 0 to N do
      if lGrid.IsSelected(lGrid.TopRow + i) then
      begin
        FCellControls[i].CanFocus := True;
        FCellControls[i].HitTest := True;
        if not FCellControls[i].IsFocused then
          lGrid.Root.SetActiveControl(FCellControls[i]);
      end;

  for i := 0 to N do
    if not lGrid.IsSelected(lGrid.TopRow + i) then
    begin
      FCellControls[i].CanFocus := False;
      FCellControls[i].HitTest := False;
      if FCellControls[i].IsFocused then
        lGrid.Root.SetActiveControl(nil);
    end;
end;

procedure TColumn.SetHeader(const Value: WideString);
begin
  if FHeader <> Value then
  begin
    FHeader := Value;
    if (Grid <> nil) and (Grid.FHeader <> nil) then
      Grid.FHeader.Items[Index].Text := FHeader;
  end;
end;

procedure TColumn.SetVisible(const Value: Boolean);
begin
  inherited SetVisible(Value);

  if Grid <> nil then
  begin
    if Grid.FHeader <> nil then
    Grid.FHeader.Items[Index].Visible := Value;
    Grid.Realign;
  end;
end;

{ TCheckColumn }

constructor TCheckColumn.Create(AOwner: TComponent);
begin
  inherited;
end;

function TCheckColumn.CreateCellControl: TStyledControl;
begin
  Result := TCheckCell.Create(Self);
  Result.StyleLookup := 'checkboxstyle';
  TCheckCell(Result).OnChange := DoCheckChanged;
end;

procedure TCheckColumn.DoCheckChanged(Sender: TObject);
begin
  if Grid = nil then
    Exit;
  if FUpdateColumn then
    Exit;
  with StringToPoint(AnsiString(TFmxObject(Sender).TagString)) do
  begin
    Grid.SetValue(trunc(X), trunc(Y), TStyledControl(Sender).Data);
    if Assigned(Grid.FOnEdititingDone) then
      Grid.FOnEdititingDone(Grid, trunc(X), trunc(Y));
  end;
end;

{ TProgressColumn }

constructor TProgressColumn.Create(AOwner: TComponent);
begin
  inherited;
  FMax := 100;
end;

function TProgressColumn.CreateCellControl: TStyledControl;
begin
  Result := TProgressCell.Create(Self);
  TProgressCell(Result).Min := FMin;
  TProgressCell(Result).Max := FMax;
end;

{ TPopupColumn }

constructor TPopupColumn.Create(AOwner: TComponent);
begin
  inherited;
  FItems := TWideStringList.Create;
end;

destructor TPopupColumn.Destroy;
begin
  FItems.Free;
  inherited;
end;

function TPopupColumn.CreateCellControl: TStyledControl;
begin
  Result := TPopupCell.Create(Self);
  TPopupCell(Result).Items.Assign(FItems);
end;

procedure TPopupColumn.SetItems(const Value: TWideStrings);
begin
  FItems.Assign(Value);
end;

{ TImageColumn }

constructor TImageColumn.Create(AOwner: TComponent);
begin
  inherited;
end;

function TImageColumn.CreateCellControl: TStyledControl;
begin
  Result := TImageCell.Create(Self);
  TImageCell(Result).EnableOpenDialog := False;
end;

{ TCustomGrid }

constructor TCustomGrid.Create(AOwner: TComponent);
begin
  inherited;
  FOddFill := TBrush.Create(TBrushKind.bkSolid, $20000000);
  FLineFill := TBrush.Create(TBrushKind.bkSolid, $FF202020);
  FShowSelectedCell := True;
  FShowVertLines := True;
  FShowHorzLines := True;
  FShowHeader := True;
  FRowHeight := 21;
  FRowCount := 100;
  DisableFocusEffect := True;
  CanFocus := True;
  AutoCapture := True;
  Width := 100;
  Height := 100;
  FItemHeight := 0;
  SetAcceptsControls(False);
end;

destructor TCustomGrid.Destroy;
begin
  if FSelections <> nil then
    FSelections.Free;
  FLineFill.Free;
  FOddFill.Free;
  inherited;
end;

procedure TCustomGrid.FreeStyle;
var
  I: Integer;
begin
  inherited;
  if FSelections <> nil then
  begin
    for i := 0 to FSelections.Count - 1 do
      TFmxObject(FSelections[i]).Free;
    FSelections.Clear;
  end;
  FSelection := nil;
  FFocus := nil;
  FHeader := nil;
end;

procedure TCustomGrid.ApplyStyle;
var
  T: TFmxObject;
  TR: Integer;
begin
  inherited;
  T := FindStyleResource('content');
  if (T <> nil) and (T is TControl) then
  begin
    TControl(T).OnPainting := DoContentPaint;
    TControl(T).OnPaint := DoContentPaint2;
  end;
  T := FindStyleResource('header');
  if (T <> nil) and (T is THeader) then
  begin
    FHeader := THeader(T);
    FHeader.OnRealignItem := DoRealignItem;
    FHeader.OnResizeItem := DoResizeItem;
    FHeader.Visible := FShowHeader;
  end;
  T := FindStyleResource('focus');
  if (T <> nil) and (T is TControl) then
  begin
    FFocus := TControl(T);
    FFocus.Visible := False;
  end;
  T := FindStyleResource('selection');
  if (T <> nil) and (T is TControl) then
  begin
    FSelection := TControl(T);
    FSelection.Visible := False;
  end;
  T := FindStyleResource('AlternatingRowBackground');
  if (T <> nil) and (T is TBrushObject) then
  begin
    FOddFill.Assign(TBrushObject(T).Brush);
  end;
  T := FindStyleResource('LineFill');
  if (T <> nil) and (T is TBrushObject) then
  begin
    FLineFill.Assign(TBrushObject(T).Brush);
  end;
  UpdateColumns;
  UpdateHeader;
  if (FHeader <> nil) and (not FHeader.Visible) then
  begin
    TR := TopRow;
    SetTopRow(TR + 1);
    SetTopRow(TR);
  end;
  UpdateSelection;
  Realign;
end;

procedure TCustomGrid.UpdateSelection;
var
  i: Integer;
  P: TPointF;
  R: TRectF;
  SelRects: array of TRectF;
  Clone: TControl;
  procedure UpdateFocusRect;
  var FocusVisible: boolean;
      I: integer;
      P: TPointF;
      FocusCellControl: TStyledControl;
      W, H: Single;
  begin
    if FFocus <> nil then
    begin
      FocusVisible := (FShowSelectedCell and Visible and Enabled) and
                      (ColumnIndex < ColumnCount) and
                      (ColumnIndex >= 0) and
                      (Columns[ColumnIndex].Visible) and
                      (Columns[ColumnIndex].Enabled){ and
                      (IsFocused or Columns[ColumnIndex].IsFocused)};
      if FocusVisible then
      begin
        I := Selected - TopRow;
        FocusVisible := (I >= 0) and
                   (I < VisibleRows) and
                   (Selected < RowCount) and
                   (I < Length(Columns[ColumnIndex].FCellControls));
        if FocusVisible then
        begin
          FocusCellControl := Columns[ColumnIndex].FCellControls[I];
          FocusVisible := (FocusCellControl <> nil) and
                          (FContent <> nil) and
                          (FocusCellControl.Parent is TControl) and
                          (FFocus.Parent is TControl);
          if FocusVisible then
          begin
            P := TControl(FocusCellControl.Parent).LocalToAbsolute(FocusCellControl.Position.Point);
            P := TControl(FContent).AbsoluteToLocal(P);
            P.Y := Selected * RowHeight;
            P.X := P.X + FFocus.Padding.Left;
            P.Y := P.Y + FFocus.Padding.Top;
            P := FContent.LocalToAbsolute(P);
            P := TControl(FFocus.Parent).AbsoluteToLocal(P);
            W := FocusCellControl.Width - FFocus.Padding.Left - FFocus.Padding.Right;
            H := FocusCellControl.Height - FFocus.Padding.Top - FFocus.Padding.Bottom;
            FocusVisible := (W > 1) and (H > 1);
            if FocusVisible then
            begin
              FFocus.SetBounds(P.X, P.Y, W, H);
              FFocus.Visible := True;
              FFocus.BringToFront;
            end;
          end;
        end;
      end;
      if not FocusVisible then
        FFocus.Visible := False;
    end;
  end;
begin
  try
    if FSelection = nil then
      Exit;
    if (ColumnCount = 0) and (RowCount = 0) then
    begin
      if FSelections <> nil then
        for i := 0 to FSelections.Count - 1 do
          TControl(FSelections[i]).Visible := False;
      Exit;
    end;
    // calc rects
    SetLength(SelRects, 0);
    for i := 0 to RowCount - 1 do
    begin
      if IsSelected(i) then
      begin
        P := PointF(0, i * FRowHeight);
        P := FContent.LocalToAbsolute(P);
        if (FSelection.Parent <> nil) and (FSelection.Parent is TControl) then
          P := TControl(FSelection.Parent).AbsoluteToLocal(P);
        if FContent.Width < ClientWidth then
          R := RectF(P.X, P.Y, P.X + ClientWidth, P.Y + FRowHeight)
        else
          R := RectF(P.X, P.Y, P.X + FContent.Width, P.Y + FRowHeight);
        if (Length(SelRects) > 0) and (i > 0) and (IsSelected(i - 1)) then
          SelRects[High(SelRects)] := UnionRect(R, SelRects[High(SelRects)])
        else
        begin
          SetLength(SelRects, Length(SelRects) + 1);
          SelRects[High(SelRects)] := R;
        end;
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
      end;
    // align selections
    for i := 0 to High(SelRects) do
    begin
      TControl(FSelections[i]).Visible := True;
      with SelRects[i] do
        TControl(FSelections[i]).SetBounds(Left, Top, Right - Left,
          Bottom - Top);
    end;
  finally
    UpdateFocusRect;
    for i := 0 to ColumnCount - 1 do
      Columns[i].UpdateSelected;
  end;
end;

procedure TCustomGrid.DoRealignItem(Sender: TObject;
  OldIndex, NewIndex: Integer);
begin
  if ColumnIndex = Columns[OldIndex].Index then
    ColumnIndex := NewIndex;
  Columns[OldIndex].Index := NewIndex;
end;

procedure TCustomGrid.DoResizeItem(Sender: TObject; var NewSize: Single);
begin
  if NewSize < 10 then
    NewSize := 10;
  Columns[THeaderItem(Sender).Index].Width := NewSize;
end;

procedure TCustomGrid.DoSelChanged;
begin
  if Assigned(FOnSelChanged) then
    FOnSelChanged(Self);
end;

procedure TCustomGrid.UpdateHeader;
var
  i: Integer;
  Item: THeaderItem;
begin
  if FHeader = nil then
    Exit;

  FHeader.FOffset := -HScrollBar.Value;
  FHeader.FChildren.Remove(FHeader.FLastItem);
  if FHeader.ChildrenCount < ColumnCount then
  begin
    for i := FHeader.ChildrenCount to ColumnCount - 1 do
    begin
      Item := THeaderItem.Create(Self);
      Item.Parent := FHeader;
      Item.Locked := True;
      Item.Stored := False;
      Item.Visible := Columns[i].Visible;
    end;
  end
  else
    for i := FHeader.ChildrenCount - 1 downto ColumnCount do
    begin
      FHeader.Children[i].Free;
    end;
  FHeader.FChildren.Add(FHeader.FLastItem);
  FHeader.FLastItem.Index := FHeader.FChildren.Count - 1;

  for i := 0 to ColumnCount - 1 do
  begin
    THeaderItem(FHeader.Children[i]).Text := Columns[i].Header;
    THeaderItem(FHeader.Children[i]).Width := Columns[i].Width;
    THeaderItem(FHeader.Children[i]).Visible := Columns[i].Visible;
  end;
  if FHeader <> nil then
    FHeader.Realign;
end;

procedure TCustomGrid.UpdateColumns;
var
  i: Integer;
begin
  for i := 0 to ColumnCount - 1 do
  begin
    if Columns[i].Visible then
    begin
      Columns[i].Position.Y := (TopRow * FRowHeight);
      Columns[i].UpdateColumn;
    end;
  end;
end;

procedure TCustomGrid.DoContentPaint(Sender: TObject; Canvas: TCanvas;
  const ARect: TRectF);
var
  i: Integer;
  P: TPointF;
begin
  if (FContent <> nil) and (ContentLayout <> nil) then
  begin
    if FAlternatingRowBackground then
    begin
      Canvas.Fill.Assign(FOddFill);
      for i := 0 to Min(RowCount, VisibleRows) - 1 do
      begin
        if Odd(TopRow + i) then
        begin
          P := FContent.LocalToAbsolute(PointF(0, (TopRow + i) * FRowHeight));
          P := TControl(Sender).AbsoluteToLocal(P);
          Canvas.FillRect(RectF(P.X, P.Y, P.X + FContent.Width,
            P.Y + FRowHeight), 0, 0, [], AbsoluteOpacity);
        end;
      end;
    end;
  end;
end;

procedure TCustomGrid.DoContentPaint2(Sender: TObject; Canvas: TCanvas;
  const ARect: TRectF);
var
  i: Integer;
  P: TPointF;
  State: TCanvasSaveState;
begin
  if (FContent <> nil) and (ContentLayout <> nil) and
    (FShowVertLines or FShowHorzLines) then
  begin
    State := Canvas.SaveState;
    try
      Canvas.IntersectClipRect(ARect);
      Canvas.Stroke.Assign(FLineFill);
      if FShowHorzLines then
        for i := 0 to Min(RowCount, VisibleRows) do
        begin
          P := FContent.LocalToAbsolute(PointF(0, (TopRow + i) * FRowHeight));
          P := TControl(Sender).AbsoluteToLocal(P);
          Canvas.DrawLine(PointF(P.X, P.Y - 0.5), PointF(P.X + FContent.Width,
            P.Y - 0.5), AbsoluteOpacity);
        end;
      if FShowVertLines then
        for i := 0 to ColumnCount - 1 do
        begin
          if Columns[i].Visible then
          begin
          P := Columns[i].LocalToAbsolute(PointF(Columns[i].Width, 0));
          P := TControl(Sender).AbsoluteToLocal(P);
          Canvas.DrawLine(PointF(P.X + 0.5, P.Y),
            PointF(P.X + 0.5, P.Y + (Min(RowCount, VisibleRows) * FRowHeight)),
            AbsoluteOpacity);
        end;
        end;
    finally
      Canvas.RestoreState(State);
    end;
  end;
end;

function TCustomGrid.GetContentBounds: TRectF;
var
  Col, R: TRectF;
  i: Integer;
begin
  Result := LocalRect;
  if FUpdating > 0 then
    Exit;
  if ContentLayout = nil then
    Exit;
  R := ContentLayout.LocalRect;
  if (ColumnCount > 0) and (GetVisibleColumnCount > 0) then
  begin
    R.Right := R.Left;
    R.Top := R.Top;
    for i := 0 to ColumnCount - 1 do
    begin
      if Columns[i].Visible then
      begin
      Col := RectF(R.Right, R.Top, R.Right + Columns[i].Width, R.Bottom);
      R.Right := R.Right + Columns[i].Width;
      Columns[i].SetBounds(Col.Left, (TopRow * FRowHeight), Columns[i].Width,
        ClientHeight);
      end;

      Columns[i].UpdateColumn;
    end;
    R.Bottom := R.Top + (FRowCount * FRowHeight);
  end;
  if RectWidth(R) < ContentLayout.Width then
    R.Right := R.Left + ContentLayout.Width;
  if RectHeight(R) < ContentLayout.Height then
    R.Bottom := R.Top + ContentLayout.Height;
  Result := R;
  UpdateColumns;
  UpdateHeader;
  UpdateSelection;
end;

function TCustomGrid.GetReadOnly: Boolean;
begin
  // Code to use observers removed.  Observers
  // do not affect ReadOnly property of a grid.
  Result := FReadOnly;
end;

procedure TCustomGrid.SetReadOnly(const Value: Boolean);
begin
  // Code to use observers removed.  Observers
  // do not affect ReadOnly property of a grid.
  FReadOnly := Value;
end;

function TCustomGrid.GetItem(const AIndex: Integer): TFmxObject;
begin
  Result := Columns[AIndex];
end;

function TCustomGrid.GetItemsCount: Integer;
begin
  Result := ColumnCount;
end;

procedure TCustomGrid.HScrollChange(Sender: TObject);
begin
  inherited;
  UpdateHeader;
  UpdateSelection;
end;

procedure TCustomGrid.VScrollChange(Sender: TObject);
begin
  inherited;
  UpdateColumns;
  SetFocus;
  UpdateSelection;
end;

function TCustomGrid.GetColumnCount: Integer;
var
  i: Integer;
begin
  Result := 0;
  if (FContent <> nil) and (FContent.ChildrenCount > 0) then
    for i := 0 to FContent.ChildrenCount - 1 do
      if FContent.Children[i] is TColumn then
      begin
        Inc(Result);
      end;
end;

function TCustomGrid.RowByPoint(const X, Y: Single): Integer;
var
  P: TPointF;
begin
  P := LocalToAbsolute(PointF(X, Y));
  if FContent <> nil then
  begin
    P := FContent.AbsoluteToLocal(P);
    Result := trunc(P.Y / FRowHeight);
    Exit;
  end;
  Result := -1;
end;

function TCustomGrid.ColumnByIndex(const Idx: Integer): TColumn;
var
  C, i: Integer;
begin
  C := 0;
  if (FContent <> nil) and (FContent.ChildrenCount > 0) then
    for i := 0 to FContent.ChildrenCount - 1 do
      if FContent.Children[i] is TColumn then
      begin
        if C = Idx then
        begin
          Result := TColumn(FContent.Children[i]);
          Exit;
        end;
        Inc(C);
      end;
  Result := nil;
end;

function TCustomGrid.ColumnByPoint(const X, Y: Single): TColumn;
var
  i: Integer;
  P, P1: TPointF;
begin
  P := LocalToAbsolute(PointF(X, Y));
  if (FContent <> nil) then
  for i := 0 to FContent.ChildrenCount - 1 do
    if FContent.Children[i] is TColumn then
    begin
      Result := TColumn(FContent.Children[i]);
      if (not Result.Visible) or
         (not IntersectRect(Result.UpdateRect, UpdateRect)) then
          Continue;
      P1 := Result.AbsoluteToLocal(P);
      if (Round(P1.X) >= 0) and (Round(P1.X) <= Result.Width) then
      begin
        Result := TColumn(FContent.Children[i]);
        Exit;
      end;
    end;
  Result := nil;
end;

procedure TCustomGrid.ContentRemoveObject(AObject: TFmxObject);
begin
  inherited;
  if AObject is TColumn then
  begin
    if FUpdating = 0 then
    begin
      Realign;
    end;
  end;
end;

function TCustomGrid.CanEditModify: Boolean;
begin
  Result := not ReadOnly;
end;

function TCustomGrid.CanEditAcceptKey(Key: System.WideChar): Boolean;
begin
  Result := True;
end;

procedure TCustomGrid.KeyDown(var Key: Word; var KeyChar: System.WideChar;
  Shift: TShiftState);
begin
  inherited;

  if (ColumnCount > 0) and (RowCount > 0) then
  begin
    if (KeyChar <> #0) and not(ReadOnly) and not(Columns[ColumnIndex].ReadOnly)
    then
    begin
      if (Columns[ColumnIndex] <> nil) and
        (Columns[ColumnIndex].CellControlByRow(Selected) <> nil) then
      begin
        if (Key = 0) and (Columns[ColumnIndex].InEditMode = -1) then
        Columns[ColumnIndex].CellControlByRow(Selected).SetFocus;
        THackControl(Columns[ColumnIndex].CellControlByRow(Selected))
          .KeyDown(Key, KeyChar, Shift);
      end;
    end;
    case Key of
      vkF2:
        begin
          if (Columns[ColumnIndex] <> nil) and
            (Columns[ColumnIndex].CellControlByRow(Selected) <> nil) then
            Columns[ColumnIndex].CellControlByRow(Selected).SetFocus;
        end;
      vkUp:
        if FSelected > 0 then
          Selected := Selected - 1;
      vkDown:
        if FSelected < FRowCount - 1 then
          Selected := Selected + 1;
      vkHome:
        if ssCtrl in Shift then
          Selected := 0
        else
          ColumnIndex := 0;
      vkEnd:
        if ssCtrl in Shift then
          Selected := RowCount - 1
        else
          ColumnIndex := ColumnCount - 1;
      vkPrior:
        if FSelected > 0 then
          Selected := Selected - Min(RowCount, VisibleRows);
      vkNext:
        if FSelected < FRowCount - 1 then
          Selected := Selected + Min(RowCount, VisibleRows);
      vkLeft:
        if ColumnIndex > 0 then
          ColumnIndex := ColumnIndex - 1;
      vkRight:
        if ColumnIndex < ColumnCount - 1 then
          ColumnIndex := ColumnIndex + 1;
    else
      Exit;
    end;
    Key := 0;
  end;
end;

procedure TCustomGrid.MouseToCell(const X, Y: Single; var Col, Row: Integer);
var
  Column: TColumn;
begin
  Column := ColumnByPoint(X, Y);
  if Column <> nil then
    Col := Column.Index
  else
    Col := ColumnIndex;
  Row := RowByPoint(X, Y);
  if (Row < 0) then
    Row := Selected;
end;

procedure TCustomGrid.SelCell(Col, Row: Integer; Need: boolean = false);
begin
  if (Col <> ColumnIndex) or (Row <> Selected) then
  begin
    if (FFocus <> nil) then
      FFocus.Visible := False;
    BeginUpdate;
    try
      Root.SetActiveControl(nil);
      if (ColumnIndex > 0) and (ColumnIndex < ColumnCount) then
      begin
        Columns[ColumnIndex].FEditMode := -1;
      end;
      Selected := Row;
      ColumnIndex := Col;
    finally
      EndUpdate;
    end;
    UpdateSelection;
  end;
end;

procedure TCustomGrid.MouseDown(Button: TMouseButton; Shift: TShiftState;
  X, Y: Single);
var
  Column: TColumn;
  NewCol, NewRow: integer;
begin
  if Observers.IsObserving(TObserverMapping.EditGridLinkID) then
  begin
    Column := ColumnByPoint(X,Y);
    if (Button = TMouseButton.mbLeft) and ((Assigned(Column) and (ColumnIndex <> Column.Index)) or (Selected <> RowByPoint(X,Y))) then
      if TLinkObservers.EditGridLinkIsEditing(Observers) then
      begin
        try
          TLinkObservers.EditGridLinkUpdate(Observers);
        except
          TLinkObservers.EditGridLinkReset(Observers);
          Reset;
          Column.SetFocus;
          raise;
        end;
      end;
  end;
  inherited;
  try
    if Button = TMouseButton.mbLeft then
    begin
      MouseToCell(X, Y, NewCol, NewRow);
      FRowPressed := NewRow;
      FColPressed := NewCol;
      if FSelMoved then
      begin
        SelCell(NewCol, NewRow, True);
      end
      else
        SelCell(NewCol, NewRow, False);
    end;
  except
    if not FSelMoved then
      MouseUp(Button, Shift, X, Y);
    raise;
  end;
end;

procedure TCustomGrid.MouseMove(Shift: TShiftState; X, Y: Single);
var
  NewCol: Integer;
  NewRow: Integer;
  Column: TColumn;
  Control: TStyledControl;
begin
  inherited;
  if FPressed then
  begin
    MouseToCell(X, Y, NewCol, NewRow);
    if (NewCol <> ColumnIndex) or (NewRow <> Selected) then
    begin
      FSelMoved := True;
      try
        MouseDown(TMouseButton.mbLeft, Shift, X, Y);
      finally
        FSelMoved := False;
      end;
    end;
  end;
end;

procedure TCustomGrid.AddObject(AObject: TFmxObject);
begin
  if (FContent <> nil) and ((AObject is TColumn)) then
  begin
    FContent.AddObject(AObject);
    if FUpdating = 0 then
      Realign;
  end
  else
    inherited;
end;

procedure TCustomGrid.Notification(AComponent: TComponent;
  Operation: TOperation);
begin
  inherited;
end;

function TCustomGrid.CanObserve(const ID: Integer): Boolean;
begin
  Result := False;
  if ID = TObserverMapping.EditGridLinkID then
    Result := True
  else if ID = TObserverMapping.PositionLinkID then
    Result := True;
end;

procedure TCustomGrid.ObserverAdded(const ID: Integer;
  const Observer: IObserver);
var
  LGridLinkObserver: IEditGridLinkObserver;
begin
  if ID = TObserverMapping.EditGridLinkID then
    Observer.OnObserverToggle := ObserverToggle;
  if Supports(Observer, IEditGridLinkObserver, LGridLinkObserver) then
    LGridLinkObserver.OnObserverCurrent := ObserverCurrent;
end;

function TCustomGrid.ObserverCurrent: TVarRec;
begin
  Result.VType := vtInteger;
  Result.VInteger := ColumnIndex;
end;

procedure TCustomGrid.ObserverToggle(const AObserver: IObserver;
  const Value: Boolean);
begin
  // Code to use observers removed.  Observers
  // do not affect ReadOnly property of a grid.
end;

function TCustomGrid.GetColumn(Index: Integer): TColumn;
begin
  Result := ColumnByIndex(Index);
end;

procedure TCustomGrid.SetRowCount(const Value: Integer);
begin
  if FRowCount <> Value then
  begin
    FRowCount := Value;
    Realign;
    if (FSelected >= FRowCount) and (FRowCount > 0) then
      Selected := FRowCount - 1;
  end;
end;

procedure TCustomGrid.SetRowHeight(const Value: Single);
begin
  if FRowHeight <> Value then
  begin
    FRowHeight := Value;
    if FRowHeight < 5 then
      FRowHeight := 5;
    Realign;
  end;
end;

function TCustomGrid.GetTopRow: Integer;
begin
  if VScrollBar <> nil then
    Result := trunc(VScrollBar.Value / FRowHeight)
  else
    Result := 0;
end;

function TCustomGrid.GetVisibleColumnCount: Integer;
var
  i : Integer;
begin
  Result := 0;
  if ColumnCount > 0 then
  begin
    for i := 0 to ColumnCount - 1 do
      if Columns[i].Visible then
        Inc(Result);
  end;
end;

function TCustomGrid.GetVisibleRows: Integer;
begin
  Result := trunc(ClientHeight / FRowHeight) + 2;
end;

function TCustomGrid.GetValue(Col, Row: Integer): Variant;
begin
  Result := NULL;
  if Assigned(FOnGetValue) then
    FOnGetValue(Self, Col, Row, Result);
end;

procedure TCustomGrid.SetValue(Col, Row: Integer; const Value: Variant);
begin
  if Assigned(FOnSetValue) then
    FOnSetValue(Self, Col, Row, Value);
end;

procedure TCustomGrid.SetSelected(const Value: Integer);
var
  LSelected: Integer;
  lScroled: boolean;
begin
  LSelected := Value;
  if LSelected < 0 then
    LSelected := 0;
  if LSelected >= FRowCount then
    LSelected := FRowCount - 1;
  if LSelected <> FSelected then
  begin
    FSelected := LSelected;
    lScroled := False;
    if (VScrollBar <> nil) then
    begin
      if (FSelected * FRowHeight) < VScrollBar.Value then
      begin
        VScrollBar.Value := FSelected * FRowHeight;
        lScroled := True;
      end;
      if (FSelected * FRowHeight > VScrollBar.Value + ClientHeight - FRowHeight) then
      begin
        VScrollBar.Value := FSelected * FRowHeight - ClientHeight + FRowHeight;
        lScroled := True;
      end;
    end;
    if not lScroled then
    begin
      if FUpdating = 0 then
        UpdateSelection;
    end;
    if Observers.IsObserving(TObserverMapping.PositionLinkID) then
      TLinkObservers.PositionLinkPosChanged(Observers);
    DoSelChanged;
  end;
end;

procedure TCustomGrid.SetColumnIndex(const Value: Integer);
var lColumnIndex: integer;
begin
  lColumnIndex := Value;
  if lColumnIndex < 0 then
    lColumnIndex := 0;
  if lColumnIndex >= ColumnCount then
    lColumnIndex := ColumnCount - 1;
  if FColumnIndex <> lColumnIndex then
  begin
    FColumnIndex := lColumnIndex;
    if FUpdating = 0 then
      UpdateSelection;
    if (HScrollBar <> nil) and (FColumnIndex >= 0)  then
    begin
      if Columns[FColumnIndex].Position.X < HScrollBar.Value then
        HScrollBar.Value := Columns[FColumnIndex].Position.X;
      if Columns[FColumnIndex].Position.X + Columns[FColumnIndex].Width >
        HScrollBar.Value + ClientWidth then
        HScrollBar.Value := Columns[FColumnIndex].Position.X +
          Columns[FColumnIndex].Width - ClientWidth;
    end;
    DoSelChanged;
  end;
end;

function TCustomGrid.IsSelected(Row: Integer): Boolean;
begin
  Result := Row = FSelected;
end;

procedure TCustomGrid.SetAlternatingRowBackground(const Value: Boolean);
begin
  if FAlternatingRowBackground <> Value then
  begin
    FAlternatingRowBackground := Value;
    Repaint;
  end;
end;

procedure TCustomGrid.SetShowHorzLines(const Value: Boolean);
begin
  if FShowHorzLines <> Value then
  begin
    FShowHorzLines := Value;
    Repaint;
  end;
end;

procedure TCustomGrid.SetShowVertLines(const Value: Boolean);
begin
  if FShowVertLines <> Value then
  begin
    FShowVertLines := Value;
    Repaint;
  end;
end;

procedure TCustomGrid.SetTopRow(const Value: Integer);
begin
  if VScrollBar <> nil then
    VScrollBar.Value := FRowHeight * Value;
end;

procedure TCustomGrid.SetShowHeader(const Value: Boolean);
begin
  if FShowHeader <> Value then
  begin
    FShowHeader := Value;
    if FHeader <> nil then
    begin
      FHeader.Visible := FShowHeader;
    end;
  end;
end;

procedure TCustomGrid.Reset;
begin
  SetFocus;
end;

{ TStringColumn }

constructor TStringColumn.Create(AOwner: TComponent);
begin
  inherited;
end;

destructor TStringColumn.Destroy;
begin
  inherited;
end;

procedure TStringColumn.UpdateColumn;
begin
  if Grid = nil then
    Exit;
  SetLength(FCells, Grid.RowCount);
  inherited;
end;

{ TStringGrid }

constructor TStringGrid.Create(AOwner: TComponent);
begin
  inherited;
  FStyleLookup := 'gridstyle';
end;

destructor TStringGrid.Destroy;
begin
  inherited;
end;

function TStringGrid.GetValue(Col, Row: Integer): Variant;
var
  C: TColumn;
begin
  C := Columns[Col];
  if C <> nil then
  begin
    if Length(TStringColumn(C).FCells) <> RowCount then
      SetLength(TStringColumn(C).FCells, RowCount);
    Result := TStringColumn(C).FCells[Row]
  end
  else
    Result := NULL;
end;

procedure TStringGrid.SetValue(Col, Row: Integer; const Value: Variant);
var
  C: TColumn;
begin
  C := Columns[Col];
  if (C <> nil) then
  begin
    if Length(TStringColumn(C).FCells) <> RowCount then
      SetLength(TStringColumn(C).FCells, RowCount);
    TStringColumn(C).FCells[Row] := VarToWideStr(Value);
    TStringColumn(C).UpdateColumn;
  end;
end;

function TStringGrid.GetCells(ACol, ARow: Integer): WideString;
begin
  Result := GetValue(ACol, ARow);
end;

procedure TStringGrid.SetCells(ACol, ARow: Integer; const Value: WideString);
begin
  SetValue(ACol, ARow, Value)
end;

procedure TCustomGrid.SetShowSelectedCell(const Value: Boolean);
begin
  if FShowSelectedCell <> Value then
  begin
    FShowSelectedCell := Value;
    UpdateSelection;
  end;
end;

initialization
  RegisterFmxClasses([TTextCell, TCheckCell, TProgressCell, TPopupCell, TStringColumn,
    TGrid, TStringGrid, THeader, THeaderItem, TColumn, TCheckColumn, TProgressColumn,
    TPopupColumn, TImageColumn]);
end.
