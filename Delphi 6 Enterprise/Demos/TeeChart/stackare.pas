{*********************************************}
{ TeeChart Delphi Component Library           }
{ Areas Demo                                  }
{ Copyright (c) 1995-2001 by David Berneda    }
{ All rights reserved                         }
{*********************************************}
unit stackare;

interface

{ This form shows 3 TAreaSeries components on same Chart.
  Areas can be Stacked or Stacked 100%
}
uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, Teengine, Series, Buttons, Chart, ExtCtrls,
  TeeProcs
  ;

type
  TAreasForm = class(TForm)
    Panel1: TPanel;
    RadioGroup1: TRadioGroup;
    Chart1: TChart;
    BitBtn1: TBitBtn;
    AreaSeries1: TAreaSeries;
    AreaSeries2: TAreaSeries;
    AreaSeries3: TAreaSeries;
    CheckBox1: TCheckBox;
    Label1: TLabel;
    CheckBox2: TCheckBox;
    Timer1: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure Chart1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure CheckBox2Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    tmpDelta,tmpCounter,tmpIndex:Longint;
    tmpSeries:TAreaSeries;
  end;

implementation

{$R *.dfm}

{ Some random values.... }
procedure TAreasForm.FormCreate(Sender: TObject);

  Procedure CreateRandom(Area:TAreaSeries);
  var t:Longint;
      Old:Double;
  begin
    With Area do
    begin
      XValues.DateTime:=False;
      Clear;
      Old:=500+Random(1000);
      for t:=1 to 30 do
      begin
        Old:=Old+Random(50)-25;
        Add( Old,'',clTeeColor);
      end;
      Cursor:=crTeeHand;
    end;
  end;

begin
  tmpCounter:=-1;
  tmpSeries:=nil;
  CreateRandom(AreaSeries1);
  CreateRandom(AreaSeries2);
  CreateRandom(AreaSeries3);
end;

procedure TAreasForm.RadioGroup1Click(Sender: TObject);
begin
  { Change how areas are displayed. (Stacked, Stacked 100%) }
  AreaSeries1.MultiArea:=TMultiArea(RadioGroup1.ItemIndex);
end;

procedure TAreasForm.CheckBox1Click(Sender: TObject);
begin
  Chart1.View3D:=CheckBox1.Checked;  { <-- turn on/off 3d }
end;

procedure TAreasForm.Chart1MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);

  Procedure HitSeries(ASeries:TChartSeries);
  Var tmp:Longint;
  begin
    tmp:=ASeries.Clicked(x,y);
    if tmp<>-1 then
    begin
      Label1.Caption:=ASeries.Name;
      Label1.Font.Color:=ASeries.SeriesColor;
    end;
  end;

var t:Longint;
begin
  Label1.Caption:='';
  for t:=0 to Chart1.SeriesCount-1 do HitSeries(Chart1.Series[t]);
  Label1.Visible:=Label1.Caption<>'';
end;

procedure TAreasForm.CheckBox2Click(Sender: TObject);
begin
  Timer1.Enabled:=CheckBox2.Checked;
  if Timer1.Enabled then RadioGroup1.ItemIndex:=1;
end;

procedure TAreasForm.Timer1Timer(Sender: TObject);
var tmp:Double;
begin
  if (tmpCounter=-1) or (tmpCounter=5) then
  begin
    Case Random(3) of
      0: tmpSeries:=AreaSeries1;
      1: tmpSeries:=AreaSeries2;
      2: tmpSeries:=AreaSeries3;
    end;
    tmpIndex:=Random(tmpSeries.Count);
    tmpCounter:=0;
    With tmpSeries.GetVertAxis do tmpDelta:=Round(Abs(Maximum-Minimum)/50.0);
    if Random(2)=1 then tmpDelta:=-tmpDelta;
  end;
  inc(tmpCounter);
  tmp:=tmpSeries.YValue[tmpIndex];
  if (tmp+tmpDelta)>0 then tmpSeries.YValue[tmpIndex]:=tmp+tmpDelta;
end;

end.
