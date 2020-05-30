program Server;
{$APPTYPE CONSOLE}
uses
  SysUtils,
  Corba,
  account_i in 'account_i.pas',
  Account_S in 'Account_S.pas',
  account_c in 'account_c.pas',
  account_impl in 'account_impl.pas';

var
   Acct : TAccountSkeleton;
begin
   CorbaInitialize;

   Acct := TAccountSkeleton.Create('Jack B Quick', TAccount.Create);
   writeln('Account object created...');writeln;

   BOA.ObjIsReady(Acct as _Object);
   writeln('Server is ready');
   BOA.ImplIsReady;


end.