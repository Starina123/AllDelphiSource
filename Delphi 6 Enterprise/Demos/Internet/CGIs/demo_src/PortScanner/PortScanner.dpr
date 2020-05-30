program PortScanner;

{$APPTYPE CONSOLE}

uses
  WebBroker,
  CGIApp,
  ScannerU in 'ScannerU.pas' {WebModule1: TWebModule};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TWebModule1, WebModule1);
  Application.Run;
end.
