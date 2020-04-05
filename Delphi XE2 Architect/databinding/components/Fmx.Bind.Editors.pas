{*******************************************************}
{                                                       }
{             Delphi LiveBindings Framework             }
{                                                       }
{ Copyright(c) 2011 Embarcadero Technologies, Inc.      }
{                                                       }
{*******************************************************}

{$HPPEMIT '#pragma link "Fmx.Bind.Editors"'}    {Do not Localize}
unit Fmx.Bind.Editors;

interface

uses
  System.Classes, System.Bindings.EvalProtocol, Data.Bind.Components, Data.Bind.Editors, System.Bindings.ObjEval,
    FMX.ListBox, FMX.Grid, FMX.Controls, FMX.Types;

type
  TBindStateCheckBoxEditor = class(TBindCheckBoxEditor)
  private
    FCheckBox: TCheckBox;
  public
    constructor Create(ACheckBox: TCheckBox);
    function GetState: TBindCheckBoxState; override;
    procedure SetState(Value: TBindCheckBoxState); override;
    function GetAllowGrayed: Boolean; override;
    procedure SetAllowGrayed(Value: Boolean); override;
  end;

  TBindListListBoxEditor = class(TBindListEditor)
  private
    FIndex: Integer;
    FListBox: TCustomListBox;
  public
    constructor Create(AListBox: TCustomListBox);
    destructor Destroy; override;
    procedure BeginUpdate; override;
    procedure EndUpdate; override;
    procedure DeleteToEnd; override;
    function AddItem(Select: Boolean): IScope; override;
    function InsertItem(Select: Boolean): IScope; override;
    function CanInsertItem: Boolean; override;
    function MoveNext: Boolean; override;
    function GetRowCount: Integer; override;
    function CurrentItem: IScope; override;
    procedure ClearList; override;
    function GetSelectedText: string; override;
    procedure SetSelectedText(const AValue: string); override;
    function GetSelectedItem: TObject; override;
  end;



  TBindListComboBoxEditor = class(TBindListEditor)
  private
    FIndex: Integer;
    FComboBox: TCustomComboBox;
  protected
    procedure BeginUpdate; override;
    procedure EndUpdate; override;
    procedure DeleteToEnd; override;
    function AddItem(Select: Boolean): IScope; override;
    function InsertItem(Select: Boolean): IScope; override;
    function CanInsertItem: Boolean; override;
    function MoveNext: Boolean; override;
    function GetRowCount: Integer; override;
    function CurrentItem: IScope; override;
    procedure ClearList; override;
    function GetSelectedText: string; override;
    function GetSelectedItem: TObject; override;
    procedure SetSelectedText(const AValue: string); override;
  public
    constructor Create(AComboBox: TCustomComboBox);
    destructor Destroy; override;
  end;

  TBaseListBoxItemEditorObject = class
  protected
    FIndex: Integer;
    function GetControlItems: TStrings; virtual; abstract;
    function GetControlItemIndex: Integer; virtual; abstract;
    procedure SetControlItemIndex(AIndex: Integer); virtual; abstract;
    procedure ControlClear; virtual; abstract;
  public
    property ControlItems: TStrings read GetControlItems;
    property ControlItemIndex: Integer read GetControlItemIndex write SetControlItemIndex;
  end;


  TStringGridItemEditorObject = class
  private
    FStringGrid: TStringGrid;
    FIndex: Integer;
    function GetOwner: TStringGrid;
    function GetCells(ACol: Integer): string;
    procedure SetCells(ACol: Integer; const Value: string);
  public
    property Owner: TStringGrid read GetOwner;
    property Cells[ACol: Integer]: string read GetCells write SetCells;
  end;

  TGridItemEditorObject = class
  private
    FGrid: TGrid;
    FIndex: Integer;
    function GetOwner: TGrid;
    function GetCells(ACol: Integer): string;
    procedure SetCells(ACol: Integer; const Value: string);
  public
    property Owner: TGrid read GetOwner;
    property Cells[ACol: Integer]: string read GetCells write SetCells;
  end;

  TBindListStringGridEditor = class(TBindGridEditor)
  private
    FEditorObject: TStringGridItemEditorObject;
    function IsEmpty: Boolean;
    function GetFixedRows: Integer;
    function GetFixedCols: Integer;
    function GetRowIndex: Integer;
    function GetColumnIndex: Integer;
  protected
    procedure BeginUpdate; override;
    procedure EndUpdate; override;
    function AddItem(Select: Boolean): IScope; override;
    function InsertItem(Select: Boolean): IScope; override;
    function CanInsertItem: Boolean; override;
    function CurrentItem: IScope; override;
    function GetRowCount: Integer; override;
    function MoveNext: Boolean; override;
    procedure DeleteToEnd; override;
    procedure ClearList; override;
    function GetSelectedText: string; override;
    procedure SetSelectedText(const AValue: string); override;
    procedure GetColumnNames(ANames: TStrings); override;
    procedure GetColumnIndices(ANames: TStrings); override;
  public
    constructor Create(AGrid: TStringGrid);
    destructor Destroy; override;
  end;


  TBindListGridEditor = class(TBindGridEditor)
  private
    FEditorObject: TGridItemEditorObject;
    function IsEmpty: Boolean;
    function GetFixedRows: Integer;
    function GetFixedCols: Integer;
    function GetRowIndex: Integer;
    function GetColumnIndex: Integer;
  protected
    procedure BeginUpdate; override;
    procedure EndUpdate; override;
    function AddItem(Select: Boolean): IScope; override;
    function InsertItem(Select: Boolean): IScope; override;
    function CanInsertItem: Boolean; override;
    function CurrentItem: IScope; override;
    function GetRowCount: Integer; override;
    function MoveNext: Boolean; override;
    procedure DeleteToEnd; override;
    procedure ClearList; override;
    function GetSelectedText: string; override;
    procedure SetSelectedText(const AValue: string); override;
    procedure GetColumnNames(ANames: TStrings); override;
    procedure GetColumnIndices(ANames: TStrings); override;
  public
    constructor Create(AGrid: TGrid);
    destructor Destroy; override;
  end;


