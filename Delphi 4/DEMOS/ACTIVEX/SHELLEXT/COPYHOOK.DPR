// This CopyHook shell extension will alert you every time an attempt
// is made to delete, move or rename a directory in the Explorer.

library CopyHook;

uses
  ComServ,
  CopyHk in 'CopyHk.pas';
  
exports
  DllGetClassObject,
  DllCanUnloadNow,
  DllRegisterServer,
  DllUnregisterServer;

begin
end.
