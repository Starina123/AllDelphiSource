library event;

uses
  ComServ,
  event_tlb in 'event_tlb.pas',
  eventunit in 'eventunit.pas' {ClockEvent: CoClass};

exports
  DllGetClassObject,
  DllCanUnloadNow,
  DllRegisterServer,
  DllUnregisterServer;

{$R *.TLB}

{$R *.RES}

begin
end.
