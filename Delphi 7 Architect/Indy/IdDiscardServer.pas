unit IdDiscardServer;

interface

{
2000-Apr-22: J Peter Mugass
  Ported to Indy
1999-Apr-13
  Final Version
2000-JAN-13 MTL
  Moved to new Palette Scheme (Winshoes Servers)
Original Author: Ozz Nixon
}

uses
  Classes,
  IdAssignedNumbers,
  IdTCPServer;

Type
  TIdDISCARDServer = class ( TIdTCPServer )
  protected
    function DoExecute(AThread: TIdPeerThread ): Boolean; override;
  public
    constructor Create(AOwner: TComponent); override;
  published
    property DefaultPort default IdPORT_DISCARD;
  end;

implementation

uses
  IdGlobal,
  SysUtils;

constructor TIdDISCARDServer.Create(AOwner: TComponent);
begin
  inherited;
  DefaultPort := IdPORT_DISCARD;
end;

function TIdDISCARDServer.DoExecute(AThread: TIdPeerThread): Boolean;
begin
  Result := True;
  // Discard it
  AThread.Connection.InputBuffer.Remove(AThread.Connection.InputBuffer.Size);
end;

end.
