library CountryReportIsapi;

{%File 'readme.txt'}

uses
  WebBroker,
  ISAPIApp,
  HomeUnit in 'HomeUnit.pas' {Home: TWebAppPageModule} {*.html},
  ReportUnit in 'ReportUnit.pas' {Report: TWebPageModule} {*.html};

{$R *.RES}

exports
  GetExtensionVersion,
  HttpExtensionProc,
  TerminateExtension;

begin
  Application.Initialize;
  Application.Run;
end.
