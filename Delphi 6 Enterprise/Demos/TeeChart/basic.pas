{*********************************************}
{ TeeChart Delphi Component Library           }
{ Basic Series Types Demo                     }
{ Copyright (c) 1995-2001 by David Berneda    }
{ All rights reserved                         }
{*********************************************}
unit basic;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, Chart, Series, ExtCtrls, StdCtrls, Bubble,
  BubbleCh, Teengine, Buttons, teeprocs;

type
  TBasicForm = class(TForm)
    Chart1: TChart;
    Panel1: TPanel;
    CheckBox1: TCheckBox;
    Timer1: TTimer;
    BarSeries1: TBarSeries;
    South: TAreaSeries;
    Speaking: TPointSeries;
    Panel2: TPanel;
    Chart2: TChart;
    Label1: TLabel;
    Chart3: TChart;
    Chart4: TChart;
    North: TAreaSeries;
    Writing: TPointSeries;
    Reading: TPointSeries;
    BitBtn1: TBitBtn;
    RadioGroup1: TRadioGroup;
    BitBtn3: TBitBtn;
    CheckBox2: TCheckBox;
    SaveDialog1: TSaveDialog;
    BitBtn2: TBitBtn;
    Winter: TLineSeries;
    Summer: TLineSeries;
    procedure FormCreate(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

Uses Printers; 

procedure TBasicForm.FormCreate(Sender: TObject);
var t:Longint;
begin
  Summer.FillSampleValues(20); { <-- Some random points }
  Winter.FillSampleValues(20); { <-- Some random points }

  { Will need a Bar Series with special random values,
    so we dont call the standard FillSampleValues method }
  With BarSeries1 do
  for t:=1 to 12 do Add(Random(1000),ShortMonthNames[t],GetDefaultColor(t));

  South.FillSampleValues(20); { <-- Some random points }
  North.FillSampleValues(20); { <-- Some random points }

  Speaking.FillSampleValues(20); { <-- Some random points }
  Reading.FillSampleValues(20); { <-- Some random points }
  Writing.FillSampleValues(20); { <-- Some random points }

{  Force to resize the four charts }
  FormResize(Self);
end;

procedure TBasicForm.CheckBox1Click(Sender: TObject);
begin
  Timer1.Enabled:=CheckBox1.Checked;
end;

procedure TBasicForm.Timer1Timer(Sender: TObject);

  Procedure Animate(Series:TChartSeries);
  Begin
    With Series do
    Begin
      Delete(0); { <-- remove the first point }
      { Add a new random point }
      AddXY( XValues.Last+1,
             YValues.Last+(Random(ChartSamplesMax)-(ChartSamplesMax/2)),
             '',clTeeColor);
    end;
  end;

Var tmpLabel:String;
    tmpColor:TColor;
begin
  Animate(Summer);
  Animate(Winter);
  { BarSeries1 has special treatment to animate }
  With BarSeries1 do
  Begin
    tmpLabel:=XLabel[0];
    tmpColor:=ValueColor[0];
    Delete(0);
    AddXY(XValues.Last+1,Random(1000),tmpLabel,tmpColor);

    { Change Bar Style randomly... }
    if Random(10)<1 then
       BarStyle:=TBarStyle(Random(1+Ord(High(TBarStyle))));
  end;
  Animate(South);
  Animate(North);
  Animate(Speaking);
  Animate(Reading);
  Animate(Writing);

  { Change Pointer Style randomly... }
  if Random(10)<1 then
  With Speaking do
   Pointer.Style:=TSeriesPointerStyle(Random(1+Ord(High(TSeriesPointerStyle))));
end;

{ Realign the four charts }
procedure TBasicForm.FormResize(Sender: TObject);
Var w,h:Longint;
begin
  { Top and bottom Panel positioning }
  w:=ClientWidth-4-Panel1.Width;
  Panel2.Width:=w-4;
  Panel1.Height:=ClientHeight-Panel2.Height-4;
  h:=Panel1.Height;
  { Top Left Chart }
  Chart1.SetBounds(Panel1.Width,Panel2.Height,w div 2,h div 2);
  { Bottom Left Chart }
  Chart2.SetBounds(Panel1.Width,Panel2.Height+Chart1.Height,w div 2,h div 2);
  { Top Right Chart }
  Chart3.SetBounds(Panel1.Width+Chart1.Width+1,Chart1.Top,w div 2,h div 2);
  { Bottom Right Chart }
  Chart4.SetBounds(Chart3.Left,Chart2.Top,w div 2,h div 2);
end;

procedure TBasicForm.FormShow(Sender: TObject);
begin
  FormResize(Self); { <-- to align charts }
end;

procedure TBasicForm.BitBtn1Click(Sender: TObject);
Var tmpH,tmpW,tmpWMargin,tmpHMargin:Longint; { margins }
    OldOrientation:TPrinterOrientation;
begin
  Screen.Cursor := crHourGlass;
  OldOrientation:=Printer.Orientation;  { <-- save paper orientation }
  Printer.Orientation:=poLandscape; { <-- Force Horizontal paper }
  try
    Printer.BeginDoc;       { <-- start printer job }
    try
      Printer.Title:='TeeChart Printing Demo';

      Case RadioGroup1.ItemIndex of
        0: Begin { screen proportional }
             Chart1.PrintResolution:= 0;
             Chart2.PrintResolution:= 0;
             Chart3.PrintResolution:= 0;
             Chart4.PrintResolution:= 0;
           End;
        1: Begin { thin lines and small fonts }
             Chart1.PrintResolution:= -100;
             Chart2.PrintResolution:= -100;
             Chart3.PrintResolution:= -100;
             Chart4.PrintResolution:= -100;
           End;
      end;

      { Print the four charts, each one at a different paper position }

      { CALCULATE HORIZONTAL MARGIN }
      tmpW:=Printer.PageWidth;
      tmpWMargin:=Round(5.0*tmpW/100.0); { <-- 5% margins }
      tmpW:=tmpW-2*tmpWMargin;  { <-- left and right margins }
      tmpW:=tmpW div 2; { half height for left and right charts }

      { CALCULATE VERTICAL MARGIN }
      tmpH:=Printer.PageHeight;
      tmpHMargin:=Round(5.0*tmpH/100.0);  { <-- 5% margins }
      tmpH:=tmpH-2*tmpHMargin;  { <-- bottom and top margins }
      tmpH:=tmpH div 2; { half height for top and bottom charts }

      { left / top chart }
      Chart1.PrintPartial( Rect( tmpWMargin,tmpHMargin,
                                 tmpWMargin+tmpW,tmpHMargin+tmpH ) );

      { right / top chart }
      Chart3.PrintPartial( Rect( tmpWMargin+tmpW,tmpHMargin,
                                 tmpWMargin+2*tmpW,tmpHMargin+tmpH ) );

      { left / bottom chart }
      Chart2.PrintPartial( Rect( tmpWMargin,tmpHMargin+tmpH,
                                 tmpWMargin+tmpW,tmpHMargin+2*tmpH ) );

      { right / bottom chart }
      Chart4.PrintPartial( Rect( tmpWMargin+tmpW,tmpHMargin+tmpH,
                                 tmpWMargin+2*tmpW,tmpHMargin+2*tmpH ) );

      Printer.EndDoc; { <-- end job and print !! }
    except
      on Exception do  { just in case an error happens... }
      Begin
        Printer.Abort;
        Printer.EndDoc;
        Raise;
      end;
    end;
  finally
    Printer.Orientation:=OldOrientation;  { <-- restore paper orientation }
    Screen.Cursor:=crDefault; { <-- restore cursor }
  end;
end;

procedure TBasicForm.CheckBox2Click(Sender: TObject);
begin
  Chart1.View3D:=CheckBox2.Checked;
  Chart2.View3D:=CheckBox2.Checked;
  Chart3.View3D:=CheckBox2.Checked;
  Chart4.View3D:=CheckBox2.Checked;
end;

procedure TBasicForm.BitBtn2Click(Sender: TObject);
var tmpH,tmpW:Longint;
begin
 { This code creates and stores a new BITMAP file
   which contains the FOUR charts.
   Asks previously the user the BMP filename.
 }
  with SaveDialog1 do
  begin
    if Execute then
    With TBitmap.Create do
    try
      { calculate bitmap size (2x2) }
      tmpW:=Chart1.Width;
      tmpH:=Chart1.Height;
      Width := 2*tmpW;
      Height:= 2*tmpH;
      { draw chart 1 }
      Chart1.BufferedDisplay:=False;
      Chart1.Draw(Canvas,Rect(0,0,tmpW,tmpH));
      Chart1.BufferedDisplay:=True;

      { draw chart 2 }
      Chart2.BufferedDisplay:=False;
      Chart2.Draw(Canvas,Rect(0,tmpH+1,tmpW,2*tmpH));
      Chart2.BufferedDisplay:=True;

      { draw chart 3 }
      Chart3.BufferedDisplay:=False;
      Chart3.Draw(Canvas,Rect(tmpW+1,0,2*tmpW,tmpH));
      Chart3.BufferedDisplay:=True;

      { draw chart 4 }
      Chart4.BufferedDisplay:=False;
      Chart4.Draw(Canvas,Rect(tmpW+1,tmpH+1,2*tmpW,2*tmpH));
      Chart4.BufferedDisplay:=True;
      SaveToFile(FileName);
    finally
      Free;
    end;
  end;
end;

end.
