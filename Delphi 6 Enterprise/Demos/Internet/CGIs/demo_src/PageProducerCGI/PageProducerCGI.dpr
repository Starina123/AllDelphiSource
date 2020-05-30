program PageProducerCGI;

{$APPTYPE CONSOLE}

uses
  CGIApp,
  WebBroker,
  PageProducerHandlerU in 'PageProducerHandlerU.pas' {WebModule1: TWebModule};
  //TWebPageFetcherU in 'TWebPageFetcherU.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TWebModule1, WebModule1);
  Application.Run;
end.
