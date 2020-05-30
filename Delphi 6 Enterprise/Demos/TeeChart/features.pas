{*********************************************}
{ TeeChart Delphi Component Library           }
{ Main Form Demo                              }
{ Copyright (c) 1996-2001 by David Berneda    }
{ All rights reserved                         }
{*********************************************}
unit features;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, Buttons, StdCtrls, ExtCtrls;

type
  TFeaturesForm = class(TForm)
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn9: TBitBtn;
    BitBtn11: TBitBtn;
    BitBtn10: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn8: TBitBtn;
    BitBtn12: TBitBtn;
    BitBtn13: TBitBtn;
    BitBtn14: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn15: TBitBtn;
    BitBtn16: TBitBtn;
    BitBtn17: TBitBtn;
    BitBtn18: TBitBtn;
    BitBtn19: TBitBtn;
    BitBtn20: TBitBtn;
    BitBtn21: TBitBtn;
    Panel2: TPanel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    BitBtn22: TBitBtn;
    Label14: TLabel;
    Panel1: TPanel;
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
    procedure BitBtn13Click(Sender: TObject);
    procedure BitBtn14Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn15Click(Sender: TObject);
    procedure BitBtn16Click(Sender: TObject);
    procedure BitBtn17Click(Sender: TObject);
    procedure BitBtn18Click(Sender: TObject);
    procedure BitBtn19Click(Sender: TObject);
    procedure BitBtn20Click(Sender: TObject);
    procedure BitBtn21Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Procedure ShowForm(AFormClass:TFormClass);
  end;

implementation

{$R *.dfm}
Uses UAxisLab,UBitmap,UDraw,ULegend,UMain,UOverBar,MulAxis,
     UPages,UPrint,UScroll,UShapes,UYLegend,LastValu,UColor,
     UMetafil,UAniZoom,UScrollB,UCrossH,UKeyboa,LogLab;

Procedure TFeaturesForm.ShowForm(AFormClass:TFormClass);
Begin
  With AFormClass.Create(Self) do
  try
    ShowModal;
  finally
    Free;
  end;
End;

procedure TFeaturesForm.BitBtn3Click(Sender: TObject);
begin
  ShowForm(TMiniForm);
end;

procedure TFeaturesForm.BitBtn5Click(Sender: TObject);
begin
  ShowForm(TLegendForm);
end;

procedure TFeaturesForm.BitBtn6Click(Sender: TObject);
begin
  ShowForm(TBitmapForm);
end;

procedure TFeaturesForm.BitBtn7Click(Sender: TObject);
begin
  ShowForm(TDrawForm);
end;

procedure TFeaturesForm.BitBtn2Click(Sender: TObject);
begin
  ShowForm(TScrollForm);
end;

procedure TFeaturesForm.BitBtn8Click(Sender: TObject);
begin
  ShowForm(TShapesForm);
end;

procedure TFeaturesForm.BitBtn9Click(Sender: TObject);
begin
  ShowForm(TOverBarForm);
end;

procedure TFeaturesForm.BitBtn10Click(Sender: TObject);
begin
  ShowForm(TPrintForm);
end;

procedure TFeaturesForm.BitBtn11Click(Sender: TObject);
begin
  ShowForm(TPagesForm);
end;

procedure TFeaturesForm.FormCreate(Sender: TObject);
begin
  if Screen.Width<800 then
     ShowMessage('Warning: '+#13+#10+
                 'This Demo is best viewed with a Screen'+#13+#10+
                 'resolution of 800x600 or greater,'+#13+#10+
                 'and a Color Depth of 256 or greater.'+#13+#10+
                 '16K Colors is also better than 256 Colors.');
end;

procedure TFeaturesForm.BitBtn12Click(Sender: TObject);
begin
  ShowForm(TAxisLabelsForm);
end;

procedure TFeaturesForm.BitBtn13Click(Sender: TObject);
begin
  ShowForm(TLegendXYForm);
end;

procedure TFeaturesForm.BitBtn14Click(Sender: TObject);
begin
  ShowForm(TDigitalForm);
end;

procedure TFeaturesForm.BitBtn4Click(Sender: TObject);
begin
  ShowForm(TFormAnimatedZoom);
end;

procedure TFeaturesForm.BitBtn15Click(Sender: TObject);
begin
  ShowForm(TMetafileForm);
end;

procedure TFeaturesForm.BitBtn16Click(Sender: TObject);
begin
  ShowForm(TCustomAxisForm);
end;

procedure TFeaturesForm.BitBtn17Click(Sender: TObject);
begin
  ShowForm(TColoredForm);
end;

procedure TFeaturesForm.BitBtn18Click(Sender: TObject);
begin
  ShowForm(TScrollBarForm);
end;

procedure TFeaturesForm.BitBtn19Click(Sender: TObject);
begin
  ShowForm(TCrossHairForm);
end;

procedure TFeaturesForm.BitBtn20Click(Sender: TObject);
begin
  ShowForm(TKeyboardForm);
end;

procedure TFeaturesForm.BitBtn21Click(Sender: TObject);
begin
  ShowForm(TLogLabelsForm);
end;

end.
