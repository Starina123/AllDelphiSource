unit About12;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Buttons;

type
  TGroupBoxXAbout = class(TForm)
    CtlImage: TSpeedButton;
    NameLbl: TLabel;
    OkBtn: TButton;
    CopyrightLbl: TLabel;
    DescLbl: TLabel;
  end;

procedure ShowGroupBoxXAbout;

implementation

{$R *.DFM}

procedure ShowGroupBoxXAbout;
begin
  with TGroupBoxXAbout.Create(nil) do
    try
      ShowModal;
    finally
      Free;
    end;
end;

end.
