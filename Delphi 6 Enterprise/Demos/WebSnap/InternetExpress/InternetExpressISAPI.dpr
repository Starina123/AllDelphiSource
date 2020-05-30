library InternetExpressISAPI;

{%File 'readme.txt'}

uses
  WebBroker,
  ISAPIThreadPool,
  ISAPIApp,
  HomeU in 'HomeU.pas' {Home: TWebAppPageModule} {*.html},
  QueryU in 'QueryU.pas' {Query: TWebPageModule} {*.html},
  DMU in 'DMU.pas' {DM: TWebDataModule},
  InetXPageU in 'InetXPageU.pas' {Countries: TWebPageModule} {*.html};

{$R *.RES}

exports
  GetExtensionVersion,
  HttpExtensionProc,
  TerminateExtension;

begin
  Application.Initialize;
  Application.Run;
end.
