program InternetExpressTestSvr;

{$APPTYPE GUI}

{%File 'readme.txt'}

uses
  Forms,
  ComApp,
  ConsoleU in 'ConsoleU.pas' {Form1},
  HomeU in 'HomeU.pas' {Home: TWebAppPageModule} {*.html},
  DMU in 'DMU.pas' {DM: TWebDataModule},
  QueryU in 'QueryU.pas' {Query: TWebPageModule} {*.html},
  InetXPageU in 'InetXPageU.pas' {Countries: TWebPageModule} {*.html};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
