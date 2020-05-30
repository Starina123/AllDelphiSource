unit ScannerU;

interface

uses
  {$IFDEF MSWINDOWS}
  Windows, Messages,
  {$ENDIF}
  SysUtils, Classes, HTTPApp, Sockets;

type
  TWebModule1 = class(TWebModule)
    TcpClient1: TTcpClient;
    procedure WebModule1waScanAction(Sender: TObject; Request: TWebRequest;
      Response: TWebResponse; var Handled: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  WebModule1: TWebModule1;

implementation

{$IFDEF MSWINDOWS}{$R *.dfm}{$ENDIF}
{$IFDEF LINUX}{$R *.xfm}{$ENDIF}

procedure TWebModule1.WebModule1waScanAction(Sender: TObject;
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
    //else
        //writeln('no connection made on port:' + inttostr(i));
    TcpClient1.Close;
    end; //for loop
  except
    on E:Exception do begin
       WriteLn('Exception: ' + E.Message);
       end; // end on do begin
  end; //try block
  Request.WriteString('END PORT SCAN </BODY></HTML>');

end;

end.
 
