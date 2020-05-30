unit Unit1;

interface

uses

  SysUtils, Variants, Classes, QGraphics, QControls, QForms,
  QDialogs, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  QStdCtrls, QExtCtrls, Sockets;

 
type
  TForm1 = class(TForm)
    Panel1: TPanel;
    Memo1: TMemo;
    Panel2: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    EditServer: TEdit;
    EditCommand: TEdit;
    Label1: TLabel;
    EditUser: TEdit;
    Label2: TLabel;
    EditPass: TEdit;
    Button1: TButton;
    ConnectLight: TShape;
    Label5: TLabel;
    client: TTcpClient;
    ButtonClose: TButton;
    ButtonClear: TButton;
    procedure Button1Click(Sender: TObject);
    procedure clientConnected(Sender: TObject);
    procedure clientConnect(sender: TObject);
    procedure clientError(sender: TObject; SocketError: Integer);
    procedure ButtonCloseClick(Sender: TObject);
    procedure ButtonClearClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation


{$R *.xfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  if NOT Client.Connected then
  begin
    ConnectLight.Brush.Color:= clGreen;
    ConnectLight.Repaint;
    Client.RemoteHost:= EditServer.Text;
    Client.Active := true;
    Client.connect;
  end;
end;

procedure TForm1.clientConnected(Sender: TObject);
var
  outln : String;
begin

end;

procedure TForm1.clientConnect(sender: TObject);
  var
  outln : String;
begin
  client.Sendln('0',#0);
  client.Sendln(EditUser.Text,#0);
  client.Sendln(EditPass.Text,#0);
  client.Sendln(editCommand.Text,#0);
  while client.WaitForData(10000) do
  begin
    outln := Client.Receiveln(#10);
    memo1.lines.add(outln);
  end;
  Client.Close;
  ConnectLight.Brush.Color:= clRed;
end;

procedure TForm1.clientError(sender: TObject; SocketError: Integer);
begin
  memo1.lines.Add('Socket Error # ' + IntToStr(SocketError));
  ConnectLight.Brush.Color:= clRed;
end;

procedure TForm1.ButtonCloseClick(Sender: TObject);
begin
  Client.Close;
end;

procedure TForm1.ButtonClearClick(Sender: TObject);
begin
  Memo1.Lines.Clear;
end;
 end.
