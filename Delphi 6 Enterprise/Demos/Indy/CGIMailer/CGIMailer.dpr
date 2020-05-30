program CGIMailer;

{$APPTYPE CONSOLE}

uses
  WebBroker,
  CGIApp,
  fMain in 'fMain.pas' {WebModule1: TWebModule};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TWebModule1, WebModule1);
  Application.Run;
end.
