{*********************************************}
{ TeeChart Delphi Component Library           }
{ Gantt Series Type Demo                      }
{ Copyright (c) 1995-2001 by David Berneda    }
{ All rights reserved                         }
{*********************************************}
unit gantt;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, Chart, Series, ExtCtrls, StdCtrls, GanttCh,
  Teengine, Buttons, TeeProcs;

type
  TGanttForm = class(TForm)
    Chart1: TChart;
    Panel1: TPanel;
    Label1: TLabel;
    Shape1: TShape;
    BitBtn3: TBitBtn;
    GanttSeries1: TGanttSeries;
    Memo1: TMemo;
    Label2: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure Chart1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Chart1GetNextAxisLabel(Sender: TChartAxis;
      LabelIndex: Longint; var LabelValue: Double; var Stop: Boolean);
    procedure GanttSeries1Click(Sender: TChartSeries; ValueIndex: Integer;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

Uses UDemUtil;

(*
 *********************************
  HOW TO ADD GANTT BARS MANUALLY ?
 *********************************

Use the  AddGantt or AddGanttColor methods.

( This demo do not uses this methods )

Example:

   GanttSeries1.AddGantt(  EncodeDate( 1997, 1,  1 ),
                           EncodeDate( 1997, 1, 31 ),
                           0,
                           'Programming' );

Or...

   GanttSeries1.AddGanttColor(  EncodeDate( 1997, 1,  1 ),
                                EncodeDate( 1997, 1, 31 ),
                                0,
                                'Programming',
                                clGreen );


   Where "0" is the desired vertical position for this bar.
   Choose the vertical position you prefer.

   To connect gantt bars:

   1) Store the "AddGantt" or "AddGanttColor" function return longint:

      Var tmp1, tmp2 : Longint;

      tmp1:=GanttSeries1.AddGantt(  EncodeDate( 1997, 1,  1 ),
                                    EncodeDate( 1997, 1, 31 ),
                                    0,
                                    'Programming' );

      tmp2:=GanttSeries1.AddGantt(  EncodeDate( 1997, 4,  1 ),
                                    EncodeDate( 1997, 4, 30 ),
                                    0,
                                    'Testing' );

   2) Then use the NextTask property:

     GanttSeries1.NextTask[ tmp1 ] := tmp2 ;

     This will draw a line from 'Programming' gantt bar to 'Testing' bar.

     The "ConnectingLinePen" property is the pen used to draw lines.

*)

procedure TGanttForm.FormCreate(Sender: TObject);
begin
  GanttSeries1.FillSampleValues(GanttSeries1.NumSampleValues); { <-- Some random points }
  { change cursor when mouse moves over Gantt bars... }
  GanttSeries1.Cursor:=crTeeHand;
end;

procedure TGanttForm.Chart1MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
var tmpTask:Longint;
begin
  tmpTask:=GanttSeries1.Clicked(x,y);  { <-- if mouse is over a gantt bar... }
  if tmpTask<>-1 then
  begin { set a sample label and a sample shape color }
    Label1.Caption:=DateToStr(GanttSeries1.XValues[tmpTask]);
    Label2.Caption:=DateToStr(GanttSeries1.EndValues[tmpTask]);
    Shape1.Brush.Color:=GanttSeries1.ValueColor[tmpTask];
  end
  else
  begin  { clear label and shape samples }
    Label1.Caption:='';
    Label2.Caption:='';
    Shape1.Brush.Color:=Panel1.Color;
  end;
end;

procedure TGanttForm.Chart1GetNextAxisLabel(Sender: TChartAxis;
  LabelIndex: Longint; var LabelValue: Double; var Stop: Boolean);
var year,month,day:Word;
begin
  { this will set the Bottom Axis (Dates) Labels to the First
    day of each month. }
  if Sender=Chart1.BottomAxis then
  begin
    { LabelValue has the "candidate" value where the Axis label will be painted. }
    DecodeDate(LabelValue,year,month,day);
    { we force that value to be the first day in month }
    Day:=1;
    Month:=Month+1;
    if Month>12 then
    Begin
      Month:=1;
      Year:=Year+1;
    end;
    { Then we set the preferred Label value }
    LabelValue:=EncodeDate(year,month,day);
    { we want more labels !! }
    Stop:=False;
  end;
end;

procedure TGanttForm.GanttSeries1Click(Sender: TChartSeries;
  ValueIndex: Integer; Button: TMouseButton; Shift: TShiftState; X,
  Y: Integer);
begin
  if Button=mbLeft then
  With Sender do
    ValueColor[ValueIndex]:=EditColor(Self,ValueColor[ValueIndex])
  else
    Chart1.CancelMouse:=False;
    { setting CancelMouse to True notifies TeeChart engine to STOP
      handling the mouse click and NOT start zoom or scroll. }
end;

end.
