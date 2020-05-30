unit srvrdm;

{
  This is the server side of the demo.  A Login procedure has been added to the
  RemoteDataModule which the client will use to login.  You can use the Type
  Library Editor or the Edit | Add To Interface menu to add a procedure to the
  type library.
}
interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComServ, ComObj, VCLCom, StdVcl, DataBkr, DBClient, server_tlb,
  Db, DBTables, Provider;

type
  TLoginDemo = class(TRemoteDataModule, ILoginDemo)
    Country: TTable;
    CountryProvider: TDataSetProvider;
    procedure LoginDemoCreate(Sender: TObject);
    procedure LoginDemoDestroy(Sender: TObject);
  private
    FLoggedIn: Boolean;
    FUserName: string;
    procedure CheckLogin;
  protected
    procedure Login(const UserName, Password: WideString); safecall;
    class procedure UpdateRegistry(Register: Boolean; const ClassID, ProgID: string); override;
  end;

var
  LoginDemo: TLoginDemo;

implementation

uses SrvrFrm;

{$R *.dfm}

{ This procedure is a helper to check that someone has actually logged into the
  server. }
procedure TLoginDemo.CheckLogin;
begin
  if not FLoggedIn then
    raise Exception.Create('Not logged in');
end;

procedure TLoginDemo.Login(const UserName, Password: WideString);
begin
  { Just add the UserName to the ListBox on Form1 and set the login flag to
    true.}
  Form1.ListBox1.Items.Add(UserName);
  FLoggedIn := True;
  FUserName := UserName;
end;

procedure TLoginDemo.LoginDemoCreate(Sender: TObject);
begin
  FLoggedIn := False;
end;

procedure TLoginDemo.LoginDemoDestroy(Sender: TObject);
begin
  { Remove the Name from the list}
  with Form1.ListBox1.Items do Delete(IndexOf(FUserName));
end;

class procedure TLoginDemo.UpdateRegistry(Register: Boolean; const ClassID, ProgID: string);
begin
  if Register then
  begin
    inherited UpdateRegistry(Register, ClassID, ProgID);
    EnableSocketTransport(ClassID);
    EnableWebTransport(ClassID);
  end else
  begin
    DisableSocketTransport(ClassID);
    DisableWebTransport(ClassID);
    inherited UpdateRegistry(Register, ClassID, ProgID);
  end;
end;

initialization
  TComponentFactory.Create(ComServer, TLoginDemo,
    Class_LoginDemo, ciMultiInstance, tmSingle);
end.
