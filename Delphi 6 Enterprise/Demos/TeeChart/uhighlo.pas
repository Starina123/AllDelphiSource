{*********************************************}
{ TeeChart Delphi Component Library           }
{ High-Mean-Low Form Demo                     }
{ Copyright (c) 1996-2001 by David Berneda    }
{ All rights reserved                         }
{*********************************************}
unit uhighlo;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, Teengine, Series, ExtCtrls, Chart, StdCtrls,
  Buttons, TeeProcs, TeeFunci;

type
  THighLowForm = class(TForm)
    Chart1: TChart;
    BarSeries1: TBarSeries;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    CheckBox1: TCheckBox;
    Timer1: TTimer;
    CB3D: TCheckBox;
    AverageSeries: TLineSeries;
    HighSeries: TLineSeries;
    LowSeries: TLineSeries;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    Memo1: TMemo;
    procedure FormCreate(Sender: TObject);
    procedure Chart1AfterDraw(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure CB3DClick(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure CheckBox3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Bar2:TBarSeries;
  end;

implementation

{$R *.dfm}

procedure THighLowForm.FormCreate(Sender: TObject);
begin
  TeeEraseBack:=False; { try win95 + plus ! + drag window + resizing ! }

  Bar2:=nil;

  Chart1.View3D:=CB3D.Checked;
  Chart1.Chart3DPercent:=35;

  BarSeries1.Fillsamplevalues(6);
  BarSeries1.Dark3D:=Chart1.IsScreenHighColor;

  Chart1.RightAxis.Minimum:=0;
  Chart1.RightAxis.AutomaticMaximum:=True;
  BarSeries1.RefreshSeries;
end;

procedure THighLowForm.Chart1AfterDraw(Sender: TObject);
begin
  if not CheckBox2.Checked then { only with one bar, much pretty... }
  With Chart1,Canvas do
  begin
    Brush.Style:=bsClear;

    Font.PixelsPerInch:=Screen.PixelsPerInch;
    Font.Size:=12;
    Font.Style:=[fsBold,fsItalic];

    Font.Color:=AverageSeries.SeriesColor;
    TextOut( ChartXCenter,
                AverageSeries.CalcYPos(0),
                AverageSeries.Name+' '+AverageSeries.ValueMarkText[0]);

    Font.Color:=HighSeries.SeriesColor;
    TextOut( ChartXCenter,
                HighSeries.CalcYPos(0),
                HighSeries.Name+' '+HighSeries.ValueMarkText[0]);

    Font.Color:=LowSeries.SeriesColor;
    TextOut( ChartXCenter,
                LowSeries.CalcYPos(0),
                LowSeries.Name+' '+LowSeries.ValueMarkText[0]);
  end;
end;

procedure THighLowForm.BitBtn1Click(Sender: TObject);
begin
  Chart1.PrintLandscape;
end;

procedure THighLowForm.CheckBox1Click(Sender: TObject);
begin
  Timer1.Enabled:=CheckBox1.Checked;
end;

procedure THighLowForm.Timer1Timer(Sender: TObject);
var tmp:Longint;
begin
  Timer1.Enabled:=False;
  tmp:=Random(BarSeries1.Count);
  BarSeries1.YValue[tmp]:=BarSeries1.YValue[tmp]+Random(50)-25;
  if random(100)<8 then
     BarSeries1.BarStyle:=TBarStyle(Random(1+Ord(High(TBarStyle))));

  { Randomly change from 3D to 2D }
  if random(100)<2 then CB3D.Checked:=not CB3D.Checked;
  Timer1.Enabled:=True;
end;

procedure THighLowForm.CB3DClick(Sender: TObject);
begin
  Chart1.View3d:=CB3D.Checked;
end;

procedure THighLowForm.CheckBox2Click(Sender: TObject);
begin
  if CheckBox2.Checked then
  begin
  { create a new TBarSeries, and add data }
    Bar2:=TBarSeries.Create(Self);
    Bar2.ParentChart:=Chart1;

    Bar2.BarStyle:=bsInvPyramid;

  { fill the second series with same number of random values than
    the first bar series }
    Bar2.FillSampleValues( BarSeries1.Count );

  { then add this new Series as datasource for statistics... }
    AverageSeries.DataSources.Add(Bar2);
    Bar2.AddLinkedSeries(AverageSeries);

    HighSeries.DataSources.Add(Bar2);
    Bar2.AddLinkedSeries(HighSeries);

    LowSeries.DataSources.Add(Bar2);
    Bar2.AddLinkedSeries(LowSeries);
  end
  else
  begin
   { remove the second bar series we created before... }
     Bar2.Free;
     Bar2:=nil;
  end;
{ and finally refresh the statistical series to view results... }
  BarSeries1.RefreshSeries;
end;

procedure THighLowForm.CheckBox3Click(Sender: TObject);
begin
  BarSeries1.Active:=CheckBox3.Checked;
  if Assigned(Bar2) then
     Bar2.Active:=CheckBox3.Checked;
end;

end.
