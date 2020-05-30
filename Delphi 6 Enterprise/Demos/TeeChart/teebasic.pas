{*********************************************}
{ TeeChart Delphi Component Library v3        }
{ Copyright (c) 1995-2001 by David Berneda    }
{ All rights reserved                         }
{*********************************************}
unit teebasic;
{$P-}  { <-- Delphi 1.0 compatibility }

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, ExtCtrls, TeeProcs, TeEngine, Chart, StdCtrls, Series,
  TeeShape, GanttCh, BubbleCh, ArrowCha, Buttons;

type
  TDemoForm = class(TForm)
    Notebook1: TNotebook;
    Chart1: TChart;
    Series1: TLineSeries;
    Series2: TLineSeries;
    Series3: TLineSeries;
    Series4: TLineSeries;
    Chart2: TChart;
    Series5: TBarSeries;
    Series6: TBarSeries;
    Series7: TBarSeries;
    Panel2: TPanel;
    Chart3: TChart;
    Series8: THorizBarSeries;
    Series9: THorizBarSeries;
    Series10: THorizBarSeries;
    Chart4: TChart;
    Series11: TAreaSeries;
    Series12: TAreaSeries;
    Chart5: TChart;
    Series13: TPointSeries;
    Series14: TPointSeries;
    Series15: TPointSeries;
    Series16: TPointSeries;
    Series17: TPointSeries;
    Series18: TPointSeries;
    Chart6: TChart;
    Series19: TPieSeries;
    Chart7: TChart;
    Series20: TFastLineSeries;
    Series21: TFastLineSeries;
    Series22: TFastLineSeries;
    Series23: TFastLineSeries;
    Series24: TFastLineSeries;
    Chart8: TChart;
    Series26: TArrowSeries;
    Series27: TArrowSeries;
    Chart9: TChart;
    Series28: TBubbleSeries;
    Chart10: TChart;
    Series29: TGanttSeries;
    Chart11: TChart;
    Series30: TChartShape;
    Series31: TChartShape;
    Series32: TChartShape;
    Button2: TButton;
    Panel3: TPanel;
    ListBox1: TListBox;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    Image1: TImage;
    Timer1: TTimer;
    ScrollBar1: TScrollBar;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    Label2: TLabel;
    Label3: TLabel;
    CheckBox3: TCheckBox;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    ScrollBar2: TScrollBar;
    Button3: TButton;
    CheckBox4: TCheckBox;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    ScrollBar3: TScrollBar;
    Label8: TLabel;
    procedure ListBox1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure ScrollBar1Change(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure CheckBox3Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure ScrollBar2Change(Sender: TObject);
    procedure Series28GetMarkText(Sender: TChartSeries;
      ValueIndex: Integer; var MarkText: string);
    procedure Button3Click(Sender: TObject);
    procedure CheckBox4Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ScrollBar3Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    tmpSeries,
    tmpIndex,
    tmpRandom,
    tmpTimes:Longint;
    Function TheChart:TChart;
    Procedure HorizScroll(Const Percent:Double);
    Procedure VertScroll(Const Percent:Double);
    Procedure ScrollAxis(Axis:TChartAxis; Const Percent:Double);
  end;

implementation

{$R *.dfm}
Uses TeeAbout;

procedure TDemoForm.ListBox1Click(Sender: TObject);
var t:Longint;
begin
  NoteBook1.PageIndex:=ListBox1.ItemIndex;
  With TheChart do
  begin
    tmpTimes:=-1;
    AnimatedZoom:=True;
    AnimatedZoomSteps:=4;
    for t:=0 to SeriesCount-1 do
    With Series[t] do
         FillSampleValues(NumSampleValues);
    UndoZoom;
    CheckBox1.Checked  :=View3D;
    ScrollBar2.Enabled :=View3D;
    ScrollBar2.Position:=Chart3DPercent;
    if Series[0] is TPieSeries then
       ScrollBar3.Position:=View3DOptions.Elevation
    else
       ScrollBar3.Position:=View3DOptions.Rotation;
    ScrollBar3.Enabled:=View3D;
  end;
end;

procedure TDemoForm.FormCreate(Sender: TObject);
begin
  tmpTimes:=-1;
  ScrollBar1.Position:=Timer1.Interval;
  ComboBox1.ItemIndex:=0;
  ComboBox2.ItemIndex:=0;
  ListBox1.ItemIndex :=0;
  ListBox1Click(Self);
end;

procedure TDemoForm.CheckBox1Click(Sender: TObject);
begin
  TheChart.View3D:=CheckBox1.Checked;
  ScrollBar2.Enabled:=TheChart.View3D;
  ScrollBar3.Enabled:=TheChart.View3D;
end;

procedure TDemoForm.CheckBox2Click(Sender: TObject);
begin
  Timer1.Enabled:=CheckBox2.Checked;
  ScrollBar1.Enabled:=Timer1.Enabled;
end;

procedure TDemoForm.ScrollBar1Change(Sender: TObject);
begin
  Timer1.Interval:=ScrollBar1.Position;
end;

Function TDemoform.TheChart:TChart;
begin
  with NoteBook1 do
  result:=(Pages.Objects[PageIndex] as TPage).Controls[0] as TChart;
end;

procedure TDemoForm.Timer1Timer(Sender: TObject);
var t:Longint;
    tmpX:Double;
begin
  With NoteBook1 do
  Case PageIndex of
     0,3,4,6:  With TheChart do
               begin
                 for t:=0 to SeriesCount-1 do
                 With Series[t] do
                 begin
                   tmpX:=XValues[1]-XValues[0];
                   Delete(0);
                   AddXY( XValues.Last+tmpX,
                          YValues.Last+Random(100)-50,'',clTeeColor);
                 end;
               end;
     1,2,8:    With TheChart do
               begin
                 if (tmpTimes=-1) then
                 begin
                   tmpSeries:=Random(SeriesCount);
                   tmpIndex :=Random(Series[tmpSeries].Count);
                   tmpTimes :=Random(10);
                   tmpRandom:=2*Round(Random(50)-25.0);
                 end;
                 if tmpSeries<>-1 then
                 begin
                   if PageIndex=8 then
                   With (Series[tmpSeries] as TBubbleSeries) do
                   begin
                     tmpX:=RadiusValues[tmpIndex]+tmpRandom;
                     if tmpX>=2 then
                     begin
                       RadiusValues[tmpIndex]:=tmpX;
                       if tmpRandom>0 then tmpX:=XValues[tmpIndex]+1
                                      else tmpX:=XValues[tmpIndex]-1;
                       XValues[tmpIndex]:=tmpX;
                       if Random(10)<5 then tmpX:=YValues[tmpIndex]+50
                                       else tmpX:=YValues[tmpIndex]-50;
                       YValues[tmpIndex]:=tmpX;
                     end
                     else tmpTimes:=0;
                   end
                   else
                   With Series[tmpSeries].MandatoryValueList do
                        Value[tmpIndex]:=Value[tmpIndex]+tmpRandom;
                   Dec(tmpTimes);
                   Repaint;
                 end;
               end;
     5: (TheChart[0] as TPieSeries).Rotate(358);
  end;
end;

procedure TDemoForm.Button2Click(Sender: TObject);
begin
  Close;
end;

procedure TDemoForm.BitBtn1Click(Sender: TObject);
begin
  TheChart.ZoomPercent(120);
  Button3.Enabled:=True;
end;

procedure TDemoForm.BitBtn2Click(Sender: TObject);
begin
  TheChart.ZoomPercent(80);
  Button3.Enabled:=True;
end;

Procedure TDemoForm.ScrollAxis(Axis:TChartAxis; Const Percent:Double);
var Amount:Double;
begin
  With Axis do
  begin
    Amount:=-((Maximum-Minimum)/(100.0/Percent));
    SetMinMax(Minimum-Amount,Maximum-Amount);
  end;
end;

Procedure TDemoForm.HorizScroll(Const Percent:Double);
begin
  ScrollAxis(TheChart.TopAxis,Percent);
  ScrollAxis(TheChart.BottomAxis,Percent);
  Button3.Enabled:=True;
end;

Procedure TDemoForm.VertScroll(Const Percent:Double);
begin
  ScrollAxis(TheChart.LeftAxis,Percent);
  ScrollAxis(TheChart.RightAxis,Percent);
  Button3.Enabled:=True;
end;

procedure TDemoForm.SpeedButton1Click(Sender: TObject);
begin
  HorizScroll(10);
end;

procedure TDemoForm.SpeedButton4Click(Sender: TObject);
begin
  HorizScroll(-10);
end;

procedure TDemoForm.SpeedButton2Click(Sender: TObject);
begin
  VertScroll(-10);
end;

procedure TDemoForm.SpeedButton3Click(Sender: TObject);
begin
  VertScroll(10);
end;

procedure TDemoForm.CheckBox3Click(Sender: TObject);
begin
  (TheChart[0] as TPieSeries).Circled:=CheckBox3.Checked;
end;

procedure TDemoForm.ComboBox1Change(Sender: TObject);
begin
  With (TheChart[0] as TCustomBarSeries) do
   MultiBar:=TMultiBar((Sender as TComboBox).ItemIndex);
end;

procedure TDemoForm.Image1Click(Sender: TObject);
begin
  Timer1.Enabled:=False;
  With TTeeAboutForm.Create(Self) do
  try
    ShowModal;
  finally
    Free;
  end;
  Timer1.Enabled:=True;
end;

procedure TDemoForm.ScrollBar2Change(Sender: TObject);
begin
  TheChart.Chart3DPercent:=ScrollBar2.Position;
end;

procedure TDemoForm.Series28GetMarkText(Sender: TChartSeries;
  ValueIndex: Integer; var MarkText: string);
begin
   if ValueIndex=3 then MarkText:='USA' else
   if ValueIndex=5 then MarkText:='UK' else
   if ValueIndex=7 then MarkText:='Germany' else
                        MarkText:='';
end;

procedure TDemoForm.Button3Click(Sender: TObject);
begin
  TheChart.UndoZoom;
  Button3.Enabled:=False;
end;

procedure TDemoForm.CheckBox4Click(Sender: TObject);
begin
  Series11.Stairs:=CheckBox4.Checked;
  Series12.Stairs:=CheckBox4.Checked;
end;

procedure TDemoForm.FormShow(Sender: TObject);
begin
  Timer1.Enabled:=True;  { <-- start animation }
end;

procedure TDemoForm.ScrollBar3Change(Sender: TObject);
begin
  if ScrollBar3.Enabled then
  With TheChart.View3DOptions do
  begin
    Orthogonal:=False;
    if TheChart[0] is TPieSeries then
       Elevation:=ScrollBar3.Position
    else
       Rotation:=ScrollBar3.Position;
  end;
end;

end.
