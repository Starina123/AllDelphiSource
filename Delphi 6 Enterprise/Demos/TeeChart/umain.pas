{******************************************}
{    TeeChart. Mini-Charts Example         }
{ Copyright (c) 1995-2001 by David Berneda }
{    All Rights Reserved                   } 
{******************************************}
unit umain;

interface

{ This project show some very small mini-charts and some animation }
{ That mini-charts could be useful as small data-monitors in your forms,
  or reports }
uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, Chart, Series, ExtCtrls, Teengine, TeeProcs;

type
  TMiniForm = class(TForm)
    LineSeries1: TLineSeries;
    Panel1: TPanel;
    Panel2: TPanel;
    Chart1: TChart;
    Chart2: TChart;
    Chart3: TChart;
    Chart4: TChart;
    PieSeries1: TPieSeries;
    AreaSeries1: TAreaSeries;
    LineSeries2: TLineSeries;
    BarSeries1: TBarSeries;
    LineSeries3: TLineSeries;
    Timer1: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure LineSeries2AfterDrawValues(Sender: TObject);
    procedure LineSeries3AfterDrawValues(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    PosChart1,PosChart4:Longint;  { used to draw vertical lines over charts }
  end;

implementation

{$R *.dfm}

Const NumPoints=30;

procedure TMiniForm.FormCreate(Sender: TObject);
begin
  PosChart1:=-1;                    { starting position of vertical divider }
  PosChart4:=NumPoints div 2;

  { Generate some random points ... }
  LineSeries1.FillSampleValues(NumPoints);
  PieSeries1.FillSampleValues(8);
  AreaSeries1.FillSampleValues(NumPoints);
  LineSeries2.FillSampleValues(NumPoints);
  BarSeries1.FillSampleValues(6);
  LineSeries3.FillSampleValues(NumPoints);
end;

procedure TMiniForm.FormResize(Sender: TObject);
begin
  { Equally resize the panels to center charts }
  Chart2.Height:=ClientHeight div 2;
  Chart3.Height:=ClientHeight div 2;
  Panel1.Width:=ClientWidth div 2;
end;

procedure TMiniForm.Timer1Timer(Sender: TObject);

  { This procedure changes the Series values every second }
  Procedure RefreshMonitorChart(Chart:TChart; Var PosChart:Longint);
  var t:Longint;
      LastValueWas:Double;
  Begin
    Inc(PosChart);
    if PosChart >= NumPoints then PosChart:=0;
    for t:=0 to Chart.SeriesCount-1 do
    Begin
      if PosChart=0 then
      Begin
        With Chart do { reset scales at the end of monitoring. }
        Begin
          LeftAxis.Automatic:=True;
          LeftAxis.SetMinMax(MinYValue(LeftAxis),MaxYValue(LeftAxis));
        end;
        LastValueWas:=Chart.Series[t].YValues.Last;
      end
      else LastValueWas:=Chart.Series[t].YValue[PosChart-1];

      { change the value for a new random one }
      Chart.Series[t].YValue[PosChart]:= LastValueWas+Random(ChartSamplesMax)-
                                           (ChartSamplesMax div 2);
    end;
  end;

var tmpPos:Longint;
begin
  RefreshMonitorChart(Chart1,PosChart1);       { refresh chart1  }

  RefreshMonitorChart(Chart4,PosChart4);       { refresh chart4  }

  With PieSeries1 do RotationAngle:=(RotationAngle+1) mod 359;  { rotate pie }

  { change Bar Series values }
  With BarSeries1 do
  Begin
    tmpPos:=Random(Count);
    YValue[tmpPos]:=YValue[tmpPos]*(80.0+Random(40))/100.0;
  end;
end;

procedure TMiniForm.LineSeries2AfterDrawValues(Sender: TObject);
begin
  { this event draws the red divider in Chart1 }
   if PosChart1>=0 then
   With Chart1,Canvas do
   Begin
     Pen.Color:=clRed;
     DoVertLine( Series[0].CalcXPos(PosChart1),  { x }
                 ChartRect.Top+1,                { initial Y }
                 ChartRect.Bottom-1              { ending Y }
               );
   end;
end;

procedure TMiniForm.LineSeries3AfterDrawValues(Sender: TObject);
begin
  { this event draws the blue divider in Chart4 }
   if PosChart4>=0 then
   With Chart4,Canvas do
   Begin
     Pen.Color:=clBlue;
     DoVertLine( Series[0].CalcXPos(PosChart4),  { x }
                 ChartRect.Top+1,                { initial Y }
                 ChartRect.Bottom-1              { ending Y }
                );
   end;
end;

end.
