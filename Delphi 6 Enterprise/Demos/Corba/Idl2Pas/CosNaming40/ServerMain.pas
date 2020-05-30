(*============================================================================
                COSNaming Server Demo for VisiBroker 4 for Delphi

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

  ===========================================================================*)

unit ServerMain;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Corba, COSNaming, Account_c, Account_i, Account_impl, Account_s, StdCtrls;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    procedure FormCreate(Sender: TObject);
  private
  { private declarations }
  protected
  { protected declarations }
    Acct : Account; // skeleton object
    RootContext : NamingContext;
    nameComp : NameComponent;
    nameArray : COSNaming.Name;
    procedure InitCorba;
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

  // Create the server and register with the BOA
  Acct := TAccountSkeleton.Create('Jack B Quick', TAccount.Create);
  BOA.ObjIsReady(Acct as _Object);

  //Get the Naming Service Root Context via the ORB
  RootContext := TNamingContextHelper.Narrow(Orb.ResolveInitialReferences('NameService'), True);

  //create the naming component -- match server id and kind values
  nameComp := TNameComponent.Create('Account', 'Jack B Quick');

  //set up the Name sequence
  SetLength(NameArray, 1);
  NameArray[0] := nameComp;

  // now bind with the Nameing Service
  RootContext.rebind(NameArray, Acct as CorbaObject);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  initCorba;
end;

end.