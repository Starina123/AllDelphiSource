// This COM server is an example of how to accomplish COM functionality
// without using any object oriented Pascal constructs.  Object Pascal
// classes are not used and so neither are Object Pascal Interfaces.  All
// interface pointers are true pointers.  This was done as a study in
// contrasts.  Compare this code to that found in the ContMenu project.

// Note: Although this project uses units wherein Object Pascal classes and
// interfaces are defined, none of those classes or interfaces are used in
// the code.

library QRegister;

uses
  Windows,
  PureContextMenu in 'PureContextMenu.pas';

exports
  DllGetClassObject,
  DllCanUnloadNow,
  DllRegisterServer,
  DllUnregisterServer;

begin
end.
