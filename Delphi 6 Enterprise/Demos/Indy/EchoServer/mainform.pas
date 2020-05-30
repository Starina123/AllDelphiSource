{***************************************************************
 *
 * Project  : EchoServer
 * Unit Name: mainform
 * Purpose  : Demonstrates ECHO server
 * Date  : 21/01/2001  -  13:05:54
 * History  :
 *
 ****************************************************************}

unit mainform;

interface

uses
  {$IFDEF Linux}
  QForms, QControls, QDialogs, QStdCtrls,
  {$ELSE}
  windows, messages, graphics, controls, forms, dialogs, stdctrls,
  {$ENDIF}
  SysUtils, Classes,
  IdBaseComponent, IdComponent, IdTCPServer, IdEchoServer;

type
  TForm1 = class(TForm)
  IdECHOServer1: TIdECHOServer;
  Label1: TLabel;
  lblStatus: TLabel;
  btnExit: TButton;
  procedure FormActivate(Sender: TObject);
  procedure btnExitClick(Sender: TObject);
  procedure IdECHOServer1Connect(AThread: TIdPeerThread);
  procedure IdECHOServer1Disconnect(AThread: TIdPeerThread);
  private
  { Private declarations }
  public
  { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$IFDEF MSWINDOWS}{$R *.dfm}{$ELSE}{$R *.xfm}{$ENDIF}

{No coding is required.  Echo server is ready to go by setting Active to True}
 procedure TForm1.FormActivate(Sender: TObject);
begin
  try
  IdECHOServer1.Active := True;
  except
  ShowMessage('Permission Denied. Cannot bind reserved port due to security reasons');
  Application.Terminate;
  end;
end;


procedure TForm1.btnExitClick(Sender: TObject);
begin
if IdECHOServer1.active then
  IdECHOServer1.active := false;
Application.terminate;
end;

procedure TForm1.IdECHOServer1Connect(AThread: TIdPeerThread);
begin
lblStatus.caption := '[ Serving client ]';
end;

procedure TForm1.IdECHOServer1Disconnect(AThread: TIdPeerThread);
begin
lblStatus.caption := '[ idle - waiting next client ]';
end;

end.
