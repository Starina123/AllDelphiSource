unit IdTCPStream;

interface

uses
  Classes,
  IdTCPConnection;

type
  TIdTCPStream = class(TStream)
  protected
    FConnection: TIdTCPConnection;
  public
    constructor Create(AConnection: TIdTCPConnection); reintroduce;
    function Read(var ABuffer; ACount: Longint): Longint; override;
    function Write(const ABuffer; ACount: Longint): Longint; override;
    function Seek(AOffset: Longint; AOrigin: Word): Longint; override;
    //
    property Connection: TIdTCPConnection read FConnection;
  end;

implementation

{ TIdTCPStream }

constructor TIdTCPStream.Create(AConnection: TIdTCPConnection);
begin
  inherited Create;
  FConnection := AConnection;
end;

function TIdTCPStream.Read(var ABuffer; ACount: Integer): Longint;
begin
  Connection.ReadBuffer(ABuffer, ACount);
  Result := ACount;
end;

function TIdTCPStream.Seek(AOffset: Integer; AOrigin: Word): Longint;
begin
  Result := -1;
end;

function TIdTCPStream.Write(const ABuffer; ACount: Integer): Longint;
begin
  Connection.WriteBuffer(ABuffer, ACount);
  Result := ACount;
end;

end.
