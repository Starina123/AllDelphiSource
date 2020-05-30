unit About3;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Buttons;

type
  TCalendarXAbout = class(TForm)
    CtlImage: TSpeedButton;
    NameLbl: TLabel;
    OkBtn: TButton;
    CopyrightLbl: TLabel;
    DescLbl: TLabel;
  end;

procedure ShowCalendarXAbout;

implementation

{$R *.DFM}

procedure ShowCalendarXAbout;
begin
  with TCalendarXAbout.Create(nil) do
    try
      ShowModal;
    finally
      Free;
    end;
end;

end.
