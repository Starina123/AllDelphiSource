unit IdQOTDUDP;

interface
uses classes, IdAssignedNumbers, IdUDPBase, IdUDPClient;
type
  TIdQOTDUDP = class(TIdUDPClient)
  protected
    Function GetQuote : String;
  public
    constructor Create(AOwner: TComponent); override;
    { This is the quote from the server }
    Property Quote: String read GetQuote;
  published
    Property Port default IdPORT_QOTD;
  end;

implementation

{ TIdQOTDUDP }

constructor TIdQOTDUDP.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Port := IdPORT_QOTD;
end;

function TIdQOTDUDP.GetQuote: String;
begin
  //The string can be anything - The RFC says the server should discard packets
  Send(' ');    {Do not Localize}
  Result := ReceiveString;
end;

end.
