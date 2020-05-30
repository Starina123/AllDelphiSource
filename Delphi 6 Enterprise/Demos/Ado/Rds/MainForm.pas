unit MainForm;

{ RDS Demo AppServer -
  In this demo, the Employee table is exported
  as a Raw ADO recordset object. (See AppServer.pas).
  No business rules are used in this demo.
  Compile and run this program before opening the RDS Client demo }

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs;

type
  TForm1 = class(TForm)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

end.
