unit IdEchoUDP;

interface
uses classes, IdAssignedNumbers, IdUDPBase, IdUDPClient;
type
  TIdEchoUDP = class(TIdUDPClient)
  protected
    FEchoTime: Cardinal;
  public
    constructor Create(AOwner: TComponent); override;
    {This sends Text to the peer and returns the reply from the peer}
    Function Echo(AText: String): String;
    {Time taken to send and receive data}
    Property EchoTime: Cardinal read FEchoTime;
  published
    property Port default IdPORT_ECHO;
  end;

implementation
uses IdGlobal;

{ TIdIdEchoUDP }

constructor TIdEchoUDP.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Port := IdPORT_ECHO;
end;

function TIdEchoUDP.Echo(AText: String): String;
var
  StartTime: Cardinal;
begin
  StartTime := IdGlobal.GetTickCount;
  Send(AText);
  Result := ReceiveString;
  {This is just in case the TickCount rolled back to zero}
  FEchoTime :=  GetTickDiff(StartTime,IdGlobal.GetTickCount);
end;

end.
