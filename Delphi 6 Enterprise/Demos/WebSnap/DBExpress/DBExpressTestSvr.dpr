program DBExpressTestSvr;

{$APPTYPE GUI}

{%File 'readme.txt'}

uses
  Forms,
  ComApp,
  ConsoleUnit in 'ConsoleUnit.pas' {Form1},
  HomeUnit in 'HomeUnit.pas' {Home: TWebAppPageModule} {*.html},
  GridUnit in 'GridUnit.pas' {Grid: TWebPageModule} {*.html},
  DetailsUnit in 'DetailsUnit.pas' {Details: TWebPageModule} {*.html},
  DMUnit in 'DMUnit.pas' {DM: TWebDataModule};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
