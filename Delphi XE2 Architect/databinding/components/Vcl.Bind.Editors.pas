{*******************************************************}
{                                                       }
{             Delphi LiveBindings Framework             }
{                                                       }
{ Copyright(c) 2011 Embarcadero Technologies, Inc.      }
{                                                       }
{*******************************************************}

{$HPPEMIT '#pragma link "Vcl.Bind.Editors"'}    {Do not Localize}
unit Vcl.Bind.Editors;

interface

uses
  System.Classes, System.Bindings.EvalProtocol, Data.Bind.Components, Data.Bind.Editors, Vcl.StdCtrls, System.Bindings.ObjEval, Vcl.ComCtrls, Vcl.Grids,
  Vcl.Controls;

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

  TListBoxItemEditorObject = class(TBaseListBoxItemEditorObject)
  private
    FListBox: TCustomListBox;
    function GetOwner: TCustomListBox;
    procedure SetText(const Value: string);
    function GetText: string;
  protected
    function GetControlItems: TStrings; override;
    function GetControlItemIndex: Integer; override;
    procedure SetControlItemIndex(AIndex: Integer); override;
    procedure ControlClear; override;
  public
    constructor Create(AListBox: TCustomListBox);
    property Text: string read GetText write SetText;
    property Owner: TCustomListBox read GetOwner;
  end;

  TComboBoxItemEditorObject = class(TBaseListBoxItemEditorObject)
  private
    FComboBox: TCustomComboBox;
    function GetOwner: TCustomComboBox;
    procedure SetText(const Value: string);
    function GetText: string;
  protected
    function GetControlItems: TStrings; override;
    function GetControlItemIndex: Integer; override;
    procedure SetControlItemIndex(AIndex: Integer); override;
    procedure ControlClear; override;
  public
    constructor Create(AComboBox: TCustomComboBox);
    property Text: string read GetText write SetText;
    property Owner: TCustomComboBox read GetOwner;
  end;

  TBaseBindListListBoxEditor = class(TBindListEditor)
  private
    FEditorObject: TBaseListBoxItemEditorObject;
  protected
    function CreateItemsEditor(AControl: TControl): TBaseListBoxItemEditorObject; virtual; abstract;
  public
    constructor Create(AControl: TControl);
    destructor Destroy; override;
    procedure BeginUpdate; override;
    procedure EndUpdate; override;
    function AddItem(Select: Boolean = False): IScope; override;
    function InsertItem(Select: Boolean = False): IScope; override;
    function CanInsertItem: Boolean; override;
    function CurrentItem: IScope; override;
    function GetRowCount: Integer; override;
    function MoveNext: Boolean; override;
    procedure DeleteToEnd; override;
    procedure ClearList; override;
    function GetSelectedText: string; override;
    procedure SetSelectedText(const AValue: string); override;
  end;

  TBindListListBoxEditor = class(TBaseBindListListBoxEditor)
  protected
    function CreateItemsEditor(AControl: TControl): TBaseListBoxItemEditorObject; override;
  public
    constructor Create(AListBox: TCustomListBox);
  end;

  TBindListComboBoxEditor = class(TBaseBindListListBoxEditor)
  protected
    function CreateItemsEditor(AControl: TControl): TBaseListBoxItemEditorObject; override;
  public
    constructor Create(ACombobox: TCustomComboBox);
  end;

  TListViewItemEditorObject = class
  private
    FListView: TCustomListView;
    FItemIndex: Integer;
    function GetOwner: TCustomListView;
    procedure SetText(const Value: string);
    function GetText: string;
  public
    property Text: string read GetText write SetText;
    property Owner: TCustomListView read GetOwner;
  end;

  TBindListListViewEditor = class(TBindListEditor)
  private
    FEditorObject: TListViewItemEditorObject;
  public
    constructor Create(AListView: TCustomListView);
    destructor Destroy; override;
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

  TBindListStringGridEditor = class(TBindGridEditor)
  private
    FEditorObject: TStringGridItemEditorObject;
    function IsEmpty: Boolean;
  protected
    procedure BeginUpdate; override;
    procedure EndUpdate; override;
    function AddItem(Select: Boolean): IScope; override;
    function CanInsertItem: Boolean; override;
    function InsertItem(Select: Boolean): IScope; override;
    function CurrentItem: IScope; override;
    function GetRowCount: Integer; override;
    function MoveNext: Boolean; override;
    procedure DeleteToEnd; override;
    procedure ClearList; override;
    function GetSelectedText: string; override;
    procedure SetSelectedText(const AValue: string); override;
    procedure GetColumnIndices(ANames: TStrings); override;
    procedure GetColumnNames(ANames: TStrings); override;
  public
    constructor Create(AGrid: TStringGrid);
    destructor Destroy; override;
  end;



