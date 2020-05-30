unit ClntFrm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBClient, Db, Grids, DBGrids, StdCtrls, MConnect;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Memo1: TMemo;
    DBGrid1: TDBGrid;
    ClientDataSet1: TClientDataSet;
    RemoteServer1: TDCOMConnection;
    DataSource1: TDataSource;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.Button1Click(Sender: TObject);
var
  Data: OleVariant;
begin
  if not RemoteServer1.Connected then
    RemoteServer1.Connected := True;
  RemoteServer1.AppServer.Select(Memo1.Lines.Text, Data);
  ClientDataSet1.Data := Data;
end;

end.
