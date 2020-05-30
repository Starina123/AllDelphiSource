library ActionFieldISAPI;

{%File 'readme.txt'}

uses
  WebBroker,
  ISAPIThreadPool,
  ISAPIApp,
  HomeU in 'HomeU.pas' {Home: TWebAppPageModule} {*.html},
  DMU in 'DMU.pas' {DM: TWebDataModule},
  ItemsTableU in 'ItemsTableU.pas' {ItemsTable: TWebPageModule} {*.html},
  NewRowU in 'NewRowU.pas' {NewRow: TWebPageModule} {*.html};

{$R *.RES}

exports
  GetExtensionVersion,
  HttpExtensionProc,
  TerminateExtension;

begin
  Application.Initialize;
  Application.Run;
end.
