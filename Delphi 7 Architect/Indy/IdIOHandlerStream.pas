unit IdIOHandlerStream;

interface

uses
  Classes,
  IdGlobal, IdIOHandler;

type
  TIdIOHandlerStreamType = (stRead, stWrite, stReadWrite);

  TIdIOHandlerStream = class(TIdIOHandler)
  protected
    FReadStream: TStream;
    FWriteStream: TStream;
    FStreamType: TIdIOHandlerStreamType;
  public
    constructor Create(AOwner: TComponent); override;
    function Connected: Boolean; override;
    destructor Destroy; override;
    function Readable(AMSec: integer = IdTimeoutDefault): boolean; override;
    function Recv(var ABuf; ALen: integer): integer; override;
    function Send(var ABuf; ALen: integer): integer; override;
    //
    property ReadStream: TStream read FReadStream write FReadStream;
    property WriteStream: TStream read FWriteStream write FWriteStream;
  published
    property StreamType: TIdIOHandlerStreamType read FStreamType write FStreamType;
  end;

implementation

uses
  SysUtils;

{ TIdIOHandlerStream }

function TIdIOHandlerStream.Connected: Boolean;
begin
  Result := false;  // Just to avaid waring message
  case FStreamType of
    stRead: Result := (FReadStream <> nil);
    stWrite: Result := (FWriteStream <> nil);
    stReadWrite: Result := (FReadStream <> nil) and (FWriteStream <> nil);
  end;
end;

constructor TIdIOHandlerStream.Create(AOwner: TComponent);
begin
  inherited;
  FStreamType := stReadWrite;
end;

destructor TIdIOHandlerStream.Destroy;
begin
  Close;
  inherited Destroy;
end;

function TIdIOHandlerStream.Readable(AMSec: integer): boolean;
begin
  Result := ReadStream <> nil;
  if Result then begin
    Result := ReadStream.Position < ReadStream.Size;
  end;
end;

function TIdIOHandlerStream.Recv(var ABuf; ALen: integer): integer;
begin
  if ReadStream = nil then begin
    Result := 0;
  end else begin
    Result := ReadStream.Read(ABuf, ALen);
  end;
end;

function TIdIOHandlerStream.Send(var ABuf; ALen: integer): integer;
begin
  if WriteStream = nil then begin
    Result := 0;
  end else begin
    Result := WriteStream.Write(ABuf, ALen);
  end;
end;

end.
