{*******************************************************}
{                                                       }
{      Copyright (C) 1999-2000 Inprise Corporation      }
{                                                       }
{*******************************************************}
unit ClientMain;

{ This illustrates two ways to use MIDAS with CORBA.  The first takes a MIDAS data
  packet on the server side and converts it to a CORBA Any.  The Any is sent across
  the wire and the client populates the database grid.

  The second method gets the MIDAS data packet on the server side as XML, then
  loads it in a string variable that is marshalled across the wire via CORBA.

  Look at the DMPooler module.  This shows a thread safe technieque for pooling
  database connections.  Instead of getting a new connection for every database
  request, this module creates a pool of connections and reuses them.  That way
  BDE resourse errors are avoided.
}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, Corba, Employee_i, Employee_c, Db, DBClient, ExtCtrls,
  DBCtrls, DBGrids;

type
  TForm1 = class(TForm)
    Button1: TButton;
    DBGrid1: TDBGrid;
    cdsEmployee: TClientDataSet;
    DataSource1: TDataSource;
    edtEmployeeName: TEdit;
    Button2: TButton;
    Memo1: TMemo;
    Label1: TLabel;
    Label2: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
    myEmployee : Employee;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.FormCreate(Sender: TObject);
begin
  myEmployee := TEmployeeHelper.bind;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  cdsEmployee.Data := myEmployee.getEmployeesByName(edtEmployeeName.Text);
  cdsEmployee.Open;
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  rtn: WideString;
  str: TStringStream;
begin
  rtn := myEmployee.getEmployeesByNameXML(edtEmployeeName.Text);
  Memo1.Lines.Text:=rtn;
  //Get XML data from server and load it into stream
  str := TStringStream.Create(rtn);
  try
    cdsEmployee.Close;
    cdsEmployee.LoadFromStream(str);
    cdsEmployee.Open;
  finally
    str.Free;
  end;
end;

end.
