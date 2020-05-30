unit eventunit;

{$WARN SYMBOL_PLATFORM OFF}

interface

uses
  ComObj, ActiveX, event_tlb, StdVcl;

type
  TClockEvent = class(TAutoObject, IClockEvent)
  protected
    procedure HourChange(Hour: Integer); virtual; safecall; abstract;
    procedure MinuteChange(Minute: Integer); virtual; safecall; abstract;
    procedure SecondChange(Second: Integer); virtual; safecall; abstract;
    { Protected declarations }
  end;

implementation

uses ComServ;

initialization
  TAutoObjectFactory.Create(ComServer, TClockEvent, Class_ClockEvent,
    ciMultiInstance, tmApartment);
end.
