{*********************************************}
{ TeeChart Delphi Component Library           }
{ Pie Series Type Demo                        }
{ Copyright (c) 1995-2001 by David Berneda    }
{ All rights reserved                         }
{*********************************************}
unit pie;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, Chart, Series, ExtCtrls, StdCtrls, Teengine,
  Buttons, teeprocs;

type
  TPieForm = class(TForm)
    Chart1: TChart;
    Panel1: TPanel;
    CheckBox1: TCheckBox;
    Timer1: TTimer;
    PieSeries1: TPieSeries;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    BitBtn3: TBitBtn;
    CheckBox4: TCheckBox;
    Shape1: TShape;
    RadioGroup1: TRadioGroup;
    CheckBox5: TCheckBox;
    CheckBox6: TCheckBox;
    RadioGroup2: TRadioGroup;
    procedure FormCreate(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure CheckBox3Click(Sender: TObject);
    procedure PieSeries1Click(Sender: TChartSeries; ValueIndex: Integer;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure CheckBox4Click(Sender: TObject);
    procedure Chart1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure RadioGroup1Click(Sender: TObject);
    procedure CheckBox5Click(Sender: TObject);
    procedure CheckBox6Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    tmpX,tmpY:Longint;
  end;

implementation

{$R *.dfm}
Uses UDemUtil;

procedure TPieForm.FormCreate(Sender: TObject);
begin
  tmpX:=-4;
  tmpY:=-3;
  PieSeries1.FillSampleValues(8); { <-- Some random points }
  Chart1.Gradient.Visible:=Chart1.IsScreenHighColor;
  if Chart1.Gradient.Visible then
     Chart1.Title.Font.Color:=clWhite
  else
     Chart1.Title.Font.Color:=clBlue;
  CheckBox6.Checked:=Chart1.Gradient.Visible;
end;

procedure TPieForm.CheckBox1Click(Sender: TObject);
begin
  Timer1.Enabled:=CheckBox1.Checked; { <-- animation on/off }
  CheckBox3.Enabled:=not Timer1.Enabled;
  if not Timer1.Enabled then
  Begin
    PieSeries1.CustomXRadius:=0;
    PieSeries1.CustomYRadius:=0;
  end;
end;

procedure TPieForm.Timer1Timer(Sender: TObject);
begin
{ increase pie rotation angle to get animation }
  PieSeries1.Rotate(5);

{ change X and Y radius to get animation }
  With PieSeries1 do
  Begin
    if tmpX>0 then
    Begin
      if XRadius+tmpX>Chart1.ChartWidth div 3 then tmpX:=-tmpX;
    end
    else if XRadius+tmpX<30 then tmpX:=-tmpX;
    CustomXRadius:=XRadius+tmpX;

    if tmpY>0 then
    Begin
      if YRadius+tmpY>Chart1.ChartHeight div 3 then tmpY:=-tmpY;
    end
    else
      if YRadius+tmpY<30 then tmpY:=-tmpY;
    CustomYRadius:=YRadius+tmpY;
  end;

{ Change Marks.Font.Color randomly }
{ if Random(100)<4 then
  With PieSeries1.Marks do
  Begin
    Repeat
       BackColor:=ColorPalette[1+Random(MaxDefaultColors)];
       Font.Color:=ColorPalette[1+Random(MaxDefaultColors)];
    Until BackColor<>Font.Color;
    Arrow.Color:=ColorPalette[1+Random(MaxDefaultColors)];
  end;

  { Change Legend positioning Randomly }
  if Random(100)<4 then
     RadioGroup1.ItemIndex:=Random(RadioGroup1.Items.Count);
end;

procedure TPieForm.CheckBox2Click(Sender: TObject);
begin
  Chart1.View3d:=CheckBox2.Checked; { <-- 3d on / off }
end;

procedure TPieForm.CheckBox3Click(Sender: TObject);
begin
  PieSeries1.Circled:=CheckBox3.Checked; { <-- circled / elliptic pie }
end;

procedure TPieForm.PieSeries1Click(Sender: TChartSeries;
  ValueIndex: Integer; Button: TMouseButton; Shift: TShiftState; X,
  Y: Integer);
begin
  { On Clicked Pie, let the user change the clicked pie color }
  With PieSeries1 do
       ValueColor[ValueIndex]:=EditColor(Self,ValueColor[ValueIndex]);
end;

procedure TPieForm.CheckBox4Click(Sender: TObject);
begin
  PieSeries1.UsePatterns:=CheckBox4.Checked;
  if PieSeries1.UsePatterns then PieSeries1.CircleBackColor:=clWhite;
end;

procedure TPieForm.Chart1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
var tmp:Longint;
begin
  tmp:=PieSeries1.Clicked(x,y);
  if tmp=-1 then Shape1.Visible:=False
  else
  begin
    Shape1.Visible:=True;
    Shape1.Brush.Color:=PieSeries1.ValueColor[tmp];
  end;
end;

procedure TPieForm.RadioGroup1Click(Sender: TObject);
begin
  Chart1.Legend.Alignment:=TLegendAlignment(RadioGroup1.ItemIndex);
end;

procedure TPieForm.CheckBox5Click(Sender: TObject);
begin
  PieSeries1.Marks.Visible:=CheckBox5.Checked;
end;

procedure TPieForm.CheckBox6Click(Sender: TObject);
begin
  Chart1.Gradient.Visible:=CheckBox6.Checked;
end;

end.