implementation

uses System.SysUtils, System.Math, FMX.Edit;

type
  TBindCheckBoxEditorFactory = class(TBindEditorFactory)
  public
    constructor Create; override;
    function Supports(AIntf: TGuid; AObject: TObject): Boolean; override;
    function CreateEditor(AIntf: TGuid;
      AObject: TObject): IInterface; override;
  end;

  TBindListBoxEditorFactory = class(TBindEditorFactory)
  public
    constructor Create; override;
    function Supports(AIntf: TGuid; AObject: TObject): Boolean; override;
    function CreateEditor(AIntf: TGuid;
      AObject: TObject): IInterface; override;
  end;

  TBindComboBoxEditorFactory = class(TBindEditorFactory)
  public
    constructor Create; override;
    function Supports(AIntf: TGuid; AObject: TObject): Boolean; override;
    function CreateEditor(AIntf: TGuid;
      AObject: TObject): IInterface; override;
  end;

  TBindComboEditEditorFactory = class(TBindEditorFactory)
  public
    constructor Create; override;
    function Supports(AIntf: TGuid; AObject: TObject): Boolean; override;
    function CreateEditor(AIntf: TGuid;
      AObject: TObject): IInterface; override;
  end;

  TBindStringGridEditorFactory = class(TBindEditorFactory)
  public
    constructor Create; override;
    function Supports(AIntf: TGuid; AObject: TObject): Boolean; override;
    function CreateEditor(AIntf: TGuid;
      AObject: TObject): IInterface; override;
  end;

  TBindGridEditorFactory = class(TBindEditorFactory)
  public
    constructor Create; override;
    function Supports(AIntf: TGuid; AObject: TObject): Boolean; override;
    function CreateEditor(AIntf: TGuid;
      AObject: TObject): IInterface; override;
  end;

  TComboEditItemEditorObject = class(TBaseListBoxItemEditorObject)
  private
    FListBox: TComboEdit;
    function GetOwner: TComboEdit;
    procedure SetText(const Value: string);
    function GetText: string;
  protected
    function GetControlItems: TStrings; override;
    function GetControlItemIndex: Integer; override;
    procedure SetControlItemIndex(AIndex: Integer); override;
    procedure ControlClear; override;
  public
    constructor Create(AListBox: TComboEdit);
    property Text: string read GetText write SetText;
    property Owner: TComboEdit read GetOwner;
  end;

  TBindListComboEditEditor = class(TBindListEditor)
  private
    FEditorObject: TBaseListBoxItemEditorObject;
  protected
    function CreateItemsEditor(
      AControl: TControl): TBaseListBoxItemEditorObject; virtual;
    procedure BeginUpdate; override;
    procedure EndUpdate; override;
    procedure DeleteToEnd; override;
    function AddItem(Select: Boolean): IScope; override;
    function InsertItem(Select: Boolean): IScope; override;
    function CanInsertItem: Boolean; override;
    function MoveNext: Boolean; override;
    function GetRowCount: Integer; override;
    function CurrentItem: IScope; override;
    procedure ClearList; override;
    function GetSelectedText: string; override;
    procedure SetSelectedText(const AValue: string); override;
  public
    constructor Create(AComboBox: TComboEdit);
    destructor Destroy; override;
  end;


{ TBindListListBoxEditor }

function TBindListListBoxEditor.AddItem(Select: Boolean): IScope;
var
  LListBoxItem: TListBoxItem;