implementation

uses System.SysUtils, System.Math;

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


  TBindListViewEditorFactory = class(TBindEditorFactory)
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



{ TListBoxItemEditorObject }

procedure TListBoxItemEditorObject.ControlClear;
begin
  FListBox.Items.Clear;
end;

constructor TListBoxItemEditorObject.Create(AListBox: TCustomListBox);
begin
  FListBox := AListBox;
end;

function TListBoxItemEditorObject.GetControlItemIndex: Integer;
begin
  Result := FListBox.ItemIndex;
end;

function TListBoxItemEditorObject.GetControlItems: TStrings;
begin
  Result := FListBox.Items;
end;

function TListBoxItemEditorObject.GetOwner: TCustomListBox;
begin
  Result := FListBox;
end;

function TListBoxItemEditorObject.GetText: string;
begin
  Result := FListBox.Items[FIndex];

end;

procedure TListBoxItemEditorObject.SetControlItemIndex(AIndex: Integer);
begin
  FListBox.ItemIndex := AIndex;
end;

procedure TListBoxItemEditorObject.SetText(const Value: string);
begin
  FListBox.Items[FIndex] := Value;
end;

{ TComboBoxItemEditorObject }

procedure TComboBoxItemEditorObject.ControlClear;
begin
  FComboBox.Items.Clear;
end;

constructor TComboBoxItemEditorObject.Create(AComboBox: TCustomComboBox);
begin
  FComboBox := AComboBox;
end;

function TComboBoxItemEditorObject.GetControlItemIndex: Integer;
begin
  Result := FComboBox.ItemIndex;
end;

function TComboBoxItemEditorObject.GetControlItems: TStrings;
begin
  Result := FComboBox.Items;
end;

function TComboBoxItemEditorObject.GetOwner: TCustomComboBox;
begin
  Result := FComboBox;
end;

function TComboBoxItemEditorObject.GetText: string;
begin
  Result := FComboBox.Items[FIndex];

end;

procedure TComboBoxItemEditorObject.SetControlItemIndex(AIndex: Integer);
begin
  FComboBox.ItemIndex := AIndex;
end;

procedure TComboBoxItemEditorObject.SetText(const Value: string);
begin
  FComboBox.Items[FIndex] := Value;
end;

{ TBindListBoxItemsBoxEditor }

function TBaseBindListListBoxEditor.AddItem(Select: Boolean): IScope;
begin
  FEditorObject.FIndex := FEditorObject.ControlItems.Add('');
  if Select then
    FEditorObject.ControlItemIndex := FEditorObject.FIndex;
  Result := WrapObject(FEditorObject);
end;

function TBaseBindListListBoxEditor.InsertItem(Select: Boolean): IScope;
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

function TBaseBindListListBoxEditor.CanInsertItem: Boolean;
begin
  Result := FEditorObject.ControlItemIndex <> -1;
end;

function TBaseBindListListBoxEditor.CurrentItem: IScope;
begin
  if FEditorObject.FIndex = -1 then
    FEditorObject.FIndex := FEditorObject.ControlItemIndex;
  if FEditorObject.FIndex <> -1 then
    Result := WrapObject(FEditorObject);
end;

procedure TBaseBindListListBoxEditor.BeginUpdate;
begin
  FEditorObject.ControlItems.BeginUpdate;

end;

procedure TBaseBindListListBoxEditor.ClearList;
begin
  FEditorObject.ControlClear;
  FEditorObject.FIndex := -1;

end;

constructor TBaseBindListListBoxEditor.Create(AControl: TControl);
begin
  FEditorObject := CreateItemsEditor(AControl);
  FEditorObject.FIndex := -1;
end;

