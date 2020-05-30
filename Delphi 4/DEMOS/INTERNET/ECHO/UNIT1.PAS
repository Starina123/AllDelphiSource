///////////////////////////////////////////////////////////////////////////
//                                                                       //
// Copyright © 1997-1998, NetMasters, L.L.C                              //
//  - All rights reserved worldwide. -                                   //
//  Portions may be Copyright © Inprise.                                 //
//                                                                       //
// Echo Demo Unit 1:  (UNIT1.PAS)                                        //
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
  Psock, NMEcho, ExtCtrls, StdCtrls, ComCtrls;

type
  TForm1 = class(TForm)
    Edit1: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Button1: TButton;
    Panel1: TPanel;
    NMEcho1: TNMEcho;
    Edit2: TEdit;
    Label3: TLabel;
    Edit3: TEdit;
    Label4: TLabel;
    Button2: TButton;
    Button3: TButton;
    StatusBar1: TStatusBar;
    Edit4: TEdit;
    Label5: TLabel;
    Button4: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure NMEcho1Connect(Sender: TObject);
    procedure NMEcho1Disconnect(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure NMEcho1ConnectionFailed(Sender: TObject);
    procedure NMEcho1HostResolved(Sender: TComponent);
    procedure NMEcho1Status(Sender: TComponent; Status: String);
    procedure NMEcho1ConnectionRequired(var handled: Boolean);
    procedure NMEcho1InvalidHost(var handled: Boolean);
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
  Edit4.Text := NMEcho1.Echo(Edit1.Text);
  Label2.Caption := 'Elapsed Time: '+FloatToStr(NMEcho1.ElapsedTime)+' milliseconds';
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  NMEcho1.ReportLevel := Status_Basic;
  NMEcho1.TimeOut := 20000;
  NMEcho1.Host := Edit2.Text;
  NMEcho1.Port := StrToInt(Edit3.Text);
  NMEcho1.Connect;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  NMEcho1.Disconnect;
end;

procedure TForm1.NMEcho1Connect(Sender: TObject);
begin
  StatusBar1.SimpleText := 'Connected';
end;

procedure TForm1.NMEcho1Disconnect(Sender: TObject);
begin
  If StatusBar1 <> nil then
    StatusBar1.SimpleText := 'Disconnected';
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  NMEcho1.Abort;
end;

procedure TForm1.NMEcho1ConnectionFailed(Sender: TObject);
begin
  ShowMessage('Connection Failed');
end;

procedure TForm1.NMEcho1HostResolved(Sender: TComponent);
begin
  StatusBar1.SimpleText := 'Host Resolved';
end;

procedure TForm1.NMEcho1Status(Sender: TComponent; Status: String);
begin
  If StatusBar1 <> nil then
    StatusBar1.SimpleText := status;
end;

procedure TForm1.NMEcho1ConnectionRequired(var handled: Boolean);
begin
  If MessageDlg('Connection Required. Connect?', mtConfirmation, mbOkCancel, 0) = mrOk then
  Begin
    Handled := TRUE;
    NMEcho1.Connect;
  End;
end;

procedure TForm1.NMEcho1InvalidHost(var handled: Boolean);
var
  TmpStr: String;
begin
  If InputQuery('Invalid Host!', 'Specify a new host:', TmpStr) then
  Begin
    NMEcho1.Host := TmpStr;
    Handled := TRUE;
  End;
end;

end.
