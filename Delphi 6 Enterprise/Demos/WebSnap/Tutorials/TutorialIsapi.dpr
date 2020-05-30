library TutorialIsapi;

{%File 'readme.txt'}
{%File 'StdTutorialHeader.html'}
{%File 'StdTutorialFooter.html'}

uses
  WebBroker,
  ISAPIApp,
  HomeU in 'HomeU.pas' {Home: TWebAppPageModule} {*.html},
  TestSvrU in 'TestSvrU.pas' {TestSvr: TWebPageModule} {*.html},
  ConfigDelphiU in 'ConfigDelphiU.pas' {ConfigureDelphi: TWebPageModule} {*.html},
  MinAppU in 'MinAppU.pas' {MinApp: TWebPageModule} {*.html},
  CountryReportU in 'CountryReportU.pas' {CountryReport: TWebPageModule} {*.html},
  CountryEditorU in 'CountryEditorU.pas' {CountryEditor: TWebPageModule} {*.html},
  TroubleShootingU in 'TroubleShootingU.pas' {TroubleShooting: TWebPageModule} {*.html};

{$R *.RES}

exports
  GetExtensionVersion,
  HttpExtensionProc,
  TerminateExtension;

begin
  Application.Initialize;
  Application.Run;
end.
