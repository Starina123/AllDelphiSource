unit IPRegister;

interface

uses
  Classes;

procedure Register;

implementation

uses
  DesignIntf,
  IndyPeerImpl;

procedure Register;
begin
  //This forces the package to load at startup to allow IndyPeerImpl to be injected for designer support
  ForceDemandLoadState(dlDisable);
end;
  
end.
