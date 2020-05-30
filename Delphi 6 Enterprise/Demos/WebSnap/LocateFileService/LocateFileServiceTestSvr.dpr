program LocateFileServiceTestSvr;

{$APPTYPE GUI}

{$R 'htmlfiles.res' 'htmlfiles.rc'}
{%File 'Header.html'}
{%File 'Footer.html'}
{%File 'readme.txt'}

uses
  Forms,
  ComApp,
  ConsoleUnit in 'ConsoleUnit.pas' {Form2},
  Page1Unit in 'Page1Unit.pas' {Page1: TWebAppPageModule} {*.html},
  Page2Unit in 'Page2Unit.pas' {Page2: TWebPageModule} {*.html},
  Page3Unit in 'Page3Unit.pas' {Page3: TWebPageModule} {*.html};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
