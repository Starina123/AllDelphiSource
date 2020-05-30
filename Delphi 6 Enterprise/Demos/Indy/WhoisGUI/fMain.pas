{***************************************************************
 *
 * Project  : Whois Windows GUI Client Demo
 * Unit Name: fMain
 * Purpose  :
 * Author   : Allen O'Neill  <email: allen_oneill@hotmail.com>
 * Date     : 11/27/00 8:27:58 AM        
 * History  : Windows client created
 *
 ****************************************************************}



unit fMain;

interface

uses
  {$IFDEF Linux}
  QGraphics, QControls, QForms, QDialogs, QStdCtrls, 
  {$ELSE}
  Graphics, Controls, Forms, Dialogs, StdCtrls, 
  {$ENDIF}
  Classes, SysUtils, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdWhois;

type
  TfrmMain = class(TForm)
    mmoResults: TMemo;
    edtDomainToCheck: TEdit;
    cboWhoisHosts: TComboBox;
    btnCheck: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    btnExit: TButton;
    IdWhois: TIdWhois;
    procedure btnCheckClick(Sender: TObject);
    procedure btnExitClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.xfm}

procedure TfrmMain.btnCheckClick(Sender: TObject);
begin
try
mmoResults.Clear;
  with IdWhois do
    Begin
    Host := trim(cboWhoisHosts.text);
    mmoResults.Lines.Text := whois(trim(edtDomainToCheck.text));
    // no need to connect - whois function does this for us
    if connected then disconnect;
    End;
except
on E : Exception do
    ShowMessage(E.Message);
end;

end;

procedure TfrmMain.btnExitClick(Sender: TObject);
begin
application.terminate;
end;

end.
