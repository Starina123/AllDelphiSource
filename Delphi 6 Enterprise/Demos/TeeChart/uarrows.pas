{*********************************************}
{ TeeChart Delphi Component Library           }
{ TArrowSeries Example                        }
{ Copyright (c) 1995-2001 by David Berneda    }
{ All rights reserved                         }
{*********************************************}
unit uarrows;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, Teengine, Series, ArrowCha, Chart, StdCtrls, ExtCtrls,
  Buttons, TeeProcs;

type
  TArrowsForm = class(TForm)
    Panel1: TPanel;
    CheckBox1: TCheckBox;
    Chart1: TChart;
    ArrowSeries1: TArrowSeries;
    Timer1: TTimer;
    BitBtn3: TBitBtn;
    Memo1: TMemo;
    procedure FormCreate(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure AddRandomArrows;
  end;

implementation

{$R *.dfm}

procedure TArrowsForm.FormCreate(Sender: TObject);
begin
  With ArrowSeries1 do
  Begin
    ArrowWidth:=32;
    ArrowHeight:=24;
    ColorEachPoint:=True;
    XValues.DateTime:=False;
    YValues.DateTime:=False;

    AddRandomArrows;
  end;
end;

procedure TArrowsForm.AddRandomArrows;
var x0,y0,x1,y1:Double;
    t:Longint;
begin
  With ArrowSeries1 do
  Begin
    Clear;
    for t:=1 to 40 do
    begin
      x0:=Random( 1000 );
      y0:=Random( 1000 );

      x1:=Random( 300 ) - 150.0;
      if x1<50 then x1:=50;
      x1:=x1+x0;

      y1:=Random( 300 ) - 150.0;
      if y1<50 then y1:=50;
      y1:=y1+y0;

      AddArrow( x0,y0,x1,y1, '', clTeeColor );
    end;
  end;
end;

procedure TArrowsForm.CheckBox1Click(Sender: TObject);
begin
  Timer1.Enabled:=CheckBox1.Checked;
end;

procedure TArrowsForm.Timer1Timer(Sender: TObject);
var t:Longint;
begin
  Timer1.Enabled:=False;
  With ArrowSeries1 do
  Begin
    for t:=0 to Count-1 do
    Begin
      StartXValues[t]:=StartXValues[t]+Random(100)-50.0;
      StartYValues[t]:=StartYValues[t]+Random(100)-50.0;
      EndXValues[t]  :=EndXValues[t]+Random(100)-50.0;
      EndYValues[t]  :=EndYValues[t]+Random(100)-50.0;
    End;
    Repaint;
  End;
  Timer1.Enabled:=True;
end;

end.
