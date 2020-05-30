{*********************************************}
{ TeeChart Delphi Component Library           }
{ Logarithmic Labels Demo                     }
{ Copyright (c) 1996-2001 by David Berneda    }
{ All rights reserved                         }
{*********************************************}
unit loglab;
{$P-}

interface

{ This form shows how custom Axis labels can be specified }
{ The Chart.OnGetNextAxisLabel event is used to supply the axis with
  custom label positions and values. }

uses
  WinProcs, WinTypes, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, TeeProcs, TeEngine, Chart, Series, StdCtrls, Buttons;

type
  TLogLabelsForm = class(TForm)
    Chart1: TChart;
    Series1: TFastLineSeries;
    Panel1: TPanel;
    BitBtn2: TBitBtn;
    Memo1: TMemo;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

procedure TLogLabelsForm.FormCreate(Sender: TObject);
begin
  { Axis settings }
  Chart1.BottomAxis.Logarithmic:=True;
  Chart1.BottomAxis.TickOnLabelsOnly:=True;
  Chart1.BottomAxis.SetMinMax( 10.0, 1000);
  Chart1.LeftAxis.Logarithmic:=True;
  Chart1.LeftAxis.TickOnLabelsOnly:=True;
  Chart1.LeftAxis.SetMinMax( 10.0, 1000);

  { adding XY values to Series1 }
  Series1.XValues.DateTime:=False;
  Series1.AddXY( 100, 100, '', clTeeColor );
  Series1.AddXY( 500, 200, '', clTeeColor );
  Series1.AddXY( 800, 300, '', clTeeColor );
  Series1.AddXY( 200, 200, '', clTeeColor );
end;

end.
