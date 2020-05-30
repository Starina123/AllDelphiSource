unit About35;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Buttons;

type
  TTabSetXAbout = class(TForm)
    CtlImage: TSpeedButton;
    NameLbl: TLabel;
    OkBtn: TButton;
    CopyrightLbl: TLabel;
    DescLbl: TLabel;
  end;

procedure ShowTabSetXAbout;

implementation

{$R *.DFM}

procedure ShowTabSetXAbout;
begin
  with TTabSetXAbout.Create(nil) do
    try
      ShowModal;
    finally
      Free;
    end;
end;

end.
