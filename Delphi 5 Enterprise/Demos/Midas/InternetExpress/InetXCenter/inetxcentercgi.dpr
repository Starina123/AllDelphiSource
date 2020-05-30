{ CGI version of InternetExpress Center sample application }

program InetXCenterCGI;

{$APPTYPE CONSOLE}

uses
  WebBroker,
  CGIApp,
  InextXCenterModule in 'InextXCenterModule.pas' {WebModule2: TWebModule};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TWebModule2, WebModule2);
  Application.Run;
end.
