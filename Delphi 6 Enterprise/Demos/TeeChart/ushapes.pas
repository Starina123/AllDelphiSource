{******************************************}
{    TeeChart. TChart Component            }
{ Copyright (c) 1995-2001 by David Berneda }
{    All Rights Reserved                   }
{******************************************}
unit ushapes;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs,TeeShape, Chart, Series, ExtCtrls, StdCtrls, Teengine,
  Buttons, TeeProcs;

type
  TShapesForm = class(TForm)
    Chart1: TChart;
    LineSeries1: TLineSeries;
    ChartShape1: TChartShape;
    LineSeries2: TLineSeries;
    ChartShape2: TChartShape;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    ChartShape3: TChartShape;
    Panel2: TPanel;
    BitBtn2: TBitBtn;
    Memo1: TMemo;
    procedure FormCreate(Sender: TObject);
    procedure ChartShape3Click(Sender: TChartSeries; ValueIndex: Integer;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ShapesForm: TShapesForm;

implementation

{$R *.dfm}

procedure TShapesForm.FormCreate(Sender: TObject);
begin
  With LineSeries1 do
  Begin
    XValues.DateTime:=False;
    Clear;
    Add( 100, 'Jan', clTeeColor );
    Add( 140, 'Feb', clTeeColor );
    Add( 120, 'Mar', clTeeColor );
    Add( 110, 'Apr', clTeeColor );
    Add(  80, 'May', clTeeColor );
    Add(  90, 'Jun', clTeeColor );
    Add(  75, 'Jul', clTeeColor );
    Add(  85, 'Aug', clTeeColor );
    Add(  95, 'Sep', clTeeColor );
    Add( 105, 'Oct', clTeeColor );
    Add( 100, 'Nov', clTeeColor );
    Add(  90, 'Dec', clTeeColor );
  end;
  With LineSeries2 do
  Begin
    XValues.DateTime:=False;
    Clear;
    Add(  60, 'Jan', clTeeColor );
    Add( 100, 'Feb', clTeeColor );
    Add(  20, 'Mar', clTeeColor );
    Add(  70, 'Apr', clTeeColor );
    AreaBrush:=bsCross;
  end;
  With ChartShape1 do
  begin
    X0:=   2;
    X1:=   8;
    Y0:= 100;
    Y1:= 130;
  end;
  With ChartShape2 do
  begin
    X0:=   5;
    X1:=   9;
    Y0:=  60;
    Y1:=  80;
  end;
  With ChartShape3 do
  begin
    X0:=   1;
    X1:=   4;
    Y0:= 135;
    Y1:= 120;
  end;
end;

procedure TShapesForm.ChartShape3Click(Sender: TChartSeries;
  ValueIndex: Integer; Button: TMouseButton; Shift: TShiftState; X,
  Y: Integer);
begin
  ShowMessage('You clicked the ChartShape3 (Rectangle)');
end;

end.
