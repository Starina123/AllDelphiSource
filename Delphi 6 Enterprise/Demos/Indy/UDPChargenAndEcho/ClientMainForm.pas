{***************************************************************
 *
 * Project  : UDPClient
 * Unit Name: ClientMainForm
 * Purpose  : UDP Chargen and Echo demo - client project
 * Version  : 1.0
 * Date  : Wed 25 Apr 2001  -  01:42:02
 * Author  : <unknown>
 * History  :
 * Tested  : Wed 25 Apr 2001  // Allen O'Neill <allen_oneill@hotmail.com> 
 *
 ****************************************************************}

unit ClientMainForm;

interface

uses
  {$IFDEF Linux}
  QGraphics, QControls, QForms, QStdCtrls, QDialogs,
  {$ELSE}
  windows, messages, graphics, controls, forms, dialogs, stdctrls,
  {$ENDIF}
  SysUtils, Classes, IdBaseComponent, IdComponent, IdUDPBase, IdUDPClient;

type
  TfrmMain = class(TForm)
  Button1: TButton;
  IdUDPClient1: TIdUDPClient;
  IdUDPClient2: TIdUDPClient;
  Button2: TButton;
  procedure Button1Click(Sender: TObject);
  procedure Button2Click(Sender: TObject);
  procedure FormCreate(Sender: TObject);
  private
  procedure Test(IdUDPClient: TIdUDPClient);
  public
  { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$IFDEF MSWINDOWS}{$R *.dfm}{$ELSE}{$R *.xfm}{$ENDIF}

uses  IdException, IdStackConsts;

procedure TfrmMain.Button1Click(Sender: TObject);
begin
  Test(IdUDPClient1);
end;

procedure TfrmMain.Button2Click(Sender: TObject);
begin
  Test(IdUDPClient2);
end;

procedure TfrmMain.Test(IdUDPClient: TIdUDPClient);
var
  s, peer: string;
  port: integer;
  counter: integer;
begin
  counter := 1;
  Screen.Cursor := crHourGlass;
  try
  IdUDPClient.Send(Format('test #%d', [counter]));
  repeat
  try
  s := IdUDPClient.ReceiveString(peer, port);
  except
  on E: EIdSocketError do
  if E.LastError <> 10040 then
  raise;
  end;
  if s <> '' then
  ShowMessage(Format('%s:%d said'#13'%s', [peer, port, s]));
  until s = '';
  finally
  Screen.Cursor := crDefault;
  end;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  // enable broadcast support in TIdUDPClient
  IdUDPClient1.BroadcastEnabled := True;
  IdUDPClient2.BroadcastEnabled := True;
end;

end.
