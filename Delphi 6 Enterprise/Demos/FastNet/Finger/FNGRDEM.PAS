///////////////////////////////////////////////////////////////////////////
//                                                                       //
// Copyright © 1997-1998, NetMasters, L.L.C                              //
//  - All rights reserved worldwide. -                                   //
//  Portions may be Copyright © Inprise.                                 //
//                                                                       //
// Finger Demo Unit 1 :  (UNIT1.PAS)                                     //
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
unit FngrDem;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, StdCtrls, ExtCtrls, Psock, NMFngr;

type
  TForm1 = class(TForm)
    NMFinger1: TNMFinger;
    Panel1: TPanel;
    Label1: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Label2: TLabel;
    Edit3: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    Memo1: TMemo;
    StatusBar1: TStatusBar;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
    procedure NMFinger1Connect(Sender: TObject);
    procedure NMFinger1ConnectionFailed(Sender: TObject);
    procedure NMFinger1Disconnect(Sender: TObject);
    procedure NMFinger1HostResolved(Sender: TComponent);
    procedure NMFinger1Status(Sender: TComponent; Status: String);
    procedure NMFinger1InvalidHost(var handled: Boolean);
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
  NMFinger1.ReportLevel := Status_Basic;
  NMFinger1.TimeOut := 5000;
  NMFinger1.Host := Edit1.Text;
  NMFinger1.Port := StrToInt(Edit2.Text);
  NMFinger1.User := Edit3.Text;
  Memo1.Text := NMFinger1.FingerStr;
end;

procedure TForm1.NMFinger1Connect(Sender: TObject);
begin
  StatusBar1.SimpleText := 'Connected';
end;

procedure TForm1.NMFinger1ConnectionFailed(Sender: TObject);
begin
  ShowMessage('Connection Failed');
end;

procedure TForm1.NMFinger1Disconnect(Sender: TObject);
begin
  If StatusBar1 <> nil then
    StatusBar1.SimpleText := 'Disconnected'; 
end;

procedure TForm1.NMFinger1HostResolved(Sender: TComponent);
begin
  StatusBar1.SimpleText := 'Host Resolved';
end;

procedure TForm1.NMFinger1Status(Sender: TComponent; Status: String);
begin
  If StatusBar1 <> nil then
    StatusBar1.SimpleText := status;
end;

procedure TForm1.NMFinger1InvalidHost(var handled: Boolean);
var
  TmpStr: String;
begin
  If InputQuery('Invalid Host!', 'Specify a new host:', TmpStr) then
  Begin
    NMFinger1.Host := TmpStr;
    Edit1.text := NMFinger1.Host;
    Handled := TRUE;
  End;
end;

end.
