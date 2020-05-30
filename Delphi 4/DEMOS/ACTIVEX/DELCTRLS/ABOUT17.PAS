unit About17;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Buttons;

type
  TMemoXAbout = class(TForm)
    CtlImage: TSpeedButton;
    NameLbl: TLabel;
    OkBtn: TButton;
    CopyrightLbl: TLabel;
    DescLbl: TLabel;
  end;

procedure ShowMemoXAbout;

implementation

{$R *.DFM}

procedure ShowMemoXAbout;
begin
  with TMemoXAbout.Create(nil) do
    try
      ShowModal;
    finally
      Free;
    end;
end;

end.
