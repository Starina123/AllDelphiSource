unit About34;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Buttons;

type
  TTabControlXAbout = class(TForm)
    CtlImage: TSpeedButton;
    NameLbl: TLabel;
    OkBtn: TButton;
    CopyrightLbl: TLabel;
    DescLbl: TLabel;
  end;

procedure ShowTabControlXAbout;

implementation

{$R *.DFM}

procedure ShowTabControlXAbout;
begin
  with TTabControlXAbout.Create(nil) do
    try
      ShowModal;
    finally
      Free;
    end;
end;

end.
