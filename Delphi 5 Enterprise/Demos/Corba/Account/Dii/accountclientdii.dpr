program AccountClientDII;

{$APPTYPE CONSOLE}

{
  This Console CORBA Client uses Dynamic Invocation Interface (DII) to
  connect to the Server thereby using 'late binding'.
  In order to run this client, follow these steps:
  1. Export a CORBA IDL file using 'Export' button on AccountServer Type Library Form.
     Save it as AccountServer.IDL
  2. Start an Interface Repository (IR) by typing IREP TEST on command prompt.
  3. Copy StdVCL.IDL from ($DELPHI)\Imports\IDL directory to current directory.
  4. Import Account.IDL into the Interface Repository by typing
      IDL2IR AccountServer.IDL -ir TEST
  5. Run the AccountServer.Exe
  6. Run this Client
}

uses
  SysUtils,
  Windows,
  CorbaObj;
// Notice it does not use any _TLB, stub or skeleton units

var
  AFactory, Account: TAny;
  InstanceName: String;
  Bal: Double;
begin
  try
    InstanceName := ParamStr(1);
    if InstanceName = '' then InstanceName := 'Jack B. Quick';
    AFactory := ORB.Bind('IDL:AccountServer/AccountFactory:1.0');
    Account := AFactory.CreateInstance(InstanceName);
    Bal := Account.Balance;
    CharToOEM(PChar(InstanceName), PChar(InstanceName));
    WriteLn(Format('The balance on %s''s account is $%2f',[InstanceName, Bal]));
  except
    on E:Exception do WriteLn(E.Message);
  end;
end.
