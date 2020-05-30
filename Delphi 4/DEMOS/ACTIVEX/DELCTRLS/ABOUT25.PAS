unit About25;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Buttons;

type
  TRadioGroupXAbout = class(TForm)
    CtlImage: TSpeedButton;
    NameLbl: TLabel;
    OkBtn: TButton;
    CopyrightLbl: TLabel;
    DescLbl: TLabel;
  end;

procedure ShowRadioGroupXAbout;

implementation

{$R *.DFM}

procedure ShowRadioGroupXAbout;
begin
  with TRadioGroupXAbout.Create(nil) do
    try
      ShowModal;
    finally
      Free;
    end;
end;

end.