procedure TBaseBindListListBoxEditor.DeleteToEnd;
begin
  if FEditorObject.FIndex = -1 then
    FEditorObject.FIndex := FEditorObject.ControlItemIndex;
  while FEditorObject.ControlItems.Count > Max(0, FEditorObject.FIndex) do
    FEditorObject.ControlItems.Delete(FEditorObject.ControlItems.Count-1);
  FEditorObject.FIndex := FEditorObject.ControlItems.Count - 1;
end;

destructor TBaseBindListListBoxEditor.Destroy;
begin
  FEditorObject.Free;
  inherited;
end;

procedure TBaseBindListListBoxEditor.EndUpdate;
begin
  FEditorObject.ControlItems.EndUpdate;

end;

function TBaseBindListListBoxEditor.GetRowCount: Integer;
begin
  Result := FEditorObject.ControlItems.Count;
end;

function TBaseBindListListBoxEditor.GetSelectedText: string;
begin
  Result := '';
  if FEditorObject.ControlItemIndex <> -1 then
    with FEditorObject do
      Result :=  ControlItems[ControlItemIndex];
end;

function TBaseBindListListBoxEditor.MoveNext: Boolean;
begin
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

procedure TBaseBindListListBoxEditor.SetSelectedText(const AValue: string);
var
  I: Integer;
begin
  I := FEditorObject.ControlItems.IndexOf(AValue);
  FEditorObject.ControlItemIndex := I;
end;

{ TBindListListBoxEditor }


constructor TBindListListBoxEditor.Create(AListBox: TCustomListBox);
begin
  inherited Create(AListBox);
end;


{ TListViewItemEditorObject }

function TListViewItemEditorObject.GetOwner: TCustomListView;
begin
  Result := FListView;
end;

procedure TListViewItemEditorObject.SetText(const Value: string);
begin
  FListView.Items[FItemIndex].Caption := Value;
end;

function TListViewItemEditorObject.GetText: string;
begin
  Result := FListView.Items[FItemIndex].Caption;
end;


{ TBindListStringGridEditor }

function TBindListStringGridEditor.AddItem(Select: Boolean): IScope;
begin
  if IsEmpty then
  begin
    // Assume first row is empty and use it
  end
  else
    FEditorObject.FStringGrid.RowCount := FEditorObject.FStringGrid.RowCount + 1;
  FEditorObject.FIndex := FEditorObject.FStringGrid.RowCount - 1;
  if Select then
    FEditorObject.FStringGrid.Row := FEditorObject.FIndex;
  Result := WrapObject(FEditorObject);
end;

function TBindListStringGridEditor.InsertItem(Select: Boolean): IScope;
begin
  // Not supported
  Exit(nil);
end;

function TBindListStringGridEditor.CanInsertItem: Boolean;
begin
  // Not supported
  Result := False;
end;

function TBindListStringGridEditor.CurrentItem: IScope;
begin
  //FEditorObject.FIndex := FEditorObject.FStringGrid.Row;
  if FEditorObject.FIndex = -1 then
    FEditorObject.FIndex := FEditorObject.FStringGrid.Row;
  Result := WrapObject(FEditorObject);
end;

procedure TBindListStringGridEditor.BeginUpdate;
begin
  //FEditorObject.FStringGrid
end;

procedure TBindListStringGridEditor.ClearList;
begin
  FEditorObject.FIndex := -1;
  if FEditorObject.FStringGrid.FixedRows > 0 then
  begin
    FEditorObject.FStringGrid.RowCount := FEditorObject.FStringGrid.FixedRows + 1;
    FEditorObject.FStringGrid.Rows[FEditorObject.FStringGrid.FixedRows].Clear;
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
    FEditorObject.FIndex := FEditorObject.FStringGrid.Row;
  if FEditorObject.FIndex = FEditorObject.FStringGrid.FixedRows then
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
  //FEditorObject.FListBox.Items.EndUpdate;
end;

function TBindListStringGridEditor.IsEmpty: Boolean;
begin
  Result := (FEditorObject.FStringGrid.RowCount = FEditorObject.FStringGrid.FixedRows + 1)
    and (Trim(FEditorObject.FStringGrid.Rows[FEditorObject.FStringGrid.FixedRows].Text) = '');
