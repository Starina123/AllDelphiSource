{***************************************************************
 *
 * Project  : MailDemo
 * Unit Name: smtpauth
 * Purpose  : Sub form
 * Version  : 1.0
 * Date  : Wed 25 Apr 2001  -  01:29:06
 * Author  : Hadi Hari <hadi@pbe.com>
 * History  :
 * Tested  : Wed 25 Apr 2001  // Allen O'Neill <allen_oneill@hotmail.com>
 *
 ****************************************************************}

unit smtpauth;

interface

uses
{$IFDEF Linux}
   QGraphics,  QControls,  QForms,  QDialogs,  QStdCtrls,  QButtons,
{$ELSE}
   Graphics,  Controls,  Forms,  Dialogs,  StdCtrls,  Buttons,
{$ENDIF}
  windows, messages,  SysUtils,  Classes;

type
  TfrmSMTPAuthentication = class(TForm)
    BitBtn1: TBitBtn;
    GroupBox1: TGroupBox;
    cboAuthType: TComboBox;
    lblAuthenticationType: TLabel;
    edtAccount: TEdit;
    edtPassword: TEdit;
    lbAccount: TLabel;
    lbPassword: TLabel;
    procedure cboAuthTypeChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure EnableControls;
  end;

var
  frmSMTPAuthentication: TfrmSMTPAuthentication;

implementation

{$IFDEF MSWINDOWS}{$R *.dfm}{$ELSE}{$R *.xfm}{$ENDIF}

{ TfrmSMTPAuthentication }

procedure TfrmSMTPAuthentication.EnableControls;
begin
  edtAccount.Enabled := (cboAuthType.ItemIndex <> 0);
  lbAccount.Enabled := (cboAuthType.ItemIndex <> 0);
  edtPassword.Enabled := (cboAuthType.ItemIndex <> 0);
  lbPassword.Enabled := (cboAuthType.ItemIndex <> 0);
end;

procedure TfrmSMTPAuthentication.cboAuthTypeChange(Sender: TObject);
begin
  EnableControls;
end;

end.
