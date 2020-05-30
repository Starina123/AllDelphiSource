unit About6;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Buttons;

type
  TColorGridXAbout = class(TForm)
    CtlImage: TSpeedButton;
    NameLbl: TLabel;
    OkBtn: TButton;
    CopyrightLbl: TLabel;
    DescLbl: TLabel;
  end;

procedure ShowColorGridXAbout;

implementation

{$R *.DFM}

procedure ShowColorGridXAbout;
begin
  with TColorGridXAbout.Create(nil) do
    try
      ShowModal;
    finally
      Free;
    end;
end;

end.
