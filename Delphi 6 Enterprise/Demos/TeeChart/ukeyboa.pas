{*********************************************}
{ TeeChart Delphi Component Library           }
{ Keyboard Scrolling Demo                     }
{ Copyright (c) 1996-2001 by David Berneda    }
{ All rights reserved                         }
{*********************************************}
unit ukeyboa;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, Teengine, Series, ExtCtrls, Chart, StdCtrls, Buttons,
  TeeProcs;

type
  TKeyboardForm = class(TForm)
    Chart1: TChart;
    LineSeries1: TLineSeries;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    InvertScroll: TCheckBox;
    CheckLimits: TCheckBox;
    Memo1: TMemo;
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CheckLimitsClick(Sender: TObject);
    procedure InvertScrollClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

procedure TKeyboardForm.FormCreate(Sender: TObject);
begin
  LineSeries1.FillSampleValues(500);
  AnimatedZoomFactor:=4;
end;

procedure TKeyboardForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
Var XDelta,YDelta,
    XRange,YRange:Double;
begin
  { initialize some temporary variables... }
  XDelta:=0;
  YDelta:=0;
  With LineSeries1.GetHorizAxis do XRange:=Maximum-Minimum;
  With LineSeries1.GetVertAxis  do YRange:=Maximum-Minimum;
  { handle keyboard !!! }
  if ssShift in Shift then
  begin
    Case key of
      VK_LEFT,VK_UP    : Chart1.ZoomPercent( 110 );
      VK_RIGHT,VK_DOWN : Chart1.ZoomPercent( 90 );
    end;
    exit;
  end
  else
  Case key of
    VK_LEFT  : XDelta:=-XRange/100;
    VK_RIGHT : XDelta:= XRange/100;
    VK_UP    : YDelta:= YRange/100;
    VK_DOWN  : YDelta:=-YRange/100;
    vk_Next  : YDelta:=-YRange/10;
    vk_Prior : YDelta:= YRange/10;
    VK_SPACE : Begin Chart1.UndoZoom; Exit; End;  { <-- reset scrolling }
  end;
  { just to make this example a little better... }
  if not InvertScroll.Checked then
  begin
    XDelta:=-XDelta;
    YDelta:=-YDelta;
  end;
  { apply scrolling !!! }
  With Chart1 do
  Begin
    LeftAxis.Scroll(YDelta,CheckLimits.Checked);
    RightAxis.Scroll(YDelta,CheckLimits.Checked);
    BottomAxis.Scroll(XDelta,CheckLimits.Checked);
    TopAxis.Scroll(XDelta,CheckLimits.Checked);
    SetFocus;
  End;
end;

procedure TKeyboardForm.CheckLimitsClick(Sender: TObject);
begin
  ShowMessage('Please zoom before scrolling.');
  Chart1.SetFocus;
end;

procedure TKeyboardForm.InvertScrollClick(Sender: TObject);
begin
  Chart1.SetFocus;
end;

end.
