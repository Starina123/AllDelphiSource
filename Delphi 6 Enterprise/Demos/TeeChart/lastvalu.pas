{*********************************************}
{ TeeChart Delphi Component Library           }
{ Digital Series and Legend Last Values Demo  }
{ Copyright (c) 1995-2001 by David Berneda    }
{ All rights reserved                         }
{*********************************************}
{$P-}   { <-- VERY IMPORTANT WHEN USING OnGet.. EVENTS }
unit lastvalu;

interface
{ This forms show 4 line series in "Stairs" mode.

 ( LineSeries1.Stairs := True ; )

  Legend Style is "lsLastValues" meaning the Legend will draw the
  Last value for each Series.
}

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, Chart, Series, ExtCtrls, StdCtrls, Teengine, Buttons,
  TeeProcs;

type
  TDigitalForm = class(TForm)
    Chart1: TChart;
    LineSeries1: TLineSeries;
    LineSeries2: TLineSeries;
    LineSeries3: TLineSeries;
    LineSeries4: TLineSeries;
    Panel1: TPanel;
    CheckBox1: TCheckBox;
    Timer1: TTimer;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    BitBtn3: TBitBtn;
    CheckBox4: TCheckBox;
    Memo1: TMemo;
    procedure FormCreate(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure CheckBox3Click(Sender: TObject);
    procedure Chart1GetLegendText(Sender: TCustomAxisPanel;
      LegendStyle: TLegendStyle; Index: Longint; var LegendText: String);
    procedure CheckBox4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

procedure TDigitalForm.FormCreate(Sender: TObject);
var t,tt:Longint;
begin
  Chart1.ApplyZOrder:=CheckBox4.Checked;     { ZOrder or not ZOrder... }
  Chart1.Legend.Inverted:=True;
  { Fill Series with random values }
  for t:=0 to Chart1.SeriesCount-1 do
  With Chart1.Series[t] do
  begin
    Clear;
    for tt:=1 to 100 do Add( 2*t+Random(2), '', clTeeColor);
  end;
end;

procedure TDigitalForm.CheckBox1Click(Sender: TObject);
begin
  Timer1.Enabled:=CheckBox1.Checked;  { start / stop animation }
end;

procedure TDigitalForm.Timer1Timer(Sender: TObject);
var t:Longint;
begin
  Timer1.Enabled:=False;  { <-- stop the timer }

  { Now, add a new point to each Series }
  for t:=0 to Chart1.SeriesCount-1 do
  With Chart1.Series[t] do Add( 2*t+Random(2),'',clTeeColor);

  { Scroll the Horizontal Axis }
  With Chart1.BottomAxis do  { <-- with the Horizontal Axis... }
  Begin
    Automatic := False;        { <-- we dont want automatic scaling }
    Maximum := LineSeries1.XValues.Last;
    Minimum := Maximum - 100;   { we want to see the last 100 points only }
  End;
  { re-start timer }
  Timer1.Enabled:=True;
end;

procedure TDigitalForm.CheckBox2Click(Sender: TObject);
begin
  Chart1.View3D:=CheckBox2.Checked;
end;

procedure TDigitalForm.CheckBox3Click(Sender: TObject);
begin
  if CheckBox3.Checked then
     Chart1.Legend.LegendStyle:=lsLastValues
  else
     Chart1.Legend.LegendStyle:=lsAuto;
end;

procedure TDigitalForm.Chart1GetLegendText(Sender: TCustomAxisPanel;
  LegendStyle: TLegendStyle; Index: Longint; var LegendText: String);
begin
  { we want to show the Series Title as well as the Last Values }
  if LegendStyle=lsLastValues then
     LegendText:=LegendText+' --> '+Chart1.Series[Index].Title;
end;

procedure TDigitalForm.CheckBox4Click(Sender: TObject);
begin
  Chart1.ApplyZOrder:=CheckBox4.Checked;
  Chart1.Repaint;
end;


end.
