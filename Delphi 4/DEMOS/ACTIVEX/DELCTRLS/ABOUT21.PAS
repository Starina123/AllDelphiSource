unit About21;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Buttons;

type
  TPageScrollerXAbout = class(TForm)
    CtlImage: TSpeedButton;
    NameLbl: TLabel;
    OkBtn: TButton;
    CopyrightLbl: TLabel;
    DescLbl: TLabel;
  end;

procedure ShowPageScrollerXAbout;

implementation

{$R *.DFM}

procedure ShowPageScrollerXAbout;
begin
  with TPageScrollerXAbout.Create(nil) do
    try
      ShowModal;
    finally
      Free;
    end;
end;

end.
