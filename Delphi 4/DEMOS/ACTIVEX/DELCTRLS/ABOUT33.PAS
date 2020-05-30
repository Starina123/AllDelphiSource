unit About33;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Buttons;

type
  TTabbedNotebookXAbout = class(TForm)
    CtlImage: TSpeedButton;
    NameLbl: TLabel;
    OkBtn: TButton;
    CopyrightLbl: TLabel;
    DescLbl: TLabel;
  end;

procedure ShowTabbedNotebookXAbout;

implementation

{$R *.DFM}

procedure ShowTabbedNotebookXAbout;
begin
  with TTabbedNotebookXAbout.Create(nil) do
    try
      ShowModal;
    finally
      Free;
    end;
end;

end.
