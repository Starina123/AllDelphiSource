program biolifetestsvr;

{$APPTYPE GUI}

{%File 'readme.txt'}

uses
  Forms,
  ComApp,
  consoleU in 'consoleU.pas' {Form1},
  HomeU in 'HomeU.pas' {Home: TWebAppPageModule} {*.html},
  DataU in 'DataU.pas' {WebDataModule3: TWebDataModule},
  GridU in 'GridU.pas' {Grid: TWebPageModule} {*.html},
  FormU in 'FormU.pas' {Details: TWebPageModule} {*.html},
  LoginU in 'LoginU.pas' {Login: TWebPageModule} {*.html};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
