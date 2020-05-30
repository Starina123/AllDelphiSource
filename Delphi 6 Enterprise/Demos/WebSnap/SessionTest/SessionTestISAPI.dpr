library SessionTestISAPI;

uses
  WebBroker,
  ISAPIThreadPool,
  ISAPIApp,
  HomeU in 'HomeU.pas' {Home: TWebAppDataModule},
  SessionInfoU in 'SessionInfoU.pas' {SessionInfo: TWebPageModule} {*.html};

{$R *.RES}

exports
  GetExtensionVersion,
  HttpExtensionProc,
  TerminateExtension;

begin
  Application.Initialize;
  Application.Run;
end.
