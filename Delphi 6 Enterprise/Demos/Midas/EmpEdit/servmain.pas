unit servmain;

{ This program represents the "Application Server" portion of the
  distributed datasets demo.  The other part is the client which will access
  the data provided by this server.  You must compile and run this program
  once before running the EmpEdit project. }

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Grids, DBGrids, Db;

type
  TMainForm = class(TForm)
    Panel1: TPanel;
    QueryCount: TLabel;
    ClientCount: TLabel;
  private
    FQueryCount: Integer;
    FClientCount: Integer;
  public
    procedure UpdateClientCount(Incr: Integer);
    procedure IncQueryCount;
  end;

var
  MainForm: TMainForm;

implementation

{$R *.dfm}

{ These procedures update the display of the application server form for
  the purposes of this demo.  A typical Application Server would probably
  not have any visible UI.  You can add a line of to the project file to
  prevent the application server icon from being displayed on the taskbar. }

procedure TMainForm.UpdateClientCount(Incr: Integer);
begin
  FClientCount := FClientCount + Incr;
  ClientCount.Caption := IntToStr(FClientCount);
end;

procedure TMainForm.IncQueryCount;
begin
  Inc(FQueryCount);
  QueryCount.Caption := IntToStr(FQueryCount);
end;


end.
