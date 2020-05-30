program TextBrowser;

uses
  QForms,
  main in 'main.pas' {TextBrowserForm};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TTextBrowserForm, TextBrowserForm);
  Application.Run;
end.
