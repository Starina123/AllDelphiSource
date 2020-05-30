program WebMailApp;

{$APPTYPE GUI}

{%File 'readme.txt'}
{%File 'howto.html'}

uses
  Forms,
  ComApp,
  MainFrm in 'MainFrm.pas' {Form1},
  MainMod in 'MainMod.pas' {MainModule: TWebAppPageModule} {*.html},
  LoginMod in 'LoginMod.pas' {LoginModule: TWebPageModule} {*.html},
  ViewMailMod in 'ViewMailMod.pas' {ViewMailModule: TWebPageModule} {*.html},
  EmailMessageMod in 'EmailMessageMod.pas' {EmailMessageModule: TWebPageModule} {*.html};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
