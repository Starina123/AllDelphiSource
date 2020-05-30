unit frmMain;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, DBTables;

type
  TMain = class(TForm)
    Panel1: TPanel;
    mmoSQL: TMemo;
    Button1: TButton;
    Label1: TLabel;
    Label2: TLabel;
    edtUsername: TEdit;
    Password: TLabel;
    edtPassword: TEdit;
    Button2: TButton;
    edtDatabase: TEdit;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Main: TMain;

implementation

uses frmQueryResultsU, frmQueryGridResultsU;

{$R *.dfm}

procedure TMain.Button1Click(Sender: TObject);
begin
  TfrmQueryResults.Create(self).Show;
end;

procedure TMain.Button2Click(Sender: TObject);
begin
  TfrmQueryGridResults.Create(self).Show;
end;

end.
