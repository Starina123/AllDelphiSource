unit main;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, StdCtrls, Buttons, ScktComp, ExtCtrls, ComCtrls;

type
  TChatForm = class(TForm)
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    Exit1: TMenuItem;
    FileConnectItem: TMenuItem;
    FileListenItem: TMenuItem;
    StatusBar1: TStatusBar;
    Bevel1: TBevel;
    Panel1: TPanel;
    Memo1: TMemo;
    Memo2: TMemo;
    N1: TMenuItem;
    SpeedButton1: TSpeedButton;
    Disconnect1: TMenuItem;
    ServerSocket: TServerSocket;
    ClientSocket: TClientSocket;
    procedure FileListenItemClick(Sender: TObject);
    procedure FileConnectItemClick(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure Memo1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure ServerSocketError(Sender: TObject; Number: Smallint;
      var Description: string; Scode: Integer; const Source,
      HelpFile: string; HelpContext: Integer; var CancelDisplay: Wordbool);
    procedure Disconnect1Click(Sender: TObject);
    procedure ClientSocketConnect(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure ClientSocketRead(Sender: TObject; Socket: TCustomWinSocket);
    procedure ServerSocketClientRead(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure ServerSocketAccept(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure ServerSocketClientConnect(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure ClientSocketDisconnect(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure ClientSocketError(Sender: TObject; Socket: TCustomWinSocket;
      ErrorEvent: TErrorEvent; var ErrorCode: Integer);
    procedure ServerSocketClientDisconnect(Sender: TObject;
      Socket: TCustomWinSocket);
  protected
    IsServer: Boolean;
  end;

var
  ChatForm: TChatForm;
  Server: String;

implementation

{$R *.DFM}

procedure TChatForm.FileListenItemClick(Sender: TObject);
begin
  FileListenItem.Checked := not FileListenItem.Checked;
  if FileListenItem.Checked then
  begin
    ClientSocket.Active := False;
    ServerSocket.Active := True;
    Statusbar1.Panels[0].Text := 'Listening...'
  end
  else
  begin
    if ServerSocket.Active then
      ServerSocket.Active := False;
    Statusbar1.Panels[0].Text := '';
  end;
end;

procedure TChatForm.FileConnectItemClick(Sender: TObject);
begin
  if ClientSocket.Active then ClientSocket.Active := False;
  if InputQuery('Computer to connect to', 'Address Name:', Server) then
    if Length(Server) > 0 then
      with ClientSocket do
      begin
        Host := Server;
        Active := True;
      end;
end;

procedure TChatForm.Exit1Click(Sender: TObject);
begin
  ServerSocket.Close;
  ClientSocket.Close;
  Close;
end;

procedure TChatForm.Memo1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_Return then
    if IsServer then
      ServerSocket.Socket.Connections[0].SendText(Memo1.Lines[Memo1.Lines.Count - 1])
    else
      ClientSocket.Socket.SendText(Memo1.Lines[Memo1.Lines.Count - 1]);
end;

procedure TChatForm.FormCreate(Sender: TObject);
begin
  FileListenItemClick(nil);
end;

procedure TChatForm.ServerSocketError(Sender: TObject; Number: Smallint;
  var Description: string; Scode: Integer; const Source, HelpFile: string;
  HelpContext: Integer; var CancelDisplay: Wordbool);
begin
  ShowMessage(Description);
end;

procedure TChatForm.Disconnect1Click(Sender: TObject);
begin
  ClientSocket.Close;
  FileListenItemClick(nil);
end;

procedure TChatForm.ClientSocketConnect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
  Statusbar1.Panels[0].Text := 'Connected to: ' + Socket.RemoteHost;
end;

procedure TChatForm.ClientSocketRead(Sender: TObject;
  Socket: TCustomWinSocket);
begin
  Memo2.Lines.Add(Socket.ReceiveText);
end;

procedure TChatForm.ServerSocketClientRead(Sender: TObject;
  Socket: TCustomWinSocket);
begin
  Memo2.Lines.Add(Socket.ReceiveText);
end;

procedure TChatForm.ServerSocketAccept(Sender: TObject;
  Socket: TCustomWinSocket);
begin
  IsServer := True;
  Statusbar1.Panels[0].Text := 'Connected to: ' + Socket.RemoteAddress;
end;

procedure TChatForm.ServerSocketClientConnect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
  Memo2.Lines.Clear;
end;

procedure TChatForm.ClientSocketDisconnect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
  FileListenItemClick(nil);
end;

procedure TChatForm.ClientSocketError(Sender: TObject;
  Socket: TCustomWinSocket; ErrorEvent: TErrorEvent;
  var ErrorCode: Integer);
begin
  Memo2.Lines.Add('Error connecting to : ' + Server);
  ErrorCode := 0;
end;

procedure TChatForm.ServerSocketClientDisconnect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
  ServerSocket.Active := False;
  FileListenItem.Checked := not FileListenItem.Checked;
  FileListenItemClick(nil);
end;

end.
