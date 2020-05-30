unit About10;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Buttons;

type
  TDrawGridXAbout = class(TForm)
    CtlImage: TSpeedButton;
    NameLbl: TLabel;
    OkBtn: TButton;
    CopyrightLbl: TLabel;
    DescLbl: TLabel;
  end;

procedure ShowDrawGridXAbout;

implementation

{$R *.DFM}

procedure ShowDrawGridXAbout;
begin
  with TDrawGridXAbout.Create(nil) do
    try
      ShowModal;
    finally
      Free;
    end;
end;

end.
