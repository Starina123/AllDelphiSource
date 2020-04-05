unit IdIOHandler;

interface

uses
  Classes,
  IdComponent, IdGlobal;

type
  TIdIOHandler = class(TIdComponent)
  public
    procedure AfterAccept; virtual;
    procedure Close; virtual;
    procedure ConnectClient(const AHost: string; const APort: Integer; const ABoundIP: string;
     const ABoundPort: Integer; const ABoundPortMin: Integer; const ABoundPortMax: Integer;
     const ATimeout: Integer = IdTimeoutDefault); virtual;
    function Connected: Boolean; virtual; abstract;
    destructor Destroy; override;
    procedure Open; virtual;
    function Readable(AMSec: Integer = IdTimeoutDefault): Boolean; virtual; abstract;
    function Recv(var ABuf; ALen: Integer): Integer; virtual; abstract;
    function Send(var ABuf; ALen: Integer): Integer; virtual; abstract;
  end;

implementation

{ TIdIOHandler }

procedure TIdIOHandler.Close;
begin
  //
end;

procedure TIdIOHandler.ConnectClient(const AHost: string;
  const APort: Integer; const ABoundIP: string; const ABoundPort,
  ABoundPortMin, ABoundPortMax: Integer; const ATimeout: Integer);
begin
  //
end;

destructor TIdIOHandler.Destroy;
begin
  Close;
  inherited;
end;

procedure TIdIOHandler.AfterAccept;
begin
  //
end;

procedure TIdIOHandler.Open;
begin
  //
end;

end.
