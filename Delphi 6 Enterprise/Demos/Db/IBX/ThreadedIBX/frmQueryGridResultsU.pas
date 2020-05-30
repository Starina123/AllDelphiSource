unit frmQueryGridResultsU;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, ThreadQueryU;

type
  TfrmQueryGridResults = class(TForm)
    StringGrid1: TStringGrid;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    thdQuery : ThreadQuery;
    { Public declarations }
  end;

var
  frmQueryGridResults: TfrmQueryGridResults;

implementation

uses frmMain;

{$R *.dfm}

procedure TfrmQueryGridResults.FormCreate(Sender: TObject);
begin
  thdQuery := ThreadQuery.Create(Main.mmoSQL.Lines.Text, StringGrid1, Main.edtDatabase.Text,
        Main.edtUsername.Text, Main.edtPassword.Text);    
end;

procedure TfrmQueryGridResults.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  thdQuery.Free;
  Action := caFree;
end;

end.
