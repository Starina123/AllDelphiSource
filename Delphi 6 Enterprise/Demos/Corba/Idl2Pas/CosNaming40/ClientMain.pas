(*============================================================================
                COSNaming Client Demo for VisiBroker 4 for Delphi

  The naming service changed significantly from VisiBroker 3.3 to VisiBroker 4.
  Now it is a java application that must be started with a command line that
  tells the Name Service which port to use for communications.  In addition,
  all clients and servers must use the same command line parameter as well.  The
  command line is used to "bootstrap" the Orb so that it knows which port to
  use for the Name Service.

  The naming service must be started before either the client or server.  Once
  the Name Service is up and running in a command window, its IOR will be
  displayed in the window.  Then the server and the client can be started (in
  that order).  Sample batch files have been provided with this example to
  show how to start each application.

  In a DOS window, run StartNS.bat first.  This brings up the Naming Service.
  Then run StartServer.bat.  After the server is up and running, run
  StartClient.bat

  The client demo shows two different ways to bind to an object.  The first is
  the more "traditional" way, using the OSAgent (or SmartAgent).  The other
  way is to use the Name Service.  In order to do that, the application must
  first resolve the reference to the Naming Service.  This gets a reference
  to the RootContext.  Create a Name Component to tell the Naming Service
  which object to retrieve. Then narrow that object to the Account type.

  ===========================================================================*)
unit ClientMain;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, 
  Corba, COSNaming, Account_c, Account_i, StdCtrls;

type
  TForm1 = class(TForm)
    GroupBox1: TGroupBox;
    btnOSAgentBalance: TButton;
    Label1: TLabel;
    GroupBox2: TGroupBox;
    btnBindNS: TButton;
    Label2: TLabel;
    btnNSBalance: TButton;
    Label3: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure btnOSAgentBalanceClick(Sender: TObject);
    procedure btnBindNSClick(Sender: TObject);
    procedure btnNSBalanceClick(Sender: TObject);
  private
  { private declarations }
  protected
    Acct : Account;    // Object that will use OSAgent for Binding
    AcctNS : Account;  // Object that will use Naming Service for Binding
    RootContext : NamingContext;
    nameComp : NameComponent;
    nameArray : COSNaming.Name;
    procedure InitCorba;
  { protected declarations }
  public
  { public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.InitCorba;
begin
  CorbaInitialize;
  Acct := TAccountHelper.bind;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  InitCorba;
end;

procedure TForm1.btnOSAgentBalanceClick(Sender: TObject);
begin
  Label1.Caption := FormatFloat('Balance = $##,##0.00', Acct.balance);
end;

procedure TForm1.btnBindNSClick(Sender: TObject);
begin
  //bind to the Root Context of the NS via the orb
  RootContext := TNamingContextHelper.Narrow(Orb.ResolveInitialReferences('NameService'), True);

  //create the naming component -- match server id and kind values
  nameComp := TNameComponent.Create('Account', 'Jack B Quick');

  //set up the Name sequence
  SetLength(NameArray, 1);
  NameArray[0] := nameComp;

  //Resolve the account object
  AcctNS := TAccountHelper.narrow(RootContext.resolve(NameArray), True);

  //handle changing the GUI controls
  btnBindNS.Enabled := False;
  if AcctNS <> nil then
  begin
    Label2.Caption := 'Successfully resolved Account object';
    btnNSBalance.Enabled := True;
  end
  else
    Label2.Caption := 'Error -- could not resolve Account object';

  Label2.Visible := True;
end;

procedure TForm1.btnNSBalanceClick(Sender: TObject);
begin
  if AcctNS <> nil then
    Label3.Caption := FormatFloat('Balance = $##,##0.00', AcctNS.balance)
  else Label3.Caption := 'Account object not bound';

  Label3.Visible := True;
end;

end.