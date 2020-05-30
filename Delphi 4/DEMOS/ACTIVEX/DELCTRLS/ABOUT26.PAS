unit About26;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Buttons;

type
  TRichEditXAbout = class(TForm)
    CtlImage: TSpeedButton;
    NameLbl: TLabel;
    OkBtn: TButton;
    CopyrightLbl: TLabel;
    DescLbl: TLabel;
  end;

procedure ShowRichEditXAbout;

implementation

{$R *.DFM}

procedure ShowRichEditXAbout;
begin
  with TRichEditXAbout.Create(nil) do
    try
      ShowModal;
    finally
      Free;
    end;
end;

end.
