unit IdDayTimeUDPServer;

interface
uses IdAssignedNumbers, IdSocketHandle, IdUDPBase, IdUDPServer, classes;
type
   TIdDayTimeUDPServer = class(TIdUDPServer)
   protected
     FTimeZone : String;
     procedure DoUDPRead(AData: TStream; ABinding: TIdSocketHandle); override;
   public
     constructor Create(axOwner: TComponent); override;
   published
     property TimeZone: String read FTimeZone write FTimeZone;
     property DefaultPort default IdPORT_DAYTIME;
   end;

implementation
uses SysUtils;

{ TIdDayTimeUDPServer }

constructor TIdDayTimeUDPServer.Create(axOwner: TComponent);
begin
  inherited Create(axOwner);
  DefaultPort := IdPORT_DAYTIME;
  FTimeZone := 'EST';  {Do not Localize}
end;

procedure TIdDayTimeUDPServer.DoUDPRead(AData: TStream;
  ABinding: TIdSocketHandle);
var s : String;
begin
  inherited DoUDPRead(AData, ABinding);
  SetLength(s, AData.Size);
  AData.Read(s[1], AData.Size);
  s := FormatDateTime('dddd, mmmm dd, yyyy hh:nn:ss', Now) + ' -' + FTimeZone;  {Do not Localize}
  with ABinding do
  begin
    SendTo(PeerIP, PeerPort, s[1], Length(s));
  end;
end;

end.
 
