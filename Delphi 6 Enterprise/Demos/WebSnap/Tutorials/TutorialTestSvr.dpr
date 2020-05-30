program TutorialTestSvr;

{$APPTYPE GUI}

{%File 'readme.txt'}
{%File 'StdTutorialHeader.html'}
{%File 'StdTutorialFooter.html'}

uses
  Forms,
  ComApp,
  ConsoleU in 'ConsoleU.pas' {Form1},
  HomeU in 'HomeU.pas' {Home: TWebAppPageModule} {*.html},
  TestSvrU in 'TestSvrU.pas' {TestSvr: TWebPageModule} {*.html},
  ConfigDelphiU in 'ConfigDelphiU.pas' {ConfigureDelphi: TWebPageModule} {*.html},
  MinAppU in 'MinAppU.pas' {MinApp: TWebPageModule} {*.html},
  CountryReportU in 'CountryReportU.pas' {CountryReport: TWebPageModule} {*.html},
  CountryEditorU in 'CountryEditorU.pas' {CountryEditor: TWebPageModule} {*.html},
  TroubleShootingU in 'TroubleShootingU.pas' {TroubleShooting: TWebPageModule} {*.html};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
