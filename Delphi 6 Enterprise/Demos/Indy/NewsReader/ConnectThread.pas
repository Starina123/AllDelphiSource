{***************************************************************
 *
 * Project  : NewsReader
 * Unit Name: ConnectThread
 * Purpose  : Sub Thread unit
 * Version  : 1.0
 * Date  : Wed 25 Apr 2001  -  01:30:26
 * Author  : <unknown>
 * History  :
 * Tested  : Wed 25 Apr 2001  // Allen O'Neill <allen_oneill@hotmail.com>
 *
 ****************************************************************}

unit ConnectThread;

interface
uses
{$IFDEF Linux}

{$ELSE}

{$ENDIF}
   Classes,  SysUtils, IdTCPClient;

type
  TProc = procedure() of object;
  TExcClass = class of exception;
  TIdConnectThread = class(TThread)
  public
    ConnectProc: TProc;
    errormsg: string;
    done: boolean;
    excclass: TExcClass;
    procedure Execute; override;
  end;

procedure ConnectThreaded(AClient: TIdTCPClient);

implementation
uses IdAntiFreezeBase, windows;

procedure ConnectThreaded(AClient: TIdTCPClient);
begin
  with TIdConnectThread.Create(true) do
  try
    TMethod(ConnectProc).Code := Addr(TIdTCPClient.Connect);
    //  FConnecting := true; // new property Connecting (readonly)
    resume;
    repeat
      sleep(10);
      TIdAntiFreezeBase.DoProcess(true);
    until done;
    //  FConnecting := false;
    if assigned(excclass) then
      raise excclass.Create(errormsg);
  finally
    free;
  end;
end;

{ TIdConnectThread }

procedure TIdConnectThread.Execute;
begin
  inherited;
  done := false;
  errormsg := '';
  excclass := nil;
  try
    if assigned(connectproc) then
      connectproc();
  except
    on e: exception do
    begin
      errormsg := e.message;
      excclass := TExcClass(e.classtype);
    end;
  end;
  done := true;
end;

end.
