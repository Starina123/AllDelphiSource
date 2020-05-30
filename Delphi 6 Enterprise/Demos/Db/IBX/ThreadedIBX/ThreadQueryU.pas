unit ThreadQueryU;

interface

uses
  Windows, Classes, SysUtils, db, grids, dmThreadU;

type
  ThreadQuery = class(TThread)
  private
    dmThread : TdmThread;
    dtsResults : TDataSource;
    FDatabaseName : String;
    FSql : String;
    FGrid : TStringGrid;
    FUserName, FPassword : String;
    procedure DisplayResults;
    procedure SetColumns;
    procedure WriteGridRow;
    procedure AddRow;
    { Private declarations }
  protected
    procedure Execute; override;
  public
    constructor Create(SQL : String; dts : TDataSource; DB_Name : String;
       username : String; password : String); overload;
    constructor Create(SQL : String; grid : TStringGrid; DB_Name : String;
       username : String; password : String); overload;
    destructor Destroy; override;
  end;

implementation

{ Important: Methods and properties of objects in VCL can only be used in a
  method called using Synchronize, for example,

      Synchronize(UpdateCaption);

  and UpdateCaption could look like,

    procedure ThreadQuery.UpdateCaption;
    begin
      Form1.Caption := 'Updated in a thread';
    end; }

{ ThreadQuery }

constructor ThreadQuery.Create(SQL: String; dts : TDataSource; DB_Name : String;
       username : String; password : String);
begin
  inherited Create(true);
  FSql := SQL;
  FDatabaseName := DB_Name;
  FUsername := username;
  FPassword := password;
  FGrid := nil;
  dtsResults := dts;
  Resume;
end;

procedure ThreadQuery.AddRow;
begin
  FGrid.RowCount := FGrid.RowCount + 1;
end;

constructor ThreadQuery.Create(SQL: String; grid: TStringGrid; DB_Name,
  username, password: String);
begin
  inherited Create(true);
  FSql := SQL;
  FDatabaseName := DB_Name;
  FUsername := username;
  FPassword := password;
  dtsResults := nil;
  FGrid := grid;
  Resume;
end;

destructor ThreadQuery.Destroy;
begin
  dmThread.Free;
  inherited Destroy;
end;

procedure ThreadQuery.DisplayResults;
begin
  dtsResults.DataSet := dmThread.IBQuery1;
end;

procedure ThreadQuery.Execute;
var
  i : Integer;
begin
  dmThread := TdmThread.Create(FDatabaseName, FUserName, FPassword);
  { Place thread code here }
  for i := 1 to 10 do
  try
    dmThread.IBQuery1.Close;
    dmThread.IBQuery1.SQL.Clear;
    dmThread.IBQuery1.SQL.Add(FSQL);
    dmThread.IBQuery1.Open;
    if FGrid = nil then
      Synchronize(DisplayResults)
    else
    begin
      Synchronize(SetColumns);
      while not dmThread.IBQuery1.Eof do
      begin
        Synchronize(WriteGridRow);
        dmThread.IBQuery1.Next;
        if not dmThread.IBQuery1.Eof then
          Synchronize(AddRow);
      end;
    end;
  except
    on E : Exception do
      MessageBox(0, PChar('Database error = ' + E.Message), 'Error', MB_OK);
  end;
end;

procedure ThreadQuery.SetColumns;
var
  i : Integer;
begin
  with dmThread.IBQuery1 do
  begin
    FGrid.ColCount := FieldDefs.Count;
    for i := 0 to Pred(FieldDefs.Count) do
      FGrid.Cells[i, 0] := FieldDefs[i].DisplayName;
  end;
end;

procedure ThreadQuery.WriteGridRow;
var
  i, row : Integer;
begin
  row := FGrid.RowCount - 1;
  with dmThread.IBQuery1 do
    for i := 0 to Pred(FieldDefs.Count) do
      FGrid.Cells[i, row] := Fields[i].AsString;
end;

end.
 