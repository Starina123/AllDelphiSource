unit AboutFrm;

interface

uses
  SysUtils, Types, Classes, QGraphics, QControls, QForms, QDialogs,
  QStdCtrls;

type
  TAboutForm = class(TForm)
    Button1: TButton;
    Label1: TLabel;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

procedure ShowAboutBox;

implementation

{$R *.xfm}

procedure ShowAboutBox;
begin
  with TAboutForm.Create(Application) do
  begin
    ShowModal;
    Free;
  end;
end;

procedure TAboutForm.Button1Click(Sender: TObject);
begin
  Close;
end;

end.