end;

function TBindListStringGridEditor.GetRowCount: Integer;
begin
  if IsEmpty then
    Result := 0
  else
    Result := FEditorObject.FStringGrid.RowCount - FEditorObject.FStringGrid.FixedRows;
end;

function TBindListStringGridEditor.GetSelectedText: string;
begin
  Result := '';
  with FEditorObject do
  begin
    if FStringGrid.Row >= FStringGrid.FixedRows then
      if FStringGrid.Col >= FStringGrid.FixedCols then
        Result := FStringGrid.Cells[FStringGrid.Col, FStringGrid.Row];
  end;
end;

function TBindListStringGridEditor.MoveNext: Boolean;
begin
  if FEditorObject.FIndex = -1 then
    FEditorObject.FIndex :=  FEditorObject.FStringGrid.Row
  else
    FEditorObject.FIndex :=  FEditorObject.FIndex + 1;
  Result := FEditorObject.FIndex < FEditorObject.FStringGrid.RowCount;
end;

procedure TBindListStringGridEditor.SetSelectedText(const AValue: string);
begin
  with FEditorObject.FStringGrid do
  begin
    if Row >= FixedRows then
      if Col >= FixedCols then
        Cells[Col, Row] := AValue;
  end;
end;

procedure TBindListStringGridEditor.GetColumnIndices(ANames: TStrings);
var
  I: Integer;
begin
  for I := 0 to FEditorObject.FStringGrid.ColCount - 1 do
    ANames.Add(IntToStr(I));
end;

procedure TBindListStringGridEditor.GetColumnNames(ANames: TStrings);
begin
  // no Names
end;

{ TStringGridItemEditorObject }

function TStringGridItemEditorObject.GetOwner: TStringGrid;
begin
  Result := FStringGrid;
end;

function TStringGridItemEditorObject.GetCells(ACol: Integer): string;
begin
  Result := Self.FStringGrid.Cells[ACol, FIndex];
end;

procedure TStringGridItemEditorObject.SetCells(ACol: Integer;
  const Value: string);
begin
  Self.FStringGrid.Cells[ACol, FIndex] := Value;
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
    if (AObject <> nil) and (AObject.InheritsFrom(TCustomListBox)) then
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
    if (AObject <> nil) and (AObject.InheritsFrom(TCustomComboBox)) then
      Result := True;
end;


{ TBindListListViewEditor }

type
  TCustomListViewHack = class(TCustomListView);

function TBindListListViewEditor.AddItem(Select: Boolean): IScope;
var
  I: Integer;
  AListItem: TListItem;
begin
  AListItem := FEditorObject.FListView.Items.Add;
  for I := 0 to TCustomListViewHack(FEditorObject.FListView).Columns.Count do
    AListItem.SubItems.Add('');

  //Result := WrapObject(FEditorObject);
  FEditorObject.FItemIndex := AListItem.Index;
  if Select then
    FEditorObject.FListView.ItemIndex := FEditorObject.FItemIndex;
  Result := WrapObject(FEditorObject.FListView.Items[FEditorObject.FItemIndex]);
end;

function TBindListListViewEditor.CanInsertItem: Boolean;
begin
  Result := FEditorObject.FListView.ItemIndex <> -1;
end;

function TBindListListViewEditor.InsertItem(Select: Boolean): IScope;
var
  I: Integer;
  AListItem: TListItem;
begin
  if FEditorObject.FListView.ItemIndex = -1 then
    Exit(nil);

  AListItem := FEditorObject.FListView.Items.Insert(FEditorObject.FListView.ItemIndex);
  for I := 0 to TCustomListViewHack(FEditorObject.FListView).Columns.Count do
    AListItem.SubItems.Add('');

  //Result := WrapObject(FEditorObject);
  FEditorObject.FItemIndex := AListItem.Index;
  if Select then
    FEditorObject.FListView.ItemIndex := FEditorObject.FItemIndex;

  Result := WrapObject(FEditorObject.FListView.Items[FEditorObject.FItemIndex]);
end;

