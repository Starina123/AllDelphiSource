library DBExpressISAPI;

{%File 'readme.txt'}

uses
  WebBroker,
  ISAPIThreadPool,
  ISAPIApp,
  DMUnit in 'DMUnit.pas',
  HomeUnit in 'HomeUnit.pas' {Home: TWebAppPageModule} {*.html},
  DetailsUnit in 'DetailsUnit.pas' {Details: TWebPageModule} {*.html},
  GridUnit in 'GridUnit.pas' {Grid: TWebPageModule} {*.html};

{$R *.RES}

exports
  GetExtensionVersion,
  HttpExtensionProc,
  TerminateExtension;

begin
  Application.Initialize;
  Application.Run;
end.
