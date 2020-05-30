{***************************************************************
 *
 * Project  : telnet
 * Unit Name: mainform
 * Purpose  :
 * Version  : 1.0
 * Date  : Wed 25 Apr 2001  -  01:36:35
 * Author  : <unknown>
 * History  :
 * Tested  : Wed 25 Apr 2001  // Allen O'Neill <allen_oneill@hotmail.com>
 *
 ****************************************************************}

unit mainform;

interface

uses
{$IFDEF Linux}
   QGraphics,  QControls,  QForms,  QDialogs,  QComCtrls,  QStdCtrls,
{$ELSE}
   Graphics,  Controls,  Forms,  Dialogs,  ComCtrls,  StdCtrls,
{$ENDIF}
  windows, messages, spin,  SysUtils,  Classes, IdBaseComponent, IdComponent,
    IdTCPConnection, IdTCPClient, IdTelnet;

type
  TfrmTelnetDemo = class(TForm)
    Memo1: TRichEdit;
    edtServer: TEdit;
    lblServer: TLabel;
    spnedtPort: TSpinEdit;
    lblPort: TLabel;
    btnConnect: TButton;
    btnDisconnect: TButton;
    sbrStatus: TStatusBar;
    IdTelnetDemo: TIdTelnet;
    procedure btnConnectClick(Sender: TObject);
    procedure btnDisconnectClick(Sender: TObject);
    procedure Memo1KeyPress(Sender: TObject; var Key: Char);
    procedure IdTelnetDemoDataAvailable(Buffer: string);
    procedure IdTelnetDemoConnected(Sender: TObject);
    procedure IdTelnetDemoConnect;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTelnetDemo: TfrmTelnetDemo;

implementation

{$IFDEF MSWINDOWS}{$R *.dfm}{$ELSE}{$R *.xfm}{$ENDIF}

procedure TfrmTelnetDemo.btnConnectClick(Sender: TObject);
begin
  IDTelnetDemo.Host := edtServer.Text;
  IDTelnetDemo.port := spnedtPort.Value;
  IdTelnetDemo.Connect;
end;

procedure TfrmTelnetDemo.btnDisconnectClick(Sender: TObject);
begin
  IdTelnetDemo.Disconnect;
end;

procedure TfrmTelnetDemo.Memo1KeyPress(Sender: TObject;
  var Key: Char);
begin
  {we simply send the key stroke to the server.  It may echo it back to us}
  if IdTelnetDemo.Connected then
    IdTelnetDemo.SendCh(Key);
  Key := #0;
end;

procedure TfrmTelnetDemo.IdTelnetDemoDataAvailable(Buffer: string);
{This routine comes directly from the ICS TNDEMO code. Thanks to Francois Piette
 It updates the memo control when we get data}
const
  CR = #13;
  LF = #10;
var
  Start, Stop: Integer;
begin
  if Memo1.Lines.Count = 0 then
    Memo1.Lines.Add('');

  Start := 1;
  Stop := Pos(CR, Buffer);
  if Stop = 0 then
    Stop := Length(Buffer) + 1;
  while Start <= Length(Buffer) do
  begin
    Memo1.Lines.Strings[Memo1.Lines.Count - 1] :=
      Memo1.Lines.Strings[Memo1.Lines.Count - 1] +
      Copy(Buffer, Start, Stop - Start);
    if Buffer[Stop] = CR then
    begin
      Memo1.Lines.Add('');
{$IFNDEF Linux}
      SendMessage(Memo1.Handle, WM_KEYDOWN, VK_UP, 1);
{$ENDIF}
    end;
    Start := Stop + 1;
    if Start > Length(Buffer) then
      Break;
    if Buffer[Start] = LF then
      Start := Start + 1;
    Stop := Start;
    while (Buffer[Stop] <> CR) and (Stop <= Length(Buffer)) do
      Stop := Stop + 1;
  end;
end;

procedure TfrmTelnetDemo.IdTelnetDemoConnected(Sender: TObject);
begin
  sbrStatus.SimpleText := 'Connected';
end;

procedure TfrmTelnetDemo.IdTelnetDemoConnect;
begin
  sbrStatus.SimpleText := 'Connect';
end;

end.

