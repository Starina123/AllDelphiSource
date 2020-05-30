unit About1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Buttons;

type
  TAnimateXAbout = class(TForm)
    CtlImage: TSpeedButton;
    NameLbl: TLabel;
    OkBtn: TButton;
    CopyrightLbl: TLabel;
    DescLbl: TLabel;
  end;

procedure ShowAnimateXAbout;

implementation

{$R *.DFM}

procedure ShowAnimateXAbout;
begin
  with TAnimateXAbout.Create(nil) do
    try
      ShowModal;
    finally
      Free;
    end;
end;

end.
