{*******************************************************}
{                                                       }
{      Copyright (C) 1999-2000 Inprise Corporation      }
{                                                       }
{*******************************************************}
unit ServerMain;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, Db, DBTables, StdCtrls, Corba, Employee_I, Employee_C,
  Employee_S, Employee_Impl, GlobalVars;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure CorbaInit;
  public
    { Public declarations }
    hitcount : integer;
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.CorbaInit;
begin
  //Set up the CORBA server
  CorbaInitialize;
  myDBServer := TEmployeeSkeleton.Create('myServer', TEmployee.Create);
  Boa.ObjIsReady( myDBServer as _Object );
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  CorbaInit;
end;

end.
