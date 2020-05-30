unit About9;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Buttons;

type
  TDateTimePickerXAbout = class(TForm)
    CtlImage: TSpeedButton;
    NameLbl: TLabel;
    OkBtn: TButton;
    CopyrightLbl: TLabel;
    DescLbl: TLabel;
  end;

procedure ShowDateTimePickerXAbout;

implementation

{$R *.DFM}

procedure ShowDateTimePickerXAbout;
begin
  with TDateTimePickerXAbout.Create(nil) do
    try
      ShowModal;
    finally
      Free;
    end;
end;

end.
