{*********************************************}
{ TeeChart Delphi Component Library           }
{ Cross-Hair demo                             }
{ Copyright (c) 1995-2001 by David Berneda    }
{ All rights reserved                         }
{*********************************************}
unit ucrossh;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, Teengine, Series, ExtCtrls, Chart, Buttons,
  TeeProcs;

type
  TCrossHairForm = class(TForm)
    Chart1: TChart;
    LineSeries1: TLineSeries;
    Panel1: TPanel;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    Label2: TLabel;
    CheckBox1: TCheckBox;
    BitBtn2: TBitBtn;
    Memo1: TMemo;
    procedure FormCreate(Sender: TObject);
    procedure Chart1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure LineSeries1AfterDrawValues(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    OldX,OldY:Longint;
    CrossHairColor:TColor;
    CrossHairStyle:TPenStyle;
  end;

implementation

{$R *.dfm}
Uses udemutil;

procedure TCrossHairForm.FormCreate(Sender: TObject);
begin
  LineSeries1.FillSampleValues(30);  { <-- some random values }
  OldX:=-1;                          { initialize variables }
  CrossHairColor:=clYellow;
  CrossHairStyle:=psSolid;
end;

procedure TCrossHairForm.Chart1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);

  { This procedure draws the crosshair lines }
  Procedure DrawCross(AX,AY:Integer);
  begin
    With Chart1,Canvas do
    begin
      Pen.Color:=CrossHairColor;
      Pen.Style:=CrossHairStyle;
      Pen.Mode:=pmXor;
      Pen.Width:=1;
      MoveTo(ax,ChartRect.Top-Height3D);
      LineTo(ax,ChartRect.Bottom-Height3D);
      MoveTo(ChartRect.Left+Width3D,ay);
      LineTo(ChartRect.Right+Width3D,ay);
    end;
  end;

Var tmpX,tmpY:Double;
begin
  if (OldX<>-1) then
  begin
    DrawCross(OldX,OldY);  { draw old crosshair }
    OldX:=-1;
  end;

  { check if mouse is inside Chart rectangle }
  if PtInRect( Chart1.ChartRect, Point(X-Chart1.Width3D,Y+Chart1.Height3D)  ) then
  begin
    DrawCross(x,y);  { draw crosshair at current position }
    { store old position }
    OldX:=x;
    OldY:=y;
    { set label text }
    With LineSeries1 do
    begin
      GetCursorValues(tmpX,tmpY);  { <-- get values under mouse cursor }
      Label1.Caption:=GetVertAxis.LabelValue(tmpY)+
                      ' '+
                      GetHorizAxis.LabelValue(tmpX);
    end;
  end;
end;

procedure TCrossHairForm.LineSeries1AfterDrawValues(Sender: TObject);
begin
  OldX:=-1;  { Reset old mouse position }
end;

procedure TCrossHairForm.CheckBox1Click(Sender: TObject);
begin
  if CheckBox1.Checked then Chart1.Cursor:=crCross
                       else Chart1.Cursor:=crDefault;
  Chart1.OriginalCursor:=Chart1.Cursor;
end;

procedure TCrossHairForm.BitBtn2Click(Sender: TObject);
begin
  CrossHairColor:=EditColor(Self,CrossHairColor);
end;


end.
