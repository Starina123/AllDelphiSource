///////////////////////////////////////////////////////////////////////////
//                                                                       //
// Copyright © 1997-1998, NetMasters, L.L.C                              //
//  - All rights reserved worldwide. -                                   //
//  Portions may be Copyright © Inprise.                                 //
//                                                                       //
// NNTP Demo Unit 1:  (UNIT1.PAS)                                        //
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
unit nntpdem;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Psock, NMNNTP, ComCtrls, ExtCtrls;

const
  NumMsg = 'Number of Messages: ';
  
type
  TForm1 = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    NMNNTP1: TNMNNTP;
    TabSheet3: TTabSheet;
    Edit1: TEdit;
    Label1: TLabel;
    Edit2: TEdit;
    Label2: TLabel;
    Edit3: TEdit;
    Label3: TLabel;
    Edit4: TEdit;
    Label4: TLabel;
    Button1: TButton;
    Button2: TButton;
    Label5: TLabel;
    Edit5: TEdit;
    Label6: TLabel;
    Edit6: TEdit;
    Label7: TLabel;
    GroupBox1: TGroupBox;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    CheckBox1: TCheckBox;
    TabSheet4: TTabSheet;
    Panel1: TPanel;
    Button3: TButton;
    ListBox1: TListBox;
    StatusBar1: TStatusBar;
    Memo1: TMemo;
    Label8: TLabel;
    Memo2: TMemo;
    Label9: TLabel;
    Memo3: TMemo;
    Label10: TLabel;
    Memo4: TMemo;
    Panel2: TPanel;
    ListBox2: TListBox;
    Button5: TButton;
    Button6: TButton;
    OpenDialog1: TOpenDialog;
    Label11: TLabel;
    Memo5: TMemo;
    Label12: TLabel;
    Panel3: TPanel;
    Label14: TLabel;
    Edit9: TEdit;
    Edit10: TEdit;
    Label15: TLabel;
    Edit11: TEdit;
    Label16: TLabel;
    Button7: TButton;
    Button8: TButton;
    Button4: TButton;
    Edit7: TEdit;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure NMNNTP1Connect(Sender: TObject);
    procedure NMNNTP1GroupListUpdate(Name: String; FirstArticle,
      LastArticle: Integer; Posting: Boolean);
    procedure NMNNTP1GroupListCacheUpdate(var Handled: Boolean;
      Name: String; FirstArticle, LastArticle: Integer; Posting: Boolean);
    procedure Button3Click(Sender: TObject);
    procedure NMNNTP1ConnectionFailed(Sender: TObject);
    procedure NMNNTP1HostResolved(Sender: TComponent);
    procedure NMNNTP1Status(Sender: TComponent; Status: String);
    procedure NMNNTP1Disconnect(Sender: TObject);
    procedure NMNNTP1Abort(Sender: TObject);
    procedure NMNNTP1GroupSelect(Sender: TObject);
    procedure ListBox1DblClick(Sender: TObject);
    procedure NMNNTP1ConnectionRequired(var handled: Boolean);
    procedure NMNNTP1GroupSelectRequired(var handled: Boolean);
    procedure NMNNTP1PostFailed(Sender: TComponent; Errno: Word;
      Errmsg: String);
    procedure NMNNTP1Posted(Sender: TObject);
    procedure NMNNTP1InvalidHost(var handled: Boolean);
    procedure NMNNTP1InvalidArticle(Sender: TObject);
    procedure NMNNTP1HeaderList(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure NMNNTP1Article(Sender: TObject);
    procedure NMNNTP1ArticleCacheUpdate(var Handled: Boolean;
      IdNo: Integer; From, Subject, MsgId, Date: String;
      ArticleNo: Integer);
    procedure NMNNTP1Header(Sender: TObject);
    procedure NMNNTP1BodyCacheUpdate(var handled: Boolean);
    procedure NMNNTP1Body(Sender: TObject);
    procedure NMNNTP1HeaderCacheUpdate(var Handled: Boolean; IdNo: Integer;
      From, Subject, MsgId, Date: String; ArticleNo: Integer);
    procedure NMNNTP1HeaderListCacheUpdate(var handled: Boolean);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  GNo: integer;

implementation

{$R *.DFM}

procedure TForm1.Button1Click(Sender: TObject);
begin
  NMNNTP1.ReportLevel := Status_Basic;
  NMNNTP1.TimeOut := 20000;
  NMNNTP1.NewsDir := Edit5.Text;
  NMNNTP1.AttachFilePath := Edit6.Text;
  NMNNTP1.Host := Edit1.Text;
  NMNNTP1.Port := StrToInt(Edit2.Text);
  If Edit3.Text <> '' then
  Begin
    NMNNTP1.UserID := Edit3.Text;
    NMNNTP1.Password := Edit4.Text;
  End;
  If RadioButton1.Checked then
    NMNNTP1.CacheMode := cmLocal;
  If RadioButton2.Checked then
    NMNNTP1.CacheMode := cmMixed;
  If RadioButton3.Checked then
    NMNNTP1.CacheMode := cmRemote;
  If CheckBox1.Checked then
    NMNNTP1.ParseAttachments := TRUE
  else
    NMNNTP1.ParseAttachments := FALSE;
  NMNNTP1.Connect;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  NMNNTP1.Disconnect;
end;

procedure TForm1.CheckBox1Click(Sender: TObject);
begin
  If CheckBox1.Checked then
    NMNNTP1.ParseAttachments := TRUE
  else
    NMNNTP1.ParseAttachments := FALSE;
end;

procedure TForm1.NMNNTP1Connect(Sender: TObject);
begin
  StatusBar1.SimpleText := 'Connect';
  GNo :=0;
  NMNNTP1.GetGroupList;
end;

procedure TForm1.NMNNTP1GroupListUpdate(Name: String; FirstArticle,
  LastArticle: Integer; Posting: Boolean);
begin
  ListBox1.Items.Add(Name);
  inc (GNo);
  StatusBar1.SimpleText := 'Getting News Group List Group '+ IntToStr(GNo);
end;

procedure TForm1.NMNNTP1GroupListCacheUpdate(var Handled: Boolean;
  Name: String; FirstArticle, LastArticle: Integer; Posting: Boolean);
begin
  ListBox1.Items.Add(Name);
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  NMNNTP1.GetArticleList(True,0);
end;

procedure TForm1.NMNNTP1ConnectionFailed(Sender: TObject);
begin
  ShowMessage('Connection Failed');
end;

procedure TForm1.NMNNTP1HostResolved(Sender: TComponent);
begin
  StatusBar1.SimpleText := 'Host Resolved';
end;

procedure TForm1.NMNNTP1Status(Sender: TComponent; Status: String);
begin
  If StatusBar1 <> nil then
    StatusBar1.SimpleText := status;
  If NMNNTP1.ReplyNumber = 200 then
    StatusBar1.SimpleText := 'server ready - posting allowed';
end;

procedure TForm1.NMNNTP1Disconnect(Sender: TObject);
begin
  If StatusBar1 <> nil then
    StatusBar1.SimpleText := 'Disconnected';
end;

procedure TForm1.NMNNTP1Abort(Sender: TObject);
begin
  StatusBar1.SimpleText := 'Operation aborted';
end;

procedure TForm1.NMNNTP1GroupSelect(Sender: TObject);
begin
  Form1.Caption := 'NNTP Demo - ['+NMNNTP1.SelectedGroup+' Lo:'+IntToStr(NMNNTP1.LoMessage)+' Hi:'+IntToStr(NMNNTP1.HiMessage);
  If NMNNTP1.Posting then
    Form1.Caption := Form1.Caption + ' Posting Allowed]'
  else
    Form1.Caption := Form1.Caption + ' Posting Prohibited]';
end;

procedure TForm1.ListBox1DblClick(Sender: TObject);
begin
  NMNNTP1.SetGroup(ListBox1.Items[ListBox1.ItemIndex]);
end;

procedure TForm1.NMNNTP1ConnectionRequired(var handled: Boolean);
begin
  If MessageDlg('Connection Required. Connect?', mtConfirmation, mbOkCancel, 0) = mrOk then
  Begin
    Handled := TRUE;
    NMNNTP1.ReportLevel := Status_Basic;
    NMNNTP1.TimeOut := 20000;
    NMNNTP1.NewsDir := Edit5.Text;
    NMNNTP1.AttachFilePath := Edit6.Text;
    NMNNTP1.Host := Edit1.Text;
    NMNNTP1.Port := StrToInt(Edit2.Text);
    If Edit3.Text <> '' then
    Begin
      NMNNTP1.UserID := Edit3.Text;
      NMNNTP1.Password := Edit4.Text;
    End;
    If RadioButton1.Checked then
      NMNNTP1.CacheMode := cmLocal;
    If RadioButton2.Checked then
      NMNNTP1.CacheMode := cmMixed;
    If RadioButton3.Checked then
      NMNNTP1.CacheMode := cmRemote;
    If CheckBox1.Checked then
      NMNNTP1.ParseAttachments := TRUE
    else
      NMNNTP1.ParseAttachments := FALSE;
    NMNNTP1.Connect;
  End;
end;
procedure TForm1.NMNNTP1GroupSelectRequired(var handled: Boolean);
var
  TmpStr: String;
begin
  If InputQuery('Newsgroup selection Required!','Enter NewsGroup Name: ', TmpStr) then
  Begin
    NMNNTP1.SetGroup(TmpStr);
    Handled := TRUE;
  End;
end;

procedure TForm1.NMNNTP1PostFailed(Sender: TComponent; Errno: Word;
  Errmsg: String);
begin
  ShowMessage('Post Failed. Error: '+IntToStr(Errno)+'; '+Errmsg);
end;

procedure TForm1.NMNNTP1Posted(Sender: TObject);
begin
  ShowMessage('Article posted successfully');
end;

procedure TForm1.NMNNTP1InvalidHost(var handled: Boolean);
var
  TmpStr: String;
begin
  If InputQuery('Invalid Host!', 'Specify a new host:', TmpStr) then
  Begin
    NMNNTP1.Host := TmpStr;
    Handled := TRUE;
  End;
end;

procedure TForm1.NMNNTP1InvalidArticle(Sender: TObject);
begin
  ShowMessage('Article number invalid');
end;

procedure TForm1.NMNNTP1HeaderList(Sender: TObject);
begin
  Memo4.Lines.Add('['+IntToStr(NMNNTP1.HeaderRecord.PrArticleId)+'] From: ' + NMNNTP1.HeaderRecord.PrFromAddress);
  Memo4.lines.add('    Subject: ' + NMNNTP1.HeaderRecord.PrSubject);
  Application.ProcessMessages;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  NMNNTP1.GetArticle(StrToInt(Edit7.Text));
end;

procedure TForm1.NMNNTP1Article(Sender: TObject);
begin
  Memo3.Text := NMNNTP1.Header.Text;
  Memo2.Text := NMNNTP1.Body.Text;
  Memo1.Text := NMNNTP1.Attachments.Text;
end;

procedure TForm1.NMNNTP1ArticleCacheUpdate(var Handled: Boolean;
  IdNo: Integer; From, Subject, MsgId, Date: String; ArticleNo: Integer);
begin
  Memo3.Text := NMNNTP1.Header.Text;
  Memo2.Text := NMNNTP1.Body.Text;
  Memo1.Text := NMNNTP1.Attachments.Text;

end;

procedure TForm1.NMNNTP1Header(Sender: TObject);
begin
  Memo3.Text := NMNNTP1.Header.Text;
end;

procedure TForm1.NMNNTP1BodyCacheUpdate(var handled: Boolean);
begin
  Memo3.Text := NMNNTP1.Body.Text;
end;

procedure TForm1.NMNNTP1Body(Sender: TObject);
begin
  Memo3.Text := NMNNTP1.Body.Text;
end;

procedure TForm1.NMNNTP1HeaderCacheUpdate(var Handled: Boolean;
  IdNo: Integer; From, Subject, MsgId, Date: String; ArticleNo: Integer);
begin
  Memo3.Text := NMNNTP1.Header.Text;
end;

procedure TForm1.NMNNTP1HeaderListCacheUpdate(var handled: Boolean);
begin
  Memo4.Lines.Add('['+IntToStr(NMNNTP1.HeaderRecord.PrArticleId)+'] From: ' + NMNNTP1.HeaderRecord.PrFromAddress);
  Memo4.lines.add('    Subject: ' + NMNNTP1.HeaderRecord.PrSubject);
end;


procedure TForm1.Button5Click(Sender: TObject);
begin
  If OpenDialog1.Execute then
    ListBox2.Items.Add(OpenDialog1.Filename);
end;

procedure TForm1.Button6Click(Sender: TObject);
begin
  ListBox2.Items.Delete(ListBox2.ItemIndex);
end;

procedure TForm1.Button7Click(Sender: TObject);
begin
  NMNNTP1.PostBody.Assign(Memo5.Lines);
  NMNNTP1.PostRecord.PrFromAddress := Edit9.Text;
  NMNNTP1.PostRecord.PrReplyTo := Edit10.Text;
  NMNNTP1.PostRecord.PrSubject := Edit11.Text;
  NMNNTP1.PostRecord.PrNewsGroups := NMNNTP1.SelectedGroup;
  NMNNTP1.Attachments.Assign(ListBox2.Items);
  NMNNTP1.PostArticle;
end;

procedure TForm1.Button8Click(Sender: TObject);
begin
  NMNNTP1.Abort;
end;



end.
