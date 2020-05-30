library EmpEditX;

{ This project demonstrates using client datasets in an ActiveForm.
  The ActiveForm in this project works just like the client in the
  EMPEDIT demo.  Before compiling and using this Active Library you
  should compile and run the Server project from the EMPEDIT demo.

  For infomation on deploying ActiveForms, look for
  "ActiveX controls:deploying" in the online help index.
}

uses
  ComServ,
  EmpE_TLB in 'EmpE_TLB.pas',
  EmpEdImp in 'EmpEdImp.pas' {EmpEditForm: TActiveForm} {EmpEditForm: CoClass},
  recerror in '..\..\..\objrepos\recerror.pas' ;

{$E ocx}

exports
  DllGetClassObject,
  DllCanUnloadNow,
  DllRegisterServer,
  DllUnregisterServer;

{$R *.TLB}

{$R *.RES}

begin
end.