begin
  LListBoxItem := TListBoxItem.Create(nil);
  LListBoxItem.Parent := FListBox;
  FIndex := LListBoxItem.Index;
  if Select then
    FListBox.ItemIndex := FIndex;
  Result := WrapObject(LListBoxItem);
end;

function TBindListListBoxEditor.MoveNext: Boolean;
begin
  if FListBox.Count = 0 then
    Exit(False);
  if FIndex = -1 then
  begin
    FIndex := FListBox.ItemIndex;
    if FIndex < 0 then
      FIndex := 0;
  end
  else
    FIndex := FIndex + 1;
  Result := (FIndex >= 0) and (FIndex < FListBox.Count);

end;

function TBindListListBoxEditor.GetRowCount: Integer;
begin
  Result := FListBox.Count;
end;


function TBindListListBoxEditor.CurrentItem: IScope;
begin
  if FIndex = -1 then
    FIndex := FListBox.ItemIndex;
  if (FIndex <> -1) and (FIndex < FListBox.Count) then
    Result := WrapObject(FListBox.ListItems[FIndex])
  else
    Result := nil;
end;

procedure TBindListListBoxEditor.BeginUpdate;
begin
  // BeginUpdate prevents resources from being applied
  //FEditorObject.FListBox.BeginUpdate;

end;

function TBindListListBoxEditor.CanInsertItem: Boolean;
begin
  Result := FListBox.ItemIndex <> -1;
end;

procedure TBindListListBoxEditor.ClearList;
begin
  FListBox.Clear;

end;

constructor TBindListListBoxEditor.Create(AListBox: TCustomListBox);
begin
  FListBox := AListBox;
  FIndex := -1;
end;

destructor TBindListListBoxEditor.Destroy;
begin
  inherited;
end;

procedure TBindListListBoxEditor.EndUpdate;
begin
  //FEditorObject.FListBox.EndUpdate;

end;

function TBindListListBoxEditor.GetSelectedText: string;
begin
  Result := '';
  if FListBox.ItemIndex <> -1 then
    with FListBox do
      if ItemIndex < Count then
        Result :=  ListItems[ItemIndex].Text;
end;

function TBindListListBoxEditor.InsertItem(Select: Boolean): IScope;
var
  LListBoxItem: TListBoxItem;
begin
  LListBoxItem := TListBoxItem.Create(nil);
  LListBoxItem.Parent := FListBox;
  FIndex := LListBoxItem.Index;
  if Select then
    FListBox.ItemIndex := FIndex;
  Result := WrapObject(LListBoxItem);
end;

function TBindListListBoxEditor.GetSelectedItem: TObject;
begin
  Result := nil;
  if FListBox.ItemIndex <> -1 then
    with FListBox do
      if ItemIndex < Count then
        Result :=  ListItems[ItemIndex];
end;

procedure TBindListListBoxEditor.SetSelectedText(const AValue: string);
var
  I: Integer;
begin
  for I := 0 to FListBox.Count - 1 do
    with FListBox do
      if SameText(ListItems[I].Text, AValue) then
      begin
        ItemIndex := I;
        Exit;
      end;
   FListBox.ItemIndex := -1;
end;

procedure TBindListListBoxEditor.DeleteToEnd;
begin
  if FIndex = -1 then
    FIndex := FListBox.ItemIndex;
  while FListBox.Count > Max(0, FIndex) do
    FListBox.RemoveObject(
      FListBox.ListItems[FListBox.Count-1]);
  FIndex := FListBox.Count - 1;
end;


{ TBindListComboBoxEditor }

function TBindListComboBoxEditor.AddItem(Select: Boolean): IScope;
var
  LListBoxItem: TListBoxItem;
begin
  LListBoxItem := TListBoxItem.Create(nil);
  LListBoxItem.Parent := FComboBox;
  FIndex := LListBoxItem.Index;
  if Select then
    FComboBox.ItemIndex := FIndex;
  Result := WrapObject(LListBoxItem);
end;

function TBindListComboBoxEditor.MoveNext: Boolean;
begin
  if FComboBox.Count = 0 then
    Exit(False);
  if FIndex = -1 then
  begin
    FIndex := FComboBox.ItemIndex;
    if FIndex < 0 then
      FIndex := 0;
  end
  else
    FIndex := FIndex + 1;
  Result := (FIndex >= 0) and (FIndex < FComboBox.Count);

end;

function TBindListComboBoxEditor.GetRowCount: Integer;
begin
  Result := FComboBox.Count;
end;


function TBindListComboBoxEditor.CurrentItem: IScope;
begin
  if FIndex = -1 then
    FIndex := FComboBox.ItemIndex;
  if FIndex <> -1 then
    Result := WrapObject(FComboBox.ListBox.ListItems[FIndex])
  else
    Result := nil;
end;

procedure TBindListComboBoxEditor.BeginUpdate;
begin
  // BeginUpdate prevents resources from being applied
  //FEditorObject.FListBox.BeginUpdate;

