{******************************************}
{ TeeChart                                 }
{ TColoredForm Example                     }
{ Copyright (c) 1995-2001 by David Berneda }
{    All Rights Reserved                   }
{******************************************}
unit ucolor;

interface

uses
  Wintypes,WinProcs, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Teengine, Series, ExtCtrls, Chart, StdCtrls, Buttons, teeprocs;

type
  TColoredForm = class(TForm)
    Chart1: TChart;
    Panel1: TPanel;
    CheckBox1: TCheckBox;
    BitBtn2: TBitBtn;
    LineSeries1: TLineSeries;
    PointSeries1: TPointSeries;
    Memo1: TMemo;
    procedure FormCreate(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

procedure TColoredForm.FormCreate(Sender: TObject);

  Procedure AddColors(Series:TChartSeries);
  var step:Double;
      t:Longint;
  begin
    With Series,GetVertAxis do
    begin
      step:=(Maximum-Minimum)/10.0;
      for t:=0 to Count-1 do
          ValueColor[t]:=GetDefaultColor( Trunc((YValue[t]-Minimum)/step) );
    end;
  end;

begin
  LineSeries1.FillSampleValues(100);
  PointSeries1.FillSampleValues(100);
  Chart1.LeftAxis.AdjustMaxMin;
  AddColors(LineSeries1);
  AddColors(PointSeries1);
end;

procedure TColoredForm.CheckBox1Click(Sender: TObject);
begin
  Chart1.LeftAxis.Inverted:=CheckBox1.Checked;
end;


end.
