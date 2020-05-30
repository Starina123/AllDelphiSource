unit About;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ExtCtrls;

type
  TAboutDialog = class(TForm)
    Panel1: TPanel;
    ProgramIcon: TImage;
    ProductName: TLabel;
    Version: TLabel;
    OKButton: TButton;
    AboutMemo: TMemo;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AboutDialog: TAboutDialog;

procedure ShowAboutDialog;

implementation

{$R *.dfm}

procedure ShowAboutDialog;
begin
  with TAboutDialog.Create(Application) do
  try
    AboutMemo.Lines.LoadFromFile(ExtractFilePath(ParamStr(0))+'ABOUT.TXT');
    ShowModal;
  finally
    Free;
  end;
end;

end.
 
