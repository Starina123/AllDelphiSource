{******************************************}
{    TeeChart. TChart Component            }
{ Copyright (c) 1995-2001 by David Berneda }
{    All Rights Reserved                   }
{******************************************}
unit uaxislab;

interface

{ This Sample Project shows how to set the Axis Labels at specific Axis
  positions.
  The key is the Chart.OnGetNextAxisLabel event.
  This event is called continuosly for each Axis Label until user decides
  to stop.
  At each call, you can specify the exact Axis value where a Label must be
  drawn.

  In this example, this event is used to set the BottomAxis labels to the
  first (1) day in month:   1/1/96,  2/1/96, 3/1/96..... 12/1/96

  This don't needs necessarily to be datetime values.
  You can also set the Axis Labels in non-datetime axis.

  WARNING:
    Remember to set the Stop boolean variable to TRUE when no more labels are
    needed.
    Remember also that using this event will NOT calculate Label used space or
    any Font size adjustment.
    TeeChart Axis will draw all labels you specify.
}
uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, Chart, Series, ExtCtrls, StdCtrls, Teengine, Buttons,
  TeeProcs;

type
  TAxisLabelsForm = class(TForm)
    Chart1: TChart;
    LineSeries1: TLineSeries;
    Panel1: TPanel;
    RadioGroup1: TRadioGroup;
    PointSeries1: TPointSeries;
    BitBtn3: TBitBtn;
    Memo1: TMemo;
    procedure FormCreate(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure Chart1GetNextAxisLabel(Sender: TChartAxis;
      LabelIndex: Longint; var LabelValue: Double; var Stop: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    DefaultLabels:Boolean;
  end;

implementation

{$R *.dfm}

procedure TAxisLabelsForm.FormCreate(Sender: TObject);
var t:Longint;
begin
  DefaultLabels:=False;  { <-- boolean variable to show or not the demo }

  LineSeries1.Clear;
  PointSeries1.Clear;
  for t:=1 to 100 do
  Begin
    LineSeries1.AddXY( Date+t, 200+Random(700),'',clTeeColor);  { <-- some random points }
    PointSeries1.AddXY( Date+t, 200+Random(700),'',clTeeColor);
  end;
end;

procedure TAxisLabelsForm.RadioGroup1Click(Sender: TObject);
begin
 { Choose between default and custom labeling. }
  DefaultLabels:=RadioGroup1.ItemIndex=0;
  Chart1.Repaint;  { <-- repaint chart to see changes }
end;

procedure TAxisLabelsForm.Chart1GetNextAxisLabel(Sender: TChartAxis;
  LabelIndex: Longint; var LabelValue: Double; var Stop: Boolean);

var year,month,day:Word;
begin
  if not DefaultLabels then
  Begin
    if Sender=Chart1.BottomAxis then
    Begin
      { ***************************** }
      { WARNING:

          Setting this axis increment:

          Chart1.BottomAxis.Increment := DateTimeStep[ dtOneMonth ];

          and...

          Chart1.BottomAxis.ExactDateTime := True ;

          Eliminates the need for the following code.
      }
      { ***************************** }

     { LabelValue has the "candidate" value where the Axis label will be painted. }
      DecodeDate(LabelValue,year,month,day);
      { we force that value to be the first day in month }
      Day:=1;
      Month:=Month+1;
      if Month>12 then
      Begin
        Month:=1;
        Year:=Year+1;
      end;
      { Then we set the preferred Label value }
      LabelValue:=EncodeDate(year,month,day);

    end
    else
    if Sender=Chart1.LeftAxis then
    Begin
      { In this example, we want the Vertical Left Axis to show
        labels only for positive values, starting at zero and
        with 250 label increment.
      }
      if LabelValue>=250 then LabelValue:=LabelValue+250
                         else LabelValue:=250;
    End;
    { we want more labels !! }
    Stop:=False;
  end;
end;


end.
