unit About4;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Buttons;

type
  TCheckBoxXAbout = class(TForm)
    CtlImage: TSpeedButton;
    NameLbl: TLabel;
    OkBtn: TButton;
    CopyrightLbl: TLabel;
    DescLbl: TLabel;
  end;

procedure ShowCheckBoxXAbout;

implementation

{$R *.DFM}

procedure ShowCheckBoxXAbout;
begin
  with TCheckBoxXAbout.Create(nil) do
    try
      ShowModal;
    finally
      Free;
    end;
end;

end.
