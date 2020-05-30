{ Compile this DLL and place it into your web server
  scripts directory.  You can then access this application
  from a web browser using http://<your web server>/scripts/iserver.dll
}
library IServer;

uses
  WebBroker,
  HTTPApp,
  ISAPIApp,
  main in 'main.pas' {CustomerInfoModule: TDataModule};

{$R *.RES}

exports
  GetExtensionVersion,
  HttpExtensionProc,
  TerminateExtension;

begin
  Application.Initialize;
  Application.CreateForm(TCustomerInfoModule, CustomerInfoModule);
  Application.Run;
end.
