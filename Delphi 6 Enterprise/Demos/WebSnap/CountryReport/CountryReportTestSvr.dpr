program CountryReportTestSvr;

{$APPTYPE GUI}

{%File 'readme.txt'}

uses
  Forms,
  ComApp,
  ConsoleUnit in 'ConsoleUnit.pas' {Form5},
  HomeUnit in 'HomeUnit.pas' {Home: TWebAppPageModule} {*.html},
  ReportUnit in 'ReportUnit.pas' {Report: TWebPageModule} {*.html};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm5, Form5);
  Application.Run;
end.
