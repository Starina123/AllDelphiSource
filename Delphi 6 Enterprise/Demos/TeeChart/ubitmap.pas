{******************************************}
{    TeeChart. TChart Component            }
{ Copyright (c) 1995-2001 by David Berneda }
{    All Rights Reserved                   }
{******************************************}
unit ubitmap;

interface

{ This example shows how to draw a custom Bitmap on a Panel Chart component }

{ Bitmap images (TBitmap component) can be painted in several styles:

  pbmStretch : Bitmap is stretched to fit Chart Panel Rectangle
  pbmTile    : Bitmap is repeteadly painted without stretching.
  pbmCenter  : Bitmap is painted centered without stretching.

  You use the PanelBitmapMode property:

  Chart1.PanelBitmapMode := pbmTile ;
}

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, ExtCtrls, Chart, Series, StdCtrls, Teengine, Buttons,
  TeeProcs;

type
  TBitmapForm = class(TForm)
    Chart1: TChart;
    OpenDialog1: TOpenDialog;
    Panel1: TPanel;
    RadioGroup1: TRadioGroup;
    BitBtn1: TBitBtn;
    BitBtn3: TBitBtn;
    CheckBox1: TCheckBox;
    Series1: TBarSeries;
    Button1: TButton;
    Memo1: TMemo;
    procedure FormCreate(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

procedure TBitmapForm.FormCreate(Sender: TObject);
begin
 { This is to show something random in this example }
  Series1.FillSampleValues(10);
end;

procedure TBitmapForm.RadioGroup1Click(Sender: TObject);
begin
  Chart1.BackImageMode:=TTeeBackImageMode(RadioGroup1.ItemIndex);
end;

procedure TBitmapForm.BitBtn1Click(Sender: TObject);
begin
  if OpenDialog1.Execute then
  begin
    RadioGroup1.Enabled:=False;
    Chart1.BackImage.LoadFromFile(OpenDialog1.FileName);
    RadioGroup1.Enabled:=True;
  end;
end;

procedure TBitmapForm.CheckBox1Click(Sender: TObject);
begin
  Chart1.BackImageInside:=CheckBox1.Checked;
end;

procedure TBitmapForm.Button1Click(Sender: TObject);
begin
  Chart1.BackImage:=nil;
end;


end.
