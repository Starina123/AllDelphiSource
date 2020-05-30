{*********************************************}
{ TeeChart Delphi Component Library           }
{ Stacked Bar Series Example                  }
{ Copyright (c) 1995-2001 by David Berneda    }
{ All rights reserved                         }
{*********************************************}
unit ustack;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, Chart, Series, ExtCtrls, StdCtrls, Teengine, ArrowCha,
  Buttons, teeprocs;

type
  TStackedForm = class(TForm)
    Chart1: TChart;
    BarSeries1: TBarSeries;
    BarSeries2: TBarSeries;
    RadioGroup1: TRadioGroup;
    Panel1: TPanel;
    Button1: TButton;
    RadioGroup2: TRadioGroup;
    ComboBox1: TComboBox;
    Label1: TLabel;
    CheckBox1: TCheckBox;
    Timer1: TTimer;
    BarSeries3: TBarSeries;
    Shape1: TShape;
    BitBtn3: TBitBtn;
    CheckBox2: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure RadioGroup2Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Shape1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure CheckBox2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Procedure RefreshShape;
  end;

implementation

{$R *.dfm}
Uses UDemUtil,tecanvas;

procedure TStackedForm.FormCreate(Sender: TObject);
var t:Longint;
begin
  { The Chart gradient is visible only with 16k Colors or greater video mode }
  Chart1.Gradient.Visible:=Chart1.IsScreenHighColor;

  { Add some random points to the three bar Series }
  Randomize;
  with BarSeries1 do
     for t:=1 to 12 do Add( Random(100),ShortMonthNames[t],clTeeColor);
  with BarSeries2 do
     for t:=1 to 12 do Add( Random(100),ShortMonthNames[t],clTeeColor);
  with BarSeries3 do
     for t:=1 to 12 do Add( Random(100),ShortMonthNames[t],clTeeColor);

  { Fill a ComboBox with the three Series titles }
  ComboBox1.Items.Clear;
  for t:=0 to Chart1.SeriesCount-1 do
      ComboBox1.Items.Add(Chart1.Series[t].Name);
  ComboBox1.ItemIndex:=0;

  RefreshShape;
end;

Procedure TStackedForm.RefreshShape;
Begin
  { This method sets the Shape color to the active Series color in Combobox }
  With Chart1.Series[ComboBox1.ItemIndex] do
  Begin
    Shape1.Visible:=not ColorEachPoint;
    if Shape1.Visible then Shape1.Brush.Color:=SeriesColor;
  end;
end;

procedure TStackedForm.RadioGroup1Click(Sender: TObject);
begin
  { Four ways to plot bar Series: }
  Case RadioGroup1.ItemIndex of
    0: BarSeries1.MultiBar:=mbNone;
    1: BarSeries1.MultiBar:=mbSide;
    2: BarSeries1.MultiBar:=mbStacked;
    3: BarSeries1.MultiBar:=mbStacked100;
  end;
end;

procedure TStackedForm.Button1Click(Sender: TObject);
begin
  { Scroll two Bar Series }
  With Chart1 do
  Begin
    Series[SeriesCount-1].Marks.Visible:=False;  { hide marks }
    SeriesDown(Series[0]);                       { move series 0 to back }
    Series[SeriesCount-1].Marks.Visible:=True;   { show marks again }
  end;
  ComboBox1Change(Self);
end;

procedure TStackedForm.ComboBox1Change(Sender: TObject);
begin
  { Change the active Bar Series }
  With Chart1.Series[ComboBox1.ItemIndex] as TBarSeries do
    RadioGroup2.Itemindex:=Ord(BarStyle);
  RefreshShape;
end;

procedure TStackedForm.RadioGroup2Click(Sender: TObject);
begin
  { Change the active Bar Series Style }
  With Chart1.Series[ComboBox1.ItemIndex] as TBarSeries do
       BarStyle:=TBarStyle(RadioGroup2.Itemindex);
end;

procedure TStackedForm.CheckBox1Click(Sender: TObject);
begin
  { Start / Stop Animation }
  Timer1.Enabled:=CheckBox1.Checked;
  RadioGroup1.Enabled:=not Timer1.Enabled;
  RadioGroup2.Enabled:=not Timer1.Enabled;
  if not Timer1.Enabled then ComboBox1Change(Self);
