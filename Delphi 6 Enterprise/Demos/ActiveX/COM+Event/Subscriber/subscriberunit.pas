unit subscriberunit;

{$WARN SYMBOL_PLATFORM OFF}

interface

uses
  ComObj, ActiveX, subscriber_tlb, StdVcl, event_tlb;

type
  TClockSubscriber = class(TAutoObject, IClockEvent)
  protected
    procedure HourChange(Hour: Integer); safecall;
    procedure MinuteChange(Minute: Integer); safecall;
    procedure SecondChange(Second: Integer); safecall;
    { Protected declarations }
  end;

implementation

uses ComServ, SysUtils, Dialogs;

var
    FHour, FMinute, FSecond: Integer;

procedure UpdateTime;
begin
  ShowMessage(IntToStr(FHour) + ':' +
              IntToStr(FMinute) + ':' +
              IntToStr(FSecond));
end;

procedure TClockSubscriber.HourChange(Hour: Integer);
begin
  FHour := StrToInt(FormatDateTime('h', Now()));
  UpdateTime;
end;

procedure TClockSubscriber.MinuteChange(Minute: Integer);
begin
  FMinute := StrToInt(FormatDateTime('n', Now()));
  UpdateTime;
end;

procedure TClockSubscriber.SecondChange(Second: Integer);
begin
  FSecond := StrToInt(FormatDateTime('s', Now()));
  UpdateTime;
end;

initialization
  TAutoObjectFactory.Create(ComServer, TClockSubscriber, Class_ClockSubscriber,
    ciMultiInstance, tmApartment);
end.
