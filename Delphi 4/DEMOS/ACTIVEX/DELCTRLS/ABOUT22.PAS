unit About22;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Buttons;

type
  TPanelXAbout = class(TForm)
    CtlImage: TSpeedButton;
    NameLbl: TLabel;
    OkBtn: TButton;
    CopyrightLbl: TLabel;
    DescLbl: TLabel;
  end;

procedure ShowPanelXAbout;

implementation

{$R *.DFM}

procedure ShowPanelXAbout;
begin
  with TPanelXAbout.Create(nil) do
    try
      ShowModal;
    finally
      Free;
    end;
end;

end.
