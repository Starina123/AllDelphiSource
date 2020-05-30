{***************************************************************
 *
 * Project  : TFTPClient
 * Unit Name: Main
 * Purpose  : Simple demo of TidFTPClient
 * Version  : 1.0
 * Date  : Wed 25 Apr 2001  -  01:39:10
 * Author  : <unknown>
 * History  :
 * Tested  : Wed 25 Apr 2001  // Allen O'Neill <allen_oneill@hotmail.com> 
 *
 ****************************************************************}

unit Main;

interface

uses
  {$IFDEF Linux}
  QGraphics, QControls, QForms, QDialogs, QStdCtrls,
  {$ELSE}
  windows, messages, graphics, controls, forms, dialogs, stdctrls,
  {$ENDIF}
  SysUtils, Classes, IdBaseComponent, IdComponent, IdUDPBase, IdUDPClient,
  IdTrivialFTP;

type
  TfrmMain = class(TForm)
  edtRemoteFile: TEdit;
  btnUpload: TButton;
  edtHost: TEdit;
  Label1: TLabel;
  Label2: TLabel;
  edtLocalFile: TEdit;
  Label3: TLabel;
  btnDownload: TButton;
  TrivialFTP: TIdTrivialFTP;
  procedure btnUploadClick(Sender: TObject);
  procedure btnDownloadClick(Sender: TObject);
  private
  { Private declarations }
  public
  { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$IFDEF MSWINDOWS}{$R *.dfm}{$ELSE}{$R *.xfm}{$ENDIF}

procedure TfrmMain.btnUploadClick(Sender: TObject);
var
  s: string;
begin
  s := edtRemoteFile.Text;
  if s = '' then
  s := ExtractFileName(edtLocalFile.Text);
  with TrivialFTP do
  begin
  Host := edtHost.Text;
  Put(edtLocalFile.Text, s);
  end;
end;

procedure TfrmMain.btnDownloadClick(Sender: TObject);
var
  strm: TFileStream;
  s: string;
begin
  s := edtLocalFile.Text;
  if s = '' then
  s := ExtractFileName(edtRemoteFile.Text);
  strm := TFileStream.Create(s, fmCreate);
  with TrivialFTP do
  try
  Host := edtHost.Text;
  Get(edtRemoteFile.Text, strm);
  finally
  strm.Free;
  end;
end;

end.