end;

function TBindListComboBoxEditor.CanInsertItem: Boolean;
begin
  Result := FComboBox.ItemIndex <> -1;
end;

procedure TBindListComboBoxEditor.ClearList;
begin
  FComboBox.Clear;

end;

constructor TBindListComboBoxEditor.Create(AComboBox: TCustomComboBox);
begin
  FComboBox := AComboBox;
  FIndex := -1;
end;

destructor TBindListComboBoxEditor.Destroy;
begin
  inherited;
end;

procedure TBindListComboBoxEditor.EndUpdate;
begin
  //FEditorObject.FListBox.EndUpdate;

end;

function TBindListComboBoxEditor.GetSelectedText: string;
begin
  Result := '';
  if FComboBox.ItemIndex <> -1 then
    with FComboBox.ListBox do
      if ItemIndex < Count then
        Result :=  ListItems[ItemIndex].Text;
end;

function TBindListComboBoxEditor.InsertItem(Select: Boolean): IScope;
var
  LListBoxItem: TListBoxItem;
begin
  LListBoxItem := TListBoxItem.Create(nil);
  LListBoxItem.Parent := FComboBox;
  FIndex := LListBoxItem.Index;
  if Select then
    FComboBox.ItemIndex := FIndex;
  //Result := WrapObject(FEditorObject);
  Result := WrapObject(LListBoxItem);
end;

function TBindListComboBoxEditor.GetSelectedItem: TObject;
begin
  Result := nil;
  if FComboBox.ItemIndex <> -1 then
    with FComboBox.ListBox do
      if ItemIndex < Count then
        Result :=  ListItems[ItemIndex];
end;

procedure TBindListComboBoxEditor.SetSelectedText(const AValue: string);
var
  I: Integer;
begin
  for I := 0 to FComboBox.Count - 1 do
    with FComboBox do
      if SameText(ListBox.ListItems[I].Text, AValue) then
      begin
        ItemIndex := I;
        Exit;
      end;
   FComboBox.ItemIndex := -1;
end;

procedure TBindListComboBoxEditor.DeleteToEnd;
begin
  if FIndex = -1 then
    FIndex := FComboBox.ItemIndex;
  while FComboBox.Count > Max(0, FIndex) do
    FComboBox.RemoveObject(
      FComboBox.ListBox.ListItems[FComboBox.Count-1]);
  FIndex := FComboBox.Count - 1;
end;


{ TBindListComboEditEditor }

function TBindListComboEditEditor.AddItem(Select: Boolean): IScope;
begin
  FEditorObject.FIndex := FEditorObject.ControlItems.Add('');
  if Select then
    FEditorObject.ControlItemIndex := FEditorObject.FIndex;
  Result := WrapObject(FEditorObject);

end;

function TBindListComboEditEditor.MoveNext: Boolean;
begin
  if FEditorObject.ControlItems.Count = 0 then
    Exit(False);
  if FEditorObject.FIndex = -1 then
  begin
    FEditorObject.FIndex := FEditorObject.ControlItemIndex;
    if FEditorObject.FIndex < 0 then
      FEditorObject.FIndex := 0;
  end
  else
    FEditorObject.FIndex := FEditorObject.FIndex + 1;
  Result := (FEditorObject.FIndex >= 0) and (FEditorObject.FIndex < FEditorObject.ControlItems.Count);
end;

function TBindListComboEditEditor.GetRowCount: Integer;
begin
  Result := FEditorObject.ControlItems.Count;
end;


function TBindListComboEditEditor.CurrentItem: IScope;
begin
  if FEditorObject.FIndex = -1 then
    FEditorObject.FIndex := FEditorObject.ControlItemIndex;
  if FEditorObject.FIndex <> -1 then
    Result := WrapObject(FEditorObject);
end;

procedure TBindListComboEditEditor.BeginUpdate;
begin
  FEditorObject.ControlItems.BeginUpdate;
end;

function TBindListComboEditEditor.CanInsertItem: Boolean;
begin
  Result := FEditorObject.ControlItemIndex <> -1;
end;

procedure TBindListComboEditEditor.ClearList;
begin
  FEditorObject.ControlClear;
  FEditorObject.FIndex := -1;

end;

constructor TBindListComboEditEditor.Create(AComboBox: TComboEdit);
begin
  FEditorObject := CreateItemsEditor(AComboBox);
  FEditorObject.FIndex := -1;
end;

destructor TBindListComboEditEditor.Destroy;
begin
  FEditorObject.Free;
  inherited;
end;

procedure TBindListComboEditEditor.EndUpdate;
begin
  FEditorObject.ControlItems.EndUpdate;

end;

function TBindListComboEditEditor.GetSelectedText: string;
begin
  Result := '';
  if FEditorObject.ControlItemIndex <> -1 then
    with FEditorObject do
      Result :=  ControlItems[ControlItemIndex];
