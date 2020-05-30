program iservcgi;

uses
  WebBroker,
  HTTPApp,
  CGIApp,
  main in 'Main.pas' {CustomerInfoModule: TWebModule};

{$R *.RES}
{$APPTYPE CONSOLE}  // CGI application

begin
  Application.Initialize;
  Application.CreateForm(TCustomerInfoModule, CustomerInfoModule);
  Application.Run;
end.

