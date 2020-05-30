unit clientfr;

{
  This is the client portion of a MIDAS demo.  Make sure that you compile and
  run the server project before trying to run this probject.

  This project demonstrates dynamically passing SQL to the server using the
  Provider.DataRequest event.
}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, DBClient, ExtCtrls, Grids, DBGrids, StdCtrls, MConnect, Variants;

type
  TForm1 = class(TForm)
    SQL: TMemo;
    Label1: TLabel;
    DatabaseName: TComboBox;
    RunButton: TButton;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    Bevel1: TBevel;
    RemoteServer: TDCOMConnection;
    ClientData: TClientDataSet;
    procedure DatabaseNameClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure RunButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
var
  I: Integer;
  DBNames: OleVariant;
begin
  { Connect to the server and get a list of available database names }
  RemoteServer.Connected := True;
  DBNames := RemoteServer.AppServer.GetDatabaseNames;
  if VarIsArray(DBNames) then
    for I := 0 to VarArrayHighBound(DBNames, 1) do
      DatabaseName.Items.Add(DBNames[I]);
  DatabaseNameClick(Self);
end;

procedure TForm1.RunButtonClick(Sender: TObject);
begin
  { Send the query string to the server and try to open the client dataset }
  ClientData.Close;
  ClientData.CommandText := SQL.Lines.Text;
  ClientData.Open;
end;

procedure TForm1.DatabaseNameClick(Sender: TObject);
var
  Password: string;
begin
  { Change the database name on the server }
  if DatabaseName.Text <> '' then
  begin
    ClientData.Close;
    try
      RemoteServer.AppServer.SetDatabaseName(DatabaseName.Text, '');
    except
      { This is a crude mechanism for getting the password on SQL Databases }
      on E: Exception do
        if E.Message = 'Password Required' then
        begin
          if InputQuery(E.Message, 'Enter password', Password) then
            RemoteServer.AppServer.SetDatabaseName(DatabaseName.Text, Password);
        end else
          raise;
    end;
  end;
end;

end.
