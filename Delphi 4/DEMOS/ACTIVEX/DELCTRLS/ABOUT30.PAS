unit About30;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Buttons;

type
  TSpinEditXAbout = class(TForm)
    CtlImage: TSpeedButton;
    NameLbl: TLabel;
    OkBtn: TButton;
    CopyrightLbl: TLabel;
    DescLbl: TLabel;
  end;

procedure ShowSpinEditXAbout;

implementation

{$R *.DFM}

procedure ShowSpinEditXAbout;
begin
  with TSpinEditXAbout.Create(nil) do
    try
      ShowModal;
    finally
      Free;
    end;
end;

end.
