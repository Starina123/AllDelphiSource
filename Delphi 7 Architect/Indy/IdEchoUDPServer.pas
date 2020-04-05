unit IdEchoUDPServer;

interface
uses IdAssignedNumbers, IdSocketHandle, IdUDPBase, IdUDPServer, classes;
type
   TIdEchoUDPServer = class(TIdUDPServer)
   protected
      procedure DoUDPRead(AData: TStream; ABinding: TIdSocketHandle); override;
   public
     constructor Create(axOwner: TComponent); override;
   published
     property DefaultPort default IdPORT_ECHO;
   end;

implementation

{ TIdEchoUDPServer }

constructor TIdEchoUDPServer.Create(axOwner: TComponent);
begin
  inherited Create(axOwner);
  DefaultPort := IdPORT_ECHO;
end;

procedure TIdEchoUDPServer.DoUDPRead(AData: TStream; ABinding: TIdSocketHandle);
var s : String;
begin
  inherited DoUDPRead(AData, ABinding);
  SetLength(s, AData.Size);
  AData.Read(s[1], AData.Size);
  with ABinding do
  begin
    SendTo(PeerIP, PeerPort, s[1], Length(s));
  end;
end;

end.
 
