library MtsCustomerTreeProject;

{
  Before running the sample, install the MtsCustomerTreeProject
  server into MTS.

  This is the server project.  You can find the client in ..\client.

  Overview
  --------

  This MTS data module uses MIDAS services to provide and resolve
  master/detail/detail records from the customer/orders/items tables.

  It is written to take advantage of MTS just in time activatation and
  as soon as possible deactivation.  This means that the server does not
  hold state in memory across method calls (some state is held in the
  MTS shared property manager) and that each method calls SetComplete.

  MTS Installation
  ----------------

  Follow these instructions to install the server into MTS:

  1) Open the Server\MtsCustomerTreeProject project
  2) Run/Install MTS Objects (This will be enabled if you have MTS installed)
  3) Check MtsCustomerTree
  4) Select "Into New Package"
  5) Enter "MtsCustomerTree" as the package name
  6) OK

  MTS Debugging
  -------------

  1) Open serve\MtsCustomerTreeProject project
  2) Run/Parameters  
     Host application: c:\winnt\system32\mtx.exe
     (Your mtx.exe may be in a different location)
     Parameters: /p:"MtsCustomerTree"
     (MtsCustomerTree is the name of the package not the component)
  3) Run

  Notes:
    If the server does not stay running after choosing Run then check
    the following:
    1) Be sure that an instance of the server is not already running by
    using the mts explorer.  Look at Computers/My Computer/Packages Installed/
    MtsCustomerTree/Components.
    You can shut down the server by right clicking on the MtsCustomerTree and
    choosing the shut down command.
    2) Be sure that you have specified the correct package name in
    Run/Parameters/Parameter.  Also be sure that there is NOT a space
    between p: and "MtsCustomerTree".
    3) These debugging options will not work if the component is installed
    into a library package.  In this case, specify the name of the client
    application in the Run/Parameters/Host application field.
    4) If a client application is not started soon after choosing run, mts
    will shut down the package.  The default package timeout is 3 seconds.  The
    timeout can be changed using the mts explorer.  Right click on the package,
    choose properties and select the advanced page.

    You will not be able to rebuild the server while it is loaded by mts.  Here
    are some tips:
    1) You can use the mts explorer to shut down a specific package by right
    clicking on the package and choosing shut down.  Sometimes it is easier
    to shut down all packages by right clicking on My Computer and choosing
    Shut down server processes.
    2) You can set the package shutdown timeout to 1 or 0 to cause the package
    to be unloaded shortly after all clients are shutdown.  Right click on
    the package, choose properties and select the advanced page.  If you do
    set a short timeout, you will need to start the client immediately when
    trying to debug the server.

}

uses
  ComServ,
  MtsCustomerTreeProject_TLB in 'MtsCustomerTreeProject_TLB.pas',
  DMMain in 'DMMain.pas' {MtsCustomerTree: TMtsDataModule} {MtsCustomerTree: CoClass},
  DMCustomerTreeU in 'DMCustomerTreeU.pas' {DMCustomerTree: TDataModule};

exports
  DllGetClassObject,
  DllCanUnloadNow,
  DllRegisterServer,
  DllUnregisterServer;

{$R *.TLB}

{$R *.RES}

begin
end.
