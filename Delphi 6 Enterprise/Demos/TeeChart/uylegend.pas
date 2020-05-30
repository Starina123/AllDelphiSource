{*********************************************}
{ TeeChart Delphi Component Library           }
{ Custom Legend Size and Position Demo        }
{ Copyright (c) 1995-2001 by David Berneda    }
{ All rights reserved                         }
{*********************************************}
unit uylegend;

interface
{ This form shows a customized Legend.
  The Chart.OnGetLegendRect and Chart.OnGetLegendPos events are used to
  change the default legend size and the default legend text positions.
}
uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, ExtCtrls, Chart, Series, StdCtrls, Teengine, Buttons,
  TeeProcs;

type
  TLegendXYForm = class(TForm)
    Chart1: TChart;
    PieSeries1: TPieSeries;
    Panel1: TPanel;
    RadioGroup1: TRadioGroup;
    BitBtn3: TBitBtn;
    Memo1: TMemo;
    procedure FormCreate(Sender: TObject);
    procedure Chart1GetLegendRect(Sender: TCustomChart; var Rect: TRect);
    procedure Chart1GetLegendPos(Sender: TCustomChart; Index: Longint;
      var X, Y, XColor: Longint);
    procedure RadioGroup1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    DefaultLegend:Boolean;
  end;

var
  LegendXYForm: TLegendXYForm;

implementation

{$R *.dfm}

procedure TLegendXYForm.FormCreate(Sender: TObject);
begin
  DefaultLegend:=False;              { <-- only used in this example }
  PieSeries1.FillSampleValues(10);   { <-- some random pie sectors }
end;

procedure TLegendXYForm.Chart1GetLegendRect(Sender: TCustomChart;
  var Rect: TRect);
begin
  if not DefaultLegend then  { <-- if we want to customize legend... }
  Begin
    { This changes the Legend Rectangle dimensions }
    Rect.Bottom:=Rect.Top+PieSeries1.Count*15;  { <-- Calc Legend Height }
    Rect.Left:=Rect.Left-120;                   { <-- Bigger Legend Width }
  end;
end;

procedure TLegendXYForm.Chart1GetLegendPos(Sender: TCustomChart; Index: Longint;
  var X, Y, XColor: Longint);
begin
  if not DefaultLegend then
  Begin
    { Calculate the X Y coordinates for each Legend Text }
    x:=Chart1.Legend.RectLegend.Left;
    x:=x + (Index div (PieSeries1.Count div 2))*100;

    y:=Chart1.Legend.RectLegend.Top;
    y:=y +   (Index mod (PieSeries1.Count div 2))*30;

    if (Index mod 2)=1 then X:=X+20;
    x:=x+20;
    XColor:=X-15;
  end;
end;

procedure TLegendXYForm.RadioGroup1Click(Sender: TObject);
begin
  { Get the RadioGroup selection and force the chart to repaint }
  DefaultLegend:=RadioGroup1.ItemIndex=0;
  Chart1.Repaint;
end;

end.
