unit About24;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Buttons;

type
  TRadioButtonXAbout = class(TForm)
    CtlImage: TSpeedButton;
    NameLbl: TLabel;
    OkBtn: TButton;
    CopyrightLbl: TLabel;
    DescLbl: TLabel;
  end;

procedure ShowRadioButtonXAbout;

implementation

{$R *.DFM}

procedure ShowRadioButtonXAbout;
begin
  with TRadioButtonXAbout.Create(nil) do
    try
      ShowModal;
    finally
      Free;
    end;
end;

end.
