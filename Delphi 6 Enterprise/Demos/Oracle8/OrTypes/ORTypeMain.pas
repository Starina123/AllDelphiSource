unit ORTypeMain;

{
  This Demo can run only on a client that has a connection to Oracle 8 Server
  This Demo shows all the Object Relational Information stored on
  the Server. It shows the following:
  1. Abstract Data Types (ADT)
  2. VAR ARRAYS
  3. Object Tables
  4. Nested Parent/Child Types
  5. Data and schema information for above.

  This Demo can be used as a tool to retreive the above information.
}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, ComCtrls, ToolWin, DBTables, Db, ImgList, Grids,
  DBGrids, Menus;

type

  TObjectType = (otADT, otArray, otReference, otNested, otChild, otTables);

  TOraTypeMain = class(TForm)
    SB: TStatusBar;
    ToolBar1: TToolBar;
    TV: TTreeView;
    Splitter1: TSplitter;
    Splitter2: TSplitter;
    ORQuery: TQuery;
    DB: TDatabase;
    EdDB: TEdit;
    ToolButton1: TToolButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    EdUserName: TEdit;
    ToolButton2: TToolButton;
    EdPassword: TEdit;
    ToolButton4: TToolButton;
    BtnOpen: TToolButton;
    Images: TImageList;
    ObjectListBox: TListBox;
    ParentGrid: TDBGrid;
    HorSplitter: TSplitter;
    DataSource1: TDataSource;
    ORTable: TTable;
    PropListView: TListView;
    GridPopup: TPopupMenu;
    OVMenuItem: TMenuItem;
    ToolButton3: TToolButton;
    procedure TVClick(Sender: TObject);
    procedure BtnOpenClick(Sender: TObject);
    procedure ObjectListBoxClick(Sender: TObject);
    procedure OVMenuItemClick(Sender: TObject);
  private
    procedure FillObjectList(T: TObjectType);
    procedure FillPropList(T: TObjectType; Str: String);
    procedure DisplayStatus(S: String);
    procedure HideGrid;
    procedure ShowGrid;
    procedure RemoveParam(S: String);
    procedure UpdateParams;
    procedure AddColumns(S: String);
    procedure ClearPanes;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  OraTypeMain: TOraTypeMain;

implementation

{$R *.dfm}

procedure TOraTypeMain.ClearPanes;
begin
  PropListView.Columns.Clear;
  PropListView.Items.Clear;
  ObjectListBox.Clear;
  HideGrid;
end;

