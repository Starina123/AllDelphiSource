{***************************************************************
 *
 * Project  : Server
 * Unit Name: ServerMain
 * Purpose  : Demonstrates basic use of IdTCPServer
 * Date  : 16/01/2001  -  03:19:36
 * History  :
 *
 ****************************************************************}

unit ServerMain;

interface

uses
  SysUtils, Classes,
  {$IFDEF Linux}
  QGraphics, QControls, QForms, QDialogs,
  {$ELSE}
  graphics, controls, forms, dialogs,
  {$ENDIF}
  IdBaseComponent, IdComponent, IdTCPServer;

type
  TfrmServer = class(TForm)
  TCPServer: TIdTCPServer;
  procedure FormCreate(Sender: TObject);
  procedure TCPServerExecute(AThread: TIdPeerThread);
  private
  public
  end;

var
  frmServer: TfrmServer;

implementation
{$IFDEF MSWINDOWS}{$R *.dfm}{$ELSE}{$R *.xfm}{$ENDIF}

procedure TfrmServer.FormCreate(Sender: TObject);
begin
  TCPServer.Active := True;
end;

// Any client that makes a connection is sent a simple message,
// then disconnected.
procedure TfrmServer.TCPServerExecute(AThread: TIdPeerThread);
begin
  with AThread.Connection do
  begin
  WriteLn('Hello from Basic Indy Server server.');
  Disconnect;
  end;
end;

end.
