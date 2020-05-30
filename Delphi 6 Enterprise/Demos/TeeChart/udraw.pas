{******************************************}
{    TeeChart. Draw Example                }
{ Copyright (c) 1995-2001 by David Berneda }
{    All Rights Reserved                   }
{******************************************}
unit udraw;

interface

{ THIS EXAMPLE SHOWS HOW TO DRAW ADDITIONAL CUSTOMIZED THINGS TO A
  CHART COMPONENT }
uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, Chart, Series, ExtCtrls, Teengine, StdCtrls, Buttons,
  TeeProcs;

type
  TDrawForm = class(TForm)
    Chart1: TChart;
    LineSeries1: TLineSeries;
    Panel1: TPanel;
    BitBtn3: TBitBtn;
    CheckBox1: TCheckBox;
    Timer1: TTimer;
    BitBtn1: TBitBtn;
    CheckBox2: TCheckBox;
    Memo1: TMemo;
    procedure FormCreate(Sender: TObject);
    procedure LineSeries1BeforeDrawValues(Sender: TObject);
    procedure LineSeries1AfterDrawValues(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Percent:Double;
    DeltaPercent:Integer;
  end;

implementation

{$R *.dfm}

procedure TDrawForm.FormCreate(Sender: TObject);
begin
  Percent:=50;  { <-- used for this demo only }
  LineSeries1.FillSampleValues(20);
end;

procedure TDrawForm.LineSeries1BeforeDrawValues(Sender: TObject);
Const
   MyColors:array[1..5] of TColor=
    ( clNavy,
      clGreen,
      clYellow,
      clRed,
      $00000080 { very red }
      );
var t,partial:Longint;
    tmpRect:TRect;
    YPosition:Longint;
    tmpYCenterValue:Double;
begin
  With Chart1 do
  Begin
    { we will divide the total chart width by 5 }
    tmpRect:=ChartRect;
    tmpRect.Right:=tmpRect.Left;
    partial:=ChartWidth div 5;

    { change the brush style }
    Canvas.Brush.Style:=bsDiagCross;
    Canvas.Pen.Style:=psClear;

    { for each section, fill with a specific color }
    for t:=1 to 5 do
    Begin
      { adjust the rectangle dimension }
      tmpRect.Right :=tmpRect.Right+partial+1 ;

      { set the brush color }
      Canvas.Brush.Color:=MyColors[t];

      { paint !!! }
      With tmpRect do
        Canvas.Rectangle( Left+Width3D,Top-Height3D,Right+Width3D,Bottom-Height3D );

      { adjust rectangle }
      tmpRect.Left:=tmpRect.Right;
    end;

    { first calculate the middle vertical value (based on LineSeries points) }
    With LineSeries1.YValues do
         tmpYCenterValue:=MinValue+Percent*(MaxValue-MinValue)/100.0;

    { then calculate the Screen Pixel coordinate of the above value }
    YPosition:=LeftAxis.CalcYPosValue(tmpYCenterValue);

    With Canvas do
    begin
      { change pen and draw the line }
      Pen.Width:=3;
      Pen.Style:=psSolid;
      Pen.Color:=clRed;
      MoveTo(ChartRect.Left,YPosition);
      LineTo(ChartRect.Left+Width3D,YPosition-Height3D);
      LineTo(ChartRect.Right+Width3D,YPosition-Height3D);
    end;
  end;
end;

procedure TDrawForm.LineSeries1AfterDrawValues(Sender: TObject);
Var YPosition:Longint;
    tmpYCenterValue:Double;
begin
  With Chart1,Canvas do
  Begin
    { first calculate the middle vertical value (based on LineSeries points) }
    With LineSeries1.YValues do
         tmpYCenterValue:=MinValue+Percent*(MaxValue-MinValue)/100.0;

    { then calculate the Screen Pixel coordinate of the above value }
    YPosition:=LeftAxis.CalcYPosValue(tmpYCenterValue);

    { change pen and draw the line }
    Pen.Width:=3;
    Pen.Style:=psSolid;
    Pen.Color:=clRed;
    MoveTo(ChartRect.Left,YPosition);
    LineTo(ChartRect.Right,YPosition);
    LineTo(ChartRect.Right+Width3D,YPosition-Height3D);

    { change font and draw some text above the line }

    Font.Name:='Arial';

    { VERY IMPORTANT !!!!!! }
    { THIS IS NECESSARY IF YOU'RE GOING TO PRINT !!!! }
    { IT MAKES FONT SIZES TO WORK FINE BOTH AT SCREEN AND PRINTER. }

    Font.Height:=-24;   { <-- express font size in "Height", NOT "Size" }

    Font.Color:=clYellow;
    Font.Style:=[fsBold];

    { Set transparent background... }
    Brush.Style:=bsClear;

    { Output some text... }
    TextOut( ChartRect.Left+20,
             YPosition-24 ,
             'This is '+FloatToStr(tmpYCenterValue));
  end;
end;

procedure TDrawForm.Timer1Timer(Sender: TObject);
begin
  if Percent+DeltaPercent>100 then
  begin
    Percent:=100;
    DeltaPercent:=-5;
  end
  else
  if Percent+DeltaPercent<0 then
  begin
    Percent:=0;
    DeltaPercent:=5;
  end
  else Percent:=Percent+DeltaPercent;
  Chart1.Repaint;
end;

procedure TDrawForm.CheckBox1Click(Sender: TObject);
begin
  Timer1.Enabled:=CheckBox1.Checked;
  DeltaPercent:=5;
end;

procedure TDrawForm.BitBtn1Click(Sender: TObject);
begin
 { try with and without this --->  Chart1.PrintResolution := -100; }
  Chart1.PrintLandscape;
end;

procedure TDrawForm.CheckBox2Click(Sender: TObject);
begin
  Chart1.View3D:=CheckBox2.Checked;
end;

end.
