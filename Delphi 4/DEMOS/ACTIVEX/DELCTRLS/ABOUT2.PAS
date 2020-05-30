unit About2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Buttons;

type
  TButtonXAbout = class(TForm)
    CtlImage: TSpeedButton;
    NameLbl: TLabel;
    OkBtn: TButton;
    CopyrightLbl: TLabel;
    DescLbl: TLabel;
  end;

procedure ShowButtonXAbout;

implementation

{$R *.DFM}

procedure ShowButtonXAbout;
begin
  with TButtonXAbout.Create(nil) do
    try
      ShowModal;
    finally
      Free;
    end;
end;

end.
