{************************************************}
{   TeeChart.   THorizBarSeries Data-Aware Demo  }
{   Copyright (c) 1995-2001 by David Berneda     }
{************************************************}
unit udbhoriz;

interface

{ This form shows Horizontal Bar Series attached to a Table }

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, DB, DBTables, Chart, Series, ExtCtrls, DbChart, StdCtrls,
  Teengine, Buttons, teeprocs;

type
  TDBHorizBarForm = class(TForm)
    Table1: TTable;
    DBChart1: TDBChart;
    Panel1: TPanel;
    CheckBox1: TCheckBox;
    RadioGroup1: TRadioGroup;
    Timer1: TTimer;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    HorizBarSeries1: THorizBarSeries;
    HorizBarSeries2: THorizBarSeries;
    CheckBox2: TCheckBox;
    Memo1: TMemo;
    procedure FormShow(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    DeltaZ:Integer;
    Procedure RecalcMarks;
  end;

implementation

{$R *.dfm}

procedure TDBHorizBarForm.FormShow(Sender: TObject);
begin
  DeltaZ:=-5;  { <-- this variable is used for animation only }

  { Here we set the Series order }
  With DBChart1.SeriesList do
  Begin
    Items[0]:=HorizBarSeries2;
    Items[1]:=HorizBarSeries1;
  End;
end;

Procedure TDBHorizBarForm.RecalcMarks;
Begin
  { Here the Series Marks and associated Axis are
    adjusted depending on MultiBar (Stacked or not )
  }
  if (HorizBarSeries1.MultiBar=mbStacked) or
     (HorizBarSeries1.MultiBar=mbStacked100) then
  Begin
    DBChart1.Series[0].Marks.Visible:=False;
    DBChart1.Series[1].Marks.Visible:=True;
    HorizBarSeries1.HorizAxis:=aTopAxis;
    HorizBarSeries2.HorizAxis:=aTopAxis;
  end
  else
  Begin
    DBChart1.Series[0].Marks.Visible:=True;
    DBChart1.Series[1].Marks.Visible:=True;
    HorizBarSeries1.HorizAxis:=aBottomAxis;
    HorizBarSeries2.HorizAxis:=aTopAxis;
  end
end;

procedure TDBHorizBarForm.RadioGroup1Click(Sender: TObject);
begin
  { Change the Series Stacked }
  HorizBarSeries1.MultiBar:=TMultiBar(RadioGroup1.ItemIndex);
  RecalcMarks;
end;

procedure TDBHorizBarForm.CheckBox1Click(Sender: TObject);
begin
  DBChart1.View3D:=CheckBox1.Checked;  { <-- 3 dimensions }
end;

procedure TDBHorizBarForm.CheckBox2Click(Sender: TObject);
begin
  Timer1.Enabled:=CheckBox2.Checked;  { <-- start / stop animation }
end;

procedure TDBHorizBarForm.Timer1Timer(Sender: TObject);
var tmp:Integer;
begin
  Timer1.Enabled:=False;
  { here is the animation code }
  tmp:=DBChart1.Chart3DPercent+DeltaZ;
  if tmp<3 then
  Begin
    DeltaZ:=5;
    tmp:=3;
  end;
  if tmp>90 then
  begin
    DeltaZ:=-5;
    tmp:=90;
  end;
  DBChart1.Chart3DPercent:=tmp;
  DBChart1.Legend.TopPos:=tmp;
  if Random(100)=1 then
     HorizBarSeries1.BarStyle:=TBarStyle(Random(Ord(High(TBarStyle))));
  if Random(100)=1 then
     HorizBarSeries2.BarStyle:=TBarStyle(Random(Ord(High(TBarStyle))));
  if Random(100)=1 then
     RadioGroup1.ItemIndex:=Random(RadioGroup1.Items.Count);
  Timer1.Enabled:=True;
end;

procedure TDBHorizBarForm.BitBtn3Click(Sender: TObject);
var tmp:TChartSeries;
begin
  { This code "swaps" the two series }
  With DBChart1.SeriesList do
  Begin
    tmp:=Items[0];
    Items[0]:=Items[1];
    Items[1]:=tmp;
  End;
  RecalcMarks;
  DBChart1.Repaint;
end;



end.
