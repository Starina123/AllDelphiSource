///////////////////////////////////////////////////////////////////////////
//                                                                       //
// Copyright © 1997-1998, NetMasters, L.L.C                              //
//  - All rights reserved worldwide. -                                   //
//  Portions may be Copyright © Inprise.                                 //
//                                                                       //
// HTTP Demo Unit 1:  (UNIT1.PAS)                                        //
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
  StdCtrls, ComCtrls, ExtCtrls, Psock, NMHttp, Buttons;

type
  TForm1 = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    NMHTTP1: TNMHTTP;
    Panel1: TPanel;
    StatusBar1: TStatusBar;
    Edit1: TEdit;
    Label1: TLabel;
    Button1: TButton;
    Memo1: TMemo;
    Label2: TLabel;
    Memo2: TMemo;
    Label3: TLabel;
    SpeedButton1: TSpeedButton;
    Panel2: TPanel;
    Label4: TLabel;
    Edit2: TEdit;
    Edit3: TEdit;
    Label5: TLabel;
    Button2: TButton;
    Label6: TLabel;
    Memo3: TMemo;
    Label7: TLabel;
    Memo4: TMemo;
    SpeedButton2: TSpeedButton;
    Label8: TLabel;
    Label9: TLabel;
    TabSheet3: TTabSheet;
    Panel3: TPanel;
    Label10: TLabel;
    SpeedButton3: TSpeedButton;
    Label11: TLabel;
    Edit4: TEdit;
    Button3: TButton;
    Memo5: TMemo;
    Label12: TLabel;
    TabSheet4: TTabSheet;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    Edit9: TEdit;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Edit10: TEdit;
    Label18: TLabel;
    Label19: TLabel;
    CheckBox1: TCheckBox;
    Label20: TLabel;
    Edit11: TEdit;
    Label21: TLabel;
    Edit12: TEdit;
    procedure NMHTTP1Connect(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure NMHTTP1PacketRecvd(Sender: TObject);
    procedure NMHTTP1PacketSent(Sender: TObject);
    procedure NMHTTP1Disconnect(Sender: TObject);
    procedure NMHTTP1Failure(Cmd: CmdType);
    procedure NMHTTP1HostResolved(Sender: TComponent);
    procedure NMHTTP1Status(Sender: TComponent; Status: String);
    procedure NMHTTP1Success(Cmd: CmdType);
    procedure NMHTTP1ConnectionFailed(Sender: TObject);
    procedure NMHTTP1InvalidHost(var handled: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.NMHTTP1Connect(Sender: TObject);
begin
  StatusBar1.SimpleText := 'Connected'
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  NMHTTP1.InputFileMode := FALSE;
  NMHTTP1.OutputFileMode := FALSE;
  NMHTTP1.ReportLevel := Status_Basic;
  If CheckBox1.Checked then
  Begin
    NMHTTP1.Proxy := Edit11.Text;
    NMHTTP1.ProxyPort := StrToInt(Edit12.Text);
  End;
  With NMHTTP1.HeaderInfo do
  Begin
    Cookie := Edit5.Text;
    LocalMailAddress := Edit6.Text;
    LocalProgram := Edit7.Text;
    Referer := Edit8.Text;
    UserID := Edit9.Text;
    Password := Edit10.Text;
  End;
  NMHTTP1.Get(Edit1.Text);
  Memo1.Text := NMHTTP1.Body;
  Memo2.Text := NMHTTP1.Header;
  If NMHTTP1.CookieIn <> '' then
    ShowMessage('Cookie:'+#13#10+NMHTTP1.CookieIn);
end;

procedure TForm1.SpeedButton1Click(Sender: TObject);
begin
  Memo1.Clear;
  Memo2.Clear;
end;


procedure TForm1.Button2Click(Sender: TObject);
begin
  NMHTTP1.InputFileMode := FALSE;
  NMHTTP1.OutputFileMode := FALSE;
  NMHTTP1.ReportLevel := Status_Basic;
  If CheckBox1.Checked then
  Begin
    NMHTTP1.Proxy := Edit11.Text;
    NMHTTP1.ProxyPort := StrToInt(Edit12.Text);
  End;
  With NMHTTP1.HeaderInfo do
  Begin
    Cookie := Edit5.Text;
    LocalMailAddress := Edit6.Text;
    LocalProgram := Edit7.Text;
    Referer := Edit8.Text;
    UserID := Edit9.Text;
    Password := Edit10.Text;
  End;
  NMHTTP1.Post(Edit2.Text, Edit3.Text);
  Memo3.Text := NMHTTP1.Header;
  Memo4.Text := NMHTTP1.Body;
end;



procedure TForm1.SpeedButton2Click(Sender: TObject);
begin
  Memo3.Clear;
  Memo4.Clear;
end;



procedure TForm1.SpeedButton3Click(Sender: TObject);
begin
  Memo5.Clear;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  NMHTTP1.InputFileMode := FALSE;
  NMHTTP1.OutputFileMode := FALSE;
  NMHTTP1.ReportLevel := Status_Basic;
  If CheckBox1.Checked then
  Begin
    NMHTTP1.Proxy := Edit11.Text;
    NMHTTP1.ProxyPort := StrToInt(Edit12.Text);
  End;
  With NMHTTP1.HeaderInfo do
  Begin
    Cookie := Edit5.Text;
    LocalMailAddress := Edit6.Text;
    LocalProgram := Edit7.Text;
    Referer := Edit8.Text;
    UserID := Edit9.Text;
    Password := Edit10.Text;
  End;
  NMHTTP1.Head(Edit4.Text);
  Memo5.Text := NMHTTP1.Header;
end;

procedure TForm1.NMHTTP1PacketRecvd(Sender: TObject);
begin
  StatusBar1.SimpleText := IntToStr(NMHTTP1.BytesRecvd)+' of '+IntToStr(NMHTTP1.BytesTotal)+' retrieved';
end;

procedure TForm1.NMHTTP1PacketSent(Sender: TObject);
begin
  StatusBar1.SimpleText := IntToStr(NMHTTP1.BytesSent)+' of '+IntToStr(NMHTTP1.BytesTotal)+' sent';
end;

procedure TForm1.NMHTTP1Disconnect(Sender: TObject);
begin
  If StatusBar1 <> nil then
    StatusBar1.SimpleText := 'Disconnected';
end;

procedure TForm1.NMHTTP1Failure(Cmd: CmdType);
begin
  Case Cmd of
    CmdGET: StatusBar1.SimpleText := 'Get Failed';
    CmdOPTIONS: StatusBar1.SimpleText := 'Options Failed';
    CmdHEAD: StatusBar1.SimpleText := 'Head Failed';
    CmdPOST: StatusBar1.SimpleText := 'Post Failed';
    CmdPUT: StatusBar1.SimpleText := 'Put Failed';
    CmdPATCH: StatusBar1.SimpleText := 'Patch Failed';
    CmdCOPY: StatusBar1.SimpleText := 'Copy Failed';
    CmdMOVE: StatusBar1.SimpleText := 'Move Failed';
    CmdDELETE: StatusBar1.SimpleText := 'Delete Failed';
    CmdLINK: StatusBar1.SimpleText := 'Link Failed';
    CmdUNLINK: StatusBar1.SimpleText := 'UnLink Failed';
    CmdTRACE: StatusBar1.SimpleText := 'Trace Failed';
    CmdWRAPPED: StatusBar1.SimpleText := 'Wrapped Failed';
  end;
end;

procedure TForm1.NMHTTP1HostResolved(Sender: TComponent);
begin
  StatusBar1.SimpleText := 'Host Resolved';
end;

procedure TForm1.NMHTTP1Status(Sender: TComponent; Status: String);
begin
  If StatusBar1 <> nil then
  Begin
    StatusBar1.SimpleText := status;
    If NMHTTP1.ReplyNumber = 404 then
      StatusBar1.SimpleText := 'Object Not Found';
  End;
end;

procedure TForm1.NMHTTP1Success(Cmd: CmdType);
begin
  Case Cmd of
    CmdGET: StatusBar1.SimpleText := 'Get Succeeded';
    CmdOPTIONS: StatusBar1.SimpleText := 'Options Succeeded';
    CmdHEAD: StatusBar1.SimpleText := 'Head Succeeded';
    CmdPOST: StatusBar1.SimpleText := 'Post Succeeded';
    CmdPUT: StatusBar1.SimpleText := 'Put Succeeded';
    CmdPATCH: StatusBar1.SimpleText := 'Patch Succeeded';
    CmdCOPY: StatusBar1.SimpleText := 'Copy Succeeded';
    CmdMOVE: StatusBar1.SimpleText := 'Move Succeeded';
    CmdDELETE: StatusBar1.SimpleText := 'Delete Succeeded';
    CmdLINK: StatusBar1.SimpleText := 'Link Succeeded';
    CmdUNLINK: StatusBar1.SimpleText := 'UnLink Succeeded';
    CmdTRACE: StatusBar1.SimpleText := 'Trace Succeeded';
    CmdWRAPPED: StatusBar1.SimpleText := 'Wrapped Succeeded';
  end;
end;

procedure TForm1.NMHTTP1ConnectionFailed(Sender: TObject);
begin
  ShowMessage('Connection Failed');
end;

procedure TForm1.NMHTTP1InvalidHost(var handled: Boolean);
var
  TmpStr: String;
begin
  If InputQuery('Invalid Host!', 'Specify a new host:', TmpStr) then
  Begin
    NMHTTP1.Host := TmpStr;
    Handled := TRUE;
  End;  
end;

end.
