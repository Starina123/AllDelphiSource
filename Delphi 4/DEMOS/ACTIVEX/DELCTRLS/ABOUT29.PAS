unit About29;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Buttons;

type
  TSpinButtonXAbout = class(TForm)
    CtlImage: TSpeedButton;
    NameLbl: TLabel;
    OkBtn: TButton;
    CopyrightLbl: TLabel;
    DescLbl: TLabel;
  end;

procedure ShowSpinButtonXAbout;

implementation

{$R *.DFM}

procedure ShowSpinButtonXAbout;
begin
  with TSpinButtonXAbout.Create(nil) do
    try
      ShowModal;
    finally
      Free;
    end;
end;

end.
