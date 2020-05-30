{*********************************************}
{ TeeChart Delphi Component Library           }
{ Chart Specs Form Demo                       }
{ Copyright (c) 1995-1996 David Berneda       }
{ All rights reserved                         }
{*********************************************}
unit Specs;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TChartSpecs = class(TForm)
    Memo1: TMemo;
    Panel2: TPanel;
    Label1: TLabel;
    Image2: TImage;
    BitBtn1: TBitBtn;
    Panel1: TPanel;
    Memo2: TMemo;
    BitBtn2: TBitBtn;
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.DFM}
Uses TeeAbout;

procedure TChartSpecs.BitBtn2Click(Sender: TObject);
begin
  With TTeeAboutForm.Create(Self) do
  try
    ShowModal;
  finally
    Free;
  end;
end;

end.
