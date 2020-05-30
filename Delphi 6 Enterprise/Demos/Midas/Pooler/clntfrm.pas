{*******************************************************}
{                                                       }
{        Midas RemoteDataModule Pooler Demo             }
{                                                       }
{*******************************************************}

unit clntfrm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBClient, Db, Grids, DBGrids, StdCtrls, MConnect, Variants;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Memo1: TMemo;
    DBGrid1: TDBGrid;
    ClientDataSet1: TClientDataSet;
    RemoteServer1: TDCOMConnection;
    DataSource1: TDataSource;
    CDSClone: TClientDataSet;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure ClientDataSet1BeforeGetRecords(Sender: TObject;
      var OwnerData: OleVariant);
    procedure Button2Click(Sender: TObject);
    procedure Memo1Change(Sender: TObject);
    procedure CheckButtonActive(DataSet: TDataSet);
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
  if not RemoteServer1.Connected then
    RemoteServer1.Connected := True;
  ClientDataSet1.Close;
  ClientDataSet1.Open;
end;

{ This method is used to pass the sql statement and the value of the first field
  for the last record to the server so that the server can return the correct
  records. }
procedure TForm1.ClientDataSet1BeforeGetRecords(Sender: TObject;
  var OwnerData: OleVariant);
var
  LastValue: OleVariant;
begin
  if ClientDataSet1.Active then
  begin
    CDSClone.CloneCursor(ClientDataSet1, True);
    CDSClone.Last;
    LastValue := CDSClone.Fields[0].AsString;
    CDSClone.Close;
  end else
    LastValue := NULL;
  OwnerData := VarArrayOf([Memo1.Lines.Text, LastValue]);
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  ClientDataSet1.GetNextPacket;
end;

procedure TForm1.Memo1Change(Sender: TObject);
begin
  ClientDataSet1.Close;
end;

procedure TForm1.CheckButtonActive(DataSet: TDataSet);
begin
  Button2.Enabled := ClientDataSet1.Active;
end;

end.
