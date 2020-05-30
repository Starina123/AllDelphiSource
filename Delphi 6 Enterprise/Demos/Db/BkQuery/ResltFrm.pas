unit ResltFrm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, DB, DBTables, Grids, DBGrids, StdCtrls;

type
  TQueryForm = class(TForm)
    QueryLabel: TLabel;
    DBGrid1: TDBGrid;
    DataSource: TDataSource;
    Query: TQuery;
    Session: TSession;
    StatusLine: TLabel;
    Database: TDatabase;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

procedure BackgroundQuery(const QueryName, Alias, User, Password,
  QueryText: string);

implementation

{$R *.dfm}

{ TQueryThread }

type
  TQueryThread = class(TThread)
  private
    QueryForm: TQueryForm;
    MessageText: string;
    procedure ConnectQuery;
    procedure DisplayMessage;
  protected
    procedure Execute; override;
  public
    constructor Create(AQueryForm: TQueryForm);
  end;

constructor TQueryThread.Create(AQueryForm: TQueryForm);
begin
  QueryForm := AQueryForm;
  FreeOnTerminate := True;
  inherited Create(False);
end;

var
  Guard: Integer;
  Numbers: Integer;

{ Thread safe increment of Numbers to guarantee the result is unique }
 
function GetUniqueNumber: Integer;
asm
@@1:    MOV     EDX,1
        XCHG    Guard,EDX
        OR      EDX,EDX
        JNZ     @@2
        MOV     EAX,Numbers
        INC     EAX
        MOV     Numbers,EAX
        MOV     Guard,EDX
        RET

@@2:    PUSH    0
        CALL    Sleep
        JMP     @@1
end;


procedure TQueryThread.Execute;
var
  UniqueNumber: Integer;
begin
  try
    with QueryForm do
    begin
      { Ensure the Query has a unique session and database.  A unique session
        is required for each thread.  Since databases are session specific
        it must be unique as well }
      UniqueNumber := GetUniqueNumber;
      Session.SessionName := Format('%s%x', [Session.Name, UniqueNumber]);
      Database.SessionName := Session.SessionName;

      Database.DatabaseName := Format('%s%x', [Database.Name, UniqueNumber]);
      Query.SessionName := Database.SessionName;
      Query.DatabaseName := Database.DatabaseName;

      { Open the query }
      Query.Open;

      { Connect the query to the grid.  This must be done in a synchronzied
        method since assigning the query to the DataSource will modify the
        contents of the grid and the grid can only be modified from the main
        VCL thread }
      Synchronize(ConnectQuery);

      { Update the status line.  Since the label is a VCL control this must
        also be done in the main VCL thread }
      MessageText := 'Query openned';
      Synchronize(DisplayMessage);
    end;
  except
    on E: Exception do
    begin
      { Display any error we receive on the status line }
      MessageText := Format('%s: %s.', [E.ClassName, E.Message]);
      Synchronize(DisplayMessage);
    end;
  end;
end;

procedure TQueryThread.ConnectQuery;
begin
  with QueryForm do DataSource.Dataset := Query;
end;

procedure TQueryThread.DisplayMessage;
begin
  with QueryForm do StatusLine.Caption := MessageText;
end;

{ BackgroundQuery }

procedure BackgroundQuery(const QueryName, Alias, User, Password,
  QueryText: string);
var
  QueryForm: TQueryForm;
begin
  QueryForm := TQueryForm.Create(Application);
  with QueryForm, Database do
  begin
    Caption := QueryName;
    QueryLabel.Caption := QueryText;
    Show;
    AliasName := Alias;
    Params.Values['USER'] := User;
    Params.Values['PASSWORD'] := Password;
    Query.Sql.Text := QueryText;
  end;

  { Create the background thread to execute the query. Since the thread
    will free itself on termination we do not neet to maintain a reference
    to it.  Creating it is enough }
  TQueryThread.Create(QueryForm);
end;

end.
