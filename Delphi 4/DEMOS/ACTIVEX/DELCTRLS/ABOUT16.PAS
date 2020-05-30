unit About16;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Buttons;

type
  TMediaPlayerXAbout = class(TForm)
    CtlImage: TSpeedButton;
    NameLbl: TLabel;
    OkBtn: TButton;
    CopyrightLbl: TLabel;
    DescLbl: TLabel;
  end;

procedure ShowMediaPlayerXAbout;

implementation

{$R *.DFM}

procedure ShowMediaPlayerXAbout;
begin
  with TMediaPlayerXAbout.Create(nil) do
    try
      ShowModal;
    finally
      Free;
    end;
end;

end.