end;

function TBindListComboEditEditor.InsertItem(Select: Boolean): IScope;
begin
  if not CanInsertItem then
    Result := nil
  else
  begin
    FEditorObject.FIndex := FEditorObject.ControlItemIndex;
    FEditorObject.ControlItems.Insert(FEditorObject.FIndex, '');
    if Select then
      FEditorObject.ControlItemIndex := FEditorObject.FIndex;
    Result := WrapObject(FEditorObject);
  end;

end;

procedure TBindListComboEditEditor.SetSelectedText(const AValue: string);
var
  I: Integer;
begin
  I := FEditorObject.ControlItems.IndexOf(AValue);
  FEditorObject.ControlItemIndex := I;
end;

procedure TBindListComboEditEditor.DeleteToEnd;
begin
  if FEditorObject.FIndex = -1 then
    FEditorObject.FIndex := FEditorObject.ControlItemIndex;
  while FEditorObject.ControlItems.Count > Max(0, FEditorObject.FIndex) do
    FEditorObject.ControlItems.Delete(FEditorObject.ControlItems.Count-1);
  FEditorObject.FIndex := FEditorObject.ControlItems.Count - 1;

end;

function TBindListComboEditEditor.CreateItemsEditor(
  AControl: TControl): TBaseListBoxItemEditorObject;
begin
  Result := TComboEditItemEditorObject.Create(AControl as TComboEdit);
end;



{ TBindListBoxEditorFactory }

constructor TBindListBoxEditorFactory.Create;
begin
  inherited;

end;

function TBindListBoxEditorFactory.CreateEditor(AIntf: TGuid;
  AObject: TObject): IInterface;
begin
  Result := TBindListListBoxEditor.Create(TCustomListBox(AObject));
end;

function TBindListBoxEditorFactory.Supports(AIntf: TGuid; AObject:
  TObject): Boolean;
begin
  Result := False;
  if AIntf = IBindListEditor then
    if AObject.InheritsFrom(TCustomListBox) then
      Result := True;
end;


{ TBindComboBoxEditorFactory }

constructor TBindComboBoxEditorFactory.Create;
begin
  inherited;

end;

function TBindComboBoxEditorFactory.CreateEditor(AIntf: TGuid;
  AObject: TObject): IInterface;
begin
  Result := TBindListComboBoxEditor.Create(TCustomComboBox(AObject));
end;

function TBindComboBoxEditorFactory.Supports(AIntf: TGuid; AObject:
  TObject): Boolean;
begin
  Result := False;
  if AIntf = IBindListEditor then
    if AObject.InheritsFrom(TCustomComboBox) then
      Result := True;
end;

{ TBindComboEditEditorFactory }

constructor TBindComboEditEditorFactory.Create;
begin
  inherited;

end;

function TBindComboEditEditorFactory.CreateEditor(AIntf: TGuid;
  AObject: TObject): IInterface;
begin
  Result := TBindListComboEditEditor.Create(TComboEdit(AObject));
end;

function TBindComboEditEditorFactory.Supports(AIntf: TGuid; AObject:
  TObject): Boolean;
begin
  Result := False;
  if AIntf = IBindListEditor then
    if AObject.InheritsFrom(TComboEdit) then
      Result := True;
end;


{ TBindStringGridEditorFactory }

constructor TBindStringGridEditorFactory.Create;
begin
  inherited;

end;

function TBindStringGridEditorFactory.CreateEditor(AIntf: TGuid;
  AObject: TObject): IInterface;
begin
  Result := TBindListStringGridEditor.Create(TStringGrid(AObject));
end;

function TBindStringGridEditorFactory.Supports(AIntf: TGuid; AObject:
  TObject): Boolean;
begin
  Result := False;
  if AIntf = IBindListEditor then
    if (AObject <> nil) and AObject.InheritsFrom(TStringGrid) then
      Result := True;
end;

{ TBindGridEditorFactory }

constructor TBindGridEditorFactory.Create;
begin
  inherited;

end;

function TBindGridEditorFactory.CreateEditor(AIntf: TGuid;
  AObject: TObject): IInterface;
begin
  Result := TBindListGridEditor.Create(TGrid(AObject));
end;

function TBindGridEditorFactory.Supports(AIntf: TGuid; AObject:
  TObject): Boolean;
begin
  Result := False;
  if AIntf = IBindListEditor then
    if (AObject <> nil) and AObject.InheritsFrom(TGrid) then
      Result := True;
end;

{ TBindListStringGridEditor }

function TBindListStringGridEditor.AddItem(Select: Boolean): IScope;
begin
//  if IsEmpty then
//  begin
//    // Assume first row is empty and use it
//  end
//  else
    FEditorObject.FStringGrid.RowCount := FEditorObject.FStringGrid.RowCount + 1;
  FEditorObject.FIndex := FEditorObject.FStringGrid.RowCount - 1;
  if Select then
    FEditorObject.FStringGrid.Selected := FEditorObject.FIndex;
  Result := WrapObject(FEditorObject);