procedure TOraTypeMain.FillObjectList(T: TObjectType);
begin
  ClearPanes;
  with ORQuery do
  begin
    SQL.Clear;
    case (T) of
      otADT:
  SQL.Add('SELECT T.TYPE_NAME FROM SYS.ALL_TYPES T WHERE T.TYPECODE = ''OBJECT'' AND T.OWNER = '''+UpperCase(EdUserName.Text)+'''');
      otArray:
  SQL.Add('SELECT C.TYPE_NAME, C.UPPER_BOUND, C.ELEM_TYPE_NAME FROM SYS.ALL_COLL_TYPES C WHERE C.COLL_TYPE = ''VARYING ARRAY'' AND C.OWNER = '''+UpperCase(EdUserName.Text)+'''');
      otReference:
  SQL.Add('SELECT T.TABLE_NAME, T.NESTED FROM SYS.ALL_OBJECT_TABLES T WHERE T.NESTED = ''NO'' AND T.OWNER = '''+UpperCase(EdUserName.Text)+'''');
      otNested:
  SQL.Add('SELECT C.TYPE_NAME, C.UPPER_BOUND, C.ELEM_TYPE_NAME FROM SYS.ALL_COLL_TYPES C WHERE C.COLL_TYPE = ''TABLE'' AND C.OWNER = '''+UpperCase(EdUserName.Text)+'''');
      otChild:
  SQL.Add('SELECT T.TABLE_NAME, T.NESTED FROM SYS.ALL_OBJECT_TABLES T WHERE T.NESTED = ''YES'' AND T.OWNER = '''+UpperCase(EdUserName.Text)+'''');
    end;
    try
      Open;
      DisplayStatus('');
    except
      on E:Exception do DisplayStatus(E.Message);
    end;
    While not EOF do
    begin
      ObjectListBox.Items.Add(Fields[0].AsString);
      Next;
    end;
  end;
end;

procedure TOraTypeMain.ShowGrid;
begin
  ParentGrid.Visible := True;
  HorSplitter.Visible := True;
end;

procedure TOraTypeMain.HideGrid;
begin
  HorSplitter.Visible := False;
  ParentGrid.Visible := False;
end;

procedure TOraTypeMain.TVClick(Sender: TObject);
begin
  if (TV.Selected.Level = 0) and (TV.Selected.Text = 'Tables') then
  begin
    DB.Session.GetTableNames(DB.DatabaseName, '', True, False, ObjectListBox.Items);
    ShowGrid;
  end else
    HideGrid;
  if TV.Selected.Level = 1 then
  case TV.Selected.Index of
  0: FillObjectList(otADT);
  1: FillObjectList(otArray);
  2: FillObjectList(otReference);
  3: FillObjectList(otNested);
  4: FillObjectList(otChild);
  end;
end;

procedure TOraTypeMain.DisplayStatus(S: String);
begin
  SB.SimpleText := S;
end;

procedure TOraTypeMain.RemoveParam(S: String);
begin
  with DB.Params do
    if IndexOFName(S) <> -1 then
      Delete(IndexOfName(S));
end;

procedure TOraTypeMain.UpdateParams;
begin
  with DB.Params do
  begin
    RemoveParam('SERVER NAME');
    RemoveParam('USER NAME');
    RemoveParam('PASSWORD');
    Add('SERVER NAME='+EdDB.Text);
    Add('USER NAME='+EdUserName.Text);
    Add('PASSWORD='+EdPassword.Text);
  end;
end;

procedure TOraTypeMain.BtnOpenClick(Sender: TObject);
begin
  with DB do
  begin
    Close;
    ClearPanes;
    UpdateParams;
    try
      Open;
      DisplayStatus('');
    except
      on E:Exception do DisplayStatus(E.Message);
    end;
    TV.FullExpand;
  end;
end;

procedure TOraTypeMain.AddColumns(S: String);
var
  F: TListColumn;
begin
  F := PropListView.Columns.Add;
  F.Caption := S;
  F.Width := Length(S)*10;
end;

procedure TOraTypeMain.FillPropList(T: TObjectType; Str: String);
var
  i,j: Integer;
begin
  PropListView.Items.Clear;
  PropListView.Columns.Clear;
  with ORQuery do
  begin
    SQL.Clear;
    case (T) of
      otADT:
        begin
          SQL.Add('SELECT ATTR_NAME, ATTR_TYPE_NAME, LENGTH, PRECISION, SCALE FROM SYS.ALL_TYPE_ATTRS WHERE OWNER ='''+UpperCase(EdUserName.Text)+'''AND TYPE_NAME = '''+Str+'''');
          AddColumns('Name ');
          AddColumns('Type    ');
          AddColumns('Length');
          AddColumns('Precision');
          AddColumns('Scale');
          HideGrid;
        end;
      otArray:
        begin
          SQL.Add('SELECT UPPER_BOUND, ELEM_TYPE_NAME, LENGTH, PRECISION, SCALE FROM SYS.ALL_COLL_TYPES WHERE OWNER ='''+UpperCase(EdUserName.Text)+'''AND TYPE_NAME = '''+Str+'''');
          AddColumns('Level');
          AddColumns('Type    ');
          AddColumns('Length');
          AddColumns('Precision');
          AddColumns('Scale');
          HideGrid;
        end;
      otReference:
        begin
          SQL.Add('SELECT COLUMN_ID, COLUMN_NAME, DATA_TYPE, DATA_LENGTH, DATA_PRECISION, DATA_SCALE FROM SYS.ALL_TAB_COLUMNS WHERE OWNER ='''+UpperCase(EdUserName.Text)+'''AND TABLE_NAME = '''+Str+'''');
          AddColumns('No ');
          AddColumns('Name  ');
          AddColumns('Type    ');
          AddColumns('Length');
          AddColumns('Precision');
          AddColumns('Scale');
          ORTable.Close;
          ORTable.TableName := Str;
          try
            ORTable.Open;
            DisplayStatus('');
          except
            on E:Exception do DisplayStatus(E.Message);
          end;
          ShowGrid;
        end;
      otNested:
        begin
          SQL.Add('SELECT ELEM_TYPE_NAME FROM SYS.ALL_COLL_TYPES WHERE OWNER ='''+UpperCase(EdUserName.Text)+'''AND TYPE_NAME = '''+Str+'''');
          AddColumns('ADT Type           ');
          HideGrid;
        end;
      otChild:
        begin
          SQL.Add('SELECT TABLE_TYPE_NAME, PARENT_TABLE_NAME, PARENT_TABLE_COLUMN FROM SYS.ALL_NESTED_TABLES WHERE OWNER ='''+UpperCase(EdUserName.Text)+'''AND TABLE_NAME = '''+Str+'''');
          AddColumns('ADT Type     ');
          AddColumns('ParentTable ');
          AddColumns('ParentColumn ');
          HideGrid;
        end;
      otTables:
        begin
          SQL.Add('SELECT COLUMN_ID, COLUMN_NAME, DATA_TYPE, DATA_LENGTH, DATA_PRECISION, DATA_SCALE FROM SYS.ALL_TAB_COLUMNS WHERE OWNER ='''+UpperCase(EdUserName.Text)+'''AND TABLE_NAME = '''+Str+'''');
          AddColumns('No');
          AddColumns('Name ');
          AddColumns('Type    ');
          AddColumns('Length');
          AddColumns('Precision');
          AddColumns('Scale');
          ORTable.Close;
          ORTable.TableName := Str;
          try
            ORTable.Open;
          except
            on E:Exception do DisplayStatus(E.Message);
          end;
          ShowGrid;
        end;
    end;
    try
      Open;
      DisplayStatus('');
    except
      on E:Exception do DisplayStatus(E.Message);
    end;
    j := 0;
    While not EOF do
    begin
      PropListView.Items.Add.Caption := Fields[0].AsString;
      for i := 1 to FieldCount-1 do
        PropListView.Items[j].SubItems.Add(Fields[i].AsString);
      j := j + 1;
      Next;
    end;
  end;
end;

procedure TOraTypeMain.ObjectListBoxClick(Sender: TObject);
var
  SelStr: String;
begin
  SelStr := ObjectListBox.Items.Strings[ObjectListBox.ItemIndex];
  if (TV.Selected.Level = 0) and (TV.Selected.Text = 'Tables') then
    FillPropList(otTables, SelStr);
  if TV.Selected.Level = 1 then
  case TV.Selected.Index of
  0: FillPropList(otADT, SelStr);
  1: FillPropList(otArray, SelStr);
  2: FillPropList(otReference, SelStr);
  3: FillPropList(otNested, SelStr);
  4: FillPropList(otChild, SelStr);
  end;
end;

procedure TOraTypeMain.OVMenuItemClick(Sender: TObject);
begin
  OVMenuItem.Checked := not OVMenuItem.Checked;
  ORTable.Close;
  ORTable.ObjectView := OVMenuItem.Checked;
  ORTable.Open;
end;

end.
