unit IdDayTimeUDP;

interface
uses Classes, IdAssignedNumbers, IdUDPBase, IdUDPClient;
type
  TIdDayTimeUDP = class(TIdUDPClient)
  protected
    Function GetDayTimeStr : String;
  public
    constructor Create(AOwner: TComponent); override;
    Property DayTimeStr : String read GetDayTimeStr;
  published
    property Port default IdPORT_DAYTIME;
  end;

implementation

{ TIdDayTimeUDP }

constructor TIdDayTimeUDP.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Port := IdPORT_DAYTIME;
end;

function TIdDayTimeUDP.GetDayTimeStr: String;
begin
  //The string can be anything - The RFC says the server should discard packets
  Send(' ');    {Do not Localize}
  Result := ReceiveString;
end;

end.
