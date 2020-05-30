unit main;

interface

uses
  SysUtils, Types, Classes, QGraphics, QControls, QForms, QDialogs,
  QStdCtrls, QTypes, QExtCtrls;

type
  TForm1 = class(TForm)
    LCDNumber1: TLCDNumber;
    Timer1: TTimer;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    procedure Timer1Timer(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure LCDNumber1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
    FRunning: Boolean;
    procedure SetRunning(Value: Boolean);
  public
    { Public declarations }
    StartTime: Extended;
    ElapsedTime: Extended;
    Reset: Boolean;
    property Running: Boolean read FRunning write SetRunning;
  end;

var
  Form1: TForm1;

implementation

{$R *.xfm}

procedure TForm1.SetRunning(Value: Boolean);
begin
  if FRunning <> Value then
  begin
    FRunning := Value;
    StartTime := ElapsedTime;
    if Value then Reset := False;
  end;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
  if Reset then ElapsedTime := Now else ElapsedTime := Now - StartTime;
  if Running then
    LCDNumber1.Value := FormatDateTime('nn:ss.zzz', ElapsedTime);
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  Running := True;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  Running := not Running;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  if not Running then
  begin
    LCDNumber1.Value := '00:00.000';
    Reset := True;
  end;
end;

procedure TForm1.LCDNumber1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  NewBorderStyle: Integer;
  NewSegmentStyle: Integer;
begin
  case Button of
    mbLeft:
      begin
        NewBorderStyle := Ord(LCDNumber1.BorderStyle) + 1;
        if NewBorderStyle > Ord(High(TBorderStyle)) then
          NewBorderStyle := Ord(Low(TBorderStyle));
        LCDNumber1.BorderStyle := TBorderStyle(NewBorderStyle);
      end;
    mbRight:
      begin
        NewSegmentStyle := Ord(LCDNumber1.SegmentStyle) + 1;
        if NewSegmentStyle > Ord(High(TLCDSegmentStyle)) then
          NewSegmentStyle := Ord(Low(TLCDSegmentStyle));
        LCDNumber1.SegmentStyle := TLCDSegmentStyle(NewSegmentStyle);
      end;
  end;
end;

end.

