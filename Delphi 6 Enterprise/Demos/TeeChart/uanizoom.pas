{******************************************}
{    TeeChart. TChart Component            }
{ Copyright (c) 1995-2001 by David Berneda }
{    All Rights Reserved                   }
{******************************************}
unit uanizoom;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, Teengine, Series, ExtCtrls, Chart, StdCtrls, Spin,
  Buttons, TeeProcs;

type
  TFormAnimatedZoom = class(TForm)
    Chart1: TChart;
    Panel1: TPanel;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    LineSeries1: TLineSeries;
    LineSeries2: TLineSeries;
    LineSeries3: TLineSeries;
    LineSeries4: TLineSeries;
    LineSeries5: TLineSeries;
    PointSeries1: TPointSeries;
    Label1: TLabel;
    SpinEdit1: TSpinEdit;
    BitBtn2: TBitBtn;
    BitBtn1: TBitBtn;
    BitBtn3: TBitBtn;
    Memo1: TMemo;
    procedure FormCreate(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure SpinEdit1Change(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

procedure TFormAnimatedZoom.FormCreate(Sender: TObject);

  Procedure RandomValues(ASeries:TChartSeries);
  Var t,tmp:Longint;
  Begin
    With ASeries do
    Begin
      tmp:=0;
      Clear;
      for t:=1 to 50 do
      Begin
        tmp:=tmp+Random(10000)-5000;
        Add( tmp, '', clTeeColor );
      end;
    end;
  End;

begin
  SpinEdit1.Value:=Chart1.AnimatedZoomSteps;
  RandomValues(LineSeries1);
  RandomValues(LineSeries2);
  RandomValues(LineSeries3);
  RandomValues(LineSeries4);
  RandomValues(LineSeries5);
  RandomValues(PointSeries1);
  Chart1.AnimatedZoom:=False;
  Chart1.ZoomPercent(5);
  Chart1.AnimatedZoom:=True;
end;

procedure TFormAnimatedZoom.CheckBox1Click(Sender: TObject);
begin
  Chart1.AnimatedZoom:=CheckBox1.checked;
end;

procedure TFormAnimatedZoom.CheckBox2Click(Sender: TObject);
begin
  Chart1.View3D:=CheckBox2.Checked;
end;

procedure TFormAnimatedZoom.SpinEdit1Change(Sender: TObject);
begin
  Chart1.AnimatedZoomSteps:=SpinEdit1.Value;
end;

procedure TFormAnimatedZoom.BitBtn1Click(Sender: TObject);
begin
  BitBtn1.Enabled:=False;
  BitBtn2.Enabled:=False;
  Chart1.ZoomPercent(115);
  BitBtn1.Enabled:=True;
  BitBtn2.Enabled:=True;
end;

procedure TFormAnimatedZoom.BitBtn2Click(Sender: TObject);
begin
  BitBtn1.Enabled:=False;
  BitBtn2.Enabled:=False;
  Chart1.ZoomPercent(85);
  BitBtn1.Enabled:=True;
  BitBtn2.Enabled:=True;
end;

end.
