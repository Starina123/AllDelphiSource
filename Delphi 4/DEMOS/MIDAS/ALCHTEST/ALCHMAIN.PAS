unit AlchMain;

{ Test program for Client DataSets }

interface

uses
  Windows, Sysutils, Forms, IniFiles, DBTables, ImgList, Controls, Classes,
  ActnList, Menus, Dialogs, Provider, BdeProv, DBClient, Db, ComCtrls, ToolWin,
  Grids, DBGrids, ExtCtrls, DBCtrls, StdCtrls, Buttons;
  
type
  TDBClientTest = class(TForm)

    { DB Controls }
    Database1: TDatabase;
    DetailQuery: TQuery;
    MasterQuery: TQuery;
    DetailTable: TTable;
    MasterTable: TTable;
    NestedTable: TNestedTable;
    BDEProvider: TProvider;
    DeltaSet: TClientDataSet;
    ResultSet: TClientDataSet;
    ClientData: TClientDataSet;
    DetailDataSet: TClientDataSet;
    MasterDataSource: TDataSource;
    DetailMasterSource: TDataSource;
    DetailDataSource: TDataSource;
    DetailQuerySource: TDataSource;
    DetailGrid: TDBGrid;
    MasterGrid: TDBGrid;
    DBMemo1: TDBMemo;
    DBImage1: TDBImage;

    { Actions }
    ActionList1: TActionList;
    SaveDataPacket: TAction;
    GetSavePoint: TAction;
    RevertToSavepoint: TAction;
    OpenQuery: TAction;
    OpenTable: TAction;
    ApplyUpdates: TAction;
    MergeChangeLog: TAction;
    ExitApplication: TAction;
    CloseActiveDataSet: TAction;
    LoadDataPacket: TAction;
    RequestLiveQuery: TAction;
    SparseArrays: TAction;
    ObjectView: TAction;
    EnableBCD: TAction;
    ResolveToDataSet: TAction;
    DisableProvider: TAction;
    FetchOnDemand: TAction;
    poCascadedDeletes: TAction;
    poCascadedUpdates: TAction;
    poDelayedDetails: TAction;
    poDelayedBlobs: TAction;
    poIncludeFieldProps: TAction;
    poReadOnly: TAction;
    CancelUpdates: TAction;
    LogChanges: TAction;
    ExecuteQuery: TAction;
    StreamFormOut: TAction;
    StreamFormIn: TAction;
    UndoLastEdit: TAction;
    RevertRecord: TAction;
    ClearField: TAction;
    GetNextPacket: TAction;
    SetMaxErrors: TAction;
    SetPacketRecords: TAction;
    ViewEvents: TAction;
    ClearPasswords: TAction;
    PrevQuery: TAction;
    NextQuery: TAction;
    RefreshData: TAction;
    ClearEventLog: TAction;
    IncludeNestedObject: TAction;
    DisplayDetails: TAction;
    SetRefTableName: TAction;
    HelpAbout: TAction;

    { Other Controls }
    MainMenu1: TMainMenu;
    FileReopen: TMenuItem;
    FileMenu: TMenuItem;
    PopupMenu1: TPopupMenu;
    ToolBar1: TToolBar;
    ImageList1: TImageList;
    OpenDialog: TOpenDialog;
    SaveDialog: TSaveDialog;
    StatusBar: TStatusBar;
    AreaSelector: TPageControl;
    DataSetSelector: TTabControl;
    FilterPage: TTabSheet;
    FindKeyPage: TTabSheet;
    LocatePage: TTabSheet;
    CreatePage: TTabSheet;
    IndexPage: TTabSheet;
    FieldsPage: TTabSheet;
    ProviderPage: TTabSheet;
    IndexList: TListBox;
    FieldList: TMemo;
    FieldDefList: TMemo;
    NavigatorPanel: TPanel;
    BlobCtrlPanel: TPanel;
    GridPanel: TPanel;
    DBNavigator1: TDBNavigator;
    foCaseInsensitive: TCheckBox;
    foNoPartialCompare: TCheckBox;
    idxDescending: TCheckBox;
    idxCaseInsensitive: TCheckBox;
    Filter: TEdit;
    FindFirst: TButton;
    FindNext: TButton;
    Filtered: TCheckBox;
    IndexFields: TEdit;
    KeyFieldList: TLabel;
    PrevQuery1: TSpeedButton;
    CreateDataSetDesc: TComboBox;
    Events: TListBox;
    CreateFieldList: TListBox;
    CreateFieldType: TComboBox;
    UpDown1: TUpDown;
    CreateFieldSize: TEdit;
    CreateFieldParent: TComboBox;
    CreateFieldRequired: TCheckBox;
    AddFieldButton: TButton;
    DataRows: TEdit;
    SparseArrays2: TCheckBox;
    ObjectView2: TCheckBox;
    MixedData: TCheckBox;
    DescFields: TEdit;
    CaseInsFields: TEdit;
    idxPrimary: TCheckBox;
    idxUnique: TCheckBox;
    StatusFilterBox: TGroupBox;
    DatabaseName: TComboBox;
    ModifiedRecords: TCheckBox;
    InsertedRecords: TCheckBox;
    DeletedRecords: TCheckBox;
    MasterTableName: TComboBox;
    DetailTableName: TComboBox;
    MasterSQL: TMemo;
    DetailSQL: TMemo;
    GridSplitter: TSplitter;
    TestButton1: TButton;
    ToolButton1: TToolButton;
    FindKey: TButton;
    FindNearest: TButton;
    FindValue: TEdit;
    LocateEdit: TEdit;
    KeyExclusive: TCheckBox;
    FindPartial: TCheckBox;
    LocateField: TComboBox;
    locCaseInsensitive: TCheckBox;
    locPartialKey: TCheckBox;
    LocateNull: TCheckBox;
    
    procedure FilterKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure MasterSQLKeyPress(Sender: TObject; var Key: Char);
    procedure IndexListClick(Sender: TObject);
    procedure GridTitleClick(Column: TColumn);
    procedure CreateIndexClick(Sender: TObject);
    procedure LocateButtonClick(Sender: TObject);
    procedure FindFirstClick(Sender: TObject);
    procedure FilterExit(Sender: TObject);
    procedure DataSourceDataChange(Sender: TObject; Field: TField);
    procedure DataSetSelectorChange(Sender: TObject);
    procedure ClientDataAfterOpen(DataSet: TDataSet);
    procedure LocateFieldDropDown(Sender: TObject);
    procedure DeleteIndexClick(Sender: TObject);
    procedure FindKeyClick(Sender: TObject);
    procedure SetFilterOptions(Sender: TObject);
    procedure FindNextClick(Sender: TObject);
    procedure ClientDataReconcileError(DataSet: TClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure MasterTableNameClick(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure FieldSelect(Sender: TObject);
    procedure GridColEnter(Sender: TObject);
    procedure Saveformtofile1Click(Sender: TObject);
    procedure LoadFormfromFile1Click(Sender: TObject);
    procedure LoadDatapacket1Click(Sender: TObject);
    procedure SaveDataPacketExecute(Sender: TObject);
    procedure GetSavePointExecute(Sender: TObject);
    procedure EditActionsUpdate(Sender: TObject);
    procedure RevertToSavepointExecute(Sender: TObject);
    procedure FieldsPageShow(Sender: TObject);
    procedure ClientDataAfterClose(DataSet: TDataSet);
    procedure OpenQueryExecute(Sender: TObject);
    procedure OpenTableExecute(Sender: TObject);
    procedure ApplyUpdatesExecute(Sender: TObject);
    procedure ProviderDataSetAfterOpen(DataSet: TDataSet);
    procedure MasterTableNameDropDown(Sender: TObject);
    procedure DatabaseNameDropDown(Sender: TObject);
    procedure DatabaseNameClick(Sender: TObject);
    procedure DatabaseNameKeyPress(Sender: TObject; var Key: Char);
    procedure DataSetBeforeOpen(DataSet: TDataSet);
    procedure FilteredClick(Sender: TObject);
    procedure CreateDataSetDescClick(Sender: TObject);
    procedure CreateDataSetDescKeyPress(Sender: TObject; var Key: Char);
    procedure CreateFieldListClick(Sender: TObject);
    procedure CreateClientData(Sender: TObject);
    procedure CreatePageShow(Sender: TObject);
    procedure AddFieldButtonClick(Sender: TObject);
    procedure CreateFieldParentDropDown(Sender: TObject);
    procedure MergeChangeLogExecute(Sender: TObject);
    procedure FilterPageShow(Sender: TObject);
    procedure IndexPageShow(Sender: TObject);
    procedure ExitApplicationExecute(Sender: TObject);
    procedure CloseActiveDataSetExecute(Sender: TObject);
    procedure FileActionsUpdate(Sender: TObject);
    procedure RequestLiveQueryExecute(Sender: TObject);
    procedure SparseArraysExecute(Sender: TObject);
    procedure ObjectViewExecute(Sender: TObject);
    procedure EnableBCDExecute(Sender: TObject);
    procedure StatusFilterClick(Sender: TObject);
    procedure ResolveToDataSetExecute(Sender: TObject);
    procedure FetchOnDemandExecute(Sender: TObject);
    procedure DisableProviderExecute(Sender: TObject);
    procedure MasterTableNameKeyPress(Sender: TObject; var Key: Char);
    procedure DetailTableNameClick(Sender: TObject);
    procedure MasterTableAfterOpen(DataSet: TDataSet);
    procedure MasterTableBeforeClose(DataSet: TDataSet);
    procedure GridSetFocus(Sender: TObject);
    procedure poCascadedDeletesExecute(Sender: TObject);
    procedure poCascadedUpdatesExecute(Sender: TObject);
    procedure poDelayedDetailsExecute(Sender: TObject);
    procedure poDelayedBlobsExecute(Sender: TObject);
    procedure poIncludeFieldPropsExecute(Sender: TObject);
    procedure poReadOnlyExecute(Sender: TObject);
    procedure LocatePageShow(Sender: TObject);
    procedure LocateNullClick(Sender: TObject);
    function BDEProviderDataRequest(Sender: TObject;
      Input: OleVariant): OleVariant;
    procedure BDEProviderGetData(Sender: TObject; DataSet: TClientDataSet);
    procedure BDEProviderUpdateData(Sender: TObject;
      DataSet: TClientDataSet);
    procedure BDEProviderUpdateError(Sender: TObject;
      DataSet: TClientDataSet; E: EUpdateError; UpdateKind: TUpdateKind;
      var Response: TResolverResponse);
    procedure ClientDataAfterScroll(DataSet: TDataSet);
    procedure ClientDataBeforeCancel(DataSet: TDataSet);
    procedure ClientDataBeforeDelete(DataSet: TDataSet);
    procedure ClientDataBeforeEdit(DataSet: TDataSet);
    procedure ClientDataBeforeInsert(DataSet: TDataSet);
    procedure ClientDataBeforePost(DataSet: TDataSet);
    procedure ClientDataBeforeScroll(DataSet: TDataSet);
    procedure ClientDataCalcFields(DataSet: TDataSet);
    procedure ClientDataDeleteError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure ClientDataNewRecord(DataSet: TDataSet);
    procedure ClientDataAfterPost(DataSet: TDataSet);
    procedure ClientDataAfterInsert(DataSet: TDataSet);
    procedure ClientDataAfterEdit(DataSet: TDataSet);
    procedure ClientDataAfterDelete(DataSet: TDataSet);
    procedure ClientDataAfterCancel(DataSet: TDataSet);
    procedure BDEProviderGetDataSetProperties(Sender: TObject;
      DataSet: TDataSet; out Properties: OleVariant);
    procedure MasterQueryAfterOpen(DataSet: TDataSet);
    procedure MasterQueryBeforeClose(DataSet: TDataSet);
    procedure CancelUpdatesExecute(Sender: TObject);
    procedure ApplyUpdatesUpdate(Sender: TObject);
    procedure LogChangesExecute(Sender: TObject);
    procedure UndoLastEditExecute(Sender: TObject);
    procedure RevertRecordExecute(Sender: TObject);
    procedure ClearFieldExecute(Sender: TObject);
    procedure GetNextPacketExecute(Sender: TObject);
    procedure SetMaxErrorsExecute(Sender: TObject);
    procedure SetPacketRecordsExecute(Sender: TObject);
    procedure ViewEventsExecute(Sender: TObject);
    procedure BDEProviderAfterUpdateRecord(Sender: TObject;
      SourceDS: TDataSet; DeltaDS: TClientDataSet;
      UpdateKind: TUpdateKind);
    procedure BDEProviderBeforeUpdateRecord(Sender: TObject;
      SourceDS: TDataSet; DeltaDS: TClientDataSet; UpdateKind: TUpdateKind;
      var Applied: Boolean);
    procedure CreateFieldTypeDropDown(Sender: TObject);
    procedure CreateFieldTypeChange(Sender: TObject);
    procedure CreateFieldSizeChange(Sender: TObject);
    procedure IncludeNestedObjectExecute(Sender: TObject);
    procedure TestButton1Click(Sender: TObject);
    procedure DisplayDetailsExecute(Sender: TObject);
    procedure SetRefTableNameExecute(Sender: TObject);
    procedure NestedTableBeforeInsert(DataSet: TDataSet);
    procedure DataSourceStateChange(Sender: TObject);
    procedure DataSourceUpdateData(Sender: TObject);
    procedure RefreshDataExecute(Sender: TObject);
    procedure ClearEventLogExecute(Sender: TObject);
    procedure ClearEventLogUpdate(Sender: TObject);
    procedure HelpAboutExecute(Sender: TObject);
    procedure FindKeyPageInit(Sender: TObject);
    procedure DataSetAfterClose(DataSet: TDataSet);
    procedure ClearPasswordsExecute(Sender: TObject);
    procedure MasterTableAfterClose(DataSet: TDataSet);
    procedure FileMenuClick(Sender: TObject);
    procedure ClosedFileClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure PrevQueryExecute(Sender: TObject);
    procedure PrevQueryUpdate(Sender: TObject);
    procedure NextQueryExecute(Sender: TObject);
  private
    FConfig: TIniFile;
    FMaxErrors: Integer;
    FPacketRecs: Integer;
    FSavePoint: Integer;
    FActiveDataSet: TDataSet;
    FActiveDataSource: TDataSource;
    FRefTabName: string;
    FStatusMsg: string;
    FClosedTables: TStringList;
    FMasterQueries: TStringList;
    FDetailQueries: TStringList;
    FQueryIndex: Integer;
    function GetConfigFile: TIniFile;
    function FilterOptions: TFilterOptions;
    procedure InsertData(DataSet: TDataSet; Rows,Start: Integer);
    procedure RefreshIndexNames(NewItemIndex: Integer);
    procedure SetEventsVisible(Visible: Boolean);
    procedure SetProviderOptions;
    procedure SetQueryText;
    procedure SetStatusMsg(const Msg: string);
    procedure ShowHeapStatus(Sender: TObject; var Done: Boolean);
    procedure ShowIndexParams;
    procedure UpdateFieldList;
    procedure UpdateReOpenMenu;
    procedure OnHint(Sender: TObject);
  public
    procedure BindControls(DataSet: TDataSet);
    procedure CheckDatabase(CloseFirst: Boolean);
    procedure OpenDataSet(Source: TDBDataSet);
    procedure SetActiveDataSet(Value: TDataSet);
    procedure StreamSettings(Write: Boolean);
    procedure LogEvent(const EventStr: string; Component: TComponent = nil);
    property StatusMsg: string read FStatusMsg write SetStatusMsg;
    property ActiveDataSet: TDataSet read FActiveDataSet write SetActiveDataSet;
    property ActiveDataSource: TDataSource read FActiveDataSource write FActiveDataSource;
    property ConfigFile: TIniFile read GetConfigFile;
  end;

var
  DBClientTest: TDBClientTest;

implementation

uses DBLogDlg, BDE, RecError;

{$R *.DFM}

procedure TDBClientTest.FormCreate(Sender: TObject);
var
  I: Integer;
begin
  Database1.Close;
  FMaxErrors := -1;
  FPacketRecs := -1;
  ActiveDataSource := MasterDataSource;
  SetCurrentDirectory(PChar(ExtractFilePath(ParamStr(0))));
  for I := 0 to StatusBar.Panels.Count - 1 do
    StatusBar.Panels[I].Text := '';
  Application.OnIdle := ShowHeapStatus;
  Application.OnHint := OnHint;
  FClosedTables := TStringList.Create;
  FMasterQueries := TStringList.Create;
  FDetailQueries := TStringList.Create;
  StreamSettings(False);
  SetEventsVisible(ViewEvents.Checked);
end;

procedure TDBClientTest.FormDestroy(Sender: TObject);
begin
  if Assigned(FConfig) then
    StreamSettings(True);
  FConfig.Free;
  FDetailQueries.Free;
  FMasterQueries.Free;
  FClosedTables.Free;
end;

procedure TDBClientTest.ExitApplicationExecute(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TDBClientTest.HelpAboutExecute(Sender: TObject);
begin
  ShowMessage('Client DataSet Test Application'#13#10+
              'Copyright (c) 1998 Inprise Corporation');
end;

procedure TDBClientTest.OnHint(Sender: TObject);
begin
  StatusMsg := Application.Hint;
end;

{ View Options }

procedure TDBClientTest.SetEventsVisible(Visible: Boolean);
var
  EventsWidth: Integer;
begin
  if Events.Visible = Visible then Exit;
  DisableAlign;
  try
    Events.Visible := Visible;
    EventsWidth := Events.Width + 10;
    if not Visible then
      EventsWidth := -EventsWidth;
    ClientWidth := ClientWidth + EventsWidth;
  finally
    DataSetSelector.ControlState := DataSetSelector.ControlState - [csAlignmentNeeded];
    AreaSelector.ControlState := AreaSelector.ControlState - [csAlignmentNeeded];
    EnableAlign;
  end;
end;

procedure TDBClientTest.ViewEventsExecute(Sender: TObject);
begin
  ViewEvents.Checked := not ViewEvents.Checked;
  SetEventsVisible(ViewEvents.Checked);
end;

procedure TDBClientTest.DisplayDetailsExecute(Sender: TObject);
begin
  DisplayDetails.Checked := not DisplayDetails.Checked;
end;

{ Settings }

function TDBClientTest.GetConfigFile: TIniFile;
begin
  if FConfig = nil then
    FConfig := TIniFile.Create(ChangeFileExt(ParamStr(0), '.INI'));
  Result := FConfig;
end;

procedure TDBClientTest.StreamSettings(Write: Boolean);

  procedure WriteStr(const OptName, Value: string);
  begin
    FConfig.WriteString('Settings', OptName, Value);
  end;

  procedure WriteBool(const OptName: string; Value: Boolean);
  begin
    FConfig.WriteBool('Settings', OptName, Value);
  end;

  procedure WriteStrings(const SectName: string; Values: TStrings);
  var
    I: Integer;
  begin
    FConfig.EraseSection(SectName);
    for I := 0 to Values.Count - 1 do
      FConfig.WriteString(SectName, IntToStr(I), Values[I]);
  end;

  function ReadStr(const OptName: string): string;
  begin
    Result := FConfig.ReadString('Settings', OptName, '');
  end;

  function ReadBool(const OptName: string): Boolean;
  begin
    Result := FConfig.ReadBool('Settings', OptName, False);
  end;

  procedure ReadStrings(const SectName: string; Values: TStrings);
  var
    I: Integer;
  begin
    FConfig.ReadSectionValues(SectName, Values);
    { Strip off the 0=, 1=, etc parts }
    for I := 0 to Values.Count - 1 do
      Values[I] := Copy(Values[I], 3, MAXINT);
  end;

  function FindPage(const PageName: string): TTabSheet;
  var
    I: Integer;
  begin
    for I := AreaSelector.PageCount - 1 downto 0 do
    begin
      Result := AreaSelector.Pages[I];
      if Result.Caption = PageName then Exit;
    end;
    Result := ProviderPage;
  end;

  procedure ProcessComponents(Components: array of TComponent);
  var
    I: Integer;
  begin
    if Write then
    begin
      for I := Low(Components) to High(Components) do
        if Components[I] is TCustomEdit then
          with TEdit(Components[I]) do
            WriteStr(Name, Text)
        else if Components[I] is TComboBox then
          with TDBComboBox(Components[I]) do
            WriteStr(Name, Text)
        else if Components[I] is TCheckBox then
          with TCheckBox(Components[I]) do
            WriteBool(Name, Checked)
        else if Components[I] is TAction then
          with TAction(Components[I]) do
            WriteBool(Name, Checked)
        else if Components[I] is TPageControl then
          with TPageControl(Components[I]) do
            WriteStr(Name, ActivePage.Caption);
    end
    else
    begin
      for I := Low(Components) to High(Components) do
        if Components[I] is TCustomEdit then
          with TEdit(Components[I]) do
            Text := ReadStr(Name)
        else if Components[I] is TComboBox then
          with TComboBox(Components[I]) do
            Text := ReadStr(Name)
        else if Components[I] is TCheckBox then
          with TCheckBox(Components[I]) do
            Checked := ReadBool(Name)
        else if Components[I] is TAction then
          with TAction(Components[I]) do
            Checked := ReadBool(Name)
        else if Components[I] is TPageControl then
          with TPageControl(Components[I]) do
            ActivePage := FindPage(ReadStr(Name));
    end;
  end;

begin
  GetConfigFile;
  if not Write and (ReadStr('AreaSelector') = '') then Exit;
  ProcessComponents([AreaSelector, DatabaseName, MasterTableName,
    DetailTableName, MasterSQL, DetailSQL, poCascadedDeletes, poCascadedUpdates,
    poDelayedDetails, poDelayedBlobs, poIncludeFieldProps, poReadOnly,
    DisableProvider, ObjectView, SparseArrays, MixedData, FetchOnDemand,
    DisableProvider, ResolveToDataSet, DataRows, CreateDataSetDesc,
    EnableBCD, RequestLiveQuery, ViewEvents, DisplayDetails, IncludeNestedObject]);
  if Write then
  begin
    WriteStrings('ClosedTables', FClosedTables);
    WriteStrings('MasterQueries', FMasterQueries);
    WriteStrings('DetailQueries', FDetailQueries);
  end else
  begin
    ReadStrings('ClosedTables', FClosedTables);
    ReadStrings('MasterQueries', FMasterQueries);
    ReadStrings('DetailQueries', FDetailQueries);
  end;
end;

procedure TDBClientTest.RequestLiveQueryExecute(Sender: TObject);
begin
  RequestLiveQuery.Checked := not RequestLiveQuery.Checked;
  MasterQuery.RequestLive := RequestLiveQuery.Checked;
end;

procedure TDBClientTest.ObjectViewExecute(Sender: TObject);
begin
  ObjectView.Checked := not ObjectView.Checked;
end;

procedure TDBClientTest.SparseArraysExecute(Sender: TObject);
begin
  SparseArrays.Checked := not SparseArrays.Checked;
end;

procedure TDBClientTest.EnableBCDExecute(Sender: TObject);
begin
  EnableBCD.Checked := not EnableBCD.Checked;
end;

procedure TDBClientTest.ResolveToDataSetExecute(Sender: TObject);
begin
  ResolveToDataSet.Checked := not ResolveToDataSet.Checked;
end;

procedure TDBClientTest.FetchOnDemandExecute(Sender: TObject);
begin
  FetchOnDemand.Checked := not FetchOnDemand.Checked;
end;

procedure TDBClientTest.LogChangesExecute(Sender: TObject);
begin
  LogChanges.Checked := not LogChanges.Checked;
  ClientData.LogChanges := LogChanges.Checked;
end;

procedure TDBClientTest.DisableProviderExecute(Sender: TObject);
begin
  DisableProvider.Checked := not DisableProvider.Checked;
end;

procedure TDBClientTest.IncludeNestedObjectExecute(Sender: TObject);
begin
  IncludeNestedObject.Checked := not IncludeNestedObject.Checked;
end;

procedure TDBClientTest.SetPacketRecordsExecute(Sender: TObject);
var
  SPacketRecs: string;
begin
  SPacketRecs := IntToStr(FPacketRecs);
  if InputQuery(Application.Title, 'Enter PacketRecs for ApplyUpdates:', SPacketRecs) then
    FPacketRecs := StrToInt(SPacketRecs);
end;

procedure TDBClientTest.SetMaxErrorsExecute(Sender: TObject);
var
  SMaxErrors: string;
begin
  SMaxErrors := IntToStr(FMaxErrors);
  if InputQuery(Application.Title, 'Enter MaxErrors for ApplyUpdates:', SMaxErrors) then
    FMaxErrors := StrToInt(SMaxErrors);
end;

procedure TDBClientTest.SetRefTableNameExecute(Sender: TObject);
begin
  InputQuery(Application.Title, 'Enter ReferenceTableName for inserted references', FRefTabName);
end;

procedure TDBClientTest.NestedTableBeforeInsert(DataSet: TDataSet);
begin
  if DataSet.DataSetField.DataType = ftReference then
    TReferenceField(DataSet.DataSetField).ReferenceTableName := FRefTabName;
end;

{ Provider Options }

procedure TDBClientTest.SetProviderOptions;
var
  Opts: TProviderOptions;
begin
  Opts := [];
  if poDelayedDetails.Checked then
    Include(Opts, poFetchDetailsOnDemand);
  if poDelayedBlobs.Checked then
    Include(Opts, poFetchBlobsOnDemand);
  if poCascadedDeletes.Checked then
    Include(Opts, poCascadeDeletes);
  if poCascadedUpdates.Checked then
    Include(Opts, poCascadeUpdates);
  if poReadOnly.Checked then
    Include(Opts, Provider.poReadOnly);
  if poIncludeFieldProps.Checked then
    Include(Opts, poIncFieldProps);
  BDEProvider.Options := Opts;
end;

procedure TDBClientTest.poCascadedDeletesExecute(Sender: TObject);
begin
  poCascadedDeletes.Checked := not poCascadedDeletes.Checked;
end;

procedure TDBClientTest.poCascadedUpdatesExecute(Sender: TObject);
begin
  poCascadedUpdates.Checked := not poCascadedUpdates.Checked;
end;

procedure TDBClientTest.poDelayedDetailsExecute(Sender: TObject);
begin
  poDelayedDetails.Checked := not poDelayedDetails.Checked;
end;

procedure TDBClientTest.poDelayedBlobsExecute(Sender: TObject);
begin
  poDelayedBlobs.Checked := not poDelayedBlobs.Checked;
end;

procedure TDBClientTest.poIncludeFieldPropsExecute(Sender: TObject);
begin
  poIncludeFieldProps.Checked := not poIncludeFieldProps.Checked;
end;

procedure TDBClientTest.poReadOnlyExecute(Sender: TObject);
begin
  poReadOnly.Checked := not poReadOnly.Checked;
end;

{ Status Information }

procedure TDBClientTest.ShowHeapStatus(Sender: TObject; var Done: Boolean);
begin
  Caption := Format('Client DataSet Test Form - (Blocks=%d Bytes=%d)',
    [AllocMemCount, AllocMemSize]);
end;

procedure TDBClientTest.SetStatusMsg(const Msg: string);
begin
  StatusBar.Panels[0].Text := Msg;
end;

procedure TDBClientTest.DataSourceDataChange(Sender: TObject;
  Field: TField);
const
  StatusStrs: array[TUpdateStatus] of string = ('Unmodified',
    'Modified', 'Inserted', 'Deleted');
begin
  if (Sender = ActiveDataSource) and ActiveDataSource.DataSet.IsSequenced then
  begin
    with ActiveDataSource.DataSet do
    begin
      if IsEmpty then
      begin
        StatusBar.Panels[1].Text := '';
        StatusBar.Panels[3].Text := '(empty)';
      end else
      begin
        StatusBar.Panels[1].Text := StatusStrs[UpdateStatus];
        if (State = dsBrowse) and (Field = nil) then
        begin
          StatusBar.Panels[3].Text := Format('%d of %d', [RecNo, RecordCount]);
          StatusMsg := '';
        end;
      end;
    end;
  end;
  LogEvent('OnDataChange', Sender as TComponent);
end;

procedure TDBClientTest.GridColEnter(Sender: TObject);
const
  NullStr: array[Boolean] of string = ('','[NULL]');
var
  Field: TField;

  procedure TrackBlobs;
  begin
    if Field.DataSet <> MasterDataSource.DataSet then Exit;
    if (Field is TMemoField) and (Field <> DBMemo1.Field) then
      DBMemo1.DataField := Field.FieldName
    else if (Field is TGraphicField) and (Field <> DBImage1.Field) then
      DBImage1.DataField := Field.FieldName;
  end;

  procedure ShowOriginalValues;
  var
    V: Variant;
  begin
    if (Field.DataSet is TClientDataSet) and
       (TClientDataSet(Field.DataSet).UpdateStatus = usModified) then
    begin
      V := Field.OldValue;
      if not VarIsNull(V) and (V <> Field.Value) then
        StatusMsg := Format('Orignal Value: %s', [VarToStr(V)]) else
        StatusMsg := '';
    end;
  end;

begin
  Field := (Sender as TDBGrid).SelectedField;
  if Assigned(Field) then
  begin
    (Sender as TDBGrid).Hint := Field.ClassName;
    StatusBar.Panels[2].Text := NullStr[Field.IsNull];
    TrackBlobs;
    ShowOriginalValues;
  end;
end;

{ File Operations / GetData }

procedure TDBClientTest.CheckDatabase(CloseFirst: Boolean);
var
  SPassword,
  SUserName: string;
begin
  if not CloseFirst and Database1.Connected and
    (Database1.AliasName = DatabaseName.Text) then Exit;
  Database1.Close;
  Database1.AliasName := DatabaseName.Text;
  Session.GetAliasParams(Database1.AliasName, Database1.Params);
  { No password prompt for standard aliases (as indicated by a 'PATH' param }
  if Database1.Params.IndexOfName('PATH') = -1 then
  begin
    SPassword := ConfigFile.ReadString('Passwords', Database1.AliasName, '');
    if SPassword = '' then
    begin
      SUserName := Database1.Params.Values['USER NAME'];
      if not LoginDialog('DatabaseName.Text', SUserName, SPassword) then Exit;
      Database1.Params.Values['USER NAME'] := SUserName;
    end;
    Database1.Params.Values['PASSWORD'] := SPassword;
  end;
  if EnableBCD.Checked then
    Database1.Params.Add('ENABLE BCD=TRUE');
  Database1.Open;
  if Database1.IsSQLBased and (SPassword <> '') then
    ConfigFile.WriteString('Passwords', Database1.AliasName, SPassword);
end;

procedure TDBClientTest.ClearPasswordsExecute(Sender: TObject);
begin
  ConfigFile.EraseSection('Passwords');
end;

procedure TDBClientTest.DatabaseNameDropDown(Sender: TObject);
begin
  if DatabaseName.Items.Count = 0 then
    Session.GetDatabaseNames(DatabaseName.Items);
end;

procedure TDBClientTest.DatabaseNameClick(Sender: TObject);
begin
  if (DatabaseName.Text <> '') and not DatabaseName.DroppedDown then
  begin
    CheckDatabase(True);
    MasterTableName.Items.Clear;
    MasterTableName.Text := '';
    DetailTableName.Text := '';
    ClientData.Close;
  end;
end;

procedure TDBClientTest.DatabaseNameKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    if DatabaseName.DroppedDown then
      DatabaseName.DroppedDown := False;
    DatabaseNameClick(Sender);
    Key := #0;
  end;
end;

procedure TDBClientTest.MasterTableNameDropDown(Sender: TObject);
begin
  CheckDatabase(False);
  with Sender as TComboBox do
    if (Items.Count < 1) and (Database1.AliasName <> '') then
      Session.GetTableNames(Database1.DatabaseName, '', True, False, Items);
end;

procedure TDBClientTest.MasterTableNameKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    with Sender as TComboBox do
    if DroppedDown then DroppedDown := False;
    OpenTable.Execute;
    Key := #0;
  end;
end;

procedure TDBClientTest.SetActiveDataSet(Value: TDataSet);
begin
  MasterDataSource.Enabled := False;
  DetailDataSource.Enabled := False;
  MasterDataSource.DataSet := Value;
  FActiveDataSet := Value;
  try
    if Assigned(Value) then Value.Open;
  finally
    if (Value = MasterTable) and DetailTable.Active then
      DetailDataSource.DataSet := DetailTable
    else if (Value = MasterQuery) and DetailQuery.Active then
      DetailDataSource.DataSet := DetailQuery
    else if (Value = ClientData) and DetailDataSet.Active then
      DetailDataSource.DataSet := DetailDataSet
    else
      DetailDataSource.DataSet := nil;
    BindControls(Value);
    MasterDataSource.Enabled := True;
    DetailDataSource.Enabled := True;
  end;
end;


procedure TDBClientTest.DataSetSelectorChange(Sender: TObject);
var
  NewActive: TDataSet;
begin
  NewActive := nil;
  case DataSetSelector.TabIndex of
    0: if ClientData.Active or (ClientData.ProviderName <> '') then
         NewActive := ClientData;
    1: if ClientData.ChangeCount > 0 then
       begin
         DeltaSet.Data := ClientData.Delta;
         NewActive := DeltaSet;
       end;
    2: if ResultSet.Active then
         NewActive := ResultSet;
    3: NewActive := MasterQuery;
    4: NewActive := MasterTable;
  end;
  ActiveDataSet := NewActive;
end;

procedure TDBClientTest.OpenDataSet(Source: TDBDataSet);
begin
  ClearEventLog.Execute;
  Screen.Cursor := crHourGlass;
  try
    ClientData.Data := Null;
    Source.Close;
    if not DisableProvider.Checked then
    begin
      BDEProvider.DataSet := Source;
      SetProviderOptions;
      ClientData.ProviderName := BDEProvider.Name;
      ActiveDataSet := ClientData;
    end else
      ActiveDataSet := Source;
    MasterGrid.SetFocus;
    StatusMsg := 'Dataset Opened';
  finally
    Screen.Cursor := crDefault;
  end;
  StreamSettings(True);
end;

procedure TDBClientTest.OpenTableExecute(Sender: TObject);
begin
  if MasterTableName.Text <> '' then
    OpenDataSet(MasterTable);
end;

procedure TDBClientTest.MasterTableNameClick(Sender: TObject);
begin
  with Sender as TComboBox do
  if not DroppedDown and (MasterTable.TableName <> Text) then
    OpenTable.Execute;
end;

procedure TDBClientTest.DetailTableNameClick(Sender: TObject);
begin
  with Sender as TComboBox do
    if not DroppedDown and (DetailTable.TableName <> Text) then
      OpenTable.Execute;
end;

procedure TDBClientTest.OpenQueryExecute(Sender: TObject);

  procedure UpdateQueryHistory;
  var
    DSQL: string;
  begin
    FMasterQueries.Add(MasterSQL.Text);
    DSQL := DetailSQL.Text;
    if DSQL = '' then DSQL := '(empty)';
    FDetailQueries.Insert(0, DSQL);
    if FMasterQueries.Count > 9 then
    begin
      FMasterQueries.Delete(0);
      FDetailQueries.Delete(0);
    end;
  end;

begin
  if UpperCase(Copy(MasterSQL.Text, 1, 6)) = 'SELECT' then
    OpenDataSet(MasterQuery) else
  begin
    CheckDatabase(False);
    MasterQuery.RequestLive := True;
    MasterQuery.SQL.Text := MasterSQL.Text;
    MasterQuery.ExecSQL;
    StatusMsg := Format('%d rows were affected', [MasterQuery.RowsAffected]);
  end;
  UpdateQueryHistory;
end;

procedure TDBClientTest.PrevQueryUpdate(Sender: TObject);
begin
  PrevQuery.Enabled := FQueryIndex < (FMasterQueries.Count - 1);
end;

procedure TDBClientTest.SetQueryText;
var
  DSQL: string;
begin
  if FQueryIndex > -1 then
  begin
    MasterSQL.Text := FMasterQueries[FQueryIndex];
    DSQL := FDetailQueries[FQueryIndex];
    if DSQL = '(empty)' then DSQL := '';
    DetailSQL.Text := DSQL;
  end else
  begin
    MasterSQL.Text := '';
    DetailSQL.Text := '';
  end;
end;

procedure TDBClientTest.PrevQueryExecute(Sender: TObject);
begin
  Assert(FQueryIndex < (FMasterQueries.Count - 1));
  Inc(FQueryIndex);
  SetQueryText;
end;

procedure TDBClientTest.NextQueryExecute(Sender: TObject);
begin
  if FQueryIndex > -1 then
    Dec(FQueryIndex);
  SetQueryText;
end;

procedure TDBClientTest.MasterSQLKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    OpenQuery.Execute;
    Key := #0;
  end;
end;

procedure TDBClientTest.DataSetBeforeOpen(DataSet: TDataSet);
begin
  DataSet.ObjectView := ObjectView.Checked;
  DataSet.SparseArrays := SparseArrays.Checked;
  if DataSet is TClientDataSet then
  begin
    ClientData.PacketRecords := FPacketRecs;
    ClientData.FetchOnDemand := FetchOnDemand.Checked;
    ClientData.IndexName := '';
  end
  else if DataSet is TDBDataSet then
  begin
    CheckDatabase(False);
    if DataSet = MasterTable then
      MasterTable.TableName := MasterTableName.Text
    else if DataSet = DetailTable then
      DetailTable.TableName := DetailTableName.Text
    else if DataSet = MasterQuery then
    begin
      MasterQuery.RequestLive := RequestLiveQuery.Checked;
      DetailQuery.RequestLive := RequestLiveQuery.Checked;
      if MasterQuery.SQL.Text <> MasterSQL.Text then
      begin
        MasterQuery.SQL.Text := MasterSQL.Text;
        DetailQuery.SQL.Text := DetailSQL.Text;
      end
    end;
  end;
end;

procedure TDBClientTest.ClientDataAfterClose(DataSet: TDataSet);
begin
  FSavePoint := -1;
  if ResultSet.Active then ResultSet.Data := NULL;
  if DeltaSet.Active then DeltaSet.Data := NULL;
  BindControls(nil);
  ClientData.IndexName := '';
  DataSetAfterClose(DataSet);
end;

procedure TDBClientTest.MasterTableAfterClose(DataSet: TDataSet);
begin
  MasterTable.IndexName := '';
  DataSetAfterClose(DataSet);
end;

procedure TDBClientTest.DataSetAfterClose(DataSet: TDataSet);
begin
  DataSet.Filtered := False;
  DataSet.Filter := '';
end;

procedure TDBClientTest.GetNextPacketExecute(Sender: TObject);
begin
  ClientData.GetNextPacket;
  ClientData.UpdateCursorPos;
  ClientData.Resync([]);
end;

procedure TDBClientTest.ClientDataAfterOpen(DataSet: TDataSet);
var
  I: Integer;
begin
  ClientData.LogChanges := LogChanges.Checked;
  if DataSetSelector.TabIndex <> 0 then
  begin
    DataSetSelector.TabIndex := 0;
    DataSetSelectorChange(nil);
  end;
  for I := 0 to DataSet.FieldCount - 1 do
  if DataSet.Fields[I].DataType in [ftDataSet, ftReference] then
  begin
    DetailDataSet.DataSetField := TDataSetField(DataSet.Fields[I]);
    Break;
  end;
end;

procedure TDBClientTest.MasterTableAfterOpen(DataSet: TDataSet);
var
  I: Integer;
  Field: TField;
  MasterFields: string;
begin
  if DetailTableName.Text <> '' then
  begin
    DetailTable.Open;
    DetailTable.IndexDefs.Update;
    for I := 0 to DetailTable.Fields.Count - 1do
    begin
      Field := MasterTable.FindField(DetailTable.Fields[I].FieldName);
      if Field <> nil then
      begin
        if DetailTable.IndexDefs.GetIndexForFields(MasterFields + Field.FieldName, False) <> nil then
          MasterFields := MasterFields + Field.FieldName + ';';
      end;
    end;
    if MasterFields = '' then
      DatabaseError('Cannot determine linking fields for detail');
    SetLength(MasterFields, Length(MasterFields)-1);
    DetailTable.IndexFieldNames := MasterFields;
    DetailTable.MasterFields := MasterFields;
    DetailTable.MasterSource := DetailMasterSource;
  end;
  for I := 0 to DataSet.FieldCount - 1 do
  if DataSet.Fields[I].DataType in [ftDataSet, ftReference] then
  begin
    TDataSetField(DataSet.Fields[I]).IncludeObjectField := IncludeNestedObject.Checked;
    NestedTable.DataSetField := TDataSetField(DataSet.Fields[I]);
    Break;
  end;
  ProviderDataSetAfterOpen(DataSet);
end;

procedure TDBClientTest.MasterTableBeforeClose(DataSet: TDataSet);

  procedure UpdateClosedTables;
  var
    TableEntry: string;
  begin
    TableEntry := Database1.AliasName + ':' + MasterTable.TableName;
    if DetailTable.Active then
    begin
      TableEntry := TableEntry + '/' + DetailTable.TableName;
      DetailTable.Close;
    end;
    if FClosedTables.IndexOf(TableEntry) = -1 then
    begin
      FClosedTables.Insert(0, TableEntry);
      if FClosedTables.Count > 9 then
        FClosedTables.Delete(9);
    end;
  end;

begin
  UpdateClosedTables;
  with DetailTable do
  begin
    Close;
    IndexFieldNames := '';
    MasterFields := '';
    MasterSource := nil;
  end;
end;

procedure TDBClientTest.MasterQueryAfterOpen(DataSet: TDataSet);
begin
  if Length(Trim(DetailSQL.Text)) <> 0 then
  begin
    DetailQuerySource.Dataset := MasterQuery;
    DetailQuery.Open;
  end
  else
    DetailQuerySource.Dataset := nil;
  ProviderDataSetAfterOpen(DataSet);
end;

procedure TDBClientTest.MasterQueryBeforeClose(DataSet: TDataSet);
begin
  DetailQuery.Close;
end;

procedure TDBClientTest.ProviderDataSetAfterOpen(DataSet: TDataSet);
begin
  if MasterDataSource.DataSet = DataSet then
    if DataSet = MasterQuery then
      DataSetSelector.TabIndex := 3 else
      DataSetSelector.TabIndex := 4;
end;

procedure TDBClientTest.CloseActiveDataSetExecute(Sender: TObject);
begin
  if Assigned(ActiveDataSet) then
    ActiveDataSet.Close;
end;

procedure TDBClientTest.UpdateReOpenMenu;
var
  I: Integer;
begin
  while FileReOpen.Count > 0 do
    FileReOpen.Items[0].Free;
  for I := 0 to FClosedTables.Count - 1 do
    FileReOpen.Add(NewItem(Format('%d) %s', [I, FClosedTables[I]]), 0, False,
      True, ClosedFileClick, 0, ''));
end;

procedure TDBClientTest.ClosedFileClick(Sender: TObject);
var
  S: string;
  P, P2: Integer;
begin
  S := Copy(TMenuItem(Sender).Caption, 4, MAXINT);
  P := Pos(':', S);
  P2 := Pos('/', S);
  DatabaseName.Text := Copy(S, 1, P-1);
  if P2 > 0 then
    DetailTableName.Text := Copy(S, P2+1, MAXINT) else
  begin
    DetailTableName.Text := '';
    P2 := MAXINT;
  end;
  MasterTableName.Text := Copy(S, P+1, P2-P-1);
  FClosedTables.Delete(FClosedTables.IndexOf(S));
  OpenTable.Execute;
end;

procedure TDBClientTest.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  CloseActiveDataSet.Execute;
end;

procedure TDBClientTest.FileMenuClick(Sender: TObject);
begin
  UpdateReOpenMenu;
  FileReOpen.Enabled := FClosedTables.Count > 0;
end;

{ Packet Save/Load }

procedure TDBClientTest.LoadDatapacket1Click(Sender: TObject);
begin
  OpenDialog.FilterIndex := 1;
  if OpenDialog.Execute then
  begin
    ClientData.LoadFromFile(OpenDialog.FileName);
    DataSetSelector.TabIndex := 0;
    DataSetSelectorChange(nil);
  end;
end;

procedure TDBClientTest.SaveDataPacketExecute(Sender: TObject);
begin
  SaveDialog.FilterIndex := 1;
  if SaveDialog.Execute then
    if ActiveDataSet is TClientDataSet then
      TClientDataSet(ActiveDataSet).SaveToFile(SaveDialog.FileName) else
      ClientData.SaveToFile(SaveDialog.FileName);
end;

procedure TDBClientTest.FileActionsUpdate(Sender: TObject);
begin
  CloseActiveDataSet.Enabled := Assigned(ActiveDataSet) and ActiveDataSet.Active;
  SaveDataPacket.Enabled := (ActiveDataSet is TClientDataSet);
end;

{ Streaming }

procedure TDBClientTest.Saveformtofile1Click(Sender: TObject);
begin
  SaveDialog.FilterIndex := 2;
  if SaveDialog.Execute then
    WriteComponentResFile(SaveDialog.FileName, Self);
end;

procedure TDBClientTest.LoadFormfromFile1Click(Sender: TObject);
var
  Form: TDBClientTest;
begin
  OpenDialog.FilterIndex := 2;
  if OpenDialog.Execute then
  begin
    RegisterClasses([TStringField, TIntegerField, TADTField, TArrayField, TDataSetField]);
    Form := TDBClientTest.CreateNew(Application, 0);
    ReadComponentResFile(OpenDialog.FileName, Form);
  end;
end;

{ DB Control Linking }

procedure TDBClientTest.BindControls(DataSet: TDataSet);
var
  I: Integer;
  Field: TField;
begin
  DBMemo1.DataField := '';
  DBImage1.DataField := '';
  DetailGrid.Visible := False;
  GridSplitter.Visible := False;
  BlobCtrlPanel.Visible := False;
  DBImage1.Visible := False;
  DBMemo1.Visible := False;
  if Assigned(DataSet) then
  begin
    for I := 0 to DataSet.FieldCount - 1 do
    begin
      Field := DataSet.Fields[I];
      case Field.DataType of
        ftMemo:
          if DBMemo1.DataField = '' then
          begin
             DBMemo1.DataField := Field.FieldName;
             DBMemo1.Visible := True;
          end;
        ftGraphic:
          if DBImage1.DataField = '' then
          begin
            DBImage1.DataField := DataSet.Fields[I].FieldName;
            DBImage1.Visible := True;
          end;
        ftDataSet, ftReference:
          if DisplayDetails.Checked and (DetailDataSource.DataSet = nil) then
          begin
            DetailDataSource.DataSet := TDataSetField(DataSet.Fields[I]).NestedDataSet;
          end;
      end;
    end;
    BlobCtrlPanel.Visible := DBMemo1.Visible or DBImage1.Visible;
    if Assigned(DetailDataSource.DataSet) then
    begin
      GridSplitter.Visible := True;
      DetailGrid.Visible := True;
    end;
  end;
end;

procedure TDBClientTest.GridSetFocus(Sender: TObject);
begin
  ActiveDataSource := (Sender as TDBGrid).DataSource;
  DBNavigator1.DataSource := ActiveDataSource;
  DataSourceDataChange(ActiveDataSource, nil);
end;

procedure TDBClientTest.PopupMenu1Popup(Sender: TObject);
var
  I: Integer;
  MI: TMenuItem;
  F, CurField: TField;
begin
  with PopupMenu1, ActiveDataSet do
  begin
    if PopupMenu1.PopupComponent = DBMemo1 then
      CurField := DBMemo1.Field else
      CurField := DBImage1.Field;
    while Items.Count > 0 do Items.Delete(0);
    MI := NewItem('(None)', 0, False, True, FieldSelect, 0, 'None');
    Items.Add(MI);
    for I := 0 to FieldCount - 1 do
      if Fields[I] is TBlobField then
      begin
        F := Fields[I];
        MI := NewItem(F.FieldName, 0, F=CurField, True, FieldSelect, 0, 'mi'+F.FieldName);
        MI.Tag := Integer(F);
        Items.Add(MI);
      end;
  end;
end;

procedure TDBClientTest.FieldSelect(Sender: TObject);
var
  MI: TMenuItem;
begin
  MI := TMenuItem(Sender);
  if PopupMenu1.PopupComponent = DBImage1 then
  try
    if MI.Tag = 0 then
      DBImage1.DataField := '' else
      DBImage1.DataField := TField(MI.Tag).FieldName;
  except
    DBImage1.DataField := '';
    raise;
  end
  else if PopupMenu1.PopupComponent = DBMemo1 then
  try
    if MI.Tag = 0 then
      DBMemo1.DataField := '' else
      DBMemo1.DataField := TField(MI.Tag).FieldName;
  except
    DBMemo1.DataField := '';
    raise;
  end;
end;

{ Editing / Updates }

procedure TDBClientTest.EditActionsUpdate(Sender: TObject);
var
  Enabled: Boolean;
begin
  with ClientData do
    Enabled := (ActiveDataSet = ClientData) and Active and
      ((ChangeCount > 0) or (State <> dsBrowse) or
       (DetailDataSet.State in dsEditModes));
  ApplyUpdates.Enabled := Enabled;
  MergeChangeLog.Enabled := Enabled;
  CancelUpdates.Enabled := Enabled;
  GetSavePoint.Enabled := (ActiveDataSet = ClientData) and ClientData.Active;
  RevertToSavePoint.Enabled := FSavePoint > 0;
  UndoLastEdit.Enabled := Enabled;
  RevertRecord.Enabled := Enabled and
    ((ActiveDataSource.DataSet as TClientDataSet).UpdateStatus <> usUnmodified);
  GetNextPacket.Enabled := GetSavePoint.Enabled and
    (ClientData.PacketRecords <> -1);
  ClearField.Enabled := Assigned(ActiveDataSet) and ActiveDataSet.Active;
  RefreshData.Enabled := ClearField.Enabled;
end;

procedure TDBClientTest.ApplyUpdatesExecute(Sender: TObject);
var
  Delta, Results: Variant;
  ErrorCount: Integer;
begin
  BDEProvider.ResolveToDataSet := ResolveToDataSet.Checked;
  ClientData.CheckBrowseMode;
  Delta := ClientData.Delta;
  Results := ClientData.Provider.ApplyUpdates(Delta, FMaxErrors, ErrorCount);
  ResultSet.Data := Results;
  ClientData.Reconcile(Results);
  if ErrorCount = 0 then
    StatusMsg := 'Update Successful' else
    StatusMsg := Format('%d errors during update', [ErrorCount]);
  Beep;
end;

procedure TDBClientTest.ApplyUpdatesUpdate(Sender: TObject);
begin
  ApplyUpdates.Enabled := ClientData.Active and (ClientData.ChangeCount > 0);
end;

procedure TDBClientTest.CancelUpdatesExecute(Sender: TObject);
begin
  ClientData.CancelUpdates;
end;

procedure TDBClientTest.ClientDataReconcileError(DataSet: TClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind;
  var Action: TReconcileAction);
begin
  Action := HandleReconcileError(DataSet, UpdateKind, E);
end;

procedure TDBClientTest.UndoLastEditExecute(Sender: TObject);
begin
  ClientData.UndoLastChange(True);
end;

procedure TDBClientTest.RevertRecordExecute(Sender: TObject);
begin
  ClientData.RevertRecord;
end;

procedure TDBClientTest.ClearFieldExecute(Sender: TObject);
var
  Field: TField;
begin
  Field := MasterGrid.SelectedField;
  if Field = nil then Exit;
  ActiveDataSet.Edit;
  Field.Clear;
end;

procedure TDBClientTest.GetSavePointExecute(Sender: TObject);
begin
  FSavePoint := ClientData.SavePoint;
end;

procedure TDBClientTest.RevertToSavepointExecute(Sender: TObject);
begin
  ClientData.SavePoint := FSavePoint;
end;

procedure TDBClientTest.MergeChangeLogExecute(Sender: TObject);
begin
  ClientData.MergeChangeLog;
end;

procedure TDBClientTest.RefreshDataExecute(Sender: TObject);
begin
  ActiveDataSet.Refresh;
end;

{ Indexes }

procedure TDBClientTest.IndexPageShow(Sender: TObject);
begin
  if not Assigned(ActiveDataSet) or not ActiveDataSet.Active then
    OpenTable.Execute;
  RefreshIndexNames(0);
end;

procedure TDBClientTest.RefreshIndexNames(NewItemIndex: Integer);
var
  I: Integer;
  IndexDefs: TIndexDefs;
begin
  IndexList.Clear;
  if ActiveDataSet = MasterTable then
    IndexDefs := MasterTable.IndexDefs else
    IndexDefs := ClientData.IndexDefs;
  IndexDefs.Update;
  for I := 0 to IndexDefs.Count - 1 do
    if IndexDefs[I].Name = '' then
      IndexList.Items.Add('<primary>') else
      IndexList.Items.Add(IndexDefs[I].Name);
  if IndexList.Items.Count > 0 then
  begin
    if NewItemIndex < IndexList.Items.Count then
      IndexList.ItemIndex := NewItemIndex else
      IndexList.ItemIndex := 0;
    ShowIndexParams;
  end;
end;

procedure TDBClientTest.ShowIndexParams;
var
  IndexDef: TIndexDef;
begin
  if ActiveDataSet = MasterTable then
    IndexDef := MasterTable.IndexDefs[IndexList.ItemIndex] else
    IndexDef := ClientData.IndexDefs[IndexList.ItemIndex];
  idxCaseInsensitive.Checked := ixCaseInsensitive in IndexDef.Options;
  idxDescending.Checked := ixDescending in IndexDef.Options;
  idxUnique.Checked := ixUnique in IndexDef.Options;
  idxPrimary.Checked := ixPrimary in IndexDef.Options;
  IndexFields.Text := IndexDef.Fields;
  DescFields.Text := IndexDef.DescFields;
  CaseInsFields.Text := IndexDef.CaseInsFields;
end;

procedure TDBClientTest.IndexListClick(Sender: TObject);
begin
  if ActiveDataSet = MasterTable then
    MasterTable.IndexName := MasterTable.IndexDefs[IndexList.ItemIndex].Name else
    ClientData.IndexName := ClientData.IndexDefs[IndexList.ItemIndex].Name;
  ShowIndexParams;
end;

procedure TDBClientTest.CreateIndexClick(Sender: TObject);
var
  IndexName: string;
  Options: TIndexOptions;
begin
  IndexName := Format('Index%d', [IndexList.Items.Count+1]);
  if InputQuery('Create Index', 'Enter IndexName:', IndexName) then
  begin
    Options := [];
    if idxCaseInsensitive.Checked then Include(Options, ixCaseInsensitive);
    if idxDescending.Checked then Include(Options, ixDescending);
    if idxUnique.Checked then Include(Options, ixUnique);
    if idxPrimary.Checked then Include(Options, ixPrimary);
    if ActiveDataSet = MasterTable then
    begin
      MasterTable.Close;
      MasterTable.AddIndex(IndexName, IndexFields.Text, Options,
        DescFields.Text);
      MasterTable.Open;
    end else
      ClientData.AddIndex(IndexName, IndexFields.Text, Options,
        DescFields.Text, CaseInsFields.Text);
    StatusMsg := 'Index Created';
    RefreshIndexNames(IndexList.Items.Count);
  end;
end;

procedure TDBClientTest.DeleteIndexClick(Sender: TObject);
begin
  if IndexList.ItemIndex > -1 then
    if ActiveDataSet = MasterTable then
    begin
      MasterTable.Close;
      MasterTable.DeleteIndex(MasterTable.IndexDefs[IndexList.ItemIndex].Name);
      MasterTable.Open;
    end else
      ClientData.DeleteIndex(ClientData.IndexDefs[IndexList.ItemIndex].Name);
end;

procedure TDBClientTest.GridTitleClick(Column: TColumn);
var
  DataSet: TDataSet;

begin
  DataSet := Column.Field.DataSet;
  if DataSet is TClientDataSet then
    TClientDataSet(DataSet).IndexFieldNames := Column.Field.FieldName
  else if DataSet is TTable then
  begin
    if TTable(DataSet).IndexDefs.GetIndexForFields(Column.Field.FieldName, False) = nil then Exit;
    TTable(DataSet).IndexFieldNames := Column.Field.FieldName;
  end;
  StatusMsg := 'Sorted on '+Column.Field.FieldName;
end;

{ Filters }

procedure TDBClientTest.FilterPageShow(Sender: TObject);
var
  Field: TField;
  LocValue,
  QuoteChar: string;
begin
  if (Filter.Text = '') and Assigned(ActiveDataSet) and ActiveDataSet.Active then
  begin
    Field := MasterGrid.SelectedField;
    if Field = nil then Exit;
    with ActiveDataSet do
    try
      DisableControls;
      MoveBy(3);
      LocValue := Field.Value;
      First;
    finally
      EnableControls;
    end;
    if Field.DataType in [ftString, ftMemo, ftFixedChar] then
      QuoteChar := '''' else
      QuoteChar := '';
    Filter.Text := Format('%s=%s%s%1:s', [Field.FullName, QuoteChar, LocValue]);
  end;
end;

procedure TDBClientTest.FilterKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then FilteredClick(Sender);
end;

procedure TDBClientTest.FilterExit(Sender: TObject);
begin
  if Assigned(ActiveDataSet) then
    ActiveDataSet.Filter := Filter.Text;
end;

procedure TDBClientTest.SetFilterOptions(Sender: TObject);
begin
  ActiveDataSet.FilterOptions := FilterOptions;
end;

function TDBClientTest.FilterOptions: TFilterOptions;
begin
  Result := [];
  if foCaseInsensitive.Checked then Include(Result, DB.foCaseInsensitive);
  if foNoPartialCompare.Checked then Include(Result, DB.foNoPartialCompare);
end;

procedure TDBClientTest.FilteredClick(Sender: TObject);
begin
  if Filtered.Checked then
  begin
    ActiveDataSet.FilterOptions := FilterOptions;
    ActiveDataSet.Filter := Filter.Text;
  end;
  ActiveDataSet.Filtered := Filtered.Checked;
end;

procedure TDBClientTest.FindFirstClick(Sender: TObject);
begin
  ActiveDataSet.FilterOptions := FilterOptions;
  ActiveDataSet.Filter := Filter.Text;
  ActiveDataSet.FindFirst;
end;

procedure TDBClientTest.FindNextClick(Sender: TObject);
begin
  if ActiveDataSet.FilterOptions <> FilterOptions then
    ActiveDataSet.FilterOptions := FilterOptions;
  if ActiveDataSet.Filter <> Filter.Text then
    ActiveDataSet.Filter := Filter.Text;
  ActiveDataSet.FindNext;
end;

procedure TDBClientTest.StatusFilterClick(Sender: TObject);
var
  StatusFilter: TUpdateStatusSet;
begin
  StatusFilter := [];
  if ModifiedRecords.Checked then
    Include(StatusFilter, usModified);
  if InsertedRecords.Checked then
    Include(StatusFilter, usInserted);
  if DeletedRecords.Checked then
    Include(StatusFilter, usDeleted);
  ClientData.StatusFilter := StatusFilter;
end;

{ FindKey }

procedure TDBClientTest.FindKeyPageInit(Sender: TObject);
var
  I: Integer;
  FirstField: TField;
  KeyFieldNames: string;
begin
  FirstField := nil;
  if ActiveDataSet is TClientDataSet then
    with TClientDataSet(ActiveDataSet) do
    begin
      for I := 0 to IndexFieldCount - 1 do
        KeyFieldNames := KeyFieldNames + IndexFields[I].FieldName + ';';
      FirstField := IndexFields[0];
    end
  else if ActiveDataSet is TTable then
    with TTable(ActiveDataSet) do
    begin
      for I := 0 to IndexFieldCount - 1 do
        KeyFieldNames := KeyFieldNames + IndexFields[I].FieldName + ';';
      FirstField := IndexFields[0];
    end;
  FindValue.Enabled := FirstField <> nil;
  if FirstField <> nil then
  begin
    with ActiveDataSet do
    try
      DisableControls;
      MasterGrid.SelectedField := FirstField;
      MoveBy(3);
      FindValue.Text := FirstField.Value;
      First;
    finally
      EnableControls;
    end;
    KeyFieldList.Caption := Copy(KeyFieldNames, 1, Length(KeyFieldNames)-1)
  end else
    KeyFieldList.Caption := 'No Key Fields';
end;

procedure TDBClientTest.FindKeyClick(Sender: TObject);

  function Min(X, Y: Integer): Integer;
  begin
    Result := X;
    if X > Y then Result := Y;
  end;

var
  Values: TStringList;
  I: Integer;
begin
  Values := TStringList.Create;
  try
    Values.CommaText := FindValue.Text;
    if ActiveDataSet = ClientData then
      with ClientData do
      begin
        SetKey;
        try
          KeyExclusive := Self.KeyExclusive.Checked;
          KeyFieldCount := Min(Values.Count, IndexFieldCount);
          for I := 0 to KeyFieldCount - 1 do
            IndexFields[I].AsString := Values[I];
          if FindPartial.Checked then KeyFieldCount := KeyFieldCount - 1;
          if Sender = Self.FindNearest then
            GotoNearest else
            if GotoKey then
              StatusMsg := 'Record Found' else
              StatusMsg := 'Not found';
        except
          Cancel;
          Raise;
        end;
      end
    else if ActiveDataSet = MasterTable then
      with MasterTable do
      begin
        SetKey;
        try
          KeyExclusive := Self.KeyExclusive.Checked;
          KeyFieldCount := Min(Values.Count, IndexFieldCount);
          for I := 0 to KeyFieldCount - 1 do
            IndexFields[I].AsString := Values[I];
          if FindPartial.Checked then KeyFieldCount := KeyFieldCount - 1;
          if Sender = Self.FindNearest then
            GotoNearest else
            if GotoKey then
              StatusMsg := 'Record Found' else
              StatusMsg := 'Not found';
        except
          Cancel;
          Raise;
        end;
      end;
  finally
    Values.Free;
  end;
end;

{ Locate }

procedure TDBClientTest.LocatePageShow(Sender: TObject);
var
  Field: TField;
begin
  if (ActiveDataSet <> nil) and ActiveDataSet.Active then
  begin
    Field := MasterGrid.SelectedField;
    if LocateField.Items.Count = 0 then
      LocateFieldDropDown(LocateField);
    if (LocateField.Text = '') or (LocateField.Items.IndexOf(Field.FieldName) < 1) then
      LocateField.Text := Field.FieldName;
    with ActiveDataSet do
    try
      DisableControls;
      MoveBy(3);
      LocateEdit.Text := Field.Value;
      First;
    finally
      EnableControls;
    end;
  end;
end;

procedure TDBClientTest.LocateFieldDropDown(Sender: TObject);
begin
  ActiveDataSet.GetFieldNames(LocateField.Items);
end;

procedure TDBClientTest.LocateButtonClick(Sender: TObject);

  function LocateValue: Variant;
  var
    I: Integer;
    Values: TStringList;
  begin
    if LocateNull.Checked then
      Result := Null
    else if Pos(',', LocateEdit.Text) < 1 then
      LocateValue := LocateEdit.Text
    else
    begin
      Values := TStringList.Create;
      try
        Values.CommaText := LocateEdit.Text;
        Result := VarArrayCreate([0,Values.Count-1], varVariant);
        for I := 0 to Values.Count - 1 do
          Result[I] := Values[I];
      finally
        Values.Free;
      end;
    end;
  end;

var
  Options: TLocateOptions;
begin
  Options := [];
  if locCaseInsensitive.Checked then Include(Options, loCaseInsensitive);
  if locPartialKey.Checked then Include(Options, loPartialKey);
  if ActiveDataSet.Locate(LocateField.Text, LocateValue, Options) then
    StatusMsg := 'Record Found' else
    StatusMsg := 'Not found';
end;

procedure TDBClientTest.LocateNullClick(Sender: TObject);
begin
  LocateEdit.Enabled := not LocateNull.Checked;
end;

{ FieldLists }

procedure TDBClientTest.FieldsPageShow(Sender: TObject);

  procedure WriteLists(DataSet: TDataSet);
  var
    I: Integer;
  begin
    FieldList.Clear;
    for I := 0 to DataSet.FieldList.Count - 1 do
      with DataSet.FieldList do
        FieldList.Lines.Add(Format('%d) %s', [Fields[I].FieldNo, Strings[I]]));
    FieldDefList.Clear;
    DataSet.FieldDefs.Updated := False;
    DataSet.FieldDefList.Update;
    for I := 0 to DataSet.FieldDefList.Count - 1 do
      with DataSet.FieldDefList do
        FieldDefList.Lines.Add(Format('%d) %s', [FieldDefs[I].FieldNo, Strings[I]]));
  end;

var
  DataSet: TDataSet;
begin
  DataSet := ActiveDataSource.DataSet;
  if Assigned(DataSet) and DataSet.Active then
    WriteLists(DataSet)
  else
  begin
    CheckDatabase(False);
    MasterTable.TableName := MasterTableName.Text;
    WriteLists(MasterTable);
  end;
end;

{ Create DataSet }

type
  TFieldTypes = array of TFieldType;
  TCreateOption = (coArrayOfADT, coADTWithArray, coNestedADT);
  TCreateOptions = set of TCreateOption;

const
  ScalarTypes: array[0..11] of TFieldType = (ftSmallint, ftString,
    ftInteger, ftWord, ftBoolean, ftFloat, ftCurrency, ftBCD, ftLargeint,
    ftDate, ftTime, ftDateTime); { ftBytes, ftVarBytes, ftAutoInc }

  BlobTypes: array[0..1] of TFieldType = (ftMemo, ftGraphic);
  ObjectTypes: array[0..4] of TFieldType = (ftInteger, ftADT, ftArray,
    ftDataSet, ftString);

  ArrayDataSet: array[0..2] of TFieldType = (ftInteger, ftArray, ftInteger);
  ADTDataSet: array[0..2] of TFieldType = (ftInteger, ftADT, ftLargeInt);

  ADTWithScalar: array[0..1] of TFieldType = (ftString, ftWord);
  ADTWithArray: array[0..2] of TFieldType = (ftString, ftArray, ftWord);
  ADTWithADT: array[0..2] of TFieldType = (ftString, ftADT, ftDate);

  ArrayOfScalar: array[0..0] of TFieldType = (ftFloat);
  ArrayOfADT: array[0..0] of TFieldType = (ftADT);

  DefaultCreateTypes: array[0..7] of string = (
    'Scalar Types Only',
    'Object Types',
    'Array of Scalars',
    'Array of ADT',
    'Array of Nested ADTs',
    'ADT with Scalars',
    'ADT with Array',
    'Nested ADTs'
    );

procedure TDBClientTest.CreatePageShow(Sender: TObject);
var
  I: Integer;
begin
  with CreateDataSetDesc.Items do
    if Count < 1 then
    begin
      for I := Low(DefaultCreateTypes) to High(DefaultCreateTypes) do
        Add(DefaultCreateTypes[I]);
      if Text = '' then
        CreateDataSetDesc.ItemIndex := 0
      else if IndexOf(CreateDataSetDesc.Text) <> -1 then
        CreateDataSetDesc.ItemIndex := IndexOf(CreateDataSetDesc.Text);
      UpdateFieldList;
    end;
end;

procedure TDBClientTest.CreateFieldTypeDropDown(Sender: TObject);
var
  I: TFieldType;
begin
  if CreateFieldType.Items.Count < 2 then
    for I := Low(TFieldType) to High(TFieldType) do
      CreateFieldType.Items.Add(FieldTypeNames[I]);
end;

procedure TDBClientTest.CreateFieldTypeChange(Sender: TObject);
begin
  if (CreateFieldType.ItemIndex >= 0) and
     (CreateFieldType.ItemIndex <= Ord(High(TFieldType))) and
     (CreateFieldList.ItemIndex <> -1) then
    ClientData.FieldDefList[CreateFieldList.ItemIndex].DataType :=
     TFieldType(CreateFieldType.ItemIndex);
end;

procedure TDBClientTest.CreateFieldSizeChange(Sender: TObject);
begin
  if (CreateFieldSize.Text <> '') and (CreateFieldList.ItemIndex <> -1) and
     (ClientData.FieldDefList.Count > 0) then
    ClientData.FieldDefList[CreateFieldList.ItemIndex].Size := StrToInt(CreateFieldSize.Text);
end;

procedure TDBClientTest.CreateDataSetDescKeyPress(Sender: TObject;
  var Key: Char);
begin
  with Sender as TComboBox do
    if Key = #13 then
    begin
       DroppedDown := False;
       OnClick(Sender);
       Key := #0;
    end;
end;

procedure TDBClientTest.CreateDataSetDescClick(Sender: TObject);
begin
  if not CreateDataSetDesc.DroppedDown then
    UpdateFieldList;
end;

procedure TDBClientTest.UpdateFieldList;

  procedure AddFieldTypes(FieldTypes: array of TFieldType;
    FieldDefs: TFieldDefs; CreateOptions: TCreateOptions);
  var
    I, BaseID: Integer;
    FT: TFieldType;
    ParentDef: TFieldDef;
    FN: string;
  begin
    BaseID := 0;
    ParentDef := FieldDefs.ParentDef;
    while ParentDef <> nil do
    begin
      Inc(BaseID, ParentDef.Index);
      ParentDef := ParentDef.ParentDef;
    end;
    for I := Low(FieldTypes) to High(FieldTypes) do
    begin
      FT := FieldTypes[I];
      with FieldDefs.AddFieldDef do
      begin
        FN := Format('%s%s%d', [FieldTypeNames[FT], 'Field', I+1+BaseID]);
        Name := FN;
        DataType := FT;
        case FT of
          ftADT, ftDataSet:
            if coADTWithArray in CreateOptions then
              AddFieldTypes(ADTWithArray, ChildDefs, [])
            else if coNestedADT in CreateOptions then
            begin
              if BaseID > 0 then CreateOptions := [];
              AddFieldTypes(ADTWithADT, ChildDefs, CreateOptions)
            end
            else
              AddFieldTypes(ADTWithScalar, ChildDefs, []);
          ftArray:
            if coArrayOfADT in CreateOptions then
              AddFieldTypes(ArrayOfADT, ChildDefs, CreateOptions) else
              AddFieldTypes(ArrayOfScalar, ChildDefs, []);
        end;
      end;
    end;
  end;

begin
  ClientData.FieldDefs.Clear;
  case CreateDataSetDesc.ItemIndex of
    0: AddFieldTypes(ScalarTypes, ClientData.FieldDefs, []);
    1: AddFieldTypes(ObjectTypes, ClientData.FieldDefs, []);
    2: AddFieldTypes(ArrayDataSet, ClientData.FieldDefs, []);
    3: AddFieldTypes(ArrayDataSet, ClientData.FieldDefs, [coArrayOfADT]);
    4: AddFieldTypes(ArrayDataSet, ClientData.FieldDefs, [coArrayOfADT, coNestedADT]);
    5: AddFieldTypes(ADTDataSet, ClientData.FieldDefs, []);
    6: AddFieldTypes(ADTDataSet, ClientData.FieldDefs, [coADTWithArray]);
    7: AddFieldTypes(ADTDataSet, ClientData.FieldDefs, [coNestedADT]);
  end;
  CreateFieldList.Items := ClientData.FieldDefList;
  if CreateFieldList.Items.Count > 0 then
  begin
    CreateFieldList.ItemIndex := 0;
    CreateFieldListClick(CreateFieldList);
  end;
end;

procedure TDBClientTest.CreateFieldListClick(Sender: TObject);
var
  FieldDef: TFieldDef;
begin
  if CreateFieldList.ItemIndex >= 0 then
  begin
    FieldDef := ClientData.FieldDefList[CreateFieldList.ItemIndex];
    CreateFieldType.Text := FieldTypeNames[FieldDef.DataType];
    CreateFieldSize.Text := IntToStr(FieldDef.Size);
    CreateFieldRequired.Checked := FieldDef.Required;
    if FieldDef.ParentDef <> nil then
      CreateFieldParent.Text := FieldDef.ParentDef.Name else
      CreateFieldParent.Text := '';
  end;
end;

procedure TDBClientTest.InsertData(DataSet: TDataSet; Rows, Start: Integer);

  procedure InsertValues(RowNum: Integer; Fields: TFields);
  const
    NumberType: array[0..2] of Integer = (1,-1,0);
  var
    I: Integer;
    F: TField;
    Value: Variant;

    function Mixer: Integer;
    begin
      if MixedData.Checked then
        Result := NumberType[(RowNum - F.FieldNo) mod 3] else
        Result := 1;
    end;

  begin
    Inc(RowNum, Start);
    for I := 0 to Fields.Count - 1 do
    begin
      F := Fields[I];
      Value := Null;
      case F.DataType of
        ftFloat, ftCurrency, ftBCD:
          Value := RowNum * (RowNum / 10) * Mixer;
        ftLargeInt:
          TLargeIntField(F).AsLargeInt := RowNum * Mixer;
        ftInteger, ftSmallint:
          Value := RowNum * Mixer;
        ftWord:
          Value := Word(RowNum * Abs(Mixer));
        ftBoolean:
          Value := Odd(RowNum + Mixer);
        ftDataSet, ftAutoInc: {NOP};
        ftDate, ftTime, ftDateTime:
          Value := (Now + RowNum + (RowNum / 1000));
        ftADT, ftArray:
          InsertValues(RowNum, TObjectField(F).Fields);
        else
          Value := RowNum * Mixer;
      end;
      if Value <> Null then
      begin
        if VarToStr(Value) = '0' then Value := Null;
        if F.DataType = ftLargeInt then
          TLargeIntField(F).AsLargeInt := Integer(Value) else
          F.Value := Value;
      end;
    end;
  end;

  function FindNestedDataSet(DataSet: TDataSet): TDataSet;
  var
    I: Integer;
  begin
    Result := nil;
    with DataSet do
      for I := 0 to FieldCount - 1 do
      begin
        if Fields[I] is TDataSetField then
        begin
          Result := TDataSetField(Fields[I]).NestedDataSet;
          Break;
        end;
      end;
  end;

var
  I: Integer;
  NestedDataSet: TDataSet;
begin
  with DataSet do
  begin
    DisableControls;
    try
      NestedDataSet := FindNestedDataSet(DataSet);
      for I := 1 to Rows do
      begin
        Append;
        InsertValues(I, Fields);
        Post;
        UpdateCursorPos;
        if NestedDataSet <> nil then
          InsertData(NestedDataSet, Rows, RecNo-1);
      end;
      First;
    finally
      EnableControls;
    end;
  end;
end;

procedure TDBClientTest.CreateClientData(Sender: TObject);
begin
  ClientData.Data := Null;
  ClientData.IndexDefs.Clear;
  ClientData.ProviderName := '';
  ClientData.CreateDataSet;
  ClientData.FieldDefs.Update;
  if DataRows.Text <> '' then
    InsertData(ClientData, StrToInt(DataRows.Text), 0);
  ActiveDataSet := ClientData;
end;

procedure TDBClientTest.AddFieldButtonClick(Sender: TObject);
begin
  ShowMessage('Not Implemented');
end;

procedure TDBClientTest.CreateFieldParentDropDown(Sender: TObject);
var
  I: Integer;
begin
  with CreateFieldParent.Items do
  begin
    Clear;
    Add('');
    for I := 0 to ClientData.FieldDefs.Count - 1 do
      AddObject(ClientData.FieldDefs[I].Name, ClientData.FieldDefs[I]);
  end;
end;

{ Event Logging }

procedure TDBClientTest.LogEvent(const EventStr: string;
  Component: TComponent = nil);
var
  ItemCount: Integer;
begin
  if (Component <> nil) and (Component.Name <> '') then
    Events.Items.Add(Format('%s(%s)', [EventStr, Component.Name])) else
    Events.Items.Add(EventStr);
  ItemCount := Events.Items.Count;
  Events.ItemIndex := ItemCount - 1;
  if ItemCount > (Events.ClientHeight div Events.ItemHeight) then
    Events.TopIndex := ItemCount - 1;
end;

procedure TDBClientTest.ClearEventLogExecute(Sender: TObject);
begin
  Events.Items.Clear;
end;

procedure TDBClientTest.ClearEventLogUpdate(Sender: TObject);
begin
  ClearEventLog.Enabled := Events.Visible and (Events.Items.Count > 0);
end;

procedure TDBClientTest.BDEProviderBeforeUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TClientDataSet; UpdateKind: TUpdateKind;
  var Applied: Boolean);
begin
  LogEvent('BeforeUpdateRecord');
end;

procedure TDBClientTest.BDEProviderAfterUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TClientDataSet; UpdateKind: TUpdateKind);
begin
  LogEvent('AfterUpdateRecord');
end;

function TDBClientTest.BDEProviderDataRequest(Sender: TObject;
  Input: OleVariant): OleVariant;
begin
  LogEvent('OnDataRequest');
end;

procedure TDBClientTest.BDEProviderGetData(Sender: TObject;
  DataSet: TClientDataSet);
begin
  LogEvent('OnGetData');
end;

procedure TDBClientTest.BDEProviderUpdateData(Sender: TObject;
  DataSet: TClientDataSet);
begin
  LogEvent('OnUpdate');
end;

procedure TDBClientTest.BDEProviderUpdateError(Sender: TObject;
  DataSet: TClientDataSet; E: EUpdateError; UpdateKind: TUpdateKind;
  var Response: TResolverResponse);
begin
  LogEvent('OnUpdateError');
end;

procedure TDBClientTest.BDEProviderGetDataSetProperties(Sender: TObject;
  DataSet: TDataSet; out Properties: OleVariant);
begin
  LogEvent('OnGetDataSetProperties');
end;

procedure TDBClientTest.ClientDataAfterScroll(DataSet: TDataSet);
begin
  LogEvent('AfterScroll', DataSet);
end;

procedure TDBClientTest.ClientDataBeforeCancel(DataSet: TDataSet);
begin
  LogEvent('BeforeCancel');
end;

procedure TDBClientTest.ClientDataBeforeDelete(DataSet: TDataSet);
begin
  LogEvent('BeforeDelete', DataSet);
end;

procedure TDBClientTest.ClientDataBeforeEdit(DataSet: TDataSet);
begin
  LogEvent('BeforeEdit', DataSet);
end;

procedure TDBClientTest.ClientDataBeforeInsert(DataSet: TDataSet);
begin
  LogEvent('BeforeInsert', DataSet);
end;

procedure TDBClientTest.ClientDataBeforePost(DataSet: TDataSet);
begin
  LogEvent('BeforePost', DataSet);
end;

procedure TDBClientTest.ClientDataBeforeScroll(DataSet: TDataSet);
begin
  LogEvent('BeforeScroll', DataSet);
end;

procedure TDBClientTest.ClientDataCalcFields(DataSet: TDataSet);
begin
  LogEvent('OnCalcFields', DataSet);
end;

procedure TDBClientTest.ClientDataDeleteError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  LogEvent('OnDeleteError', DataSet);
end;

procedure TDBClientTest.ClientDataNewRecord(DataSet: TDataSet);
begin
  LogEvent('OnNewRecord', DataSet);
end;

procedure TDBClientTest.ClientDataAfterPost(DataSet: TDataSet);
begin
  LogEvent('AfterPost', DataSet);
end;

procedure TDBClientTest.ClientDataAfterInsert(DataSet: TDataSet);
begin
  LogEvent('AfterInsert', DataSet);
end;

procedure TDBClientTest.ClientDataAfterEdit(DataSet: TDataSet);
begin
  LogEvent('AfterEdit', DataSet);
end;

procedure TDBClientTest.ClientDataAfterDelete(DataSet: TDataSet);
begin
  LogEvent('AfterDelete', DataSet);
end;

procedure TDBClientTest.ClientDataAfterCancel(DataSet: TDataSet);
begin
  LogEvent('AfterCancel', DataSet);
end;

procedure TDBClientTest.DataSourceStateChange(Sender: TObject);
begin
  LogEvent('OnStateChange', Sender as TComponent);
end;

procedure TDBClientTest.DataSourceUpdateData(Sender: TObject);
begin
  LogEvent('OnUpdateData', Sender as TComponent);
end;

procedure TDBClientTest.TestButton1Click(Sender: TObject);
begin
  { Add your test code here }
end;

end.
 