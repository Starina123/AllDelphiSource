program Client;
{$APPTYPE CONSOLE}
uses
  SysUtils,
  Corba,
  Account_I,
  Account_C;

procedure Main;
var
  Acct: Account;
begin
  CorbaInitialize;
  Acct := TAccountHelper.Bind;
  WriteLn('The balance is ', FormatFloat('$###,##0.00', Acct.balance));
end;

begin
  Main;
end.
