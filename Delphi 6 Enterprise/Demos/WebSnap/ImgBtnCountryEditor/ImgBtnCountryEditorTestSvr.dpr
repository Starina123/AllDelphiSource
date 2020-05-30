program ImgBtnCountryEditorTestSvr;

{$APPTYPE GUI}

{%File 'readme.txt'}

uses
  Forms,
  ComApp,
  ConsoleU in 'ConsoleU.pas' {Form1},
  HomeU in 'HomeU.pas' {Home: TWebAppPageModule} {*.html},
  CountryTableU in 'CountryTableU.pas' {CountryTable: TWebPageModule} {*.html},
  CountryFormU in 'CountryFormU.pas' {CountryForm: TWebPageModule} {*.html};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
