unit clntfrm;

{
  This is the client side of the login demo.  Using the login dialog provided by
  the connection component and the OnLogin event, we pass the username and
  password to the server for verification.

  Make sure you first compile and run the server portion of this demo.
}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, DBGrids, Db, DBClient, MConnect;

type
  TForm1 = class(TForm)
    DCOMConnection1: TDCOMConnection;
    ClientDataSet1: TClientDataSet;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
    procedure DCOMConnection1Login(Sender: TObject; Username,
      Password: String);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  ClientDataSet1.Open;
end;

procedure TForm1.DCOMConnection1Login(Sender: TObject; Username,
  Password: String);
begin
  { Use the Login procedure that was added on the server to pass the
    username and password to the server.  If your protocol is not encrypted
    you may want to encrypt your password before sending it. }
  DCOMConnection1.AppServer.Login(UserName, Password);
end;

end.
