unit About8;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Buttons;

type
  TControlBarXAbout = class(TForm)
    CtlImage: TSpeedButton;
    NameLbl: TLabel;
    OkBtn: TButton;
    CopyrightLbl: TLabel;
    DescLbl: TLabel;
  end;

procedure ShowControlBarXAbout;

implementation

{$R *.DFM}

procedure ShowControlBarXAbout;
begin
  with TControlBarXAbout.Create(nil) do
    try
      ShowModal;
    finally
      Free;
    end;
end;

end.
