{******************************************}
{ TeeChart                                 }
{ Scroll Bars Example                      }
{ Copyright (c) 1995-2001 by David Berneda }
{    All Rights Reserved                   }
{******************************************}
unit uscrollb;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, Teengine, Series, ExtCtrls, Chart, TeeProcs;

type
  TScrollBarForm = class(TForm)
    Chart1: TChart;
    LineSeries1: TLineSeries;
    ScrollBar2: TScrollBar;
    ScrollBar1: TScrollBar;
    procedure ScrollBar1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ScrollBar2Change(Sender: TObject);
    procedure Chart1Scroll(Sender: TObject);
    procedure Chart1Zoom(Sender: TObject);
    procedure Chart1UndoZoom(Sender: TObject);
    procedure Chart1Resize(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    ChangingBars:Boolean;
    Procedure CalcScrollBarPos;
  end;

implementation

{$R *.dfm}

procedure TScrollBarForm.ScrollBar1Change(Sender: TObject);
var Difer:Double;
begin
  if not ChangingBars then
  With Chart1.BottomAxis do
  Begin
    Difer:=Maximum-Minimum;
    Maximum:=Chart1.MaxXValue(Chart1.BottomAxis)-ScrollBar1.Position*Difer/100.0;
    Minimum:=Maximum-Difer;
  end;
end;

procedure TScrollBarForm.FormCreate(Sender: TObject);
begin
  LineSeries1.FillSampleValues(1000);
  Chart1.ZoomPercent(115);
  CalcScrollBarPos;
end;

procedure TScrollBarForm.ScrollBar2Change(Sender: TObject);
Var Difer:Double;
begin
  if not ChangingBars then
  With Chart1.LeftAxis do
  Begin
    Difer:=Maximum-Minimum;
    Minimum:=Chart1.MinYValue(Chart1.LeftAxis)+ScrollBar2.Position*Difer/100.0;
    Maximum:=Minimum+Difer;
  end;
end;

Procedure TScrollBarForm.CalcScrollBarPos;
Var Difer:Double;
Begin
  ChangingBars:=True;
  With Chart1 do
  Begin
   if BottomAxis.Automatic then
      ScrollBar1.Enabled:=False
   else
   Begin
     ScrollBar1.Enabled:=True;
     Difer:=MaxXValue(BottomAxis)-MinXValue(BottomAxis);
     if Difer>0 then
     ScrollBar1.Position:=
       Round(100.0*(BottomAxis.Minimum-MinXValue(BottomAxis))/Difer);
   end;
   if LeftAxis.Automatic then
      ScrollBar2.Enabled:=False
   else
   Begin
     ScrollBar2.Enabled:=True;
     Difer:=MaxYValue(LeftAxis)-MinYValue(LeftAxis);
     if Difer>0 then
     ScrollBar2.Position:=
       Round(100.0*(LeftAxis.Minimum-MinYValue(LeftAxis))/Difer);
   end;
  end;
  ChangingBars:=False;
End;

procedure TScrollBarForm.Chart1Scroll(Sender: TObject);
begin
  CalcScrollBarPos;
end;

procedure TScrollBarForm.Chart1Zoom(Sender: TObject);
begin
  CalcScrollBarPos;
end;

procedure TScrollBarForm.Chart1UndoZoom(Sender: TObject);
begin
  CalcScrollBarPos;
end;

procedure TScrollBarForm.Chart1Resize(Sender: TObject);
begin
  ScrollBar1.Left:=0;
  ScrollBar1.Top:=Chart1.Height-ScrollBar1.Height;
  ScrollBar1.Width:=Chart1.Width;

  ScrollBar2.Left:=Chart1.Width-ScrollBar2.Width;
  ScrollBar2.Top:=0;
  ScrollBar2.Height:=Chart1.Height;
end;

end.
