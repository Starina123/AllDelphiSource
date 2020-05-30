unit About11;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Buttons;

type
  TEditXAbout = class(TForm)
    CtlImage: TSpeedButton;
    NameLbl: TLabel;
    OkBtn: TButton;
    CopyrightLbl: TLabel;
    DescLbl: TLabel;
  end;

procedure ShowEditXAbout;

implementation

{$R *.DFM}

procedure ShowEditXAbout;
begin
  with TEditXAbout.Create(nil) do
    try
      ShowModal;
    finally
      Free;
    end;
end;

end.