end;

function TBindListStringGridEditor.GetFixedRows: Integer;
begin
  Result := 0;
end;

function TBindListStringGridEditor.GetFixedCols: Integer;
begin
  Result := 0;
end;

function TBindListStringGridEditor.GetRowIndex: Integer;
begin
  if FEditorObject.FStringGrid.Selected >= FEditorObject.FStringGrid.RowCount then
    Result := FEditorObject.FStringGrid.RowCount - 1
  else
    Result := FEditorObject.FStringGrid.Selected;
end;

function TBindListStringGridEditor.GetColumnIndex: Integer;
begin
  Result := FEditorObject.FStringGrid.ColumnIndex;
end;

procedure TBindListStringGridEditor.GetColumnIndices(ANames: TStrings);
var
  I: Integer;
begin
  for I := 0 to FEditorObject.FStringGrid.ColumnCount - 1 do
    ANames.Add(IntToStr(I));
end;

procedure TBindListStringGridEditor.GetColumnNames(ANames: TStrings);
var
  I: Integer;
begin
  for I := 0 to FEditorObject.FStringGrid.ColumnCount - 1 do
    ANames.Add(FEditorObject.FStringGrid.Columns[I].Name);
end;

function TBindListStringGridEditor.CurrentItem: IScope;
begin
  //FEditorObject.FIndex := FEditorObject.FStringGrid.Row;
  if FEditorObject.FIndex = -1 then
    FEditorObject.FIndex := GetRowIndex;
  Result := WrapObject(FEditorObject);
end;

procedure TBindListStringGridEditor.BeginUpdate;
begin
  FEditorObject.FStringGrid.BeginUpdate;
end;

function TBindListStringGridEditor.CanInsertItem: Boolean;
begin
  Result := False; // Not supported
end;

procedure TBindListStringGridEditor.ClearList;
begin
  FEditorObject.FIndex := -1;
  if GetFixedRows > 0 then
  begin
    FEditorObject.FStringGrid.RowCount := GetFixedRows + 1;
  end
  else
    FEditorObject.FStringGrid.RowCount := 0;
end;

constructor TBindListStringGridEditor.Create(AGrid: TStringGrid);
begin
  FEditorObject := TStringGridItemEditorObject.Create;
  FEditorObject.FStringGrid := AGrid;
  FEditorObject.FIndex := -1;
end;

procedure TBindListStringGridEditor.DeleteToEnd;
begin
  if FEditorObject.FIndex = -1 then
    FEditorObject.FIndex := GetRowIndex;
  if (FEditorObject.FIndex = -1) or (FEditorObject.FIndex = GetFixedRows) then
    ClearList
  else
    FEditorObject.FStringGrid.RowCount := FEditorObject.FIndex;
end;

destructor TBindListStringGridEditor.Destroy;
begin
  FEditorObject.Free;
  inherited;
end;

procedure TBindListStringGridEditor.EndUpdate;
begin
  FEditorObject.FStringGrid.EndUpdate;
end;

function TBindListStringGridEditor.InsertItem(Select: Boolean): IScope;
begin
  Result := nil;
end;

function TBindListStringGridEditor.IsEmpty: Boolean;
begin
  Result := (FEditorObject.FStringGrid.RowCount = GetFixedRows + 1)
end;

function TBindListStringGridEditor.GetRowCount: Integer;
begin
  if IsEmpty then
    Result := 0
  else
    Result := FEditorObject.FStringGrid.RowCount - GetFixedRows;
end;

function TBindListStringGridEditor.GetSelectedText: string;
begin
  Result := '';
  with FEditorObject do
  begin
    if GetRowIndex >= GetFixedRows then
      if GetColumnIndex >= GetFixedCols then
        Result := FStringGrid.Cells[GetColumnIndex, GetRowIndex];
  end;
end;

function TBindListStringGridEditor.MoveNext: Boolean;
begin
  if FEditorObject.FStringGrid.RowCount = 0 then
    Exit(False);
  if FEditorObject.FIndex = -1 then
    FEditorObject.FIndex :=  GetRowIndex
  else
    FEditorObject.FIndex :=  FEditorObject.FIndex + 1;
  Result := FEditorObject.FIndex < FEditorObject.FStringGrid.RowCount;
end;

procedure TBindListStringGridEditor.SetSelectedText(const AValue: string);
begin
  with FEditorObject.FStringGrid do
  begin
    if GetRowIndex >= GetFixedRows then
      if GetColumnIndex >= GetFixedCols then
        Cells[GetColumnIndex, GetRowIndex] := AValue;
  end;
end;

