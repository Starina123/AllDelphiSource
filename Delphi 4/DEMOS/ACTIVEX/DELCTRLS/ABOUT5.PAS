unit About5;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Buttons;

type
  TCheckListBoxXAbout = class(TForm)
    CtlImage: TSpeedButton;
    NameLbl: TLabel;
    OkBtn: TButton;
    CopyrightLbl: TLabel;
    DescLbl: TLabel;
  end;

procedure ShowCheckListBoxXAbout;

implementation

{$R *.DFM}

procedure ShowCheckListBoxXAbout;
begin
  with TCheckListBoxXAbout.Create(nil) do
    try
      ShowModal;
    finally
      Free;
    end;
end;

end.
