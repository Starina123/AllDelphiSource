///////////////////////////////////////////////////////////////////////////
//                                                                       //
// Copyright © 1997-1998, NetMasters, L.L.C                              //
//  - All rights reserved worldwide. -                                   //
//  Portions may be Copyright © Inprise.                                 //
//                                                                       //
// SMTP Demo Unit 1:  (UNIT1.PAS)                                        //
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
unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, StdCtrls, Psock, NMsmtp, ExtCtrls;

type
  TForm1 = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    Edit1: TEdit;
    NMSMTP1: TNMSMTP;
    Label1: TLabel;
    Edit2: TEdit;
    Label2: TLabel;
    Button1: TButton;
    Button2: TButton;
    TabSheet4: TTabSheet;
    StatusBar1: TStatusBar;
    Edit3: TEdit;
    Label3: TLabel;
    Button3: TButton;
    Edit4: TEdit;
    Label4: TLabel;
    Memo1: TMemo;
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    Edit5: TEdit;
    Edit6: TEdit;
    Label5: TLabel;
    Label6: TLabel;
    Edit7: TEdit;
    Label7: TLabel;
    Edit8: TEdit;
    Label8: TLabel;
    Edit9: TEdit;
    Label9: TLabel;
    ListBox1: TListBox;
    Label10: TLabel;
    Button4: TButton;
    Button5: TButton;
    Memo2: TMemo;
    Panel2: TPanel;
    Button6: TButton;
    Label11: TLabel;
    Panel3: TPanel;
    Label14: TLabel;
    Button7: TButton;
    Label12: TLabel;
    OpenDialog1: TOpenDialog;
    Edit10: TEdit;
    Edit11: TEdit;
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure NMSMTP1Connect(Sender: TObject);
    procedure NMSMTP1Disconnect(Sender: TObject);
    procedure NMSMTP1Status(Sender: TComponent; Status: String);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure NMSMTP1EncodeStart(Filename: String);
    procedure NMSMTP1EncodeEnd(Filename: String);
    procedure Button7Click(Sender: TObject);
    procedure NMSMTP1MailListReturn(MailAddress: String);
    procedure NMSMTP1ConnectionFailed(Sender: TObject);
    procedure NMSMTP1ConnectionRequired(var handled: Boolean);
    procedure NMSMTP1Failure(Sender: TObject);
    procedure NMSMTP1HostResolved(Sender: TComponent);
    procedure NMSMTP1InvalidHost(var handled: Boolean);
    procedure NMSMTP1PacketSent(Sender: TObject);
    procedure NMSMTP1RecipientNotFound(Recipient: String);
    procedure NMSMTP1SendStart(Sender: TObject);
    procedure NMSMTP1Success(Sender: TObject);
    procedure NMSMTP1HeaderIncomplete(var handled: Boolean;
      hiType: Integer);
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

procedure TForm1.Button1Click(Sender: TObject);
begin
  NMSMTP1.Host := Edit1.Text;
  NMSMTP1.Port := StrToInt(Edit2.Text);
  NMSMTP1.UserID := Edit4.Text;
  NMSMTP1.Connect;
end;

procedure TForm1.Button3Click(Sender: TObject);
var
  TmpStr: String;
begin
  TmpStr := Edit3.Text; // Do this so the user can't change the edit box.
  If NMSMTP1.Verify(TmpStr) then
    ShowMessage(TmpStr+' verified')
  else
    ShowMessage(TmpStr+' not verified');
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  NMSMTP1.Disconnect;
end;

procedure TForm1.NMSMTP1Connect(Sender: TObject);
begin
  StatusBar1.SimpleText := 'Connected';
end;

procedure TForm1.NMSMTP1Disconnect(Sender: TObject);
begin
  If StatusBar1 <> nil then
    StatusBar1.SimpleText := 'Disconnected';
end;

procedure TForm1.NMSMTP1Status(Sender: TComponent; Status: String);
begin
  If StatusBar1 <> nil then
    StatusBar1.SimpleText := status;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  If OpenDialog1.Execute then
    ListBox1.Items.Add(OpenDialog1.FileName);
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
  ListBox1.Items.Delete(ListBox1.ItemIndex);
end;

procedure TForm1.Button6Click(Sender: TObject);
begin
  NMSMTP1.PostMessage.FromAddress := Edit6.Text;
  NMSMTP1.PostMessage.FromName := Edit5.Text;
  NMSMTP1.PostMessage.Subject := Edit10.Text;
  NMSMTP1.PostMessage.ToAddress.Add(Edit7.Text);
  NMSMTP1.PostMessage.ToBlindCarbonCopy.Add(Edit9.Text);
  NMSMTP1.PostMessage.ToCarbonCopy.Add(Edit8.Text);
  NMSMTP1.PostMessage.Attachments.AddStrings(Listbox1.Items);
  NMSMTP1.PostMessage.Body.Assign(Memo1.Lines);
  NMSMTP1.SendMail;
end;

procedure TForm1.NMSMTP1EncodeStart(Filename: String);
begin
  StatusBar1.SimpleText := 'Encoding '+Filename;
end;

procedure TForm1.NMSMTP1EncodeEnd(Filename: String);
begin
  StatusBar1.SimpleText := 'Finished encoding '+Filename;
end;

procedure TForm1.Button7Click(Sender: TObject);
begin
  NMSMTP1.ExpandList(Edit11.Text);
end;

procedure TForm1.NMSMTP1MailListReturn(MailAddress: String);
begin
  Memo2.Lines.Add(MailAddress);
end;

procedure TForm1.NMSMTP1ConnectionFailed(Sender: TObject);
begin
  ShowMessage('Connection Failed');
end;

procedure TForm1.NMSMTP1ConnectionRequired(var handled: Boolean);
begin
  If MessageDlg('Connection Required. Connect?', mtConfirmation, mbOkCancel, 0) = mrOk then
  Begin
    Handled := TRUE;
    NMSMTP1.Connect;
  End;
end;

procedure TForm1.NMSMTP1Failure(Sender: TObject);
begin
  StatusBar1.SimpleText := 'Failure';
end;

procedure TForm1.NMSMTP1HostResolved(Sender: TComponent);
begin
  StatusBar1.SimpleText := 'Host Resolved';
end;

procedure TForm1.NMSMTP1InvalidHost(var handled: Boolean);
var
  TmpStr: String;
begin
  If InputQuery('Invalid Host!', 'Specify a new host:', TmpStr) then
  Begin
    NMSMTP1.Host := TmpStr;
    Handled := TRUE;
  End;
end;

procedure TForm1.NMSMTP1PacketSent(Sender: TObject);
begin
  StatusBar1.SimpleText := IntToStr(NMSMTP1.BytesSent)+' bytes of '+IntToStr(NMSMTP1.BytesTotal)+' sent';
end;

procedure TForm1.NMSMTP1RecipientNotFound(Recipient: String);
begin
  ShowMessage('Recipient "'+Recipient+'" not found');
end;

procedure TForm1.NMSMTP1SendStart(Sender: TObject);
begin
  StatusBar1.simpleText := 'Sending message';
end;

procedure TForm1.NMSMTP1Success(Sender: TObject);
begin
  StatusBar1.SimpleText := 'Success';
end;

procedure TForm1.NMSMTP1HeaderIncomplete(var handled: Boolean;
  hiType: Integer);
begin
  ShowMessage('Header Incomplete.');
end;





procedure TForm1.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
 NMSMTP1.Abort;
end;

end.
