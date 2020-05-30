{***************************************************************
 *
 * Project  : TimeServer
 * Unit Name: Main
 * Purpose  : Demonstrates basic use of the TimeServer
 * Date  : 21/01/2001  -  15:12:26
 * History  :
 *
 ****************************************************************}

unit Main;

interface

uses
  {$IFDEF Linux}
  QGraphics, QForms, QControls, QDialogs, QStdCtrls,
  {$ELSE}
  windows, messages, graphics, controls, forms, dialogs, stdctrls,
  {$ENDIF}
  SysUtils, Classes, IdComponent, IdTCPServer, IdTimeServer, IdBaseComponent;

type
  TfrmMain = class(TForm)
  IdTimeServer1: TIdTimeServer;
  Label1: TLabel;
  lblStatus: TLabel;
  procedure FormActivate(Sender: TObject);
  procedure IdTimeServer1Connect(AThread: TIdPeerThread);
  procedure IdTimeServer1Disconnect(AThread: TIdPeerThread);
  private
  public
  end;

var
  frmMain: TfrmMain;

implementation
{$IFDEF MSWINDOWS}{$R *.dfm}{$ELSE}{$R *.xfm}{$ENDIF}

// No Code required - TimeServer is functional as is.
 procedure TfrmMain.FormActivate(Sender: TObject);
begin
  try
  IdTimeServer1.Active := True;
  except
  ShowMessage('Permission Denied. Cannot bind reserved port due to security reasons');
  Application.Terminate;
  end;
end;


procedure TfrmMain.IdTimeServer1Connect(AThread: TIdPeerThread);
begin
lblStatus.caption := '[ Client connected ]';
end;

procedure TfrmMain.IdTimeServer1Disconnect(AThread: TIdPeerThread);
begin
lblStatus.caption := '[ idle ]';
end;

end.
