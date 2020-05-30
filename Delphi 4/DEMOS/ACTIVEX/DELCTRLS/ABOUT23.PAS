unit About23;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Buttons;

type
  TProgressBarXAbout = class(TForm)
    CtlImage: TSpeedButton;
    NameLbl: TLabel;
    OkBtn: TButton;
    CopyrightLbl: TLabel;
    DescLbl: TLabel;
  end;

procedure ShowProgressBarXAbout;

implementation

{$R *.DFM}

procedure ShowProgressBarXAbout;
begin
  with TProgressBarXAbout.Create(nil) do
    try
      ShowModal;
    finally
      Free;
    end;
end;

end.
