program SessionTestTestSvr;

{$APPTYPE GUI}

{%File 'clearlog.html'}
{%File 'Log.html'}
{%File 'setvalue.html'}
{%File 'showvalue.html'}
{%File 'termsession.html'}
{%File 'readme.txt'}

uses
  Forms,
  ComApp,
  ConsoleU in 'ConsoleU.pas' {Form1},
  HomeU in 'HomeU.pas' {Home: TWebAppDataModule},
  SessionInfoU in 'SessionInfoU.pas' {SessionInfo: TWebPageModule} {*.html};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
