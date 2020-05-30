library SimpleAdapterIsapi;

{%File 'readme.txt'}

uses
  WebBroker,
  ISAPIApp,
  HomeU in 'HomeU.pas' {Home: TWebAppPageModule} {*.html},
  CounterU in 'CounterU.pas' {Counter: TPageProducerModule} {*.html};

{$R *.RES}

exports
  GetExtensionVersion,
  HttpExtensionProc,
  TerminateExtension;

begin
  Application.Initialize;
  Application.Run;
end.