{ TStringGridItemEditorObject }

function TStringGridItemEditorObject.GetCells(ACol: Integer): string;
begin
  Result := Self.FStringGrid.Cells[ACol, FIndex];
end;

function TStringGridItemEditorObject.GetOwner: TStringGrid;
begin
  Result := FStringGrid;
end;

procedure TStringGridItemEditorObject.SetCells(ACol: Integer;
  const Value: string);
begin
  if FIndex > -1 then
    if FIndex <= Self.FStringGrid.RowCount then
      Self.FStringGrid.Cells[ACol, FIndex] := Value;
end;

{ TBindListGridEditor }

function TBindListGridEditor.AddItem(Select: Boolean): IScope;
begin
//  if IsEmpty then
//  begin
//    // Assume first row is empty and use it
//  end
//  else
    FEditorObject.FGrid.RowCount := FEditorObject.FGrid.RowCount + 1;
    FEditorObject.FGrid.ApplyStyleLookup;  // Update columns
  FEditorObject.FIndex := FEditorObject.FGrid.RowCount - 1;
  if Select then
    FEditorObject.FGrid.Selected := FEditorObject.FIndex;
  Result := WrapObject(FEditorObject);
end;

function TBindListGridEditor.GetFixedRows: Integer;
begin
  Result := 0;
end;

function TBindListGridEditor.GetFixedCols: Integer;
begin
  Result := 0;
end;

function TBindListGridEditor.GetRowIndex: Integer;
begin
  Result := FEditorObject.FGrid.Selected;
end;

function TBindListGridEditor.GetColumnIndex: Integer;
begin
  Result := FEditorObject.FGrid.ColumnIndex;
end;

procedure TBindListGridEditor.GetColumnIndices(ANames: TStrings);
var
  I: Integer;
begin
  for I := 0 to FEditorObject.FGrid.ColumnCount - 1 do
    ANames.Add(IntToStr(I));
end;

procedure TBindListGridEditor.GetColumnNames(ANames: TStrings);
var
  I: Integer;
begin
  for I := 0 to FEditorObject.FGrid.ColumnCount - 1 do
    ANames.Add(FEditorObject.FGrid.Columns[I].Name);
end;

function TBindListGridEditor.CurrentItem: IScope;
begin
  //FEditorObject.FIndex := FEditorObject.FGrid.Row;
  if FEditorObject.FIndex = -1 then
    FEditorObject.FIndex := GetRowIndex;
  Result := WrapObject(FEditorObject);
end;

procedure TBindListGridEditor.BeginUpdate;
begin
  //FEditorObject.FGrid
end;

function TBindListGridEditor.CanInsertItem: Boolean;
begin
  Result := False; // Not supported
end;

procedure TBindListGridEditor.ClearList;
begin
  FEditorObject.FIndex := -1;
  if GetFixedRows > 0 then
  begin
    FEditorObject.FGrid.RowCount := GetFixedRows + 1;
  end
  else
    FEditorObject.FGrid.RowCount := 0;
end;

constructor TBindListGridEditor.Create(AGrid: TGrid);
begin
  FEditorObject := TGridItemEditorObject.Create;
  FEditorObject.FGrid := AGrid;
  FEditorObject.FIndex := -1;
end;

procedure TBindListGridEditor.DeleteToEnd;
begin
  if FEditorObject.FIndex = -1 then
    FEditorObject.FIndex := GetRowIndex;
  if (FEditorObject.FIndex = -1) or (FEditorObject.FIndex = GetFixedRows) then
    ClearList
  else
    FEditorObject.FGrid.RowCount := FEditorObject.FIndex;
end;

destructor TBindListGridEditor.Destroy;
begin
  FEditorObject.Free;
  inherited;
end;

procedure TBindListGridEditor.EndUpdate;
begin
  //FEditorObject.FListBox.Items.EndUpdate;
end;

function TBindListGridEditor.InsertItem(Select: Boolean): IScope;
begin
  Result := nil;
end;

function TBindListGridEditor.IsEmpty: Boolean;
begin
  Result := (FEditorObject.FGrid.RowCount = GetFixedRows + 1)
end;

function TBindListGridEditor.GetRowCount: Integer;
begin
  if IsEmpty then
    Result := 0
  else
    Result := FEditorObject.FGrid.RowCount - GetFixedRows;
end;

function TBindListGridEditor.GetSelectedText: string;
var
  LColumn: TColumn;
begin
  Result := '';
  with FEditorObject do
  begin
    if GetRowIndex >= GetFixedRows then
      if GetColumnIndex >= GetFixedCols then
      begin
        LColumn := FGrid.Columns[GetColumnIndex];
        Result := LColumn.Binding['Text'];
      end;
  end;
end;

