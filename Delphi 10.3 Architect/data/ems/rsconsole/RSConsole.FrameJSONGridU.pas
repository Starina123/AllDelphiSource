{*******************************************************}
{                                                       }
{           CodeGear Delphi Runtime Library             }
{ Copyright(c) 2014-2019 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}
unit RSConsole.FrameJSONGridU;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  System.Rtti, FMX.Layouts, FMX.Grid, REST.Response.Adapter, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, System.JSON, FMX.TabControl,
  REST.Client, Data.Bind.EngExt, FMX.Bind.DBEngExt, FMX.Bind.Grid,
  System.Bindings.Outputs, FMX.Bind.Editors, Data.Bind.Components,
  Data.Bind.Grid, Data.Bind.DBScope, RSConsole.Types,
  System.Generics.Collections, FMX.Controls.Presentation,
  RSConsole.FrameAdd, FMX.Edit, FMX.ListBox, FMX.Grid.Style, FMX.ScrollBox,
  FMX.Effects, FMX.Filter.Effects, FMX.Objects, FMX.Menus;

type
  TFrameJSONGrid = class(TFrame)
    StringGrid: TStringGrid;
    BindSourceDB: TBindSourceDB;
    BindingsList: TBindingsList;
    FDMemTable: TFDMemTable;
    RESTResponseDataSetAdapter: TRESTResponseDataSetAdapter;
    LinkGridToDataSourceBindSourceDB: TLinkGridToDataSource;
    DoneButton: TSpeedButton;
    CancelButton: TSpeedButton;
    RefreshButton: TSpeedButton;
    EditModeButton: TSpeedButton;
    AddItemButton: TSpeedButton;
    DeleteButton: TSpeedButton;
    LayoutExtras: TLayout;
    LabelExtras: TLabel;
    ComboBoxExtras: TComboBox;
    EditSelectedButton: TSpeedButton;
    NoEditingGPL: TGridPanelLayout;
    Layout1: TLayout;
    Layout2: TLayout;
    Layout3: TLayout;
    Layout4: TLayout;
    Layout5: TLayout;
    EditingLayoutA: TLayout;
    EditingLayoutB: TLayout;
    ToolBar1: TToolBar;
    MenuButton: TButton;
    ToolBar2: TToolBar;
    Image2: TImage;
    MenuFillRGBEffect: TFillRGBEffect;
    Label2: TLabel;
    Image1: TImage;
    RefreshFillRGBEffect: TFillRGBEffect;
    Label1: TLabel;
    Image3: TImage;
    EditFillRGBEffect: TFillRGBEffect;
    Image4: TImage;
    EditSelFillRGBEffect: TFillRGBEffect;
    Label3: TLabel;
    Label4: TLabel;
    Image5: TImage;
    AddFillRGBEffect: TFillRGBEffect;
    Label5: TLabel;
    Image6: TImage;
    DeleteFillRGBEffect: TFillRGBEffect;
    Image7: TImage;
    DoneFillRGBEffect: TFillRGBEffect;
    Label6: TLabel;
    Image8: TImage;
    CancelFillRGBEffect: TFillRGBEffect;
    Label7: TLabel;
    PopupMenu: TPopupMenu;
    RefreshMT: TMenuItem;
    EditMT: TMenuItem;
    EditSelectedMT: TMenuItem;
    AddMT: TMenuItem;
    DeleteMT: TMenuItem;
    UpdateMT: TMenuItem;
    CancelMT: TMenuItem;
    EditingLayout: TLayout;
    procedure RESTResponseDataSetAdapterBeforeOpenDataSet(Sender: TObject);
    procedure StringGridHeaderClick(Column: TColumn);
    procedure StringGridColumnMoved(Column: TColumn;
      FromIndex, ToIndex: Integer);
    procedure RefreshButtonClick(Sender: TObject);
    procedure EditModeButtonClick(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
    procedure DoneButtonClick(Sender: TObject);
    procedure StringGridEditingDone(Sender: TObject; const Col, Row: Integer);
    procedure DeleteButtonClick(Sender: TObject);
    procedure AddItemButtonClick(Sender: TObject);
    procedure ComboBoxExtrasChange(Sender: TObject);
    procedure EditSelectedButtonClick(Sender: TObject);
    procedure StringGridCellDblClick(const Column: TColumn; const Row: Integer);
    procedure MenuButtonClick(Sender: TObject);
  public type
    TGetJSONArrayEvent = procedure(Sender: TObject; const AJSON: TJSONArray)
      of object;
  private
    FEditing: Boolean;
    FDataModified: TDictionary<string, TList<TCell>>;
    FWidths: TDictionary<string, Single>;
    FColumnsReadOnly: TList<Integer>;
    FOnGetData: TGetJSONArrayEvent;
    FOnGetFields: TGetJSONArrayEvent;
    // FOnEdit: TNotifyEvent;
    procedure RestoreGridLayout;
    procedure SaveGridLayout;
    procedure ShowAddFrame(ADialogType: string = '');
    function GetTabItem: TTabItem;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    property OnGetData: TGetJSONArrayEvent read FOnGetData write FOnGetData;
    property OnGetFields: TGetJSONArrayEvent read FOnGetFields
      write FOnGetFields;
    // property OnEdit: TNotifyEvent read FOnEdit write FOnEdit;
    property ColumnsReadOnly: TList<Integer> read FColumnsReadOnly
      write FColumnsReadOnly;
    property Editing: Boolean read FEditing write FEditing;
    property DataModified: TDictionary<string, TList<TCell>>
      read FDataModified write FDataModified;
    procedure Refresh;
    procedure UpdateStyle(const AStyle: string);
    procedure SetEditingStatus(AEnabled: Boolean);
  end;

  // TODO: Move this class into a REST unit.
  TAdapterJSONValue = class(TInterfacedObject, IRESTResponseJSON)
  private
    FJSONValue: TJSONValue;
  protected
    { IRESTResponseJSON }
    procedure AddJSONChangedEvent(const ANotify: TNotifyEvent);
    procedure RemoveJSONChangedEvent(const ANotify: TNotifyEvent);
    procedure GetJSONResponse(out AJSONValue: TJSONValue;
      out AHasOwner: Boolean);
    function HasJSONResponse: Boolean;
    function HasResponseContent: Boolean;
  public
    constructor Create(const AJSONValue: TJSONValue);
    destructor Destroy; override;
  end;

implementation

uses RSConsole.Form, RSConsole.TypesViews,
  RSConsole.DlgModifyU, RSConsole.Consts,
  RSConsole.ModuleBackend;

{$R *.fmx}
{ TFrame1 }

// procedure TFrameJSONGrid.ButtonEditClick(Sender: TObject);
// begin
// if BindSourceDB.DataSet.RecNo > 0 then
// if Assigned(FOnEdit) then
// FOnEdit(Self);
// end;

procedure TFrameJSONGrid.UpdateStyle(const AStyle: string);
begin

  if AStyle = strDarkStyle then
  begin
    MenuFillRGBEffect.Enabled := False;
    RefreshFillRGBEffect.Enabled := False;
    EditFillRGBEffect.Enabled := False;
    EditSelFillRGBEffect.Enabled := False;
    AddFillRGBEffect.Enabled := False;
    DeleteFillRGBEffect.Enabled := False;
    DoneFillRGBEffect.Enabled := False;
    CancelFillRGBEffect.Enabled := False;
  end
  else if (AStyle = strLightStyle) or (AStyle = '') then
  begin
    MenuFillRGBEffect.Enabled := True;
    RefreshFillRGBEffect.Enabled := True;
    EditFillRGBEffect.Enabled := True;
    EditSelFillRGBEffect.Enabled := True;
    AddFillRGBEffect.Enabled := True;
    DeleteFillRGBEffect.Enabled := True;
    DoneFillRGBEffect.Enabled := True;
    CancelFillRGBEffect.Enabled := True;
  end;
end;


procedure TFrameJSONGrid.AddItemButtonClick(Sender: TObject);
begin
  AddItemButton.IsPressed := False;
  if BackendDM.EMSProvider.BaseURL <> '' then
    ShowAddFrame(cAddTab)
  else
    raise Exception.Create(strURLBlank);
end;

procedure TFrameJSONGrid.SetEditingStatus(AEnabled: Boolean);
begin
  RefreshMT.Enabled := not AEnabled;
  EditMT.Enabled := not AEnabled;
  EditSelectedMT.Enabled := not AEnabled;
  AddMT.Enabled := not AEnabled;
  DeleteMT.Enabled := not AEnabled;
  UpdateMT.Enabled := AEnabled;
  CancelMT.Enabled := AEnabled;
end;

procedure TFrameJSONGrid.CancelButtonClick(Sender: TObject);
begin
  TMainForm(root).ViewsFrame.EnableTabs;
  FEditing := False;
  StringGrid.ReadOnly := True;
  StringGrid.Options := StringGrid.Options + [TGridOption.RowSelect] -
    [TGridOption.Editing];
  NoEditingGPL.Enabled := True;
  EditingLayout.Enabled := False;
  SetEditingStatus(False);
  EditModeButton.IsPressed := False;
  if FDataModified <> nil then
    FDataModified.Clear;
  Refresh;
end;

procedure TFrameJSONGrid.ComboBoxExtrasChange(Sender: TObject);
begin
  Refresh;
end;

constructor TFrameJSONGrid.Create(AOwner: TComponent);
begin
  inherited;
  ToolBar2.Visible := False;
  FWidths := TDictionary<string, Single>.Create;
  FColumnsReadOnly := TList<Integer>.Create;
end;

procedure TFrameJSONGrid.DeleteButtonClick(Sender: TObject);
var
  LTabItem: TEMSTabItem;
  ButtonSelected: Integer;
begin
  if not FEditing and (StringGrid.Selected >= 0) and (StringGrid.RowCount > 0) then
  begin
    LTabItem := TEMSTabItem(GetTabItem);
    ButtonSelected := MessageDlg(strDeleteItem + LTabItem.GetObjectIdentifier
      (StringGrid.Selected), TMsgDlgType.mtWarning,
      [TMsgDlgBtn.mbYes, TMsgDlgBtn.mbNo], 0);
    if ButtonSelected = mrYes then
      if LTabItem.Delete(LTabItem.GetObjectIdentifier(StringGrid.Selected)) then
        Refresh;
  end;
end;

destructor TFrameJSONGrid.Destroy;
begin
  FWidths.Free;
  FColumnsReadOnly.Free;
  inherited;
end;

procedure TFrameJSONGrid.DoneButtonClick(Sender: TObject);
var
  LArray: TArray<TPair<string, TList<TCell>>>;
  I: Integer;
  LTabItem: TEMSTabItem;
begin
  LTabItem := TEMSTabItem(GetTabItem);
  try
    LArray := FDataModified.ToArray;
    for I := Low(LArray) to High(LArray) do
      LTabItem.UpdateView(LArray[I].Key, LArray[I].Value)
  finally
    CancelButtonClick(Self);
  end;
end;

procedure TFrameJSONGrid.EditModeButtonClick(Sender: TObject);
begin
  EditModeButton.IsPressed := False;
  if not FEditing and (StringGrid.Selected >= 0) then
    if (BackendDM.EMSProvider.BaseURL <> '') then
    begin
      FEditing := True;
      StringGrid.ReadOnly := False;
      StringGrid.Options := StringGrid.Options - [TGridOption.RowSelect] +
        [TGridOption.Editing];
      FDataModified := TDictionary<string, TList<TCell>>.Create;
      NoEditingGPL.Enabled := False;
      EditingLayout.Enabled := True;
      SetEditingStatus(True);
      TMainForm(root).ViewsFrame.DisableTabs(TEMSTabItem(GetTabItem));
    end
    else
      raise Exception.Create(strURLBlank);
end;

function TFrameJSONGrid.GetTabItem: TTabItem;
begin
  Result := TTabItem(Parent.Parent);
end;

procedure TFrameJSONGrid.MenuButtonClick(Sender: TObject);
var
  LP: TPointF;
begin
  LP.X := 0;
  LP.Y := 0;
  LP := MenuButton.LocalToAbsolute(LP);
  LP := MainForm.ClientToScreen(LP);
  PopupMenu.Popup(LP.X, LP.Y+MenuButton.Height);
end;

procedure TFrameJSONGrid.SaveGridLayout;
var
  I: Integer;
  LColumn: TColumn;
begin
  for I := 0 to StringGrid.ColumnCount - 1 do
  begin
    LColumn := StringGrid.Columns[I];
    FWidths.AddOrSetValue(LColumn.Header, LColumn.Width);
    if LColumn.ReadOnly then
      FColumnsReadOnly.Add(I);
  end;
end;

procedure TFrameJSONGrid.ShowAddFrame(ADialogType: string = '');
var
  LFormAddDialog: TFormAddDlg;
  LTabItem: TEMSTabItem;
  LOpenModal: Boolean;
begin
  LOpenModal := True;
  LTabItem := TEMSTabItem(GetTabItem);
  if not FEditing and Assigned(StringGrid) then
  begin
    LFormAddDialog := TFormAddDlg.Create(Self.Owner, LTabItem.EMSConsoleData);
    try
      if ADialogType <> cAddTab then
        if StringGrid.Selected >= 0 then
          LTabItem.SetObjectInfoToAddDlg(LFormAddDialog)
        else
          LOpenModal := False
      else
      begin
        LTabItem.ShowFrame(LFormAddDialog);
        LFormAddDialog.Caption := cAdd;
      end;
      if LOpenModal then
        if LFormAddDialog.ShowModal = mrOk then
          Refresh;
      // Needs to show message if adding failed
    finally
      LFormAddDialog.Free;
    end;
  end;
end;

procedure TFrameJSONGrid.EditSelectedButtonClick(Sender: TObject);
begin
  ShowAddFrame;
end;

procedure TFrameJSONGrid.StringGridCellDblClick(const Column: TColumn;
  const Row: Integer);
begin
  ShowAddFrame;
end;

procedure TFrameJSONGrid.StringGridColumnMoved(Column: TColumn;
  FromIndex, ToIndex: Integer);
begin
  //
end;

procedure TFrameJSONGrid.StringGridEditingDone(Sender: TObject;
  const Col, Row: Integer);
var
  LCell: TCell;
  LCellList: TList<TCell>;
  LIdentifier: string;
  LTabItem: TEMSTabItem;
begin
  LTabItem := TEMSTabItem(GetTabItem);
  LCell.Col := Col;
  LCell.Row := Row;
  LIdentifier := LTabItem.GetObjectIdentifier(Row);
  if FDataModified.ContainsKey(LIdentifier) then
  begin
    LCellList := FDataModified.Items[LIdentifier];
    FDataModified.Remove(LIdentifier);
    if not LCellList.Contains(LCell) then
      LCellList.Add(LCell);
    FDataModified.Add(LIdentifier, LCellList);
  end
  else
  begin
    LCellList := TList<TCell>.Create;
    LCellList.Add(LCell);
    FDataModified.Add(LIdentifier, LCellList);
  end;
end;

procedure TFrameJSONGrid.StringGridHeaderClick(Column: TColumn);
begin
  // TODO: Sort
end;

procedure TFrameJSONGrid.RestoreGridLayout;
var
  I: Integer;
  LColumn: TColumn;
  LWidth: Single;
begin
  for I := 0 to StringGrid.ColumnCount - 1 do
  begin
    LColumn := StringGrid.Columns[I];
    if not FWidths.TryGetValue(LColumn.Header, LWidth) then
      LWidth := 200;
    LColumn.Width := LWidth;
    if FColumnsReadOnly.Contains(I) then
      LColumn.ReadOnly := True;
  end;
end;

procedure TFrameJSONGrid.RESTResponseDataSetAdapterBeforeOpenDataSet
  (Sender: TObject);
var
  LJSON: TJSONArray;
  LAdapter: TRESTResponseDataSetAdapter;
  LValue: TJSONValue;
begin
  if not BackendDM.Closing then
  begin
    LAdapter := Sender as TRESTResponseDataSetAdapter;
    if Assigned(FOnGetFields) then
    begin
      LJSON := TJSONArray.Create;
      try
        FOnGetFields(Self, LJSON);
        if LJSON <> nil then
        begin
          LAdapter.DataSet.FieldDefs.Clear;
          for LValue in LJSON do
          begin
            LAdapter.DataSet.FieldDefs.Add(LValue.GetValue<string>('name'),
              TFieldType.ftWideString, 200);
          end;
        end;
      finally
        LJSON.Free;
      end;
    end;
  end;
end;

procedure TFrameJSONGrid.Refresh;
var
  LJSON: TJSONArray;
begin
  if not BackendDM.Closing then
  begin
    SaveGridLayout;
    RESTResponseDataSetAdapter.Active := False;
    if Assigned(FOnGetData) then
    begin
      LJSON := TJSONArray.Create;
      FOnGetData(Self, LJSON);
      if LJSON <> nil then
      begin
        RESTResponseDataSetAdapter.ResponseJSON :=
          TAdapterJSONValue.Create(LJSON);
        StringGrid.BeginUpdate;
        try
          RESTResponseDataSetAdapter.Active := True;
          RestoreGridLayout;
        finally
          StringGrid.EndUpdate;
        end;
      end;
    end;
  end;
end;

procedure TFrameJSONGrid.RefreshButtonClick(Sender: TObject);
begin
  RefreshButton.IsPressed := False;
  Refresh;
end;

{ TAdapterJSONValue }

procedure TAdapterJSONValue.AddJSONChangedEvent(const ANotify: TNotifyEvent);
begin
  // Not implemented because we pass JSON in constructor and do not change it
end;

constructor TAdapterJSONValue.Create(const AJSONValue: TJSONValue);
begin
  FJSONValue := AJSONValue;
end;

destructor TAdapterJSONValue.Destroy;
begin
  // We own the JSONValue, so free it.
  FJSONValue.Free;
  inherited;
end;

procedure TAdapterJSONValue.GetJSONResponse(out AJSONValue: TJSONValue;
  out AHasOwner: Boolean);
begin
  AJSONValue := FJSONValue;
  AHasOwner := True; // We own this object
end;

function TAdapterJSONValue.HasJSONResponse: Boolean;
begin
  Result := FJSONValue <> nil;
end;

function TAdapterJSONValue.HasResponseContent: Boolean;
begin
  Result := FJSONValue <> nil;
end;

procedure TAdapterJSONValue.RemoveJSONChangedEvent(const ANotify: TNotifyEvent);
begin
  // Not implemented because we pass JSON in constructor and do not change it
end;

end.
