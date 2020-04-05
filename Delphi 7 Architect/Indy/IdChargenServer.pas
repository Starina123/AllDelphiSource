unit IdChargenServer;

interface

{
2000-Apr-17 Kudzu
  Converted to Indy
  Improved efficiency

Original Author: Ozz Nixon
}

uses
  Classes,
  IdAssignedNumbers,
  IdTCPServer;

Type
  TIdChargenServer = class(TIdTCPServer)
  protected
    function DoExecute(AThread: TIdPeerThread): boolean; override;
  public
    constructor Create(AOwner: TComponent); override;
  published
    property DefaultPort default IdPORT_CHARGEN;
  end;

implementation

{ TIdChargenServer }

constructor TIdChargenServer.Create(AOwner: TComponent);
begin
  inherited;
  DefaultPort := IdPORT_CHARGEN;
end;

function TIdChargenServer.DoExecute(AThread: TIdPeerThread): boolean;
var
  Counter, Width, Base: integer;
begin
  Base := 0;
  result := true;
  Counter := 1;
  Width := 1;
  with AThread.Connection do begin
    while Connected do begin
      Write(Chr(Counter + 31));
      Inc(Counter);
      Inc(Width);
      if Width = 72 then begin
        Writeln('');  {Do not Localize}
        Width := 1;
        Inc(Base);
        if Base = 95 then begin
          Base := 1;
        end;
        Counter := Base;
      End;
      if Counter = 95 then begin
        Counter := 1;
      end;
    end;
  end;
end;

end.
