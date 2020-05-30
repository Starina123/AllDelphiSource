{***************************************************************
 *
 * Project  : SSLTunnel
 * Unit Name: main
 * Purpose  : Demonstrates setting up an SSL tunnell
 * Version  : 1.0
 * Date  : Wed 25 Apr 2001  -  01:33:51
 * Author  : <unknown>
 * History  :
 * Tested  : Wed 25 Apr 2001  // Allen O'Neill <allen_oneill@hotmail.com>
 *
 ****************************************************************}

unit main;

interface

uses
{$IFDEF Linux}
   QGraphics,  QControls,  QForms,  QDialogs,  QStdCtrls,
{$ELSE}
   Graphics,  Controls,  Forms,  Dialogs,  StdCtrls,
{$ENDIF}
  windows, messages,  SysUtils,  Classes, IdBaseComponent, IdComponent,
    IdTCPServer, IdMappedPortTCP, IdIntercept, IdSSLIntercept, IdSSLOpenSSL,
    IdTCPClient;

type
  TformMain = class(TForm)
    MappedPort: TIdMappedPortTCP;
    lablLocal: TLabel;
    Label2: TLabel;
    lablHost: TLabel;
    Label1: TLabel;
    Label3: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure MappedPortBeforeClientConnect(ASender: TComponent;
      AThread: TIdPeerThread; AClient: TIdTCPClient);
    procedure SSLInterceptGetPassword(var Password: string);
  private
  public
  end;

var
  formMain: TformMain;

implementation
{$IFDEF MSWINDOWS}{$R *.dfm}{$ELSE}{$R *.xfm}{$ENDIF}

procedure TformMain.FormCreate(Sender: TObject);
begin
  if ParamCount = 3 then
  begin
    with MappedPort do
    begin
      DefaultPort := StrToInt(ParamStr(1));
      MappedHost := ParamStr(2);
      MappedPort := StrToInt(ParamStr(3));
      //
      Active := True;
      //
      lablLocal.Caption := 'Local Port: ' + IntToStr(DefaultPort);
      lablHost.Caption := 'Host: ' + MappedHost + ':' + IntToStr(MappedPort);
    end;
    lablLocal.Visible := True;
    lablHost.Visible := True;
  end;
end;

procedure TformMain.MappedPortBeforeClientConnect(ASender: TComponent;
  AThread: TIdPeerThread; AClient: TIdTCPClient);
var
  LIntercept: TIdConnectionInterceptOpenSSL;
begin
  LIntercept := TIdConnectionInterceptOpenSSL.Create(AClient);
  AClient.Intercept := LIntercept;
  with LIntercept do
  begin
    SSLOptions.Method := sslvSSLv2;
    SSLOptions.Mode := sslmClient;
    SSLOptions.VerifyMode := [];
    SSLOptions.VerifyDepth := 0;
    OnGetPassword := SSLInterceptGetPassword;
  end;
end;

procedure TformMain.SSLInterceptGetPassword(var Password: string);
begin
  Password := 'aaaa';
end;

end.

