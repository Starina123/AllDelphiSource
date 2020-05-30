program TestSvrInfo;

{$APPTYPE GUI}

{$R 'htmlfiles.res' 'htmlfiles.rc'}
{%File 'readme.txt'}

uses
  Forms,
  ComApp,
  HomeU in 'HomeU.pas' {Home: TWebAppPageModule} {*.HTML},
  ConsoleU in 'ConsoleU.pas' {Form1},
  DetailsU in 'DetailsU.pas' {Details: TWebPageModule} {*.HTML};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
