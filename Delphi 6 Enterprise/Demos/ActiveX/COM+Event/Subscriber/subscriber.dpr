library subscriber;

uses
  ComServ,
  subscriber_tlb in 'subscriber_tlb.pas',
  event_tlb in '..\Event\event_tlb.pas',
  subscriberunit in 'subscriberunit.pas' {ClockSubscriber: CoClass};

exports
  DllGetClassObject,
  DllCanUnloadNow,
  DllRegisterServer,
  DllUnregisterServer;

{$R *.TLB}

{$R *.RES}

begin
end.
