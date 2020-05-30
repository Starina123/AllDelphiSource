///////////////////////////////////////////////////////////////////////////
//                                                                       //
// Copyright © 1997-1998, NetMasters, L.L.C                              //
//  - All rights reserved worldwide. -                                   //
//  Portions may be Copyright © Inprise.                                 //
//                                                                       //
// POP3 Demo Unit 1:  (UNIT1.PAS)                                        //
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
  StdCtrls, ComCtrls, Psock, NMpop3, ExtCtrls;

type
  TForm1 = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Edit1: TEdit;
    Edit2: TEdit;
    NMPOP31: TNMPOP3;
    Label1: TLabel;
    Label2: TLabel;
    Edit3: TEdit;
    Edit4: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    Button1: TButton;
    Button2: TButton;
    StatusBar1: TStatusBar;
    Memo1: TMemo;
    Panel1: TPanel;
    Button3: TButton;
    Edit5: TEdit;
    Label5: TLabel;
    Memo2: TMemo;
    Label6: TLabel;
    Label7: TLabel;
    Edit6: TEdit;
    Label8: TLabel;
    Edit7: TEdit;
    Label9: TLabel;
    Label10: TLabel;
    TabSheet3: TTabSheet;
    Label11: TLabel;
    Memo3: TMemo;
    Button4: TButton;
    Button5: TButton;
    Edit8: TEdit;
    Label12: TLabel;
    Edit9: TEdit;
    Label13: TLabel;
    Button6: TButton;
    Button7: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure NMPOP31Connect(Sender: TObject);
    procedure NMPOP31Disconnect(Sender: TObject);
    procedure NMPOP31Status(Sender: TComponent; Status: String);
    procedure Button3Click(Sender: TObject);
    procedure NMPOP31ConnectionFailed(Sender: TObject);
    procedure NMPOP31ConnectionRequired(var handled: Boolean);
    procedure NMPOP31Failure(Sender: TObject);
    procedure NMPOP31HostResolved(Sender: TComponent);
    procedure NMPOP31InvalidHost(var handled: Boolean);
    procedure NMPOP31List(Msg, Size: Integer);
    procedure NMPOP31Reset(Sender: TObject);
    procedure NMPOP31Success(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure NMPOP31PacketRecvd(Sender: TObject);
    procedure NMPOP31RetrieveEnd(Sender: TObject);
    procedure NMPOP31RetrieveStart(Sender: TObject);
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
  NMPOP31.AttachFilePath := '.';
  NMPOP31.DeleteOnRead := FALSE;
  NMPOP31.ReportLevel := Status_Basic;
  NMPOP31.TimeOut := 20000;
  NMPOP31.Host := Edit1.Text;
  NMPOP31.Port := StrToInt(Edit2.Text);
  NMPOP31.UserID := Edit3.Text;
  NMPOP31.Password := Edit4.Text;
  NMPOP31.Connect;
  Label10.caption := '# of Messages: '+IntToStr(NMPOP31.MailCount);
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  NMPOP31.Disconnect;
end;

procedure TForm1.NMPOP31Connect(Sender: TObject);
begin
  StatusBar1.SimpleText := 'Connected';
end;

procedure TForm1.NMPOP31Disconnect(Sender: TObject);
begin
  If StatusBar1 <> nil then
    StatusBar1.SimpleText := 'Disconnected';
end;

procedure TForm1.NMPOP31Status(Sender: TComponent; Status: String);
begin
  If StatusBar1 <> nil then
    StatusBar1.SimpleText := status;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  NMPOP31.GetMailMessage(StrToInt(Edit5.Text));
  Edit6.Text := NMPOP31.MailMessage.From;
  Edit7.Text := NMPOP31.MailMessage.Subject;
  Edit9.Text := NMPOP31.MailMessage.MessageID;
  Memo2.Lines.Assign(NMPOP31.MailMessage.Head);
  Memo1.Lines.Assign(NMPOP31.MailMessage.Body);
  If NMPOP31.MailMessage.Attachments.Text <> '' then
    ShowMessage('Attachments:'+#10#13+NMPOP31.MailMessage.Attachments.Text);
end;

procedure TForm1.NMPOP31ConnectionFailed(Sender: TObject);
begin
  ShowMessage('Connection Failed');
end;

procedure TForm1.NMPOP31ConnectionRequired(var handled: Boolean);
begin
  If MessageDlg('Connection Required. Connect?', mtConfirmation, mbOkCancel, 0) = mrOk then
  Begin
    Handled := TRUE;
    NMPOP31.Connect;
  End;
end;

procedure TForm1.NMPOP31Failure(Sender: TObject);
begin
  ShowMessage('Operation failed');
end;

procedure TForm1.NMPOP31HostResolved(Sender: TComponent);
begin
  StatusBar1.SimpleText := 'Host Resolved';
end;

procedure TForm1.NMPOP31InvalidHost(var handled: Boolean);
var
  TmpStr: String;
begin
  If InputQuery('Invalid Host!', 'Specify a new host:', TmpStr) then
  Begin
    NMPOP31.Host := TmpStr;
    Handled := TRUE;
  End;
end;

procedure TForm1.NMPOP31List(Msg, Size: Integer);
begin
  Memo3.Lines.Add(IntToStr(Msg)+' / '+IntToStr(Size));
end;

procedure TForm1.NMPOP31Reset(Sender: TObject);
begin
  ShowMessage('Delete Flags Reset');
end;

procedure TForm1.NMPOP31Success(Sender: TObject);
begin
  StatusBar1.SimpleText := 'Operation successful';
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  Memo3.Clear;
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
  NMPOP31.List;
end;


procedure TForm1.Button6Click(Sender: TObject);
begin
  NMPOP31.GetSummary(StrToInt(Edit5.Text));
  Edit6.Text := NMPOP31.Summary.From;
  Edit7.Text := NMPOP31.Summary.Subject;
  Edit8.Text := IntToStr(NMPOP31.Summary.Bytes);
  Edit9.Text := NMPOP31.Summary.MessageID;
  Memo2.Lines.Assign(NMPOP31.Summary.Header);
end;

procedure TForm1.Button7Click(Sender: TObject);
begin
  NMPOP31.DeleteMailMessage(StrToint(Edit5.Text));
end;

procedure TForm1.NMPOP31PacketRecvd(Sender: TObject);
begin
  StatusBar1.SimpleText := IntToStr(NMPOP31.BytesRecvd)+' bytes of '+IntToStr(NMPOP31.BytesTotal)+' received';
end;

procedure TForm1.NMPOP31RetrieveEnd(Sender: TObject);
begin
  Form1.Cursor := crDefault;
  StatusBar1.SimpleText := 'Retrieval end';
end;

procedure TForm1.NMPOP31RetrieveStart(Sender: TObject);
begin
  Form1.Cursor := crHourGlass;
  StatusBar1.SimpleText := 'Retrieval start';
end;

end.
