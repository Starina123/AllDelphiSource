program WebRequestCGI;

{$APPTYPE CONSOLE}

uses
  WebBroker,
  CGIApp,
  requestU in 'requestU.pas' {WebModule1: TWebModule};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TWebModule1, WebModule1);
  Application.Run;
end.
