{*********************************************}
{ TeeChart Delphi Component Library           }
{ Chart Specs Form Demo                       }
{ Copyright (c) 1995-2001 David Berneda       }
{ All rights reserved                         }
{*********************************************}
unit specs;

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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}
Uses TeeAbout;

end.
