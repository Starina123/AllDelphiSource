{******************************************}
{    TeeChart. Legend Example              }
{ Copyright (c) 1995-2001 by David Berneda }
{    All Rights Reserved                   }
{******************************************}
unit ulegend;

interface
{ This form shows how to create a new Chart.Legend.
  We'll draw the Series Titles onto a Paintbox component.
}
uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, ExtCtrls, Chart, Series, StdCtrls, Teengine, Buttons,
  TeeProcs;

type
  TLegendForm = class(TForm)
    Chart1: TChart;
    LineSeries1: TLineSeries;
    LineSeries2: TLineSeries;
    PaintBox1: TPaintBox;
    Panel1: TPanel;
    BitBtn3: TBitBtn;
    Label1: TLabel;
    Memo1: TMemo;
    procedure LineSeries2AfterDrawValues(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  LegendForm: TLegendForm;

implementation

{$R *.dfm}

procedure TLegendForm.LineSeries2AfterDrawValues(Sender: TObject);
var t:Longint;
begin
  With Paintbox1.Canvas do  { we'll draw over PaintBox1 }
  Begin
    for t:=0 to Chart1.SeriesCount-1 do  { for each Series in Chart... }
    Begin
      Font.Color:=Chart1[t].SeriesColor;  { set font color }
      { draw the customized Series Title }
      TextOut(40,20+16*t,'This is a long Series title: '+Chart1.SeriesTitleLegend(t));
    end;
  End;
end;

procedure TLegendForm.FormCreate(Sender: TObject);
begin
  LineSeries1.FillSampleValues(50); { random values }
  LineSeries2.FillSampleValues(50);
end;

end.
