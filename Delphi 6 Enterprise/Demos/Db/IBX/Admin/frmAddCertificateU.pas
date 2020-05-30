unit frmAddCertificateU;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls, 
  Buttons, dialogs, IBServices;

type
  TfrmAddCertificate = class(TForm)
    Label1: TLabel;
    edID: TEdit;
    OKBtn: TButton;
    CancelBtn: TButton;
    Label2: TLabel;
    Label3: TLabel;
    edKey: TEdit;
    procedure OKBtnClick(Sender: TObject);
  private
    FIBLicensingService: TIBLicensingService;
    { Private declarations }
  public
    { Public declarations }
    property LicensingService : TIBLicensingService read FIBLicensingService write FIBLicensingService;
  end;

implementation

{$R *.dfm}

procedure TfrmAddCertificate.OKBtnClick(Sender: TObject);
begin
  with LicensingService do
  begin
    ID := trim(edID.text);
    Key := trim(edKey.text);
    try
      AddLicense;
      self.ModalResult := mrOK;
    except
      ShowMessage('The certificate could not be validated based on the information given. Please recheck the id and key information.');
    end;
  end;
end;

end.

