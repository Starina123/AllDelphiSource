unit servmain;

{ This is "Application Server" for this demo.  You must compile and run
  this program once before running the client application.  The remote
  data module (ServData) implments the actual OLE server that the client
  communicates with. }

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

{ These procedures update the display of the application server to show
  how many clients are connected and how many queries have been exectued. }

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
