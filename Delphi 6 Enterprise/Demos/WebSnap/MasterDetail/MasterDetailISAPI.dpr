library MasterDetailISAPI;

{%File '..\MasterDetail\readme.txt'}

uses
  WebBroker,
  ISAPIThreadPool,
  ISAPIApp,
  HomeU in '..\MasterDetail\HomeU.pas' {Home: TWebAppPageModule} {*.html},
  DMU in '..\MasterDetail\DMU.pas' {WebDataModule1: TWebDataModule},
  OrderFormU in '..\MasterDetail\OrderFormU.pas' {OrderForm: TWebPageModule} {*.html},
  OrderGridU in '..\MasterDetail\OrderGridU.pas' {OrdersGrid: TWebPageModule} {*.html};

{$R *.RES}

exports
  GetExtensionVersion,
  HttpExtensionProc,
  TerminateExtension;

begin
  Application.Initialize;
  Application.Run;
end.
