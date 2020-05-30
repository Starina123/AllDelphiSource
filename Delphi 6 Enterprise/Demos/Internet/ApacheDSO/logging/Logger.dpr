library Logger;

uses
  WebBroker,
  HTTPD,
  ApacheApp,
  Logger_u in 'Logger_u.pas' {WebModule1: TWebModule};

{$R *.res}

exports
  apache_module name 'logger_module';

begin
  ModuleName:='logger_module';
  ContentType:='logger-handler';
  Application.Initialize;
  Application.CreateForm(TWebModule1, WebModule1);
  Application.Run;
end.