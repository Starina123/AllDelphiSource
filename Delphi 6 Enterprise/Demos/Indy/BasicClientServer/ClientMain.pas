{***************************************************************
 *
 * Project  : Client
 * Unit Name: ClientMain
 * Purpose  : Demonstrates basic interaction of IdTCPClient with server
 * Date  : 16/01/2001  -  03:21:02
 * History  :
 *
 ****************************************************************}

unit ClientMain;

interface

uses
  {$IFDEF Linux}
  QForms, QGraphics, QControls, QDialogs, QStdCtrls, QExtCtrls,
  {$ELSE}
  windows, messages, graphics, controls, forms, dialogs, stdctrls, extctrls,
  {$ENDIF}
  SysUtils, Classes,
  IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient;

type
  TForm2 = class(TForm)
  TCPClient: TIdTCPClient;
  pnlTop: TPanel;
  btnGo: TButton;
  lstMain: TListBox;
  procedure btnGoClick(Sender: TObject);
  private
  public
  end;

var
  Form2: TForm2;

implementation
{$IFDEF MSWINDOWS}{$R *.dfm}{$ELSE}{$R *.xfm}{$ENDIF}


// Any data received from the client is added as a text line in the ListBox
procedure TForm2.btnGoClick(Sender: TObject);
begin
  with TCPClient do
  begin
  Connect;
  try
  lstMain.Items.Add(ReadLn);
  finally
  Disconnect;
  end;
  end;
end;

end.
