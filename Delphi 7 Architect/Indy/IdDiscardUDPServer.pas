unit IdDiscardUDPServer;

interface

uses
  Classes,
  IdAssignedNumbers, IdSocketHandle, IdUDPBase, IdUDPServer;

type
   TIdDiscardUDPServer = class(TIdUDPServer)
   public
     constructor Create(AOwner: TComponent); override;
   published
     property DefaultPort default IdPORT_DISCARD;
   end;

implementation

{ TIdDiscardUDPServer }

constructor TIdDiscardUDPServer.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  DefaultPort := IdPORT_DISCARD;
end;

end.
 
