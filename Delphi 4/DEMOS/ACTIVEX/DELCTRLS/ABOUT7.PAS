unit About7;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Buttons;

type
  TComboBoxXAbout = class(TForm)
    CtlImage: TSpeedButton;
    NameLbl: TLabel;
    OkBtn: TButton;
    CopyrightLbl: TLabel;
    DescLbl: TLabel;
  end;

procedure ShowComboBoxXAbout;

implementation

{$R *.DFM}

procedure ShowComboBoxXAbout;
begin
  with TComboBoxXAbout.Create(nil) do
    try
      ShowModal;
    finally
      Free;
    end;
end;

end.
