///////////////////////////////////////////////////////////////////////////
//                                                                       //
// Copyright © 1997-1998, NetMasters, L.L.C                              //
//  - All rights reserved worldwide. -                                   //
//  Portions may be Copyright © Inprise.                                 //
//                                                                       //
// FTP Demo Unit 1 :  (UNIT1.PAS)                                        //
//                                                                       //
// DESCRIPTION:                                                          //
//                                                                       //
// THIS CODE AND INFORMATION IS PROVIDED "AS IS" WITHOUT WARRANTY OF ANY //
// KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE   //
// IMPLIED WARRANTIES OF MERCHANTABILITY AND/OR FITNESS FOR A PARTICULAR //
// PURPOSE.                                                              //
//                                                                       //
///////////////////////////////////////////////////////////////////////////
//
// Revision History
//
//                                                                       //
///////////////////////////////////////////////////////////////////////////
unit FTPDem;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics,  Forms, Dialogs,
  ComCtrls, StdCtrls, Psock, NMFtp, Controls;

type
  TForm1 = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    HostTxt: TEdit;
    PortTxt: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Button1: TButton;
    Button2: TButton;
    StatusBar1: TStatusBar;
    Memo1: TMemo;
    Button3: TButton;
    Button4: TButton;
    NMFTP1: TNMFTP;
    UserTxt: TEdit;
    Label3: TLabel;
    PassTxt: TEdit;
    Label4: TLabel;
    DirTxt: TEdit;
    Label5: TLabel;
    Label6: TLabel;
    Button5: TButton;
    RemoteTxt: TEdit;
    Label7: TLabel;
    LocalTxt: TEdit;
    Label8: TLabel;
    Button6: TButton;
    Button7: TButton;
    TabSheet6: TTabSheet;
    Edit3: TEdit;
    Label11: TLabel;
    Label12: TLabel;
    Edit4: TEdit;
    Button10: TButton;
    Button11: TButton;
    Button8: TButton;
    Button9: TButton;
    Button12: TButton;
    Button13: TButton;
    PosTxt: TEdit;
    Label9: TLabel;
    TabSheet5: TTabSheet;
    Edit1: TEdit;
    Label10: TLabel;
    Edit2: TEdit;
    Label13: TLabel;
    Button14: TButton;
    Button15: TButton;
    TabSheet7: TTabSheet;
    Edit5: TEdit;
    Label14: TLabel;
    Button16: TButton;
    TabSheet8: TTabSheet;
    Button17: TButton;
    Label15: TLabel;
    CheckBox1: TCheckBox;
    Edit6: TEdit;
    Edit7: TEdit;
    Label16: TLabel;
    Label17: TLabel;
    TabSheet9: TTabSheet;
    Edit8: TEdit;
    Edit9: TEdit;
    Label18: TLabel;
    Label19: TLabel;
    Button18: TButton;
    procedure NMFTP1Success(Trans_Type: TCmdType);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure NMFTP1ListItem(Listing: String);
    procedure TabSheet3MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Button5Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure NMFTP1PacketRecvd(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure Button12Click(Sender: TObject);
    procedure Button13Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button14Click(Sender: TObject);
    procedure Button15Click(Sender: TObject);
    procedure Button16Click(Sender: TObject);
    procedure Button17Click(Sender: TObject);
    procedure NMFTP1Connect(Sender: TObject);
    procedure NMFTP1Failure(var handled: Boolean; Trans_Type: TCmdType);
    procedure NMFTP1TransactionStop(Sender: TObject);
    procedure NMFTP1HostResolved(Sender: TComponent);
    procedure NMFTP1InvalidHost(var handled: Boolean);
    procedure NMFTP1PacketSent(Sender: TObject);
    procedure NMFTP1TransactionStart(Sender: TObject);
    procedure NMFTP1Disconnect(Sender: TObject);
    procedure NMFTP1Error(Sender: TComponent; Errno: Word; Errmsg: String);
    procedure NMFTP1Status(Sender: TComponent; Status: String);
    procedure Button18Click(Sender: TObject);
    procedure NMFTP1UnSupportedFunction(Trans_Type: TCmdType);
    procedure NMFTP1ConnectionFailed(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

var
  Q: Integer;

procedure TForm1.NMFTP1Success(Trans_Type: TCmdType);
begin
  Case Trans_Type of
    cmdChangeDir: StatusBar1.SimpleText := 'ChangeDir success';
    cmdMakeDir: StatusBar1.SimpleText := 'MakeDir success';
    cmdDelete: StatusBar1.SimpleText := 'Delete success';
    cmdRemoveDir: StatusBar1.SimpleText := 'RemoveDir success';
    cmdList: StatusBar1.SimpleText := 'List success';
    cmdRename: StatusBar1.SimpleText := 'Rename success';
    cmdUpRestore: StatusBar1.SimpleText := 'UploadRestore success';
    cmdDownRestore: StatusBar1.SimpleText := 'DownloadRestore success';
    cmdDownload: StatusBar1.SimpleText := 'Download success';
    cmdUpload: StatusBar1.SimpleText := 'Upload success';
    cmdAppend: StatusBar1.SimpleText := 'UploadAppend success';
    cmdReInit: StatusBar1.SimpleText := 'ReInit success';
    cmdAllocate: StatusBar1.SimpleText := 'Allocate success';
    cmdNList: StatusBar1.SimpleText := 'NList success';
    cmdDoCommand: StatusBar1.SimpleText := 'DoCommand success';
  end;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  If CheckBox1.Checked then
  Begin
    NMFTP1.Proxy := Edit6.Text;
    NMFTP1.ProxyPort := StrToInt(Edit7.Text);
  End;
  NMFTP1.Host := HostTxt.Text;
  NMFTP1.Port := StrToInt(PortTxt.Text);
  NMFTP1.Timeout := 5000;
  NMFTP1.UserID := UserTxt.Text;
  NMFTP1.Password := PassTxt.Text;
  try
    NMFTP1.Connect;
   except
   On E:Exception do
       writeln(E.message);
   end
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  NMFTP1.Disconnect;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  Q := 1;
  try NMFTP1.Nlist;    except end;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  Q := 1;
  try NMFTP1.List;   except end;
end;

procedure TForm1.NMFTP1ListItem(Listing: String);
begin
  Memo1.Lines.Add(IntToStr(Q)+': '+Listing);
  Inc(Q);
end;

procedure TForm1.TabSheet3MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  Label5.Caption := 'Current Dir: ';
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
  NMFTP1.ChangeDir(DirTxt.Text);
end;

procedure TForm1.Button8Click(Sender: TObject);
begin
  NMFTP1.DownloadRestore(RemoteTxt.Text, LocalTxt.Text);
end;

procedure TForm1.NMFTP1PacketRecvd(Sender: TObject);
begin
  StatusBar1.SimpleText := IntToStr(NMFTP1.BytesRecvd)+' of '+IntToStr(NMFTP1.BytesTotal);
end;

procedure TForm1.Button7Click(Sender: TObject);
begin
  NMFTP1.Abort;
end;


procedure TForm1.Button10Click(Sender: TObject);
begin
  try NMFTP1.Upload(Edit3.Text, Edit4.Text); except end;
end;


procedure TForm1.Button11Click(Sender: TObject);
begin
  try NMFTP1.UploadAppend(Edit3.Text, Edit4.Text);  except end;
end;

procedure TForm1.Button12Click(Sender: TObject);
begin
  try   NMFTP1.UploadUnique(Edit3.Text);   except end;
end;

procedure TForm1.Button13Click(Sender: TObject);
begin
  try  NMFTP1.UploadRestore(Edit3.Text,Edit4.Text,StrToInt(PosTxt.Text));  except end;
end;

procedure TForm1.Button6Click(Sender: TObject);  
begin
 try  NMFTP1.Download(RemoteTxt.Text, LocalTxt.Text);  except end;
end;

procedure TForm1.Button14Click(Sender: TObject);
begin
  NMFTP1.MakeDirectory(Edit1.Text);
end;

procedure TForm1.Button15Click(Sender: TObject);
begin
  NMFTP1.RemoveDir(Edit2.Text);
end;

procedure TForm1.Button16Click(Sender: TObject);
begin
  NMFTP1.Delete(Edit5.Text);
end;

procedure TForm1.Button17Click(Sender: TObject);
begin
  NMFTP1.Reinitialize;
  PageControl1.ActivePage := TabSheet2;
end;

procedure TForm1.NMFTP1Connect(Sender: TObject);
begin
  StatusBar1.SimpleText := 'Connected';
end;

procedure TForm1.NMFTP1Failure(var handled: Boolean; Trans_Type: TCmdType);
begin
  Case Trans_Type of
    cmdChangeDir: StatusBar1.SimpleText := 'ChangeDir failure';
    cmdMakeDir: StatusBar1.SimpleText := 'MakeDir failure';
    cmdDelete: StatusBar1.SimpleText := 'Delete failure';
    cmdRemoveDir: StatusBar1.SimpleText := 'RemoveDir failure';
    cmdList: StatusBar1.SimpleText := 'List failure';
    cmdRename: StatusBar1.SimpleText := 'Rename failure';
    cmdUpRestore: StatusBar1.SimpleText := 'UploadRestore failure';
    cmdDownRestore: StatusBar1.SimpleText := 'DownloadRestore failure';
    cmdDownload: StatusBar1.SimpleText := 'Download failure';
    cmdUpload: StatusBar1.SimpleText := 'Upload failure';
    cmdAppend: StatusBar1.SimpleText := 'UploadAppend failure';
    cmdReInit: StatusBar1.SimpleText := 'ReInit failure';
    cmdAllocate: StatusBar1.SimpleText := 'Allocate failure';
    cmdNList: StatusBar1.SimpleText := 'NList failure';
    cmdDoCommand: StatusBar1.SimpleText := 'DoCommand failure';
  end;
end;

procedure TForm1.NMFTP1TransactionStop(Sender: TObject);
begin
  StatusBar1.SimpleText := 'Data Transfer Complete';
end;

procedure TForm1.NMFTP1HostResolved(Sender: TComponent);
begin
  StatusBar1.SimpleText := 'Host resolved';
end;

procedure TForm1.NMFTP1InvalidHost(var handled: Boolean);
begin
  ShowMessage('Invalid Host');
end;

procedure TForm1.NMFTP1PacketSent(Sender: TObject);
begin
  StatusBar1.SimpleText := IntToStr(NMFTP1.BytesSent)+' of '+IntToStr(NMFTP1.BytesTotal);
end;

procedure TForm1.NMFTP1TransactionStart(Sender: TObject);
begin
  StatusBar1.SimpleText := 'Beginning Data Transfer';
end;

procedure TForm1.NMFTP1Disconnect(Sender: TObject);
begin
  If StatusBar1 <> nil then
    StatusBar1.SimpleText := 'Disconnected';
end;

procedure TForm1.NMFTP1Error(Sender: TComponent; Errno: Word;
  Errmsg: String);
begin
  ShowMessage('Error '+IntToStr(Errno)+': '+Errmsg);
end;

procedure TForm1.NMFTP1Status(Sender: TComponent; Status: String);
begin
//  If StatusBar1 <> nil then
//    StatusBar1.SimpleText := status;
end;

procedure TForm1.Button18Click(Sender: TObject);
begin
  NMFTP1.Rename(Edit8.Text,Edit9.Text);
end;

procedure TForm1.NMFTP1UnSupportedFunction(Trans_Type: TCmdType);
begin
  Case Trans_Type of
    cmdChangeDir: ShowMessage('ChangeDir unsupported');
    cmdMakeDir: ShowMessage('MakeDir unsupported');
    cmdDelete: ShowMessage('Delete unsupported');
    cmdRemoveDir: ShowMessage('RemoveDir unsupported');
    cmdList: ShowMessage('List unsupported');
    cmdRename: ShowMessage('Rename unsupported');
    cmdUpRestore: ShowMessage('UploadRestore unsupported');
    cmdDownRestore: ShowMessage('DownloadRestore unsupported');
    cmdDownload: ShowMessage('Download unsupported');
    cmdUpload: ShowMessage('Upload unsupported');
    cmdAppend: ShowMessage('UploadAppend unsupported');
    cmdReInit: ShowMessage('ReInit unsupported');
    cmdAllocate: ShowMessage('Allocate unsupported');
    cmdNList: ShowMessage('NList unsupported');
    cmdDoCommand: ShowMessage('DoCommand unsupported');
  end;
end;

procedure TForm1.NMFTP1ConnectionFailed(Sender: TObject);
begin
  ShowMessage('Connection Failed');
end;

procedure TForm1.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
   NMFTP1.Abort;
end;

end.
