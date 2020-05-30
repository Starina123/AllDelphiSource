{***************************************************************
 *
 * Project  : FTPDemo
 * Unit Name: mainf
 * Purpose  : This demo demonstrates the use of IdFTP and IdDebugLog components
 *  : supports both UNIX and DOS directory listings
 * Version  : 1.0
 * Date  : Wed 25 Apr 2001  -  01:15:09
 * Author  : Doychin Bondzhev <doichin@5group.com>
 * History  :
 * Tested  : Wed 25 Apr 2001  // Allen O'Neill <allen_oneill@hotmail.com>
 *
 ****************************************************************}


unit mainf;

interface

uses
  {$IFDEF Linux}
  QGraphics, QControls, QForms, QDialogs, QStdCtrls, QExtCtrls, QComCtrls, QMenus, QTypes,
  {$ELSE}
  windows, messages, graphics, controls, forms, dialogs, stdctrls, extctrls, comctrls,
  menus,
  {$ENDIF}
  SysUtils, Classes, IdIntercept, IdLogBase, IdLogDebug, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdFTP,
  IdAntiFreezeBase, IdAntiFreeze;

type
  TMainForm = class(TForm)
  DirectoryListBox: TListBox;
  IdFTP1: TIdFTP;
  IdLogDebug1: TIdLogDebug;
  DebugListBox: TListBox;
  Panel1: TPanel;
  FtpServerEdit: TEdit;
  ConnectButton: TButton;
  Splitter1: TSplitter;
  Label1: TLabel;
  UploadOpenDialog1: TOpenDialog;
  Panel3: TPanel;
  SaveDialog1: TSaveDialog;
  StatusBar1: TStatusBar;
  TraceCheckBox: TCheckBox;
  CommandPanel: TPanel;
  UploadButton: TButton;
  AbortButton: TButton;
  BackButton: TButton;
  DeleteButton: TButton;
  DownloadButton: TButton;
  UserIDEdit: TEdit;
  PasswordEdit: TEdit;
  Label2: TLabel;
  Label3: TLabel;
  IdAntiFreeze1: TIdAntiFreeze;
  ProgressBar1: TProgressBar;
  UsePassive: TCheckBox;
  CurrentDirEdit: TEdit;
  ChDirButton: TButton;
  CreateDirButton: TButton;
  PopupMenu1: TPopupMenu;
  Download1: TMenuItem;
  Upload1: TMenuItem;
  Delete1: TMenuItem;
  N1: TMenuItem;
  Back1: TMenuItem;
  procedure ConnectButtonClick(Sender: TObject);
  procedure IdLogDebug1LogItem(ASender: TComponent; var AText: String);
  procedure UploadButtonClick(Sender: TObject);
  procedure DirectoryListBoxDblClick(Sender: TObject);
  procedure DeleteButtonClick(Sender: TObject);
  procedure IdFTP1Disconnected(Sender: TObject);
  procedure AbortButtonClick(Sender: TObject);
  procedure BackButtonClick(Sender: TObject);
  procedure IdFTP1Status(axSender: TObject; const axStatus: TIdStatus;
  const asStatusText: String);
  procedure TraceCheckBoxClick(Sender: TObject);
  procedure FormCreate(Sender: TObject);
  procedure DirectoryListBoxClick(Sender: TObject);
  procedure IdFTP1Work(Sender: TObject; AWorkMode: TWorkMode;
  const AWorkCount: Integer);
  procedure IdFTP1WorkBegin(Sender: TObject; AWorkMode: TWorkMode;
  const AWorkCountMax: Integer);
  procedure IdFTP1WorkEnd(Sender: TObject; AWorkMode: TWorkMode);
  procedure UsePassiveClick(Sender: TObject);
  procedure ChDirButtonClick(Sender: TObject);
  procedure CreateDirButtonClick(Sender: TObject);
  private
  { Private declarations }
  AbortTransfer: Boolean;
  TransferrignData: Boolean;
  BytesToTransfer: LongWord;
  STime: TDateTime;
  procedure ChageDir(DirName: String);
  procedure SetFunctionButtons(AValue: Boolean);
  procedure SaveFTPHostInfo(Datatext, header: String);
  function GetHostInfo(header: String): String;
  public
  { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

{$IFDEF MSWINDOWS}{$R *.dfm}{$ELSE}{$R *.xfm}{$ENDIF}

Uses
  IniFiles;

Var
  AverageSpeed: Double = 0;

procedure TMainForm.SetFunctionButtons(AValue: Boolean);
Var
  i: Integer;
begin
  with CommandPanel do
  for i := 0 to ControlCount - 1 do
  if Controls[i].Name <> 'AbortButton' then Controls[i].Enabled := AValue;

  with PopupMenu1 do
  for i := 0 to Items.Count - 1 do Items[i].Enabled := AValue;

  ChDirButton.Enabled := AValue;
  CreateDirButton.Enabled := AValue;
end;

procedure TMainForm.ConnectButtonClick(Sender: TObject);
begin
  ConnectButton.Enabled := false;
  if IdFTP1.Connected then try
  if TransferrignData then IdFTP1.Abort;
  IdFTP1.Quit;
  finally
  //Panel3.Caption := 'Current directory is: ';
  CurrentDirEdit.Text := '/';
  DirectoryListBox.Items.Clear;
  SetFunctionButtons(false);
  ConnectButton.Caption := 'Connect';
  ConnectButton.Enabled := true;
  ConnectButton.Default := true;
  end
  else with IdFTP1 do try
  User := UserIDEdit.Text;
  Password := PasswordEdit.Text;
  Host := FtpServerEdit.Text;
  Connect;
  Self.ChageDir(CurrentDirEdit.Text);
  SetFunctionButtons(true);
  SaveFTPHostInfo(FtpServerEdit.Text, 'FTPHOST');
  finally
  ConnectButton.Enabled := true;
  if Connected then begin
  ConnectButton.Caption := 'Disconnect';
  ConnectButton.Default := false;
  end;
  end;
end;

procedure TMainForm.IdLogDebug1LogItem(ASender: TComponent;
  var AText: String);
begin
  DebugListBox.ItemIndex := DebugListBox.Items.Add(AText);
end;

procedure TMainForm.UploadButtonClick(Sender: TObject);
begin
  if IdFTP1.Connected then begin
  if UploadOpenDialog1.Execute then try
  SetFunctionButtons(false);
  IdFTP1.TransferType := ftBinary;
  
  IdFTP1.Put(UploadOpenDialog1.FileName, ExtractFileName(UploadOpenDialog1.FileName));
  ChageDir(idftp1.RetrieveCurrentDir);
  finally
  SetFunctionButtons(true);
  end;
  end;
end;

procedure TMainForm.ChageDir(DirName: String);
begin
  try
  SetFunctionButtons(false);
  IdFTP1.ChangeDir(DirName);
  IdFTP1.TransferType := ftASCII;

  CurrentDirEdit.Text := IdFTP1.RetrieveCurrentDir;

  {Panel3.Caption := 'Current directory is: ' + IdFTP1.RetrieveCurrentDir +
  '  Remote system is ' + IdFTP1.SystemDesc;}
  DirectoryListBox.Items.Clear;
  IdFTP1.List(DirectoryListBox.Items);
  finally
  SetFunctionButtons(true);
  end;
end;

function GetNameFromDirLine(Line: String; Var IsDirectory: Boolean): String;
Var
  i: Integer;
  DosListing: Boolean;
begin
  IsDirectory := Line[1] = 'd';
  DosListing := false;
  for i := 0 to 7 do begin
  if (i = 2) and not IsDirectory then begin
  IsDirectory := Copy(Line, 1, Pos(' ', Line) - 1) = '<DIR>';
  if not IsDirectory then
  DosListing := Line[1] in ['0'..'9']
  else DosListing := true;
  end;
  Delete(Line, 1, Pos(' ', Line));
  While Line[1] = ' ' do Delete(Line, 1, 1);
  if DosListing and (i = 2) then break;
  end;
  Result := Line;
end;

procedure TMainForm.DirectoryListBoxDblClick(Sender: TObject);
Var
  Name, Line: String;
  IsDirectory: Boolean;
begin
  if not IdFTP1.Connected then exit;
  Line := DirectoryListBox.Items[DirectoryListBox.ItemIndex];
  Name := GetNameFromDirLine(Line, IsDirectory);
  if IsDirectory then begin
  // Change directory
  SetFunctionButtons(false);
  ChageDir(Name);
  SetFunctionButtons(true);
  end
  else begin
  try
  SaveDialog1.FileName := Name;
  if SaveDialog1.Execute then begin
  SetFunctionButtons(false);
  IdFTP1.TransferType := ftBinary;
  BytesToTransfer := IdFTP1.Size(Name);
  IdFTP1.Get(Name, SaveDialog1.FileName, true);
  end;
  finally
  SetFunctionButtons(true);
  end;
  end;
end;

procedure TMainForm.DeleteButtonClick(Sender: TObject);
Var
  Name, Line: String;
  IsDirectory: Boolean;
begin
  if not IdFTP1.Connected then exit;
  Line := DirectoryListBox.Items[DirectoryListBox.ItemIndex];
  Name := GetNameFromDirLine(Line, IsDirectory);
  if IsDirectory then try
  SetFunctionButtons(false);
  idftp1.RemoveDir(Name);
  ChageDir(idftp1.RetrieveCurrentDir);
  finally
  end
  else
  try
  SetFunctionButtons(false);
  idftp1.Delete(Name);
  ChageDir(idftp1.RetrieveCurrentDir);
  finally
  end;
end;

procedure TMainForm.IdFTP1Disconnected(Sender: TObject);
begin
  StatusBar1.Panels[1].Text := 'Disconnected.';
end;

procedure TMainForm.AbortButtonClick(Sender: TObject);
begin
  AbortTransfer := true;
end;

procedure TMainForm.BackButtonClick(Sender: TObject);
begin
  if not IdFTP1.Connected then exit;
  try
  ChageDir('..');
  finally end;
end;

procedure TMainForm.IdFTP1Status(axSender: TObject; const axStatus: TIdStatus;
  const asStatusText: String);
begin
  DebugListBox.ItemIndex := DebugListBox.Items.Add(asStatusText);
  StatusBar1.Panels[1].Text := asStatusText;
end;

procedure TMainForm.TraceCheckBoxClick(Sender: TObject);
begin
  IdLogDebug1.Active := TraceCheckBox.Checked;
  DebugListBox.Visible := TraceCheckBox.Checked;
  if DebugListBox.Visible then Splitter1.Top := DebugListBox.Top + 5;
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  SetFunctionButtons(false);
  IdLogDebug1.Active := true;

  FtpServerEdit.Text := GetHostInfo('FTPHOST');

  ProgressBar1.Parent := StatusBar1;
  ProgressBar1.Top := 2;
  ProgressBar1.Left := 1;
  {$IFDEF Linux}
  ProgressBar1.Width := 142;
  {$ENDIF}
end;

procedure TMainForm.DirectoryListBoxClick(Sender: TObject);
Var
  Line: String;
  IsDirectory: Boolean;
begin
  if not IdFTP1.Connected then exit;
  Line := DirectoryListBox.Items[DirectoryListBox.ItemIndex];
  GetNameFromDirLine(Line, IsDirectory);
  if IsDirectory then DownloadButton.Caption := 'Change dir'
  else DownloadButton.Caption := 'Download';
end;

procedure TMainForm.IdFTP1Work(Sender: TObject; AWorkMode: TWorkMode;
  const AWorkCount: Integer);
Var
  S: String;
  TotalTime: TDateTime;
  H, M, Sec, MS: Word;
  DLTime: Double;
begin
  TotalTime :=  Now - STime;
  DecodeTime(TotalTime, H, M, Sec, MS);
  Sec := Sec + M * 60 + H * 3600;
  DLTime := Sec + MS / 1000;
  if DLTime > 0 then
  AverageSpeed := {(AverageSpeed + }(AWorkCount / 1024) / DLTime{) / 2};

  S := FormatFloat('0.00 KB/s', AverageSpeed);
  case AWorkMode of
  wmRead: StatusBar1.Panels[1].Text := 'Download speed ' + S;
  wmWrite: StatusBar1.Panels[1].Text := 'Uploade speed ' + S;
  end;

  if AbortTransfer then IdFTP1.Abort;

  ProgressBar1.Position := AWorkCount;
  AbortTransfer := false;
end;

procedure TMainForm.IdFTP1WorkBegin(Sender: TObject; AWorkMode: TWorkMode;
  const AWorkCountMax: Integer);
begin
  TransferrignData := true;
  AbortButton.Visible := true;
  AbortTransfer := false;
  STime := Now;
  if AWorkCountMax > 0 then ProgressBar1.Max := AWorkCountMax
  else ProgressBar1.Max := BytesToTransfer;
  AverageSpeed := 0;
end;

procedure TMainForm.IdFTP1WorkEnd(Sender: TObject; AWorkMode: TWorkMode);
begin
  AbortButton.Visible := false;
  StatusBar1.Panels[1].Text := 'Transfer complete.';
  BytesToTransfer := 0;
  TransferrignData := false;
  ProgressBar1.Position := 0;
  AverageSpeed := 0;
end;

procedure TMainForm.UsePassiveClick(Sender: TObject);
begin
  IdFTP1.Passive := UsePassive.Checked;
end;

procedure TMainForm.ChDirButtonClick(Sender: TObject);
begin
  SetFunctionButtons(false);
  ChageDir(CurrentDirEdit.Text);
  SetFunctionButtons(true);
end;

procedure TMainForm.CreateDirButtonClick(Sender: TObject);
Var
  S: String;
begin
  S := InputBox('Make new directory', 'Name', '');
  if S <> '' then
  try
  SetFunctionButtons(false);
  IdFTP1.MakeDir(S);
  ChageDir(CurrentDirEdit.Text);
  finally
  SetFunctionButtons(true);
  end;
end;

procedure TMainForm.SaveFTPHostInfo(Datatext, header: String);
var
  ServerIni: TIniFile;
begin
  ServerIni := TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'FtpHost.ini');
  ServerIni.WriteString('Server', header, Datatext);
  ServerIni.UpdateFile;
  ServerIni.Free;
end;

function TMainForm.GetHostInfo(header: String): String;
var
  ServerName: String;
  ServerIni: TIniFile;
begin
  ServerIni := TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'FtpHost.ini');
  ServerName := ServerIni.ReadString('Server', header, header);

  ServerIni.Free;
  result := ServerName;
end;


end.

