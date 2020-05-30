// This COM server defines a Context Menu shell extension.  This allows the user
// to right click on Delphi Project files (.DPR) from the Explorer and compile
// them using the DCC32.exe command line compiler.

library ContMenu;

uses
  ComServ,
  ContextM in 'ContextM.pas';

exports
  DllGetClassObject,
  DllCanUnloadNow,
  DllRegisterServer,
  DllUnregisterServer;

begin
end.
