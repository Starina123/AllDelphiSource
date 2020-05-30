unit About31;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Buttons;

type
  TStaticTextXAbout = class(TForm)
    CtlImage: TSpeedButton;
    NameLbl: TLabel;
    OkBtn: TButton;
    CopyrightLbl: TLabel;
    DescLbl: TLabel;
  end;

procedure ShowStaticTextXAbout;

implementation

{$R *.DFM}

procedure ShowStaticTextXAbout;
begin
  with TStaticTextXAbout.Create(nil) do
    try
      ShowModal;
    finally
      Free;
    end;
end;

end.