end;

procedure TStackedForm.Timer1Timer(Sender: TObject);

  { this function returns a random color from ColorPalette }
  Function RandomColor(CheckBack:Boolean):TColor;
  Begin
    Repeat
      result:=ColorPalette[1+Random(MaxDefaultColors)];
    Until (not CheckBack) or
          ( (result<>Chart1.Color) and (result<>Chart1.BackColor) );
  end;

  { this function returns a random angle from 0, 90, 180 or 270 }
  Function RandomAngle:Integer;
  Begin
    Case Random(4) of
      0: result:=0;
      1: result:=90;
      2: result:=180;
    else
{      3: } result:=270;
    end;
  end;

  { this function changes randomly the Pen parameter }
  Procedure RandomPen(APen:TChartPen);
  Begin
    With APen do
    if Visible then
    Case Random(3) of
      0: Color:=RandomColor(True);
      1: Style:=TPenStyle(Random(5));
      2: Width:=1+Random(3);
    end;
  end;

  { this function changes randomly the Brush parameter }
  Procedure RandomBrush(ABrush:TBrush);
  Begin
    With ABrush do
    Case Random(2) of
      0: Color:=RandomColor(True);
      1: if Random(10)<5 then Style:=TBrushStyle(Random(8));
    end;
  end;

  { this function changes randomly the Font parameter }
  Procedure RandomFont(AFont:TFont);
  Begin
    With AFont do
    Case Random(2) of
      0: Color:=RandomColor(True);
      1: if Random(2)=0 then
            Size:=Size+1
         else
         if Size>7 then Size:=Size-1;
    end;
  End;

var tmpSeries:TBarSeries;
    t:Longint;
