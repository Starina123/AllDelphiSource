program PhotoGalleryTestSvr;

{$APPTYPE GUI}

{%File 'GeneralTemplateTop.html'}
{%File 'GeneralTemplateBottom.html'}
{%File 'readme.txt'}

uses
  Forms,
  ComApp,
  MainFrm in 'MainFrm.pas' {MainForm},
  MainPageMod in 'MainPageMod.pas' {MainPageModule: TWebAppPageModule} {*.html},
  LoginPageMod in 'LoginPageMod.pas' {LoginPageModule: TWebPageModule} {*.html},
  WebPageLookMod in 'WebPageLookMod.pas' {WebPageLookModule: TWebPageModule} {*.html},
  UpPicPageMod in 'UpPicPageMod.pas' {UpPicPageModule: TWebPageModule} {*.html},
  AddUserPageMod in 'AddUserPageMod.pas' {AddUserPageModule: TWebPageModule} {*.html};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
