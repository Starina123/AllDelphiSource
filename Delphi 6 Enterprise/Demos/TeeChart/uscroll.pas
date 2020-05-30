{*********************************************}
{ TeeChart Delphi Component Library           }
{ Auto Axis scaling Demo                      }
{ Copyright (c) 1995-2001 by David Berneda    }
{ All rights reserved                         }
{*********************************************}
unit uscroll;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, Chart, Series, ExtCtrls, Teengine, Buttons,
  TeeProcs;

type
  TScrollForm = class(TForm)
    Chart1: TChart;
    LineSeries1: TLineSeries;
    Panel1: TPanel;
    Button1: TButton;
    BitBtn3: TBitBtn;
    CBVertical: TCheckBox;
    procedure LineSeries1AfterAdd(Sender: TChartSeries;
      ValueIndex: Longint);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure CBVerticalClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Procedure AddPoint(Const x,y:Double; AColor:TColor);
    procedure FillDemoPoints;
  end;

implementation

{$R *.dfm}

{ This is the event we need to arrange Axis scale as new points are added. }
procedure TScrollForm.LineSeries1AfterAdd(Sender: TChartSeries;
  ValueIndex: Longint);
begin
 { If VERTICAL SCROLL }
  if CBVertical.Checked then
  begin
    With Sender.GetVertAxis do  { <-- with the Vertical Axis... }
    Begin
      Automatic := False;        { <-- we dont want automatic scaling }

      { In this example, we will set the Axis Minimum and Maximum values to
        show One Hour of data ending at last point Time plus 5 minutes
      }
      Minimum := 0;
      Maximum := Sender.YValues.MaxValue + DateTimeStep[ dtFiveMinutes ];
      Minimum := Maximum - DateTimeStep[ dtOneHour ];
    end;
  end
  else
  begin
    With Sender.GetHorizAxis do  { <-- with the Horizontal Axis... }
    Begin
      Automatic := False;        { <-- we dont want automatic scaling }

      { In this example, we will set the Axis Minimum and Maximum values to
        show One Hour of data ending at last point Time plus 5 minutes
      }
      Minimum := 0;
      Maximum := Sender.XValues.MaxValue + DateTimeStep[ dtFiveMinutes ];
      Minimum := Maximum - DateTimeStep[ dtOneHour ];
    end;
  End;
end;

Procedure TScrollForm.AddPoint(Const x,y:Double; AColor:TColor);
begin
  if CBVertical.Checked then { If VERTICAL SCROLL }
     LineSeries1.AddXY(y,x,'',AColor)
  else
     LineSeries1.AddXY(x,y,'',AColor);
end;

procedure TScrollForm.FormCreate(Sender: TObject);
begin
  FillDemoPoints;
end;

procedure TScrollForm.FillDemoPoints;
var t:Longint;
begin
   { fill the LineSeries with some random data }
  LineSeries1.Clear;   { <-- this removes all points from LineSeries1 }

  { let's add 60 minutes from 12:00 to 12:59 }
  for t:= 0 to 59 do
      AddPoint( EncodeTime( 12, t, 0,0),Random(100),clRed );

  { let's add 60 more minutes from 13:00 to 13:59 }
  for t:= 0 to 59 do
      AddPoint( EncodeTime( 13, t, 0,0),Random(100),clRed);
end;

procedure TScrollForm.Button1Click(Sender: TObject);
var h,m,s,msec:word;
begin
  if CBVertical.Checked then { if VERTICAL SCROLL.... }
     DecodeTime( LineSeries1.YValues.Last , h, m, s, msec)
  else
     DecodeTime( LineSeries1.XValues.Last , h, m, s, msec);

  { add a new random point to the Series (one more minute) }
  inc(m);
  if m=60 then
  begin
    m:=0;
    inc(h);
  end;
  AddPoint( EncodeTime( h, m, s, msec), Random(100), clYellow );
end;

procedure TScrollForm.CBVerticalClick(Sender: TObject);
begin
  With LineSeries1 do
  if CBVertical.Checked then  { If VERTICAL SCROLL }
  begin
    YValues.Order:=loAscending;
    XValues.Order:=loNone;
  end
  else
  begin
    XValues.Order:=loAscending;
    YValues.Order:=loNone;
  end;
  Chart1.LeftAxis.Automatic:=True; { <-- this makes axis scales AUTOMATIC AGAIN ! }
  Chart1.BottomAxis.Automatic:=True; { <-- this makes axis scales AUTOMATIC AGAIN ! }
  FillDemoPoints;   { <-- fill sample values again ! }
end;

end.