begin
  { This long.... routine.....
    is only a random generator for Chart and Series properties.
  }
  Timer1.Enabled:=False; { stop timer }

  { Set all Series.Active }
  for t:=0 to Chart1.SeriesCount-1 do Chart1.Series[t].Active:=True;

  { Choose a Series randomly }
  tmpSeries:=Chart1.Series[Random(ComboBox1.Items.Count)] as TBarSeries;

  { Then, lets change this chart a little.... }
  Case Random(72) of
    0: RadioGroup1.ItemIndex:=Random(RadioGroup1.Items.Count);
    1,2,3,4,5: RadioGroup2.ItemIndex:=Random(RadioGroup2.Items.Count);
    6: Button1Click(Self);
    7: tmpSeries.SeriesColor:=RandomColor(False);
    8: Chart1.Chart3dPercent:=5+Random(80);
    9: Chart1.BackColor:=RandomColor(False);
   10: if Chart1.Legend.Alignment=laRight then
          Chart1.Legend.Alignment:=laLeft
       else
          Chart1.Legend.Alignment:=laRight;
   11: RandomFont(Chart1.BottomAxis.LabelsFont);
   12: RandomFont(Chart1.LeftAxis.LabelsFont);
   13: Chart1.View3d:=not Chart1.View3d;
   14: tmpSeries.BarWidthPercent:=50+Random(40);
   15: RandomFont(tmpSeries.Marks.Font);
   16: Chart1.BottomAxis.Grid.Visible:=not Chart1.BottomAxis.Grid.Visible;
   17: Chart1.LeftAxis.Grid.Visible:=not Chart1.LeftAxis.Grid.Visible;
   18: RandomFont(Chart1.LeftAxis.Title.Font);
   19: RandomFont(Chart1.BottomAxis.Title.Font);
   20: tmpSeries.Marks.Style:=TSeriesMarksStyle(Random(9));
   21: With Chart1 do
       Begin
         BevelWidth:=1+Random(10);
         MarginTop   :=TeeDefVerticalMargin+BevelWidth;
         MarginLeft  :=TeeDefHorizMargin+BevelWidth;
         MarginRight :=TeeDefHorizMargin+BevelWidth;
         MarginBottom:=TeeDefVerticalMargin+BevelWidth;
       end;
   22: Chart1.Legend.Visible:=not Chart1.Legend.Visible;
   23: if Random(10)<5 then Chart1.Legend.LegendStyle:=lsSeries
                       else Chart1.Legend.LegendStyle:=lsValues;
   24: tmpSeries.Active:=not tmpSeries.Active;
   25: tmpSeries.Marks.BackColor:=RandomColor(True);
   26: tmpSeries.Marks.Visible:=not tmpSeries.Marks.Visible;
   27: RandomPen(Chart1.BottomAxis.Grid);
   28: RandomPen(Chart1.LeftAxis.Grid);
   29: Chart1.Legend.Frame.Visible:=not Chart1.Legend.Frame.Visible;
   30: RandomPen(Chart1.Legend.Frame);
   31: RandomPen(tmpSeries.BarPen);
   32: tmpSeries.ColorEachPoint:=not tmpSeries.ColorEachPoint;
   33: Chart1.Title.Alignment:=TAlignment(Random(3));
   34: RandomFont(Chart1.Title.Font);
   35: RandomFont(Chart1.Legend.Font);
   36: Chart1.Legend.Color:=RandomColor(False);
   37: Chart1.Legend.TextStyle:=TLegendTextStyle(Random(5));
   38: Chart1.Legend.TopPos:=5+Random(90);
   39: RandomPen(Chart1.BottomAxis.Axis);
   40: RandomPen(Chart1.LeftAxis.Axis);
   41: RandomPen(Chart1.BottomAxis.Ticks);
   42: RandomPen(Chart1.LeftAxis.Ticks);
   43: RandomPen(Chart1.BottomAxis.TicksInner);
   44: RandomPen(Chart1.LeftAxis.TicksInner);
   45: Chart1.BottomAxis.TickLength:=Random(8);
   46: Chart1.LeftAxis.TickLength:=Random(8);
   47: Chart1.BottomAxis.TickInnerLength:=Random(8);
   48: Chart1.LeftAxis.TickInnerLength:=Random(8);
   49: RandomBrush(tmpSeries.BarBrush);
   50: Chart1.Title.Frame.Visible:=not Chart1.Title.Frame.Visible;
   51: RandomPen(Chart1.Title.Frame);
   52: Chart1.Foot.Frame.Visible:=not Chart1.Foot.Frame.Visible;
   53: RandomPen(Chart1.Foot.Frame);
   54: Chart1.Title.AdjustFrame:=not Chart1.Title.AdjustFrame;
   55: Chart1.Foot.AdjustFrame:=not Chart1.Foot.AdjustFrame;
   56: RandomBrush(Chart1.Title.Brush);
   57: RandomBrush(Chart1.Foot.Brush);
   58: Chart1.BottomAxis.MinorTickLength:=Random(8);
   59: Chart1.LeftAxis.MinorTickLength:=Random(8);
   60: RandomPen(Chart1.BottomAxis.MinorTicks);
   61: RandomPen(Chart1.LeftAxis.MinorTicks);
   62: RandomPen(Chart1.LeftWall.Pen);
   63: RandomPen(Chart1.BottomWall.Pen);
   64: Chart1.LeftWall.Color:=RandomColor(False);
   65: Chart1.BottomWall.Color:=RandomColor(False);
   66: Chart1.LeftAxis.MinorTickCount:=1+Random(6);
   67: Chart1.BottomAxis.MinorTickCount:=1+Random(6);
   68: Chart1.LeftAxis.Title.Angle:=RandomAngle;
   69: Chart1.BottomAxis.Title.Angle:=RandomAngle;
   70: Chart1.LeftAxis.LabelsAngle:=RandomAngle;
   71: Chart1.BottomAxis.LabelsAngle:=RandomAngle;
  end;
  { re-start timer }
  Timer1.Enabled:=True;
end;

procedure TStackedForm.Shape1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  { Run the Color dialog to change Series color }
  With Chart1.Series[ComboBox1.ItemIndex] do
       SeriesColor:=EditColor(Self,SeriesColor);
  RefreshShape;
end;

procedure TStackedForm.CheckBox2Click(Sender: TObject);
begin
  { Turn on / off Chart 3D }
  Chart1.View3D:=CheckBox2.Checked;
end;

end.
