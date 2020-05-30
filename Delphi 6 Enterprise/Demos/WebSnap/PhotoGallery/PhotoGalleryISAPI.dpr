library PhotoGalleryISAPI;

{%File 'readme.txt'}
{%File 'GeneralTemplateBottom.html'}
{%File 'GeneralTemplateTop.html'}

uses
  WebBroker,
  ISAPIThreadPool,
  ISAPIApp,
  AddUserPageMod in 'AddUserPageMod.pas' {AddUserPageModule: TWebPageModule} {*.html},
  LoginPageMod in 'LoginPageMod.pas' {LoginPageModule: TWebPageModule} {*.html},
  MainPageMod in 'MainPageMod.pas' {MainPageModule: TWebAppPageModule} {*.html},
  UpPicPageMod in 'UpPicPageMod.pas' {UpPicPageModule: TWebPageModule} {*.html},
  WebPageLookMod in 'WebPageLookMod.pas' {WebPageLookModule: TWebPageModule} {*.html};

{$R *.RES}

exports
  GetExtensionVersion,
  HttpExtensionProc,
  TerminateExtension;

begin
  Application.Initialize;
  Application.Run;
end.