function TBindListListViewEditor.CurrentItem: IScope;
//var
//  I: Integer;
begin
  if FEditorObject.FItemIndex = -1 then
    FEditorObject.FItemIndex := FEditorObject.FListView.ItemIndex;

  //Result := WrapObject(FEditorObject);
  if FEditorObject.FItemIndex <> -1 then
    Result := WrapObject(FEditorObject.FListView.Items[FEditorObject.FItemIndex])
  else
    Result := nil;
end;

procedure TBindListListViewEditor.BeginUpdate;
begin
  FEditorObject.FListView.Items.BeginUpdate;

end;

procedure TBindListListViewEditor.ClearList;
begin
  FEditorObject.FListView.Clear;
  FEditorObject.FItemIndex := -1;

end;

constructor TBindListListViewEditor.Create(AListView: TCustomListView);
begin
  FEditorObject := TListViewItemEditorObject.Create;
  FEditorObject.FListView := AListView;
  FEditorObject.FItemIndex := -1;
end;

procedure TBindListListViewEditor.DeleteToEnd;
begin
  if FEditorObject.FItemIndex = -1 then
    FEditorObject.FItemIndex := FEditorObject.FListView.ItemIndex;
  while FEditorObject.FListView.Items.Count > Max(0, FEditorObject.FItemIndex) do
    FEditorObject.FListView.Items.Delete(FEditorObject.FListView.Items.Count-1);
  FEditorObject.FItemIndex := FEditorObject.FListView.Items.Count - 1;
end;

destructor TBindListListViewEditor.Destroy;
begin
  FEditorObject.Free;
  inherited;
end;

procedure TBindListListViewEditor.EndUpdate;
begin
  FEditorObject.FListView.Items.EndUpdate;

end;

function TBindListListViewEditor.GetRowCount: Integer;
begin
  Result := FEditorObject.FListView.Items.Count;
end;

function TBindListListViewEditor.GetSelectedText: string;
begin
  if FEditorObject.FListView.ItemIndex <> -1 then
    with FEditorObject.FListView do
      Result := Items[ItemIndex].Caption;
end;

function TBindListListViewEditor.MoveNext: Boolean;
begin
  if FEditorObject.FItemIndex = -1 then
  begin
    FEditorObject.FItemIndex := FEditorObject.FListView.ItemIndex;
    if FEditorObject.FItemIndex < 0 then
      FEditorObject.FItemIndex := 0;
  end
  else
    FEditorObject.FItemIndex := FEditorObject.FItemIndex + 1;
  Result := (FEditorObject.FItemIndex >= 0) and (FEditorObject.FItemIndex < FEditorObject.FListView.Items.Count);
end;

procedure TBindListListViewEditor.SetSelectedText(const AValue: string);
var
  LItem: TListItem;
begin
  LItem := FEditorObject.FListView.FindCaption(0, AValue, False, True, False);
  if LItem <> nil then
    FEditorObject.FListView.ItemIndex := LItem.Index
  else
    FEditorObject.FListView.ItemIndex := -1;
end;

{ TBindListViewEditorFactory }

constructor TBindListViewEditorFactory.Create;
begin
  inherited;

end;

function TBindListViewEditorFactory.CreateEditor(AIntf: TGuid;
  AObject: TObject): IInterface;
begin
  Result := TBindListListViewEditor.Create(TCustomListView(AObject));
end;

function TBindListViewEditorFactory.Supports(AIntf: TGuid; AObject:
  TObject): Boolean;
begin
  Result := False;
  if AIntf = IBindListEditor then
    if (AObject <> nil) and AObject.InheritsFrom(TCustomListView) then
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


