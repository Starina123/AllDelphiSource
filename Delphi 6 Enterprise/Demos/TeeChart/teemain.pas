{*********************************************}
{ TeeChart Delphi Component Library 3.0       }
{ Demo                                        }
{ Copyright (c) 1995-2001 by David Berneda    }
{ All rights reserved                         }
{*********************************************}
unit teemain;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, ExtCtrls, TeEngine, Series, TeeProcs, Chart, StdCtrls,
  TeeFunci;

type
  TTeeMainForm = class(TForm)
    Panel1: TPanel;
    Button1: TButton;
    Image1: TImage;
    Timer1: TTimer;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button6: TButton;
    Chart2: TChart;
    FastLineSeries1: TFastLineSeries;
    FastLineSeries2: TFastLineSeries;
    Timer2: TTimer;
    Label11: TLabel;
    Label12: TLabel;
    Panel2: TPanel;
    Chart1: TChart;
    Series1: TPieSeries;
    Chart7: TChart;
    PieSeries6: TPieSeries;
    Chart8: TChart;
    PieSeries7: TPieSeries;
    Chart9: TChart;
    PieSeries8: TPieSeries;
    Chart10: TChart;
    PieSeries9: TPieSeries;
    Label13: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label2: TLabel;
    Panel3: TPanel;
    Label1: TLabel;
    Label9: TLabel;
    Label3: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Chart2MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Chart2MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Label10Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Label3Click(Sender: TObject);
  private
    { Private declarations }
    DeltaZoom:Integer;
  public
    { Public declarations }
    procedure ShowForm(FormClass: TFormClass);
  end;

var
  TeeMainForm: TTeeMainForm;

implementation

{$R *.dfm}

Uses TeeAbout, TeeBasic, Features, UDemoCha, Specs, ShellAPI;

procedure TTeeMainForm.ShowForm(FormClass: TFormClass);
begin
  Timer1.Enabled:=False;
  Timer2.Enabled:=False;
  With FormClass.Create(Self) do
  try
    ShowModal;
  finally
    Free;
  end;
  Timer2.Enabled:=True;
  Timer1.Enabled:=True;
end;

procedure TTeeMainForm.FormCreate(Sender: TObject);
begin
  TeeEraseBack:=False;
  PieSeries6.FillSampleValues(5);
  PieSeries9.FillSampleValues(5);
  PieSeries7.FillSampleValues(5);
  Series1.FillSampleValues(5);
  PieSeries8.CheckDataSource;
  FastLineSeries1.FillSampleValues(20);
  FastLineSeries2.FillSampleValues(20);
  DeltaZoom:=5;
end;

procedure TTeeMainForm.Timer1Timer(Sender: TObject);
var tmp:Integer;
begin
  PieSeries6.Rotate(5);
  PieSeries7.Rotate(5);
  PieSeries9.Rotate(5);
  Series1.Rotate(355);
  PieSeries8.Rotate(355);
  With Chart9.View3DOptions do
  begin
    Zoom:=Zoom-DeltaZoom;
    if (Zoom<60) or (Zoom>110) then DeltaZoom:=-DeltaZoom;
  end;
  With PieSeries8 do
  begin
    tmp:=Random(Count);
    if ExplodedSlice[tmp]>20 then
       ExplodedSlice[tmp]:=ExplodedSlice[tmp]-1
    else
       ExplodedSlice[tmp]:=ExplodedSlice[tmp]+1;
  end;
end;

procedure TTeeMainForm.Button1Click(Sender: TObject);
begin
  Close;
end;

procedure TTeeMainForm.Timer2Timer(Sender: TObject);
var tmpX:Double;
begin
  With FastLineSeries1 do
  begin
    tmpX:=XValues[1]-XValues[0];
    Delete(0);
    AddXY(XValues.Last+tmpX,Random(100),'',clTeeColor);
  end;
  With FastLineSeries2 do
  begin
    tmpX:=XValues[1]-XValues[0];
    Delete(0);
    AddXY(XValues.Last+tmpX,Random(100),'',clTeeColor);
  end;
end;

procedure TTeeMainForm.Button2Click(Sender: TObject);
begin
  ShowForm(TDemoForm);
end;

procedure TTeeMainForm.Chart2MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  Label10Click(Self);
end;

procedure TTeeMainForm.Chart2MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  Chart2.BevelOuter:=bvLowered;
end;

procedure TTeeMainForm.Label10Click(Sender: TObject);
begin
  ShowForm(TTeeAboutForm);
  Chart2.BevelOuter:=bvRaised;
end;

procedure TTeeMainForm.Button3Click(Sender: TObject);
begin
  ShowForm(TFeaturesForm);
end;

procedure TTeeMainForm.Button4Click(Sender: TObject);
begin
  ShowForm(TChartSpecs);
end;

procedure TTeeMainForm.Button6Click(Sender: TObject);
begin
  ShowForm(TSeriesForm);
end;

procedure TTeeMainForm.Label3Click(Sender: TObject);
Var St:Array[0..255] of char;
begin
  Timer1.Enabled:=False;
  Timer2.Enabled:=False;
  ShellExecute(0,'open',StrPCopy(St,'http://'+Label3.Caption+
                       '/products/teechart/delphi6'),nil,nil,SW_SHOW);
end;

end.
