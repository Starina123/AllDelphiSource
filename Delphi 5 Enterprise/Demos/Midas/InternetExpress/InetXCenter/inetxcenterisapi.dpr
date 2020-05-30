{ ISAPI version of InternetExpress Center sample application }

library InetXCenterISAPI;

uses
  WebBroker,
  ISAPIApp,
  InextXCenterModule in 'InextXCenterModule.pas' {WebModule2: TWebModule};

{$R *.RES}

exports
  GetExtensionVersion,
  HttpExtensionProc,
  TerminateExtension;

begin
  Application.Initialize;
  Application.CreateForm(TWebModule2, WebModule2);
  Application.Run;
end.
