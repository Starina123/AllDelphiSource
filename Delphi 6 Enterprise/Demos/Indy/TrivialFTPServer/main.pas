{***************************************************************
 *
 * Project  : TFTPServer
 * Unit Name: main
 * Purpose  : Simple demo of using the TrivialFTPServer
 * Version  : 1.0
 * Date  : Wed 25 Apr 2001  -  01:39:41
 * Author  : <unknown>
 * History  :
 * Tested  : Wed 25 Apr 2001  // Allen O'Neill <allen_oneill@hotmail.com>
 *
 ****************************************************************}

unit main;

interface

uses
{$IFDEF Linux}
   QForms,  QControls,  QStdCtrls,  QExtCtrls,
{$ELSE}
   Forms,  Controls,  StdCtrls,  ExtCtrls,
{$ENDIF}
  IdTrivialFTPServer,  Classes, transfer;

type
  TfrmMain = class(TForm)
    memLog: TMemo;
    Panel1: TPanel;
    edtRootDir: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    lblCount: TLabel;
    btnBrowse: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btnBrowseClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    FTransferList: TList;
    procedure TFTPReadFile(Sender: TObject; var FileName: string; const
      PeerInfo: TPeerInfo;
      var GrantAccess: Boolean; var AStream: TStream; var FreeStreamOnComplete:
        Boolean);
    procedure TFTPWriteFile(Sender: TObject; var FileName: string; const
      PeerInfo: TPeerInfo;
      var GrantAccess: Boolean; var AStream: TStream; var FreeStreamOnComplete:
        Boolean);
    procedure TFTPTransferComplete(Sender: TObject; const Success: Boolean;
      const PeerInfo: TPeerInfo; AStream: TStream; const WriteOperation:
        Boolean);
    function CheckAccess(var FileName: string; RootDir: string): Boolean;
    procedure AddTransfer(const FileName: string; const FileMode: Word; AStream:
      TProgressStream);
  public
  end;

var
  frmMain: TfrmMain;

implementation

{$IFDEF MSWINDOWS}{$R *.dfm}{$ELSE}{$R *.xfm}{$ENDIF}

uses  FileCtrl,  SysUtils;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  FTransferList := TList.Create;
  edtRootDir.Text := GetCurrentDir;
  with TIdTrivialFTPServer.Create(self) do
  begin
    OnReadFile := TFTPReadFile;
    OnWriteFile := TFTPWriteFile;
    OnTransferComplete := TFTPTransferComplete;
    Active := True;
  end;
end;

procedure TfrmMain.TFTPReadFile(Sender: TObject; var FileName: string;
  const PeerInfo: TPeerInfo; var GrantAccess: Boolean; var AStream: TStream;
  var FreeStreamOnComplete: Boolean);
var
  s: string;
begin
  FreeStreamOnComplete := False;
  s := 'denied';
  GrantAccess := CheckAccess(FileName, edtRootDir.Text);
  try
    if GrantAccess then
    begin
      AStream := TProgressStream.Create(FileName, fmOpenRead or
        fmShareDenyWrite);
      AddTransfer(FileName, fmOpenRead, TProgressStream(AStream));
      s := 'granted';
      lblCount.Caption := IntToStr(succ(StrToInt(lblCount.Caption)));
    end;
  finally
    memLog.Lines.Add(Format('%s:%d - Read access to %s %s',
      [PeerInfo.PeerIP, PeerInfo.PeerPort, FileName, s]));
  end;
end;

procedure TfrmMain.TFTPTransferComplete(Sender: TObject;
  const Success: Boolean; const PeerInfo: TPeerInfo; AStream: TStream; const
    WriteOperation: Boolean);
var
  s: string;
  i: integer;
begin
  try
    if Success then
      s := 'completed'
    else
      s := 'aborted';
    memLog.Lines.Add(Format('%s:%d - Transfer %s - %d bytes transferred',
      [PeerInfo.PeerIp, PeerInfo.PeerPort, s, AStream.Position]));
  finally
    for i := FTransferList.Count - 1 downto 0 do
      if TfrmTransfer(FTransferList[i]).Stream = AStream then
      begin
        TfrmTransfer(FTransferList[i]).Free;
        FTransferList.Delete(i);
      end;
    AStream.Free;
    lblCount.Caption := IntToStr(pred(StrToInt(lblCount.Caption)));
  end;
end;

procedure TfrmMain.TFTPWriteFile(Sender: TObject; var FileName: string;
  const PeerInfo: TPeerInfo; var GrantAccess: Boolean; var AStream: TStream;
  var FreeStreamOnComplete: Boolean);
var
  s: string;
begin
  FreeStreamOnComplete := False;
  GrantAccess := CheckAccess(FileName, edtRootDir.Text);
  s := 'denied';
  try
    if GrantAccess then
    begin
      AStream := TProgressStream.Create(FileName, fmCreate);
      AddTransfer(FileName, fmCreate, TProgressStream(AStream));
      s := 'granted';
      lblCount.Caption := IntToStr(StrToInt(lblCount.Caption) + 1);
    end;
  finally
    memLog.Lines.Add(Format('%s:%d - Write access to %s %s',
      [PeerInfo.PeerIP, PeerInfo.PeerPort, FileName, s]));
  end;
end;

procedure TfrmMain.btnBrowseClick(Sender: TObject);
var
  s: string;
begin
  s := edtRootDir.Text;
  if SelectDirectory(s, [sdAllowCreate, sdPerformCreate, sdPrompt], 0) then
    edtRootDir.Text := s;
end;

function TfrmMain.CheckAccess(var FileName: string; RootDir: string): Boolean;
var
  s: string;
begin
  RootDir := ExtractFileDir(ExpandFileName(IncludeTrailingBackslash(RootDir) +
    'a.b'));
  FileName := ExpandFileName(IncludeTrailingBackslash(RootDir) + FileName);
  s := FileName;
  SetLength(s, Length(RootDir));
  Result := AnsiCompareText(RootDir, s) = 0;
end;

procedure TfrmMain.FormDestroy(Sender: TObject);
begin
  FTransferList.Free;
end;

procedure TfrmMain.AddTransfer(const FileName: string;
  const FileMode: Word; AStream: TProgressStream);
begin
  with TfrmTransfer(FTransferList[FTransferList.Add(TfrmTransfer.Create(self,
    AStream, FileName, FileMode))]) do
  begin
    Parent := Self;
    Show;
  end;
end;

end.

