unit About32;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Buttons;

type
  TStringGridXAbout = class(TForm)
    CtlImage: TSpeedButton;
    NameLbl: TLabel;
    OkBtn: TButton;
    CopyrightLbl: TLabel;
    DescLbl: TLabel;
  end;

procedure ShowStringGridXAbout;

implementation

{$R *.DFM}

procedure ShowStringGridXAbout;
begin
  with TStringGridXAbout.Create(nil) do
    try
      ShowModal;
    finally
      Free;
    end;
end;

end.
