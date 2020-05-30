program AccountClient;

{$APPTYPE CONSOLE}

{
  This Console CORBA Client is statically compiled with the Account's STUB Class
  thereby using 'early binding'.
}

uses
  SysUtils,
  Windows,
  CorbaObj,
  // The _TLB unit contains Client's STUB Class and Server's SKELETON Class
  AccountServer_TLB in 'AccountServer_TLB.pas';

var
  Account: IAccount;
  InstanceName: String;
  Bal: Double;
begin
  CorbaInitialize;
  InstanceName := ParamStr(1);
  if InstanceName = '' then InstanceName := 'Jack B. Quick';
  try
    Account := TAccountCorbaFactory.CreateInstance(InstanceName);
    Bal := Account.Balance;
    CharToOEM(PChar(InstanceName), PChar(InstanceName));
    WriteLn(Format('The balance on %s''s account is $%f',[InstanceName, Bal]));
  except
    on E:Exception do WriteLn(E.Message);
  end;
end.
