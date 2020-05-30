unit About37;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Buttons;

type
  TUpDownXAbout = class(TForm)
    CtlImage: TSpeedButton;
    NameLbl: TLabel;
    OkBtn: TButton;
    CopyrightLbl: TLabel;
    DescLbl: TLabel;
  end;

procedure ShowUpDownXAbout;

implementation

{$R *.DFM}

procedure ShowUpDownXAbout;
begin
  with TUpDownXAbout.Create(nil) do
    try
      ShowModal;
    finally
      Free;
    end;
end;

end.
