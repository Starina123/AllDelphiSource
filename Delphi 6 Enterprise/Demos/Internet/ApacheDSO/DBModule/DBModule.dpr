library DBModule;

uses
  WebBroker,
  ApacheApp,
  DBWebModule in 'DBWebModule.pas' {WebModule1: TWebModule};

{$R *.res}

exports
  apache_module name 'dbmodule_module';

begin
  ModuleName := 'dbmodule_module';
  ContentType := 'dbmodule-handler';
  Application.Initialize;
  Application.CreateForm(TWebModule1, WebModule1);
  Application.Run;
end.
