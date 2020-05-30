unit MainMod;

interface

uses
  SysUtils, Classes, HTTPApp, Sockets;

type
  TWebModule1 = class(TWebModule)
    TcpClient1: TTcpClient;
    procedure WebModule1actnScanAction(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  WebModule1: TWebModule1;

implementation

uses WebReq;

{$R *.xfm}

procedure TWebModule1.WebModule1actnScanAction(Sender: TObject;
  Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
var
  i : integer;
  hostname : String;
begin
  TcpClient1.Active := false;

  hostname := Request.QueryFields.Values['HOSTNAME'];

  if (hostname = EmptyStr) then
    hostname := 'localhost';

  Response.SendResponse;
  Request.WriteString('<HTML><BODY>Scanning Host: ' + hostname + '<BR>');
  try
    for i := 1 to 1024 do
    begin
      TcpClient1.RemotePort := inttostr(i);
      TcpClient1.RemoteHost := hostname;
      TcpClient1.Active:=true;
      if TcpClient1.Connect then
        Request.WriteString('There is Server on  port: ' + inttostr(i) + '<BR>');
      TcpClient1.Close;
    end;
  except
    on E:Exception do
       Request.WriteString('Exception ' + E.ClassName + ': ' + E.Message);
  end; //try block
  Request.WriteString('END PORT SCAN </BODY></HTML>');
end;

initialization
  WebRequestHandler.WebModuleClass := TWebModule1;
end.