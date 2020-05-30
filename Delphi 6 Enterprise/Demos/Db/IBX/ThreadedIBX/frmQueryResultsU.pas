unit frmQueryResultsU;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, Grids, DBGrids, ThreadQueryU;

type
  TfrmQueryResults = class(TForm)
    DBGrid1: TDBGrid;
    dtsQuery: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    thdQuery : ThreadQuery;
    { Public declarations }
  end;

var
  frmQueryResults: TfrmQueryResults;

implementation

uses frmMain;

{$R *.dfm}

procedure TfrmQueryResults.FormCreate(Sender: TObject);
begin
  thdQuery := ThreadQuery.Create(Main.mmoSQL.Lines.Text, dtsQuery, Main.edtDatabase.Text,
        Main.edtUsername.Text, Main.edtPassword.Text);  
end;

procedure TfrmQueryResults.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  thdQuery.Free;
  Action := caFree;
end;

end.
