unit dbxexplore;

interface

uses
  SysUtils, Types, Classes, QGraphics, QControls, QForms, QDialogs,
  QComCtrls, DB, SqlExpr, IniFiles, DBXpress, FMTBcd, DBClient, Provider,
  QExtCtrls, QDBCtrls, QGrids, QDBGrids, QDBLogDlg, QStdCtrls, QButtons,
  QTypes, QMenus;

const
  DriverLevel = 0;
  ConnectionLevel = 1;
  OpenConnLevel = 2;                          
  TableProcLevel = 3;
  OpenTableProcLevel = 4;
  ColArgTypeLevel = 5;
  SExplorerIni = './DbxExpl.ini';
  STables = 'Tables';                    { do not localize }
  SSysTables = 'System Tables';          { do not localize }
  SViews = 'Views';                      { do not localize }
  SSynonyms = 'Synonyms';                { do not localize }
  SIndices = 'Indexes';                  { do not localize }
  SProcedures = 'Procedures';            { do not localize }
  SADTS = 'ADTS';                        { do not localize }
  SARRAYS = 'ARRAYS';                    { do not localize }
  SGETARRAYS = 'GETARRAYS';              { do not localize }
  SGETARRAYINFO = 'GETARRAYINFO';        { do not localize }
  SDependencies = 'Dependencies';        { do not localize }
  SColumns = 'Columns';                  { do not localize }
  STypeInfo = 'Type Info';               { do not localize }
  SColumnName = 'COLUMN_NAME';           { do not localize }
  SColumnPosition = 'COLUMN_POSITION';   { do not localize }
  SColumnSize = 'COLUMN_LENGTH';         { do not localize }
  SColumnPrecision = 'COLUMN_PRECISION'; { do not localize }
  SColumnScale = 'COLUMN_SCALE';         { do not localize }
  SColumnType = 'COLUMN_DATATYPE';       { do not localize }
  SColumnSubtype = 'COLUMN_SUBTYPE';     { do not localize }
  SColumnNullable = 'COLUMN_NULLABLE';   { do not localize }
  SIndexName = 'INDEX_NAME';             { do not localize }
  STableName = 'TABLE_NAME';             { do not localize }
  SKeyName = 'PKEY_NAME';                { do not localize }
  SCheckConnectionKey = 'CheckConnection'; { do not localize }
  SConnectionErrorKey = 'ConnectionError'; { do not localize }
  SSortOrder = 'SORT_ORDER';             { do not localize }
  ColWidth = 6;
  ColBorder = 10;
  SArgTypes : array[0..4] of String =
    ('ptUnknown', 'ptInput', 'ptOutput', 'ptInputOutput', 'ptResult');

  SDataTypeMap: array[0..MAXLOGFLDTYPES - 1] of String = (
    'ftUnknown', 'ftString', 'ftDate', 'ftBlob', 'ftBoolean', 'ftSmallint',
    'ftInteger', 'ftFloat', 'ftBCD', 'ftBytes', 'ftTime', 'ftDateTime',
    'ftWord', 'ftInteger', 'ftUnknown', 'ftVarBytes', 'ftUnknown', 'ftCursor',
   'ftLargeInt', 'ftLargeInt', 'ftADT', 'ftArray', 'ftReference', 'ftDataSet', 'ftTimeStamp', 'ftFMTBcd');

  SBlobTypes: array[fldstMEMO..fldstBFILE] of String = (
    'ftMemo', 'ftBlob', 'ftFmtMemo', 'ftParadoxOle', 'ftGraphic', 'ftDBaseOle',
    'ftTypedBinary', 'ftBlob', 'ftBlob', 'ftBlob', 'ftBlob', 'ftOraClob', 'ftOraBlob',
    'ftBlob', 'ftBlob');

resourcestring

  SLogOnError = 'Failure to logon: check username/password';
  SEmpty = 'None';
  
