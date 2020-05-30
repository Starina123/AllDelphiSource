program CustomerList;

{$APPTYPE CONSOLE}

uses
  WebBroker,
  CGIApp,
  CustomerListWebModule in 'CustomerListWebModule.pas' {WebModule1: TWebModule};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TWebModule1, WebModule1);
  Application.Run;
end.
