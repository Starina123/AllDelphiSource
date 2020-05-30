unit frmAddCertificate;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls, 
  Buttons, dialogs;

type
  TAddDlg = class(TForm)
    Label1: TLabel;
    edID: TEdit;
    OKBtn: TButton;
    CancelBtn: TButton;
    Label2: TLabel;
    Label3: TLabel;
    edKey: TEdit;
    procedure OKBtnClick(Sender: TObject);
    procedure CancelBtnClick(Sender: TObject);
  private
    { Private declarations }
    procedure clearedits;
  public
    { Public declarations }
  end;

var
  AddDlg: TAddDlg;

implementation

uses umain;

{$R *.dfm}

procedure TAddDlg.OKBtnClick(Sender: TObject);
begin
  with Form1.IBLicensingService1 do
  begin
    ID := trim(edID.text);
    Key := trim(edKey.text);
    try
      AddLicense;
      ClearEdits;
      self.ModalResult := mrOK;
    except
      ShowMessage('The certificate could not be validated based on the information given. Please recheck the id and key information.');
    end;
  end;
end;

procedure TAddDlg.CancelBtnClick(Sender: TObject);
begin
  ClearEdits;
end;

procedure TAddDlg.clearedits;
begin
  edId.text := '';
  edKey.Text := '';
end;

end.

