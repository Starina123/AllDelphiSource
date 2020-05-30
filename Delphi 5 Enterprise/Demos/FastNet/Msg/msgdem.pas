///////////////////////////////////////////////////////////////////////////
//                                                                       //
// Copyright © 1997-1998, NetMasters, L.L.C                              //
//  - All rights reserved worldwide. -                                   //
//  Portions may be Copyright © Inprise.                                 //
//                                                                       //
// Message Client/Server Demo Unit 1:  (UNIT1.PAS)                       //
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
unit msgdem;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Psock, NMMSG, ComCtrls, ScktComp;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    Memo1: TMemo;
    Edit1: TEdit;
    NMMsg1: TNMMsg;
    NMMSGServ1: TNMMSGServ;
    Label1: TLabel;
    Edit2: TEdit;
    Label2: TLabel;
    Edit3: TEdit;
    StatusBar1: TStatusBar;
    Label3: TLabel;
    ClientSocket1: TClientSocket;
    procedure Panel1Resize(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure NMMSGServ1MSG(Sender: TComponent; const sFrom, sMsg: String);
    procedure NMMsg1MessageSent(Sender: TObject);
    procedure NMMsg1Connect(Sender: TObject);
    procedure NMMsg1ConnectionFailed(Sender: TObject);
    procedure NMMsg1Disconnect(Sender: TObject);
    procedure NMMsg1HostResolved(Sender: TComponent);
    procedure NMMsg1Status(Sender: TComponent; Status: String);
    procedure NMMsg1InvalidHost(var handled: Boolean);
    procedure NMMSGServ1ClientContact(Sender: TObject);
    procedure NMMSGServ1Status(Sender: TComponent; Status: String);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.Panel1Resize(Sender: TObject);
begin
  Edit1.Left := 8;
  Edit1.Width := Panel1.Width - 16;
  Label1.Left := 8;
  Edit2.Left := 67;
end;

procedure TForm1.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
  If Key = #13 then
  Begin
    NMMsg1.Host := Edit3.Text;
    NMMsg1.FromName := Edit2.Text;
    NMMsg1.PostIt(Edit1.Text);
  End;
end;

procedure TForm1.NMMSGServ1MSG(Sender: TComponent; const sFrom,
  sMsg: String);
begin
  Memo1.Lines.Add(sFrom+'::'+sMsg);
end;

procedure TForm1.NMMsg1MessageSent(Sender: TObject);
begin
  ShowMessage('Message sent!');
end;

procedure TForm1.NMMsg1Connect(Sender: TObject);
begin
  StatusBar1.SimpleText := 'Connected';
end;

procedure TForm1.NMMsg1ConnectionFailed(Sender: TObject);
begin
  ShowMessage('Connection Failed');
end;

procedure TForm1.NMMsg1Disconnect(Sender: TObject);
begin
  If StatusBar1 <> nil then
    StatusBar1.SimpleText := 'Disconnected';
end;

procedure TForm1.NMMsg1HostResolved(Sender: TComponent);
begin
  StatusBar1.SimpleText := 'Host Resolved';
end;

procedure TForm1.NMMsg1Status(Sender: TComponent; Status: String);
begin
  If StatusBar1 <> nil then
    StatusBar1.SimpleText := status;
end;

procedure TForm1.NMMsg1InvalidHost(var handled: Boolean);
var
  TmpStr: String;
begin
  If InputQuery('Invalid Host!', 'Specify a new host:', TmpStr) then
  Begin
    NMMsg1.Host := TmpStr;
    Handled := TRUE;
  End;
end;

procedure TForm1.NMMSGServ1ClientContact(Sender: TObject);
begin
  NMMsgServ1.ReportLevel := Status_Basic;
  NMMsgServ1.TimeOut := 90000;
  StatusBar1.SimpleText := 'Client connected';
end;

procedure TForm1.NMMSGServ1Status(Sender: TComponent; Status: String);
begin
  If StatusBar1 <> nil then
    StatusBar1.SimpleText := status;
end;

end.
