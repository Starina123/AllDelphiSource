unit SaveQAs;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls;

type
  TSaveQueryAs = class(TForm)
    NameEdit: TEdit;
    Label1: TLabel;
    Bevel1: TBevel;
    OKBtn: TButton;
    CancelBtn: TButton;
    procedure NameEditChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function GetNewName(var QueryName: string): Boolean;

implementation

{$R *.dfm}

function GetNewName(var QueryName: string): Boolean;
begin
  with TSaveQueryAs.Create(Application) do
  begin
    NameEdit.Text := QueryName;
    Result := ShowModal = mrOK;
    if Result then QueryName := NameEdit.Text;
  end;
end;

procedure TSaveQueryAs.NameEditChange(Sender: TObject);
begin
  OkBtn.Enabled := NameEdit.Text <> '';
end;

end.
