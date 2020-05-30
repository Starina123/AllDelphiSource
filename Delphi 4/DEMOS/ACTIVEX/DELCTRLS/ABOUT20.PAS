unit About20;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Buttons;

type
  TOutlineXAbout = class(TForm)
    CtlImage: TSpeedButton;
    NameLbl: TLabel;
    OkBtn: TButton;
    CopyrightLbl: TLabel;
    DescLbl: TLabel;
  end;

procedure ShowOutlineXAbout;

implementation

{$R *.DFM}

procedure ShowOutlineXAbout;
begin
  with TOutlineXAbout.Create(nil) do
    try
      ShowModal;
    finally
      Free;
    end;
end;

end.
