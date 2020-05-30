unit About19;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Buttons;

type
  TNotebookXAbout = class(TForm)
    CtlImage: TSpeedButton;
    NameLbl: TLabel;
    OkBtn: TButton;
    CopyrightLbl: TLabel;
    DescLbl: TLabel;
  end;

procedure ShowNotebookXAbout;

implementation

{$R *.DFM}

procedure ShowNotebookXAbout;
begin
  with TNotebookXAbout.Create(nil) do
    try
      ShowModal;
    finally
      Free;
    end;
end;

end.
