library ImgBtnCountryEditorISAPI;

{%File 'readme.txt'}

uses
  WebBroker,
  ISAPIThreadPool,
  ISAPIApp,
  HomeU in 'HomeU.pas' {Home: TWebAppPageModule} {*.html},
  CountryTableU in 'CountryTableU.pas' {CountryTable: TWebPageModule} {*.html},
  CountryFormU in 'CountryFormU.pas' {CountryForm: TWebPageModule} {*.html};

{$R *.RES}

exports
  GetExtensionVersion,
  HttpExtensionProc,
  TerminateExtension;

begin
  Application.Initialize;
  Application.Run;
end.
