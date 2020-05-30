unit About36;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Buttons;

type
  TTrackBarXAbout = class(TForm)
    CtlImage: TSpeedButton;
    NameLbl: TLabel;
    OkBtn: TButton;
    CopyrightLbl: TLabel;
    DescLbl: TLabel;
  end;

procedure ShowTrackBarXAbout;

implementation

{$R *.DFM}

procedure ShowTrackBarXAbout;
begin
  with TTrackBarXAbout.Create(nil) do
    try
      ShowModal;
    finally
      Free;
    end;
end;

end.