function TBindListGridEditor.MoveNext: Boolean;
begin
  if FEditorObject.FGrid.RowCount = 0 then
    Exit(False);
  if FEditorObject.FIndex = -1 then
    FEditorObject.FIndex :=  GetRowIndex
  else
    FEditorObject.FIndex :=  FEditorObject.FIndex + 1;
  Result := FEditorObject.FIndex < FEditorObject.FGrid.RowCount;
end;

procedure TBindListGridEditor.SetSelectedText(const AValue: string);
var
  LColumn: TColumn;
begin
  with FEditorObject do
  begin
    if GetRowIndex >= GetFixedRows then
      if GetColumnIndex >= GetFixedCols then
      begin
        LColumn := FGrid.Columns[GetColumnIndex];
        LColumn.Binding['Text'] := AValue;

      end;
  end;
end;

{ TGridItemEditorObject }

function TGridItemEditorObject.GetCells(ACol: Integer): string;
var
  LColumn: TColumn;
begin
  LColumn := FGrid.Columns[ACol];
  Result := LColumn.Binding['Text'];
end;

function TGridItemEditorObject.GetOwner: TGrid;
begin
  Result := FGrid;
end;

procedure TGridItemEditorObject.SetCells(ACol: Integer;
  const Value: string);
var
  LColumn: TColumn;
  LControl: TStyledControl;
begin
  LColumn := FGrid.Columns[ACol];
  LControl := LColumn.CellControlByRow(FIndex);
  if LControl <>  nil then
    LControl.Binding['Text'] := Value;
end;



{ TBindCheckBoxEditorFactory }

constructor TBindCheckBoxEditorFactory.Create;
begin
  inherited;
end;

function TBindCheckBoxEditorFactory.CreateEditor(AIntf: TGuid;
  AObject: TObject): IInterface;
begin
  Result := TBindStateCheckBoxEditor.Create(TCheckBox(AObject));
end;

function TBindCheckBoxEditorFactory.Supports(AIntf: TGuid;
  AObject: TObject): Boolean;
begin
  Result := False;
  if AIntf = IBindCheckBoxEditor then
    if AObject.InheritsFrom(TCheckBox) then
      Result := True;
end;

{ TBindStateCheckBoxEditor }

constructor TBindStateCheckBoxEditor.Create(ACheckBox: TCheckBox);
begin
  FCheckBox := ACheckBox;
end;

function TBindStateCheckBoxEditor.GetAllowGrayed: Boolean;
begin
  Result := False;                                                                              
end;

function TBindStateCheckBoxEditor.GetState: TBindCheckBoxState;
begin
                                                          
//  if GetAllowGrayed and FCheckBox.IsGrayed then
//    Result := cbGrayed
//  else
  begin
    if FCheckBox.IsChecked then
      Result := cbChecked
    else
      Result := cbUnchecked;
  end;
end;

procedure TBindStateCheckBoxEditor.SetAllowGrayed(Value: Boolean);
begin
  //Note: FMX CheckBox does not allow Grayed state
  assert(False);
end;

procedure TBindStateCheckBoxEditor.SetState(Value: TBindCheckBoxState);
begin
//  if (Value = cbGrayed) and GetAllowedGrayed then
//    FCheckBox.IsGrayed := cbGrayed
//  else
  begin
    FCheckBox.IsChecked := Value = cbChecked;
  end;
end;

{ TComboEditItemEditorObject }

procedure TComboEditItemEditorObject.ControlClear;
begin
  FListBox.Items.Clear;
end;

constructor TComboEditItemEditorObject.Create(AListBox: TComboEdit);
begin
  FListBox := AListBox;
end;

function TComboEditItemEditorObject.GetControlItemIndex: Integer;
begin
  Result := FListBox.ItemIndex;
end;

function TComboEditItemEditorObject.GetControlItems: TStrings;
begin
  Result := FListBox.Items;
end;

function TComboEditItemEditorObject.GetOwner: TComboEdit;
begin
  Result := FListBox;
end;

function TComboEditItemEditorObject.GetText: string;
begin
  Result := FListBox.Items[FIndex];

end;

procedure TComboEditItemEditorObject.SetControlItemIndex(AIndex: Integer);
begin
  FListBox.ItemIndex := AIndex;
end;

procedure TComboEditItemEditorObject.SetText(const Value: string);
begin
  FListBox.Items[FIndex] := Value;
end;


initialization
  RegisterBindEditorFactory([TBindListBoxEditorFactory, TBindComboBoxEditorFactory,
    TBindStringGridEditorFactory, TBindGridEditorFactory, TBindCheckBoxEditorFactory,
    TBindComboEditEditorFactory]);
finalization
  UnregisterBindEditorFactory([TBindListBoxEditorFactory, TBindComboBoxEditorFactory,
    TBindStringGridEditorFactory, TBindGridEditorFactory, TBindCheckBoxEditorFactory,
    TBindComboEditEditorFactory]);
end.