type

  PDriverInfo = ^TDriverInfo;
  TDriverInfo = packed record
    SupportsProcedures: Boolean;
    SupportsViews: Boolean;
    SupportsSynonyms: Boolean;
    SupportsSysTables: Boolean;
    SupportsADTs: Boolean;
    SupportsArrays: Boolean;
    CheckConnection: Boolean;
  end;

  ADTDesc = packed record
    Name : String;
    TypeName : String;
    Length: Integer;
    Precision: SmallInt;
    Scale: SmallInt;
  end;  

  IDXDesc = packed record               { Field Descriptor }
    IdxNum         : Word;              { Field number (1..n) }
    IdxName         : String;           { Index name }
    TblName         : String;           { Table name }
    ColName         : String;           { Field name }
    KeyName         : String;           { Key Name }
    SortOrder       : String;           { Asc/Desc }
  end;

  TForm1 = class(TForm)
    TreeView1: TTreeView;
    SQLConnection1: TSQLConnection;
    SQLDataSet1: TSQLDataSet;
    DataSource1: TDataSource;
    DataSetProvider1: TDataSetProvider;
    ClientDataSet1: TClientDataSet;
    DBGrid1: TDBGrid;
    DBNavigator1: TDBNavigator;
    Button1: TButton;
    Memo1: TMemo;
    SpeedButton1: TSpeedButton;
    SQLDataSet2: TSQLDataSet;
    Label1: TLabel;
    DBImage1: TDBImage;
    DBMemo1: TDBMemo;
    procedure FormCreate(Sender: TObject);
    procedure TreeView1Expanded(Sender: TObject; Node: TTreeNode);
    procedure TreeView1DblClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure TreeView1Click(Sender: TObject);
    procedure Memo1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure Button1Click(Sender: TObject);
    procedure ClientDataSet1ReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure DBMemo1Exit(Sender: TObject);
    procedure DBImage1Exit(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure AddEmptyNode(Node: TTreeNode );
  private
    { Private declarations }
    FGridHeight: Integer;
    ConnectionCount: Integer;
    DriverInfo: Array of PDriverInfo;
    Connections: Array of TSqlConnection;
    DriverList: TStrings;
    ConnectionList: TStrings;
    procedure ActivateBlob(Field: TBlobField);
    function AddADTList(Node: TTreeNode): Boolean;
    function AddADTDependInfo(Node, N: TTreeNode; Ini: TIniFile): Boolean;
    function AddADTColTypeInfo(Node, N: TTreeNode; Ini: TIniFile): Boolean;
    function AddArrayColAndDependInfo(Node: TTreeNode): Boolean;
    function AddArrayList(Node: TTreeNode): Boolean;
    function AddAdtColAndDependInfo(Node: TTreeNode): Boolean;
    function AddAliases(Node: TTreeNode): Boolean;
//    function AddArrayStructure(Node: TTreeNode): Boolean;
    function AddArrayTypeInfo(Node, N: TTreeNode; Ini: TIniFile): Boolean;
    function AddColTypeInfo(Node: TTreeNode): Boolean;
    function AddColArgTypeInfo(Node: TTreeNode): Boolean;
    function AddIdxTypeInfo(Node: TTreeNode): Boolean;
    procedure AddTableList(Node: TTreeNode; Scope: TTableScopes; ReplaceFirst: Boolean = False);
    function AddTableProcStructure(Node: TTreeNode): Boolean;
    function AddTableProcMetaData(Node: TTreeNode): Boolean;
    function AddTableMetaData(Node: TTreeNode): Boolean;
    function AddTableStructure(Node: TTreeNode): Boolean;
    function AddProcedureList(Node: TTreeNode): Boolean;
    function AddProcParamStructure(Node: TTreeNode): Boolean;
    procedure AddArgTypes(Node: TTreeNode; List: TList; I: Integer);
    procedure CheckLevel;
    procedure CloseDataSet;
    procedure GetArrayList(Node: TTreeNode; List: TStrings);
    procedure GetADTList(Node: TTreeNode; List: TStrings);
    procedure GetColumnInfo(Node: TTreeNode; const TableName, FieldName: string; var AField: FLDDesc);
    procedure GetIndexInfo(DS: TSQLDataSet; var AIdx: IDXDesc);
    procedure GetNextADTColumnInfo(DS: TDataSet; var AField: ADTDesc);
    procedure OpenClientDataSet;
    procedure CheckConnection(Connection: TSQLConnection);
    function OpenConnection(Node: TTreeNode): Boolean;
    procedure OpenDataSet(Node: TTreeNode);
    procedure SetDBControlsVisible(Value: Boolean);
  public
    ThreadActive: Boolean;
    NodeExpanded: TTreeNode;
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses DbxRecError;

{$R *.xfm}

function GetConnection(SQLConnection: TSQLConnection): TSQLConnection;
begin
  if (SQLConnection.MaxStmtsPerConn > 0) and (SQLConnection.ActiveStatements >= SQLConnection.MaxStmtsPerConn) then
    Result := SQLConnection.CloneConnection
  else
    Result := SQLConnection;
end;

procedure TForm1.CloseDataSet;
begin
  Label1.Caption := '';
  ClientDataSet1.Close;
  SqlDataSet1.Close;
  SetDBControlsVisible(False);
end;

procedure TForm1.OpenDataSet(Node: TTreeNode);
begin
  try
    ClientDataSet1.Active := False;
    SQLDataSet1.Active := False;
    SQLDataSet1.SQLConnection := TSQLConnection(Node.Parent.Parent.Data);
    SQLDataSet1.CommandType := ctTable;
    SQLDataSet1.CommandText := Node.Text;
    if PDriverInfo(Node.Parent.Parent.Parent.Data).SupportsADTs then
      SQLDataSet1.ObjectView := True
    else
      SQLDataSet1.ObjectView := False;
    OpenClientDataSet;
  except
    CloseDataSet;
  end;
end;


procedure TForm1.SetDBControlsVisible(Value: Boolean);
begin
  DBGrid1.Visible := Value;
  DBNavigator1.Visible := Value;
  Button1.Visible := Value;
end;

procedure TForm1.OpenClientDataSet;
begin
  Label1.Caption := SqlDataSet1.CommandText;
  ClientDataSet1.Active := True;
  SetDBControlsVisible(True);
  DBGrid1.Left := TreeView1.Width + TreeView1.Left;
  DBGrid1.Width := DBNavigator1.Width + Button1.Width;
  DBNavigator1.Left := DBGrid1.Left;
  DBGrid1.Visible := True;
  if ClientDataSet1.RecordCount = 0 then
    DBGrid1.Height := 100 + 17
  else
    DBGrid1.Height := (100 + ClientDataset1.RecordCount *17);
  if DBGrid1.Height + DBGrid1.Top > Memo1.Top then
    DBGrid1.Height := (Memo1.Top - DBGrid1.Top);
  FGridHeight := DBGrid1.Height;  
  Button1.Visible := True;
  if ColBorder + (ClientDataSet1.RecordSize * ColWidth) > DBGrid1.Width then
  begin
    DBGrid1.Width := ColBorder + (ClientDataSet1.RecordSize * ColWidth);
  end;
  Button1.Left := DBNavigator1.Left + DBNavigator1.Width;
end;


procedure TForm1.AddTableList(Node: TTreeNode; Scope: TTableScopes; ReplaceFirst: Boolean = False);
var
  List: TStrings;
  I : Integer;
  SQLConnection: TSQLConnection;
begin
  if ReplaceFirst then
    if Node.GetFirstChild.Text <> SEmpty then exit;
  SQLConnection := TSQLConnection(Node.Parent.Data);
  List := TStringList.Create;
  try
    SQLConnection.TableScope := Scope;
    SQLConnection.GetTableNames(List);
    for I := 0 to List.Count -1 do
    begin
      if (I = 0) and ReplaceFirst then
        Node.GetFirstChild.Text := List.Strings[I]
      else
        TreeView1.Items.AddChildObject(Node, List.Strings[I], nil);
    end
  finally
    List.Free;
  end;
end;

function TForm1.AddProcedureList(Node: TTreeNode): Boolean;
var
  List: TStrings;
  I : Integer;
  N: TTreeNode;
  SQLConnection: TSQLConnection;
begin
  Result := True;
  if Node <> nil then
  begin
    if Node.getFirstChild.Text <> SEmpty then exit;
    SQLConnection := TSQLConnection(Node.Parent.Data);
    List := TStringList.Create;
    try
      SQLConnection.GetProcedureNames(List);
      for I := 0 to List.Count -1 do
      begin
        if I = 0 then
        begin
          Node.getFirstChild.Text := List.Strings[I];
          TreeView1.Items.AddChildObject(Node.getFirstChild, SEmpty, nil);
        end else
        begin
          N := TreeView1.Items.AddChildObject(Node, List.Strings[I], nil);
          TreeView1.Items.AddChildObject(N, SEmpty, nil);
        end;
      end;
    finally
      List.Free;
    end;
  end;
end;

procedure TForm1.CheckConnection(Connection: TSQLConnection);
var
  Ini: TMemIniFile;
  ExpError: string;
begin
  Ini := TMemIniFile.Create(SExplorerIni);
  try
     ExpError := Ini.ReadString( Connection.DriverName, SConnectionErrorKey, '' );
    try
      Connection.ExecuteDirect(Ini.ReadString(Connection.DriverName, SCheckConnectionKey, '' ))
    except
      on E: Exception do
        if pos(ExpError, E.Message) > 0 then
          DatabaseError(SLogonError);
    end;
  finally
    Ini.Free;
  end;
end;

function TForm1.AddADTList(Node: TTreeNode): Boolean;
var
  List: TStrings;
  I : Integer;
  N: TTreeNode;
begin
  Result := True;
  if Node <> nil then
  begin
    if Node.getFirstChild.Text <> SEmpty then exit;
    List := TStringList.Create;
    try
      GetADTList(Node, List);
      for I := 0 to List.Count -1 do
      begin
        if I = 0 then
        begin
          Node.getFirstChild.Text := List.Strings[I];
          TreeView1.Items.AddChildObject(Node.GetFirstChild, SColumns, nil);
          TreeView1.Items.AddChildObject(Node.GetFirstChild, SDependencies, Nil);
//          AddEmptyNode(Node.getFirstChild);
        end else
        begin
          N := TreeView1.Items.AddChildObject(Node, List.Strings[I], nil);
          TreeView1.Items.AddChildObject(N, SColumns, nil);
          TreeView1.Items.AddChildObject(N, SDependencies, Nil);
        end;
      end;
    finally
      List.Free;
    end;  
  end;
end;

procedure TForm1.GetNextADTColumnInfo(DS: TDataSet; var AField: ADTDesc);
begin
  AField.Name := DS.Fields[0].AsString;
  AField.TypeName := DS.Fields[1].AsString;
  AField.Length := DS.Fields[2].AsInteger;
  AField.Precision := DS.Fields[3].AsInteger;
  AField.Scale := DS.Fields[4].AsInteger;
  DS.Next;
end;

function TForm1.AddArrayList(Node: TTreeNode): Boolean;
var
  List: TStrings;
  I : Integer;
  N: TTreeNode;
begin
  Result := True;
  if Node.GetFirstChild = nil then exit;
  if Node.GetFirstChild.Text <> SEmpty then exit;
  List := TStringList.Create;
  try
    GetArrayList(Node, List);
    for I := 0 to List.Count -1 do
      if I = 0 then
      begin
        Node.GetFirstChild.Text := List.Strings[I];
        TreeView1.Items.AddChildObject(Node.GetFirstChild, SColumns, nil);
        TreeView1.Items.AddChildObject(Node.GetFirstChild, SDependencies, Nil);
      end else
      begin
        N := TreeView1.Items.AddChildObject(Node, List.Strings[I], nil);
        TreeView1.Items.AddChildObject(N, SColumns, nil);
        TreeView1.Items.AddChildObject(N, SDependencies, Nil);
      end;
  finally;
    List.Free;
  end;
end;

function TForm1.OpenConnection(Node: TTreeNode): Boolean;
var
  SQLConnection : TSQLConnection;
  N: TTreeNode;
  DrInfo: PDriverInfo;
begin
  SQLConnection := TSQLConnection(Node.Data);
  if Node.getFirstChild.getFirstChild = nil then
  begin
    try
      CloseDataSet;
      SQLConnection.LoadParamsOnConnect := True;
      SQLConnection.LoginPrompt := True;
      SQLConnection.ConnectionName := Node.Text;
      SQLConnection.Connected := True;
      if SQLConnection.Connected then
      begin
        N := Node.GetFirstChild;
        DrInfo := PDriverInfo(Node.Parent.Data);
        If DrInfo.CheckConnection then
          CheckConnection(SQLConnection);
        AddTableList(N, [tsTable]);
        if DrInfo.SupportsSysTables then
        begin
          N := Node.GetNextChild(N);
          AddEmptyNode(N);
        end;
        if DrInfo.SupportsViews then
        begin
          N := Node.GetNextChild(N);
          AddEmptyNode(N);
        end;
        if DrInfo.SupportsSynonyms then
        begin
          N := Node.GetNextChild(N);
          AddEmptyNode(N);
        end;
        if DrInfo.SupportsProcedures then
        begin
          N := Node.GetNextChild(N);
          AddEmptyNode(N);
        end;
        if DrInfo.SupportsADTS then
        begin
          N := Node.GetNextChild(N);
          AddEmptyNode(N);
        end;
        if DrInfo.SupportsArrays then
        begin
          N := Node.GetNextChild(N);
          AddEmptyNode(N);
        end;
      end;
    Except
      On E : Exception do
      begin
        MessageDlg( E.Message, mtError, [mbOK], 0 );
        SQLConnection.ConnectionName := '';
      end;
    end;
  end;
  Result := SqlConnection.Connected;
end;

procedure TForm1.AddEmptyNode(Node: TTreeNode );
begin
  if Node.GetFirstChild = nil then
    TreeView1.Items.AddChildObject(Node, SEmpty, nil);
end;

procedure TForm1.AddArgTypes(Node: TTreeNode; List: TList; I: Integer);
begin
  TreeView1.Items.AddChildObject(Node, 'ParamNum : ' + IntToStr(pSPParamDesc(List.Items[I]).iParamNum), nil);
  TreeView1.Items.AddChildObject(Node, 'ArgType : ' + SArgTypes[integer(pSPParamDesc(List.Items[I]).iArgType)], nil);
  TreeView1.Items.AddChildObject(Node, 'DataType : ' + SDataTypeMap[integer(pSPParamDesc(List.Items[I]).iDataType)], nil);
  TreeView1.Items.AddChildObject(Node, 'Length : ' + IntToStr(pSPParamDesc(List.Items[I]).iLen), nil);
  TreeView1.Items.AddChildObject(Node, 'Units1 : ' + IntToStr(pSPParamDesc(List.Items[I]).iUnits1), nil);
  TreeView1.Items.AddChildObject(Node, 'Units2 : ' + IntToStr(pSPParamDesc(List.Items[I]).iUnits2), nil);
end;

function TForm1.AddProcParamStructure(Node: TTreeNode): Boolean;
var
  N: TTreeNode;
  List: TList;
  I: Integer;
  SQLConnection: TSQLConnection;
begin
  Result := True;
  if Node <> nil then
  begin
    if Node.GetFirstChild = nil then exit;
    if Node.getFirstChild.Text <> SEmpty then exit;
    SQLConnection := TSQLConnection(Node.Parent.Parent.Data);
    List := TList.Create;
    try
      SQLConnection.GetProcedureParams(Node.Text, List);
      for I := 0 to List.Count -1 do
      begin
        if I = 0 then
        begin
          Node.GetFirstChild.Text := PSPParamDesc(List.Items[I]).szName;
          AddArgTypes(Node.GetFirstChild, List, I);
        end else
        begin
          N := TreeView1.Items.AddChildObject(Node, PSPParamDesc(List.Items[I]).szName, nil );
          AddArgTypes(N, List, I);
        end;
      end;
    finally
      List.Free;
    end;
  end;
end;

function TForm1.AddTableStructure(Node: TTreeNode): Boolean;
var
  N: TTreeNode;
begin
  if Node.Text = SSysTables then
    AddTableList(Node, [tsSysTable], True)
  else if Node.Text = SViews then
    AddTableList(Node, [tsView], True)
  else if Node.Text = SSynonyms then
    AddTableList(Node, [tsSynonym], True);
  N := Node.getFirstChild;
  repeat
    if N.GetFirstChild = nil then
    begin
      TreeView1.Items.AddChildObject(N, SColumns, nil);
      TreeView1.Items.AddChildObject(N, SIndices, nil);
    end;
    N := Node.GetNextChild(N);
  until not Assigned(N);
  Result := True;
end;

function TForm1.AddTableProcStructure(Node: TTreeNode): Boolean;
begin
  Result := True;
  if (Node.Text = sTables) or (Node.Text = sSysTables) or
     (Node.Text = sViews) or (Node.Text = sSynonyms) then
    Result := AddTableStructure(Node)
  else if Node.Text = sProcedures then
    Result := AddProcedureList(Node)
  else if Node.Text = sADTS then
    Result := AddADTList(Node)
  else if Node.Text = sARRAYS then
    Result := AddArrayList(Node);
end;


(*function TForm1.AddArrayStructure(Node: TTreeNode): Boolean;
var
  N: TTreeNode;
begin
  Result := True;
  N := Node.getFirstChild;
  if N.getFirstChild = nil then
  repeat
    TreeView1.Items.AddChildObject(N, STypeInfo, nil);
    TreeView1.Items.AddChildObject(N, SDependencies, Nil);
    N := Node.GetNextChild(N);
  until N = nil;
end;*)

procedure TForm1.GetColumnInfo(Node: TTreeNode; const TableName, FieldName: string; var AField: FLDDesc);
var
  DS : TSQLDataSet;
  FldName : PChar;
  I : Integer;
  SQLConnection: TSqlConnection;
begin
  SQLConnection := TSQLConnection(Node.Data);
  if SQLConnection.Connected then
  begin
    DS := TSQlDataSet.Create(nil);
    DS.SQLConnection := GetConnection(SQLConnection);
    DS.SetSchemaInfo(stColumns, TableName, FieldName);
    try
      DS.Open;
      if not DS.eof then
      begin
        FldName := PChar(DS.FieldByName(SColumnName).AsString);
        // todo: find right syntax
        for I := 0 to strlen(FldName)  do
          AField.szName[I] := FldName[I];
        AField.iLen := DS.FieldByName(SColumnSize).AsInteger;
        AField.iUnits1 := DS.FieldByName(SColumnPrecision).AsInteger;
        AField.iUnits2 := DS.FieldByName(SColumnScale).AsInteger;
        AField.iFldNum := DS.FieldByName(SColumnPosition).AsInteger;
        AField.iFldType := DS.FieldByName(SColumnType).AsInteger;
        AField.iSubType := DS.FieldByName(SColumnSubtype).AsInteger;
      end;
    finally
      DS.free;
    end;
  end;
end;

function TForm1.AddColTypeInfo(Node: TTreeNode): Boolean;
var
  FldInfo: FLDDesc;
  N: TTreeNode;
begin
  if Node.Parent.Parent.Text = SADTS then
    Result := AddADTColandDependInfo(Node)
  else if Node.Parent.Parent.Text = SARRAYS then
    Result := AddARRAYColAndDependInfo(Node)
  else begin
    N := Node.getFirstChild;
    if N.getFirstChild = nil then
    repeat
      GetColumnInfo(Node.Parent.Parent.Parent, Node.Parent.Text, N.Text, FldInfo);
      TreeView1.Items.AddChildObject(N, 'Col Name: ' + FLDInfo.szName, nil);
      TreeView1.Items.AddChildObject(N, 'Col Pos: ' + IntToStr(FLDInfo.iFldNum), nil);
      if FLDInfo.iSubType = 0 then
        TreeView1.Items.AddChildObject(N, 'Col Type: ' + SDataTypeMap[FLDInfo.iFldType], nil)
      else if FLDInfo.iFldType = fldBLOB then
        TreeView1.Items.AddChildObject(N, 'Col Type: ' + SBlobTypes[FLDInfo.iSubType],nil)
      else if FLDInfo.iFldType = fldZSTRING then
        TreeView1.Items.AddChildObject(N, 'Col Type: ftFixedChar', nil)
      else
        TreeView1.Items.AddChildObject(N, 'Col Type: ftUnknown', nil);
      TreeView1.Items.AddChildObject(N, 'Col Len: ' + IntToStr(FLDInfo.iLen), nil);
      TreeView1.Items.AddChildObject(N, 'Col Precision: ' + IntToStr(FLDInfo.iUnits1), nil);
      TreeView1.Items.AddChildObject(N, 'Col Scale: ' + IntToStr(FLDInfo.iUnits2), nil);
      N := Node.GetNextChild(N);
    until N = nil;
    Result := True;
  end;
end;

procedure TForm1.GetIndexInfo(DS: TSQLDataSet; var AIdx: IDXDesc);
begin
  AIDX.IdxNum := DS.FieldByName(SColumnPosition).AsInteger;
  AIDX.IdxName := DS.FieldByName(SIndexName).AsString;
  AIDX.ColName := DS.FieldByName(SColumnName).AsString;
  AIDX.KeyName := DS.FieldByName(SKeyName).AsString;
  AIDX.TblName := DS.FieldByName(STableName).AsString;
  AIDX.SortOrder := DS.FieldByName(SSortOrder).AsString;
end;

function TForm1.AddIdxTypeInfo(Node: TTreeNode): Boolean;
var
  DS : TSQLDataSet;
  SQLConnection: TSqlConnection;
  IDXInfo: IDXDesc;
  SaveIDXInfo: array of IDXDesc;
  I, SaveIDXCount: Integer;
  N, NN: TTreeNode;
begin
  N := Node.getFirstChild;
  SQLConnection := TSQLConnection(Node.Parent.Parent.Parent.Data);
  if (N.getFirstChild = nil) and SQLConnection.Connected then
  begin
    DS := TSQlDataSet.Create(nil);
    DS.SQLConnection := GetConnection(SQLConnection);
    DS.SetSchemaInfo(stIndexes, Node.Parent.Text, '');
    try
      SaveIDXCount := 0;
      DS.Open;
      while not DS.eof do
      begin
        GetIndexInfo(DS, IDXInfo);
        if (N <> nil) and (N.Text = IDXInfo.IdxName) then
        begin
          TreeView1.Items.AddChildObject(N, 'Index Pos: ' + IntToStr(IDXInfo.IdxNum), nil);
          TreeView1.Items.AddChildObject(N, 'Index Name: ' + IDXInfo.IdxName, nil);
          TreeView1.Items.AddChildObject(N, 'Column Name: ' + IDXInfo.ColName, nil);
          TreeView1.Items.AddChildObject(N, 'Primary Key Name: ' + IDXInfo.KeyName, nil);
          TreeView1.Items.AddChildObject(N, 'Asc/Desc: ' + IDXInfo.SortOrder, nil);
          N := Node.GetNextChild(N);
        end else
        begin   // duplicate index names, different fields
          Inc(SaveIdxCount);
          SetLength(SaveIdxInfo, SaveIdxCount);
          SaveIdxInfo[SaveIdxCount-1].ColName := IdxInfo.ColName;
          SaveIdxInfo[SaveIdxCount-1].IdxName := IdxInfo.IdxName;
        end;
        DS.next;
      end;
    finally
      DS.free;
    end;
    if SaveIdxCount > 0 then
    begin
      I := 0;
      N := Node.getFirstChild;
      repeat
        while (I < SaveIdxCount) and (SaveIdxInfo[I].IdxName = N.Text) do
        begin
          NN := N.GetNextChild(N.GetNextChild(N.GetFirstChild));
          NN.Text := NN.Text + ';' + SaveIdxInfo[I].ColName;
          Inc(I);
        end;
        N := Node.GetNextChild(N);
      until (N = nil) or (I = SaveIdxCount);
      SetLength(SaveIdxInfo, 0);
    end;
  end;
  Result := True;
end;

function TForm1.AddColArgTypeInfo(Node: TTreeNode): Boolean;
begin
  Result := True;
  if (Node.Text = SColumns) and ((Node.Parent.Parent.Text <> SADTs) and
      (Node.Parent.Parent.Text <> SARRAYS)) then
    Result := AddColTypeInfo(Node)
  else if Node.Text = SIndices then
    Result := AddIdxTypeInfo(Node)
end;


function TForm1.AddTableMetaData(Node: TTreeNode): Boolean;
var
  List: TStrings;
  I : Integer;
  N: TTreeNode;
  SQLConnection: TSQLConnection;
begin
  N := Node.getFirstChild;
  if N.getFirstChild = nil then
  begin
    SQLConnection := TSQLConnection(Node.Parent.Parent.Data);
    List := TStringList.Create;
    SQLConnection.GetFieldNames(Node.Text, List);
    for I := 0 to List.Count -1 do
      TreeView1.Items.AddChildObject(N, List.Strings[I], nil);
    List.Clear;
    N := Node.GetNextChild(N);
    SQLConnection.GetIndexNames(Node.Text, List);
    for I := 0 to List.Count -1 do
      TreeView1.Items.AddChildObject(N, List.Strings[I], nil);
    List.Free;
  end;
  Result := True;
end;

function TForm1.AddTableProcMetaData(Node: TTreeNode): Boolean;
begin
  Result := True;
  if (Node.Parent.Text = sTables) or (Node.Parent.Text = sSysTables) or
     (Node.Parent.Text = sViews) or (Node.Parent.Text = sSynonyms) then
    Result := AddTableMetaData(Node)
  else if Node.Parent.Text = sProcedures then
    AddProcParamStructure(Node)
  else
  if Node.Parent.Text = SADTS then
    Result := AddADTColAndDependInfo(Node)
  else if Node.Parent.Text = SARRAYS then
    Result := AddArrayColAndDependInfo(Node)
end;

function TForm1.AddADTColandDependInfo(Node: TTreeNode): Boolean;
var
  Ini: TIniFile;
  N: TTreeNode;
begin
  N := Node.GetFirstChild;
  if N.GetFirstChild = nil then
  begin
    Ini := TIniFile.Create(SExplorerIni);
    try
      AddADTColTypeInfo(Node, N, Ini);
      AddADTDependInfo(Node, N, Ini);
    finally
      Ini.Free;
    end;
  end;
  Result := True;
end;

function TForm1.AddArrayColAndDependInfo(Node: TTreeNode): Boolean;
var
  Ini: TIniFile;
  N: TTreeNode;
begin
  Result := True;
  N := Node.GetFirstChild;
  if N = nil then exit;
  if N.Text <> SEmpty then
  begin
    Ini := TIniFile.Create(SExplorerIni);
    try
      AddArrayTypeInfo(Node, N, Ini);
      AddADTDependInfo(Node, N, Ini);
    finally
      Ini.Free;
    end;
  end;
  Result := True;
end;

function TForm1.AddArrayTypeInfo(Node, N: TTreeNode; Ini: TIniFile): Boolean;
var
  DS : TSQLDataSet;
  SQLConnection: TSqlConnection;
  Query: string;
begin
  SQLConnection := TSQLConnection(Node.Parent.Parent.Data);
  if SQLConnection.Connected then
  begin
    DS := TSQlDataSet.Create(nil);
    DS.SQLConnection := GetConnection(SQLConnection);
    Query := Node.Text;
    DS.CommandText := Format(Ini.ReadString(DS.SQLConnection.DriverName,
                      SGETARRAYINFO, ''), [Query]);
    try
      DS.Open;
      while not DS.Eof do
      begin
        TreeView1.Items.AddChildObject(N, 'Array of ' + IntToStr(DS.Fields[1].AsInteger) + ' elements', nil);
        TreeView1.Items.AddChildObject(N, 'of type ' + DS.Fields[2].AsString + '(' +
                  IntToStr(DS.Fields[3].AsInteger) + ')', nil);
        DS.Next;
      end;
    finally
      DS.Free;
    end;
  end;
  Result := True;
end;

function TForm1.AddADTDependInfo(Node, N: TTreeNode; Ini: TIniFile): Boolean;
var
  DS : TSQLDataSet;
  SQLConnection: TSqlConnection;
  ADTName: String;
begin
  N := N.getNextSibling;
  SQLConnection := TSQLConnection(Node.Parent.Parent.Data);
  if SQLConnection.Connected then
  begin
    DS := TSQlDataSet.Create(nil);
    DS.SQLConnection := GetConnection(SQLConnection);
    ADTName := Node.Text;
    DS.CommandText := Format(Ini.ReadString(DS.SQLConnection.DriverName,
                      'GETDEPEND', ''), [ADTName]);
    try
      DS.Open;
      while not DS.Eof do
      begin
        TreeView1.Items.AddChildObject(N, DS.Fields[0].AsString + ' (' +
                  DS.Fields[1].AsString + ')', nil);
        DS.Next;
      end;
    finally
      DS.Free;
    end;
  end;
  Result := True;
end;

function TForm1.AddADTColTypeInfo(Node, N: TTreeNode; Ini: TIniFile): Boolean;
var
  ADTInfo: ADTDesc;
  NNew: TTreeNode;
  DS : TSQLDataSet;
  SQLConnection: TSqlConnection;
  ADTName: String;
begin
  SQLConnection := TSQLConnection(Node.Parent.Parent.Data);
  if SQLConnection.Connected then
  begin
    DS := TSQlDataSet.Create(nil);
    DS.SQLConnection := GetConnection(SQLConnection);
    ADTName := Node.Text;
    DS.CommandText := Format(Ini.ReadString(DS.SQLConnection.DriverName,
                      'GetADTColumns', ''), [ADTName]);
    try
      DS.Open;
      while not DS.Eof do
      begin
        GetNextAdtColumnInfo(DS, ADTInfo);
        NNew := TreeView1.Items.AddChildObject(N, ADTInfo.Name, nil);
        TreeView1.Items.AddChildObject(NNew, 'Type: ' + ADTInfo.TypeName, nil);
        TreeView1.Items.AddChildObject(NNew, 'Col Len: ' + IntToStr(ADTInfo.Length), nil);
        TreeView1.Items.AddChildObject(NNew, 'Col Precision: ' + IntToStr(ADTInfo.Precision), nil);
        TreeView1.Items.AddChildObject(NNew, 'Col Scale: ' + IntToStr(ADTInfo.Scale), nil);
      end;
    finally
      DS.Free;
    end;
  end;
  Result := True;
end;

function GetDriverInfo(Driver: string; var Info: TDRIVERInfo): Boolean;
var
  Ini : TMemIniFile;
begin
  Result := True;
  Ini := TMemIniFile.Create(SExplorerIni);
  try
    if uppercase(Ini.ReadString(Driver,SProcedures,'False')) = 'TRUE' then
      Info.SupportsProcedures := True;
    if uppercase(Ini.ReadString(Driver, SViews,'False')) = 'TRUE' then
      Info.SupportsViews := True;
    if uppercase(Ini.ReadString(Driver, SSynonyms,'False')) = 'TRUE' then
      Info.SupportsSynonyms := True;
    if uppercase(Ini.ReadString(Driver, SSysTables,'False')) = 'TRUE' then
      Info.SupportsSysTables := True;
    if uppercase(Ini.ReadString(Driver, SCheckConnectionKey,'')) <> '' then
      Info.CheckConnection := True;
    if uppercase(Ini.ReadString(Driver, SADTS,'False')) = 'TRUE' then
      if Ini.ReadString(Driver,'GetADTS', '') <> '' then
        Info.SupportsADTs := True;
    if uppercase(Ini.ReadString(Driver, SArrays, 'False')) = 'TRUE' then
      if Ini.ReadString(Driver, SGETARRAYS, '') <> '' then
        Info.SupportsArrays := True;
  finally
    Ini.Free;
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
var
  I, J: Integer;
begin
  SetDBControlsVisible(False);
  ConnectionCount := 0;
  DriverList := TStringList.Create;
  try
    ConnectionList := TStringList.Create;
    try
      GetDriverNames(DriverList);
      SetLength(DriverInfo, DriverList.Count);
      for I := 0 to DriverList.Count -1 do
      begin
        DriverInfo[I] := AllocMem(SizeOf(TDriverInfo));
        GetDriverInfo(DriverList.Strings[I],DriverInfo[I]^);
        TreeView1.Items.AddChildObject(TreeView1.Items[0], DriverList[I], Pointer(DriverInfo[I]));
        GetConnectionNames(ConnectionList, DriverList[I]);
        for J := 0 to ConnectionList.Count -1 do
        begin
          SetLength( Connections, ConnectionCount+1 );
          Connections[ConnectionCount] := TSqlConnection.create(Self);
          TreeView1.Items.AddChildObject(TreeView1.Items[0].GetLastChild,ConnectionList.Strings[J], Pointer(Connections[i]));
          Inc(ConnectionCount);
        end;
      end;
    except
      FreeAndNil(ConnectionList);
      FreeAndNil(DriverList);
    end;
  except
    FreeAndNil(DriverList);
  end;
  Memo1.Visible := False;
  SpeedButton1.Visible := False;
end;

function TForm1.AddAliases(Node: TTreeNode): Boolean;
var
  N: TTreeNode;
begin
  N := Node.getFirstChild;
  repeat
    if N.GetFirstChild = nil then
    begin
      TreeView1.Items.AddChildObject(N, STables, nil);
      if PDriverInfo(Node.Data).SupportsSysTables then
        TreeView1.Items.AddChildObject(N, SSysTables, nil);
      if PDriverInfo(Node.Data).SupportsViews then
        TreeView1.Items.AddChildObject(N, SViews, nil);
      if PDriverInfo(Node.Data).SupportsSynonyms then
        TreeView1.Items.AddChildObject(N, SSynonyms, nil);
      if PDriverInfo(Node.Data).SupportsProcedures then
        TreeView1.Items.AddChildObject(N, SProcedures, nil);
      if PDriverInfo(Node.Data).SupportsADTS then
        TreeView1.Items.AddChildObject(N, SADTS, nil);
      if PDriverInfo(Node.Data).SupportsArrays then
        TreeView1.Items.AddChildObject(N, SARRAYS, nil);
    end;
    N := Node.GetNextChild(N);
  until not Assigned(N);
  Result := True;
end;

procedure TForm1.TreeView1Expanded(Sender: TObject; Node: TTreeNode);
var
  Level: Integer;
begin
  NodeExpanded := Node;
  Level := Node.Level;
  case Level of
    ConnectionLevel: AddAliases(Node);
    OpenConnLevel: OpenConnection(Node);
    TableProcLevel: AddTableProcStructure(Node);
    OpenTableProcLevel:  AddTableProcMetadata(Node);
    ColArgTypeLevel:  AddColArgTypeInfo(Node);
  end;
  CheckLevel;
end;

procedure TForm1.TreeView1DblClick(Sender: TObject);
var
  N: TTreeNode;
begin
  N := TTreeView(Sender).Selected;
  if N.Level = OpenTableProcLevel then
  begin
    if (N.Parent.Text = STables) or (N.Parent.Text = sSysTables) or
     (N.Parent.Text = sViews) or (N.Parent.Text = sSynonyms) then
       OpenDataSet(N)
    else
       CloseDataSet;
  end;
end;

procedure TForm1.GetADTList(Node: TTreeNode; List: TStrings);
var
  DS: TSqlDataSet;
  Ini: TIniFile;
begin
  Ini := TIniFile.Create(SExplorerIni);
  DS := TSqlDataSet.Create(nil);
  try
    DS.SQLConnection := TSQLConnection(Node.Parent.Data);
    DS.CommandText := Ini.ReadString(DS.SqlConnection.DriverName,
                      'GetADTS', '');
    DS.Active := True;
    List.BeginUpdate;
    try
      while not DS.eof do
      begin
        List.Add(DS.Fields[0].AsString);
        DS.next;
      end;
    finally
      List.EndUpdate;
    end;
  finally
    DS.Free;
  end;
end;

procedure TForm1.GetArrayList(Node: TTreeNode; List: TStrings);
var
  DS: TSqlDataSet;
  Ini: TIniFile;
begin
  Ini := TIniFile.Create(SExplorerIni);
  DS := TSqlDataSet.Create(nil);
  try
    DS.SQLConnection := TSQLConnection(Node.Parent.Data);
    DS.CommandText := Ini.ReadString(DS.SqlConnection.DriverName,
                      SGETARRAYS, '');
    DS.Active := True;
    List.BeginUpdate;
    try
      while not DS.eof do
      begin
        List.Add(DS.Fields[0].AsString);
        DS.next;
      end;
    finally
      List.EndUpdate;
    end;
  finally
    DS.Free;
  end;
end;

function GetStringFromStringList( Strings: TStrings ): String;
var
  I : Integer;
begin
  Result := '';
  for I := 0 to Strings.Count -1 do
    Result := Result + Strings[I];
end;

procedure TForm1.SpeedButton1Click(Sender: TObject);
const
  SSelect = 'select';
var
  N: TTreeNode;
//  RowsAffected: Integer;
  SQL: String;
begin
  N := TreeView1.Selected;
  SQL := GetStringFromStringList(Memo1.Lines);
  if (N.Level >= OpenConnLevel) and (Trim(SQL) <> '') then
  begin
     while N.Level <> OpenConnLevel do
       N := N.Parent;
     if TSQLConnection(N.Data).Connected then
     begin
       SQLDataSet1.CommandType := ctQuery;
       try
         begin
           if Pos(SSelect, LowerCase(SQL)) > 0 then
           begin
             CloseDataSet;
             SQLDataSet1.SQLConnection := GetConnection(TSQLConnection(N.Data));
             SQLDataSet1.CommandText := SQL;
//	     RowsAffected := 0;
             OpenClientDataSet;
           end else
           begin
             SQLDataSet2.SQLConnection := GetConnection(TSQLConnection(N.Data));
             SQLDataSet2.CommandText := SQL;
//             RowsAffected := SQLDataSet2.ExecSql(True);
             SQLDataSet2.ExecSql(True);
           end;
         end;
       except
         on e: Exception do
           MessageDlg( E.Message + ' from query ' + SQL, mtError, [mbOK], 0 );
       end;
     end;
  end;
end;

procedure TForm1.CheckLevel;
var
  N: TTreeNode;
begin
  N := TreeView1.Selected;
  Memo1.Visible := (N.Level >= OpenConnLevel);
  SpeedButton1.Visible := Memo1.Visible;
end;

procedure TForm1.TreeView1Click(Sender: TObject);
begin
  CheckLevel;
end;

procedure TForm1.Memo1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if ssCtrl in Shift then
    if Key in [Word('E'), Word('e')] then
      SpeedButton1Click(Sender);
end;

procedure TForm1.ActivateBlob(Field: TBlobField);
begin
  if Field.BlobType in [ftGraphic, ftBlob, ftOraBlob] then
  begin
    try
      DBImage1.DataField := Field.FieldName;
      DBGrid1.Height := DBImage1.Top - DBGrid1.Top;
      DBImage1.Visible := True;
      DBImage1.SetFocus;
    except
      DBMemo1.DataField := Field.FieldName;
      DBGrid1.Height := DBMemo1.Top - DBGrid1.Top;
      DBMemo1.Visible := True;
      DBMemo1.SetFocus;
    end;
  end else
  begin
     DBMemo1.DataField := Field.FieldName;
     DBGrid1.Height := DBMemo1.Top - DBGrid1.Top;
     DBMemo1.Visible := True;
     DBMemo1.SetFocus;
  end;
end;

procedure TForm1.DBGrid1CellClick(Column: TColumn);
begin
  if Column.Field.DataType in [ftBlob, ftMemo, ftGraphic] then
    ActivateBlob(TBlobField(Column.Field));
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  if ClientDataSet1.Active then
    ClientDataSet1.ApplyUpdates(-1);
end;

procedure TForm1.ClientDataSet1ReconcileError(
  DataSet: TCustomClientDataSet; E: EReconcileError;
  UpdateKind: TUpdateKind; var Action: TReconcileAction);
begin
  HandleReconcileError(DataSet, UpdateKind, E );
end;

procedure TForm1.DBMemo1Exit(Sender: TObject);
begin
  DBGrid1.Height := FGridHeight;
  DBMemo1.Visible := False;
end;

procedure TForm1.DBImage1Exit(Sender: TObject);
begin
  DBGrid1.Height := FGridHeight;
  DBImage1.Visible := False;
end;

procedure TForm1.FormActivate(Sender: TObject);
begin
  if not FileExists(SExplorerIni) then
    ShowMessage('Warning: ' + SExplorerIni + ' not found' );
end;

end.
