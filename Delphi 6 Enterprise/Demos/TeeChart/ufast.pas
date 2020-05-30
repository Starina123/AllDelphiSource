{******************************************}
{    TeeChart. TChart Component            }
{ Copyright (c) 1995-2001 by David Berneda }
{    All Rights Reserved                   }
{******************************************}
unit ufast;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, ExtCtrls, Teengine, Chart,Series, Buttons,
  TeeProcs;

type
  TFastLineForm = class(TForm)
    Chart1: TChart;
    Panel1: TPanel;
    Button1: TButton;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    FastLineSeries1: TFastLineSeries;
    FastLineSeries2: TFastLineSeries;
    CheckBox3: TCheckBox;
    BitBtn3: TBitBtn;
    Memo1: TMemo;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure CheckBox3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

procedure TFastLineForm.FormCreate(Sender: TObject);
var t,tmpRandom:Longint;
begin
  { This can speed up things a little... }
  TeeEraseBack:=False;

  { Make the chart flicker by default, only for this demo }
  Chart1.BufferedDisplay:=False;

  Chart1.View3d:=False;
  Chart1.Legend.Visible:=False;
  Chart1.Title.Visible:=False;
  Chart1.Foot.Visible:=False;

  { some speed improvement if... }
  TeeDefaultCapacity:=2000;
  
  { 2000 random points }
  Randomize;
  for t:=1 to 1000 do
  begin
    tmpRandom:=Random(Abs(500-t))-(Abs(500-t) div 2);
    FastLineSeries1.Add(1000-t+tmpRandom,'',clTeeColor);
    FastLineSeries2.Add(t+tmpRandom,'',clTeeColor);
  end;
end;

procedure TFastLineForm.Button1Click(Sender: TObject);
var t1,t2,t:Longint;
begin
  Screen.Cursor:=crHourGlass;
  try
    Chart1.AnimatedZoom:=False;
    t1:=GetTickCount;
    for t:=1 to 30 do Chart1.ZoomPercent(105);  { 5% zoom in }
    for t:=1 to 30 do Chart1.ZoomPercent(95); { 5% zoom out }
    t2:=GetTickCount;
    Chart1.AnimatedZoom:=True;
    Chart1.UndoZoom;
  finally
    Screen.Cursor:=crDefault;
  end;
  Showmessage('Time to plot 2000 points'+#13+
              '61 times: '+#13+
              IntToStr(t2-t1)+' milliseconds.');
end;

procedure TFastLineForm.CheckBox2Click(Sender: TObject);
begin
  Chart1.AxisVisible:=CheckBox2.Checked;
end;

procedure TFastLineForm.CheckBox1Click(Sender: TObject);
begin
 { Setting this to False speeds up drawing
   with maximized charts on some video drivers }
  Chart1.BufferedDisplay:=CheckBox1.Checked;
end;

procedure TFastLineForm.CheckBox3Click(Sender: TObject);
begin
  Chart1.ClipPoints:=CheckBox3.Checked;
end;

end.
