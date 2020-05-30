unit publisherunit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls;

type
  TMainForm = class(TForm)
    Timer1: TTimer;
    TimeLabel: TLabel;
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

uses event_tlb;

{$R *.dfm}

procedure TMainForm.Timer1Timer(Sender: TObject);
var
  Event: IClockEvent;
  Hour, Minute, Second: Integer;
begin
  Event := CoClockEvent.Create;

  Hour := StrToInt(FormatDateTime('h', Now()));
  Minute := StrToInt(FormatDateTime('n', Now()));
  Second := StrToInt(FormatDateTime('s', Now()));

  TimeLabel.Caption := IntToStr(Hour) + ':' +
                       IntToStr(Minute) + ':' +
                       IntToStr(Second);

  Event.HourChange(Hour);
  Event.MinuteChange(Minute);
  Event.SecondChange(Second);
end;

end.
