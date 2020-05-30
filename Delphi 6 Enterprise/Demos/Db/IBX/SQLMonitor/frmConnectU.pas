unit frmConnectU;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons;

type
  TfrmConnect = class(TForm)
    btnOK: TBitBtn;
    btnCancel: TBitBtn;
    edtDatabase: TEdit;
    edtUser: TEdit;
    edtPassword: TEdit;
    edtRole: TEdit;
    btnBrowse: TButton;
    dlgOpen: TOpenDialog;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    procedure edtDatabaseChange(Sender: TObject);
    procedure btnBrowseClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConnect: TfrmConnect;

implementation

{$R *.dfm}

procedure TfrmConnect.edtDatabaseChange(Sender: TObject);
begin
  if (edtDatabase.Text <> '') and (edtUser.Text <> '')
     and (edtPassword.Text <> '') then
    btnOk.Enabled := true
  else
    btnOK.Enabled := false;
end;

procedure TfrmConnect.btnBrowseClick(Sender: TObject);
begin
  if dlgOpen.Execute then
    edtDatabase.Text := dlgOpen.FileName;
end;

end.