//{ TBindListEditor }
//
//procedure TBindListEditor.FillList(ARecordEnumerator: IScopeRecordEnumerator;
//  AFormatProc: TFormatCallback);
//var
//  LEditor: IBindListEditor;
//  LEnumerator: IScopeRecordEnumerator;
//  LEditorScope: IScope;
//begin
//  LEditor := Self;
//  LEditor.BeginUpdate;
//  try
//    LEnumerator := ARecordEnumerator;
//    LEnumerator.First;
//    LEditor.ClearList;
//    if LEnumerator <> nil then
//    begin
//      while LEnumerator.MoveNext do
//      begin
//        LEditorScope := LEditor.AddItem;
//        Assert(LEditorScope <> nil);
//        if LEditorScope <> nil then
//        begin
//          AFormatProc(LEnumerator.Current, LEditorScope);
//        end;
//      end;
//    end
//    else
//      Assert(False);
//  finally
//    LEditor.EndUpdate;
//  end;
//
//end;
//
//procedure TBindListEditor.UpdateList(ARecordEnumerator: IScopeRecordEnumerator;
//  AFormatProc: TFormatCallback);
//var
//  LEditor: IBindListEditor;
//  LEditorScope: IScope;
//begin
//  LEditor := Self;
//
//  LEditor.BeginUpdate;
//  try
//    if ARecordEnumerator <> nil then
//    begin
//      // Update existing items
//      while LEditor.MoveNext do
//      begin
//        if ARecordEnumerator.MoveNext then
//        begin
//          LEditorScope := LEditor.CurrentItem;
//          Assert(LEditorScope <> nil);
//          if LEditorScope <> nil then
//          begin
//            AFormatProc(ARecordEnumerator.Current, LEditorScope);
//          end;
//        end
//        else
//        begin
//          Assert(True); //Debugging
//          break;
//        end;
//      end;
//      // Delete remaining items, if any
//      LEditor.DeleteToEnd;
//      // Add new items
//      while ARecordEnumerator.MoveNext do
//      begin
//        LEditorScope := LEditor.AddItem;
//        Assert(LEditorScope <> nil);
//        if LEditorScope <> nil then
//        begin
//          AFormatProc(ARecordEnumerator.Current, LEditorScope);
//        end;
//      end;
//    end
//    else
//      Assert(False);
//  finally
//    LEditor.EndUpdate;
//  end;
//end;
//
//function TBindListEditor.UpdateNeeded(
//  ARecordEnumerator: IScopeRecordEnumerator): Boolean;
//var
//  LEditor: IBindListEditor;
//  LEnumerator: IScopeRecordEnumerator;
//begin
//  LEditor := Self;
//  if ARecordEnumerator <> nil then
//    if LEditor.RowCount = ARecordEnumerator.RecordCount then
//      // Only need to do something if records added or deleted
//      Exit(False);
//  Result := True;
//end;

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
  Result := FCheckBox.AllowGrayed;
end;

function TBindStateCheckBoxEditor.GetState: TBindCheckBoxState;
begin
  if GetAllowGrayed and (FCheckBox.State = TCheckBoxState.cbGrayed) then
    Result := TBindCheckBoxState.cbGrayed
  else
  begin
    if FCheckBox.Checked then
      Result := TBindCheckBoxState.cbChecked
    else
      Result := TBindCheckBoxState.cbUnchecked;
  end;
end;

procedure TBindStateCheckBoxEditor.SetAllowGrayed(Value: Boolean);
begin
  FCheckBox.AllowGrayed := Value;
end;

procedure TBindStateCheckBoxEditor.SetState(Value: TBindCheckBoxState);
begin
  if (Value = TBindCheckBoxState.cbGrayed) and GetAllowGrayed then
    FCheckBox.State := TCheckBoxState.cbGrayed
  else
    FCheckBox.Checked := Value = TBindCheckBoxState.cbChecked;
end;

function TBindListListBoxEditor.CreateItemsEditor(
  AControl: TControl): TBaseListBoxItemEditorObject;
begin
  Result := TListBoxItemEditorObject.Create(AControl as TCustomListBox);
end;

{ TBindListComboBoxEditor }

constructor TBindListComboBoxEditor.Create(ACombobox: TCustomComboBox);
begin
  inherited Create(ACombobox);
end;

function TBindListComboBoxEditor.CreateItemsEditor(
  AControl: TControl): TBaseListBoxItemEditorObject;
begin
  Result := TComboBoxItemEditorObject.Create(AControl as TCustomComboBox);
end;

initialization
  RegisterBindEditorFactory([TBindCheckBoxEditorFactory, TBindListBoxEditorFactory,
    TBindComboBoxEditorFactory, TBindListViewEditorFactory, TBindStringGridEditorFactory]);
finalization
  UnregisterBindEditorFactory([TBindCheckBoxEditorFactory, TBindListBoxEditorFactory,
    TBindComboBoxEditorFactory, TBindListViewEditorFactory, TBindStringGridEditorFactory]);
end.
