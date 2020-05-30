{*********************************************}
{ TeeChart Delphi Component Library           }
{ Bubble Series Type Demo                     }
{ Copyright (c) 1995-2001 by David Berneda    }
{ All rights reserved                         }
{*********************************************}
unit bubble;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, Chart, Series, ExtCtrls, StdCtrls, BubbleCh,
  Teengine, Buttons, TeeProcs;

type
  TBubbleForm = class(TForm)
    Chart1: TChart;
    Panel1: TPanel;
    CheckBox1: TCheckBox;
    Timer1: TTimer;
    CheckBox2: TCheckBox;
    ComboBox1: TComboBox;
    Label1: TLabel;
    BitBtn3: TBitBtn;
    CheckBox3: TCheckBox;
    BubbleSeries1: TBubbleSeries;
    ZoomInButton: TSpeedButton;
    ZoomOutButton: TSpeedButton;
    Memo1: TMemo;
    procedure FormCreate(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure CheckBox3Click(Sender: TObject);
    function BubbleSeries1GetPointerStyle(Sender: TChartSeries;
      ValueIndex: Longint): TSeriesPointerStyle;
    procedure ZoomInButtonClick(Sender: TObject);
    procedure ZoomOutButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

procedure TBubbleForm.FormCreate(Sender: TObject);
var t:Longint;
begin
  ComboBox1.ItemIndex:=Ord(psCircle); { <-- Circled Bubbles by default }
  BubbleSeries1.Clear;
  for t:=1 to 100 do
      BubbleSeries1.AddBubble( Date+t,
                               Random(ChartSamplesMax),         { <-- y value }
                               ChartSamplesMax/(20+Random(25)), { <-- radius value }
                               '',                              { <-- label string }
                               GetDefaultColor(t));             { <-- color }
end;

procedure TBubbleForm.CheckBox1Click(Sender: TObject);
begin
  Timer1.Enabled:=CheckBox1.Checked; { <-- on / off animation }
end;

procedure TBubbleForm.Timer1Timer(Sender: TObject);
Var tmpColor:TColor;
Begin
  Timer1.Enabled:=False;  { <-- stop the timer (this is optional) }
  With BubbleSeries1 do
  Begin
    tmpColor:=ValueColor[0];
    Delete(0); { <-- remove the first point }
    { Add a new random bubble }
    AddBubble( XValues.Last+1,                  { <-- x value }
               Random(ChartSamplesMax),         { <-- y value }
               ChartSamplesMax/(20+Random(25)), { <-- radius value }
               '',                              { <-- label string }
               tmpColor);                       { <-- color }
  end;
  if Random(100)<8 then
  begin
    if ComboBox1.ItemIndex<ComboBox1.Items.Count-1 then
       ComboBox1.ItemIndex:=ComboBox1.ItemIndex+1
    else
       ComboBox1.ItemIndex:=0;
    ComboBox1Change(Self);
  end;
  if (GetTickCount mod 1000)<=55 then
  begin
    with BubbleSeries1.GetHorizAxis.Title do
     if Angle>=90 then Angle:=Angle-90 else Angle:=270;

    with BubbleSeries1.GetVertAxis.Title do
     if Angle>=90 then Angle:=Angle-90 else Angle:=270;

    with BubbleSeries1.GetVertAxis do
     if LabelsAngle>=90 then LabelsAngle:=LabelsAngle-90 else LabelsAngle:=270;

    with BubbleSeries1.GetHorizAxis do
     if LabelsAngle>=90 then LabelsAngle:=LabelsAngle-90 else LabelsAngle:=270;
  end;
  Timer1.Enabled:=True;  { <-- restart the timer }
end;

procedure TBubbleForm.CheckBox2Click(Sender: TObject);
begin
  BubbleSeries1.Marks.Visible:=CheckBox2.Checked; { switch on/off Marks }
end;

procedure TBubbleForm.ComboBox1Change(Sender: TObject);
begin { the demo combobox1 allows changing Bubble style }
  BubbleSeries1.Pointer.Style:=TSeriesPointerStyle(ComboBox1.ItemIndex);
end;

procedure TBubbleForm.CheckBox3Click(Sender: TObject);
begin
  Chart1.Repaint;
end;

function TBubbleForm.BubbleSeries1GetPointerStyle(Sender: TChartSeries;
  ValueIndex: Longint): TSeriesPointerStyle;
begin
  if CheckBox3.Checked then
     result:=TSeriesPointerStyle(Random(Ord(High(TSeriesPointerStyle))))
  else
     result:=BubbleSeries1.Pointer.Style;
end;

procedure TBubbleForm.ZoomInButtonClick(Sender: TObject);
begin
  Chart1.ZoomPercent(110);
end;

procedure TBubbleForm.ZoomOutButtonClick(Sender: TObject);
begin
  Chart1.ZoomPercent(90);
end;



end.
