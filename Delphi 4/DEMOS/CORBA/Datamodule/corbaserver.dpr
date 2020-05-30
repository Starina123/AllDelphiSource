program CORBAServer;

{
  This is the CORBA Server part of the demo
  This project is created via the wizard:
  File | New MultiTier | CORBA Data Module.
  'DemoCORBA' was entered as the ClassName.

  In order to run the Server, please make sure that
  OSAGENT is either running as a service under NT
  or has been started at the command prompt with a -C option.
}

uses
  Forms,
  CORBAServerForm in 'CORBAServerForm.pas' {MainServerForm},
  // The _TLB unit contains the STUB and SKELETON classes for DemoCORBA Object
  CORBAServer_TLB in 'CORBAServer_TLB.pas',
  // The Impl Unit contains the implementation of DemoCORBA Object
  CORBAServerImpl in 'CORBAServerImpl.pas' {DemoCORBA: TCorbaDataModule} {DemoCORBA: CoClass};

{$R *.TLB} {CORBA}

begin
  Application.Initialize;
  Application.CreateForm(TMainServerForm, MainServerForm);
  Application.Run;
end.
