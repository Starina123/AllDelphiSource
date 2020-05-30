unit About27;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Buttons;

type
  TScrollBarXAbout = class(TForm)
    CtlImage: TSpeedButton;
    NameLbl: TLabel;
    OkBtn: TButton;
    CopyrightLbl: TLabel;
    DescLbl: TLabel;
  end;

procedure ShowScrollBarXAbout;

implementation

{$R *.DFM}

procedure ShowScrollBarXAbout;
begin
  with TScrollBarXAbout.Create(nil) do
    try
      ShowModal;
    finally
      Free;
    end;
end;

end.
