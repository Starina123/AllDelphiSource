unit About13;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Buttons;

type
  THotKeyXAbout = class(TForm)
    CtlImage: TSpeedButton;
    NameLbl: TLabel;
    OkBtn: TButton;
    CopyrightLbl: TLabel;
    DescLbl: TLabel;
  end;

procedure ShowHotKeyXAbout;

implementation

{$R *.DFM}

procedure ShowHotKeyXAbout;
begin
  with THotKeyXAbout.Create(nil) do
    try
      ShowModal;
    finally
      Free;
    end;
end;

end.
