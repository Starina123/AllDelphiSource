unit AccountServerImpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, ComObj, StdVcl,
  CorbaObj, AccountServer_TLB;

type

  TAccount = class(TCorbaImplementation, IAccount)
  private
    { Private declarations }
  public
    { Public declarations }
  protected
    function Balance: Double; safecall;
  end;

implementation

uses CorbInit;

function TAccount.Balance: Double;
begin
  Randomize;
  Result := Random * 100;
end;

initialization
  TCorbaObjectFactory.Create('AccountFactory', 'Account', 'IDL:AccountServer/AccountFactory:1.0', IAccount,
    TAccount, iMultiInstance, tmSingleThread);
end.