{*********************************************}
{ TeeChart Delphi Component Library           }
{ Custom Axis Drawing Demo                    }
{ Copyright (c) 1995-2001 by David Berneda    }
{ All rights reserved                         }
{*********************************************}
unit mulaxis;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, ExtCtrls, Teengine, Chart, Series, Buttons,
  TeeProcs;

type
  TCustomAxisForm = class(TForm)
    Chart1: TChart;
    LineSeries1: TLineSeries;
    Panel1: TPanel;
    CheckBox1: TCheckBox;
    Timer1: TTimer;
    BitBtn1: TBitBtn;
    CheckBox2: TCheckBox;
    PointSeries1: TPointSeries;
    FastLineSeries1: TFastLineSeries;
    DrawGrid: TCheckBox;
    Memo1: TMemo;
    procedure FormCreate(Sender: TObject);
    procedure LineSeries1AfterDrawValues(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure DrawGridClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    XPercent,YPercent:Integer;
  end;

implementation

{$R *.dfm}

procedure TCustomAxisForm.FormCreate(Sender: TObject);

  Procedure CreateRandomPoints(Series:TChartSeries);
  var t,Old:Longint;
  begin
    With Series do
    begin
      Clear;
      Old:=Longint(Random(1000));
      for t:=1 to 100 do
      begin
        Inc(Old,Longint(Random(20))-10);
        Add(Old,'',clTeeColor);
      end;
    end;
  end;

begin
  XPercent:=50;
  YPercent:=50;
  Randomize;
  CreateRandomPoints(LineSeries1);
  CreateRandomPoints(PointSeries1);
  CreateRandomPoints(FastLineSeries1);
end;

procedure TCustomAxisForm.LineSeries1AfterDrawValues(Sender: TObject);
var posaxis:longint;
begin
  With Chart1 do
  begin
    { Calculate axis position and draw... }
    PosAxis:=ChartRect.Left+Trunc(ChartWidth*YPercent/100.0);
    LeftAxis.CustomDraw(posaxis-10,posaxis-40,posaxis,DrawGrid.Checked);

    PosAxis:=ChartRect.Left+Trunc(ChartWidth*(100.0-YPercent)/100.0);
    LeftAxis.CustomDraw(posaxis-10,posaxis-40,posaxis,DrawGrid.Checked);

    PosAxis:=ChartRect.Top+Trunc(ChartHeight*XPercent/100.0);
    BottomAxis.CustomDraw(posaxis+10,posaxis+40,posaxis,DrawGrid.Checked);

    PosAxis:=ChartRect.Top+Trunc(ChartHeight*(100.0-XPercent)/100.0);
    BottomAxis.CustomDraw(posaxis+10,posaxis+40,posaxis,DrawGrid.Checked);
  end;
end;

procedure TCustomAxisForm.CheckBox1Click(Sender: TObject);
begin
  Chart1.AxisVisible:=not CheckBox1.Checked;
  Timer1.Enabled:=CheckBox1.Checked;
end;

procedure TCustomAxisForm.Timer1Timer(Sender: TObject);
begin
  if XPercent<95 then Inc(XPercent,5)
                 else XPercent:=5;
  if YPercent<97 then Inc(YPercent,3)
                 else YPercent:=3;
  Chart1.Repaint;
end;

procedure TCustomAxisForm.CheckBox2Click(Sender: TObject);
begin
  Chart1.LeftAxis.Inverted:=CheckBox2.Checked;
  Chart1.BottomAxis.Inverted:=CheckBox2.Checked;
end;

procedure TCustomAxisForm.DrawGridClick(Sender: TObject);
begin
  Chart1.Repaint;
end;

end.
