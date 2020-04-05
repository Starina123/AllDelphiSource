unit IdServerIOHandler;

interface

uses
  Classes, SysUtils,
  IdComponent, IdIOHandlerSocket, IdStackConsts, IdIOHandler, IdThread;

type
  TIdServerIOHandler = class(TIdComponent)
  public
    procedure Init; virtual;
    function Accept(ASocket: TIdStackSocketHandle; AThread: TIdThread = nil): TIdIOHandler; virtual;
  end;

implementation

{ TIdServerIOHandler }

procedure TIdServerIOHandler.Init;
begin
  //
end;

function TIdServerIOHandler.Accept(ASocket: TIdStackSocketHandle;
  AThread: TIdThread = nil): TIdIOHandler;
begin
  result := nil;
end;

end.
