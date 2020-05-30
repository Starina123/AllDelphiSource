unit CORBAServerForm;

{
  This is the form that gets displayed when the server is running.
  A Counter is maintained on this Form to display the number of
  clients connected to it.
  For in-depth transfer of information between client and server,
  please refer to demos in MIDAS directory. 
}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TMainServerForm = class(TForm)
    ClientsLabel: TLabel;
    ClientCount: TLabel;
  private
    { Private declarations }
    FClientCount: Integer;
  public
    { Public declarations }
    procedure UpdateClientCount(Incr: Integer);
  end;

var
  MainServerForm: TMainServerForm;

implementation

{$R *.DFM}

procedure TMainServerForm.UpdateClientCount(Incr: Integer);
begin
  FClientCount := FClientCount+Incr;
  ClientCount.Caption := IntToStr(FClientCount);
end;

end.
