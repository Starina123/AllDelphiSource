program AccountServer;

{$APPTYPE CONSOLE}

{
  This Demo demonstrates how to create a Console CORBA Server
  and a Console CORBA Client. In order to run this Server,
  please make sure you have the OSAGENT either started
  up with a -C option on Win95/NT or running as a service under NT.
}

uses
  SysUtils,
  CorbaObj,
  // The _TLB unit contains Client's STUB Class and Server's SKELETON Class
  AccountServer_TLB in 'AccountServer_TLB.pas',
  // The Impl Unit contains the Server's Implementation
  AccountServerImpl in 'AccountServerImpl.pas' {Account: CoClass};

{$R *.TLB} {CORBA}

begin
  CORBAInitialize;
  try
    WriteLn('Account Server is ready');
    BOA.ImplIsReady;
  except
    on E:Exception do WriteLn(E.Message);
  end;
end.
