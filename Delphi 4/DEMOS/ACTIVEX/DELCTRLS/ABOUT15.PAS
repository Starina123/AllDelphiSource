unit About15;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Buttons;

type
  TMaskEditXAbout = class(TForm)
    CtlImage: TSpeedButton;
    NameLbl: TLabel;
    OkBtn: TButton;
    CopyrightLbl: TLabel;
    DescLbl: TLabel;
  end;

procedure ShowMaskEditXAbout;

implementation

{$R *.DFM}

procedure ShowMaskEditXAbout;
begin
  with TMaskEditXAbout.Create(nil) do
    try
      ShowModal;
    finally
      Free;
    end;
end;

end.
