library ModuleInit;

uses
  WebBroker,
  ApacheApp,
  ModuleInit_u in 'ModuleInit_u.pas' {WebModule1: TWebModule},
  ApacheInit in 'ApacheInit.pas';

{$R *.res}

exports
  apache_module name 'ModuleInit_module';

begin
  ModuleName := 'ModuleInit_module';
  ContentType := 'moduleinit-handler';
  Application.Initialize;
  Application.CreateForm(TWebModule1, WebModule1);
  Application.Run;
end.
