{*********************************************}
{ TeeChart Delphi Component Library           }
{ Overlayed Bars Demo                         }
{ Copyright (c) 1995-2001 by David Berneda    }
{ All rights reserved                         }
{*********************************************}
unit uoverbar;

interface

{ This form shows 3 bar series in a overlayed layout.
  Each Bar Series has a different BarWidthPercent.
  The order Series are drawn is the most important thing. See below.
}
uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, Chart, Series, ExtCtrls, Teengine, StdCtrls, Spin,
  Buttons, TeeProcs;

type
  TOverBarForm = class(TForm)
    Chart1: TChart;
    BarSeries1: TBarSeries;
    BarSeries2: TBarSeries;
    BarSeries3: TBarSeries;
    Panel1: TPanel;
    Memo1: TMemo;
    BitBtn3: TBitBtn;
    Label1: TLabel;
    SpinEdit1: TSpinEdit;
    Label2: TLabel;
    SpinEdit2: TSpinEdit;
    CBPatterns: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure BarSeries2Click(Sender: TChartSeries; ValueIndex: Integer;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure BarSeries1Click(Sender: TChartSeries; ValueIndex: Integer;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure SpinEdit1Change(Sender: TObject);
    procedure SpinEdit2Change(Sender: TObject);
    procedure CBPatternsClick(Sender: TObject);
    procedure BarSeries3Click(Sender: TChartSeries; ValueIndex: Integer;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ChangeOverBars;
  end;

var
  OverBarForm: TOverBarForm;

implementation

{$R *.dfm}

procedure TOverBarForm.FormCreate(Sender: TObject);
var t:Longint;
begin
  { lets fill the 3 Bar Series with some random data }
  { Series3 has the biggest values, while Series1 has the smaller values }
  With BarSeries3 do
  begin
    Clear;
    for t:=1 to 10 do Add( 100+Random(30),'', clTeeColor);
  end;
  With BarSeries2 do
  begin
    Clear;
    for t:=1 to 10 do Add( 50+Random(10), '', clTeeColor);
  end;
  With BarSeries1 do
  begin
    Clear;
    for t:=1 to 10 do Add( 20+Random(10), '', clTeeColor);
  end;
  ChangeOverBars;
end;

procedure TOverBarForm.BarSeries2Click(Sender: TChartSeries; ValueIndex: Integer;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
   Showmessage('You clicked the Red Bar at point #: '+inttostr(Valueindex));
end;

procedure TOverBarForm.BarSeries1Click(Sender: TChartSeries; ValueIndex: Integer;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
   Showmessage('You clicked the Green Bar at point #: '+inttostr(Valueindex));
end;

procedure TOverBarForm.ChangeOverBars;
begin { compress / expand the overlayed space between bars }
  BarSeries3.BarWidthPercent:=SpinEdit1.Value;
  BarSeries1.BarWidthPercent:=SpinEdit1.Value-Round(SpinEdit1.Value*55.0/100.0);
  BarSeries2.BarWidthPercent:=SpinEdit1.Value-Round(SpinEdit1.Value*35.0/100.0);
end;

procedure TOverBarForm.SpinEdit1Change(Sender: TObject);
begin
  ChangeOverBars;
end;

procedure TOverBarForm.SpinEdit2Change(Sender: TObject);
begin { increase / decrease the 3 Series OffsetPercent property }
{ This will make partially overlay }
  BarSeries3.OffsetPercent:=SpinEdit2.Value;
  BarSeries1.OffsetPercent:=SpinEdit2.Value-Round(SpinEdit2.Value*55.0/100.0);
  BarSeries2.OffsetPercent:=SpinEdit2.Value-Round(SpinEdit2.Value*35.0/100.0);
end;

procedure TOverBarForm.CBPatternsClick(Sender: TObject);
begin
  if CBPatterns.Checked then
  begin
    BarSeries1.BarBrush.Style:=bsFDiagonal;
    BarSeries2.BarBrush.Style:=bsBDiagonal;
    BarSeries3.BarBrush.Style:=bsDiagCross;
    Chart1.BackColor:=clWhite;
  end
  else
  begin
    BarSeries1.BarBrush.Style:=bsSolid;
    BarSeries2.BarBrush.Style:=bsSolid;
    BarSeries3.BarBrush.Style:=bsSolid;
    Chart1.BackColor:=clTeeColor;
  end;
end;

procedure TOverBarForm.BarSeries3Click(Sender: TChartSeries;
  ValueIndex: Integer; Button: TMouseButton; Shift: TShiftState; X,
  Y: Integer);
begin
   Showmessage('You clicked the Blue Bar at point #: '+inttostr(Valueindex));
end;

end.
