// Demo to show how to use TSharedConnection with BDE datasets.
// Note that the ClientDataSet.RemoteServer is set to the
// TSharedConnection, and the TSharedConnection.ParentConnection
// is set to the DCOMConnection.
unit CliMain;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBClient, MConnect, Grids, DBGrids, StdCtrls;

type
  TForm2 = class(TForm)
    dsVendor: TDataSource;
    cdsVendor: TClientDataSet;
    DCOMConnection1: TDCOMConnection;
    SharedConnection1: TSharedConnection;
    DBGrid1: TDBGrid;
    Button1: TButton;
    Button2: TButton;
    lblSessionName: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.DFM}

procedure TForm2.Button1Click(Sender: TObject);
begin
  cdsVendor.open;
end;

procedure TForm2.Button2Click(Sender: TObject);
begin
  lblSessionName.Caption := SharedConnection1.AppServer.SessionName;
end;

end.
