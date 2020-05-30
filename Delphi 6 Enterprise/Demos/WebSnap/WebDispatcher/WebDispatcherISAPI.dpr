library WebDispatcherISAPI;

{%File 'readme.txt'}

uses
  WebBroker,
  ISAPIThreadPool,
  ISAPIApp,
  MainU in 'MainU.pas' {Main: TWebAppDataModule},
  ModuleU in 'ModuleU.pas' {Module: TWebDataModule};

{$R *.RES}

exports
  GetExtensionVersion,
  HttpExtensionProc,
  TerminateExtension;

begin
  Application.Initialize;
  Application.Run;
end.
