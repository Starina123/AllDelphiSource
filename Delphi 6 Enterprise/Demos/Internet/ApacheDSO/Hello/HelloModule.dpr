{*------------------------------------------------------------------------------
 * File: HelloModule.dpr
 * About: Basic HelloWorld Demo for an Apache Module
 *
 *-----------------------------------------------------------------------------}

library HelloModule;

uses
  WebBroker,
  ApacheApp,
  HelloUnit in 'HelloUnit.pas' {WebModule1: TWebModule};

{$R *.res}

exports
  apache_module name 'Hello_module';

begin
  Application.Initialize;
  //Optional, Set your own String for ModuleName and Content Type
  ModuleName:='HelloWorld_module';
  ContentType:= 'hello-handler';
  Application.CreateForm(TWebModule1, WebModule1);
  Application.Run;
end.
