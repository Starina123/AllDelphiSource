program XMLBiolifeTestSvr;

{$APPTYPE GUI}

{%File 'readme.txt'}
{%File 'template.xsl'}

uses
  Forms,
  ComApp,
  ConsoleU in 'ConsoleU.pas' {Form1},
  HomeU in 'HomeU.pas' {Home: TWebAppPageModule},
  DMU in 'DMU.pas' {DM: TWebDataModule},
  GridU in 'GridU.pas' {Grid: TWebPageModule},
  EditU in 'EditU.pas' {Details: TWebPageModule},
  LoginU in 'LoginU.pas' {LoginPage: TWebPageModule};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
