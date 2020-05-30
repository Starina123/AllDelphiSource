unit About14;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Buttons;

type
  TListBoxXAbout = class(TForm)
    CtlImage: TSpeedButton;
    NameLbl: TLabel;
    OkBtn: TButton;
    CopyrightLbl: TLabel;
    DescLbl: TLabel;
  end;

procedure ShowListBoxXAbout;

implementation

{$R *.DFM}

procedure ShowListBoxXAbout;
begin
  with TListBoxXAbout.Create(nil) do
    try
      ShowModal;
    finally
      Free;
    end;
end;

end.
