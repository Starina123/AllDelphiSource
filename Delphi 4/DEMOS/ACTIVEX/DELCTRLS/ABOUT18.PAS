unit About18;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Buttons;

type
  TMonthCalendarXAbout = class(TForm)
    CtlImage: TSpeedButton;
    NameLbl: TLabel;
    OkBtn: TButton;
    CopyrightLbl: TLabel;
    DescLbl: TLabel;
  end;

procedure ShowMonthCalendarXAbout;

implementation

{$R *.DFM}

procedure ShowMonthCalendarXAbout;
begin
  with TMonthCalendarXAbout.Create(nil) do
    try
      ShowModal;
    finally
      Free;
    end;
end;

end.
