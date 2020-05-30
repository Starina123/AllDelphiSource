///////////////////////////////////////////////////////////////////////////
//                                                                       //
// Copyright © 1997-1998, NetMasters, L.L.C                              //
//  - All rights reserved worldwide. -                                   //
//  Portions may be Copyright © Inprise.                                 //
//                                                                       //
// Stream Client/Server Demo Unit 1:  (UNIT1.PAS)                        //
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
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, NMStrm,
  ExtDlgs, StdCtrls, Psock, ExtCtrls, ComCtrls;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    Image1: TImage;
    Button1: TButton;
    Button2: TButton;
    NMStrm1: TNMStrm;
    NMStrmServ1: TNMStrmServ;
    Edit1: TEdit;
    Label1: TLabel;
    Edit2: TEdit;
    Label2: TLabel;
    OpenPictureDialog1: TOpenPictureDialog;
    StatusBar1: TStatusBar;
    procedure Button1Click(Sender: TObject);
    procedure NMStrmServ1MSG(Sender: TComponent; const sFrom: String;
      strm: TStream);
    procedure Button2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure NMStrm1MessageSent(Sender: TObject);
    procedure NMStrm1Connect(Sender: TObject);
    procedure NMStrm1Disconnect(Sender: TObject);
    procedure NMStrm1HostResolved(Sender: TComponent);
    procedure NMStrm1Status(Sender: TComponent; Status: String);
    procedure NMStrm1PacketSent(Sender: TObject);
    procedure NMStrm1InvalidHost(var handled: Boolean);
    procedure NMStrm1ConnectionFailed(Sender: TObject);
    procedure NMStrmServ1ClientContact(Sender: TObject);
    procedure NMStrmServ1Status(Sender: TComponent; Status: String);
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
var
  MyFStream: TFileStream;
begin
  If OpenPictureDialog1.Execute then
  Begin
    NMStrm1.Host := Edit2.Text;
    NMStrm1.FromName := Edit1.Text;
    MyFStream := TFileStream.Create(OpenPictureDialog1.FileName, fmOpenRead);
    try
      NMStrm1.PostIt(MyFStream);
    finally
      MyFStream.Free;
    end;
  end;  
end;

procedure TForm1.NMStrmServ1MSG(Sender: TComponent; const sFrom: String;
  strm: TStream);
var
  MyFStream: TFileStream;
begin
  If FileExists('.\tmp.bmp') then DeleteFile('.\tmp.bmp');
  MyFStream := TFileStream.Create('.\tmp.bmp', fmCreate);
  try
    MyFStream.CopyFrom(strm, strm.size);
  finally
    MYFStream.Free;
  end;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  Image1.Picture.LoadFromFile('.\tmp.bmp');
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  If FileExists('.\tmp.bmp') then DeleteFile('.\tmp.bmp');
end;

procedure TForm1.NMStrm1MessageSent(Sender: TObject);
begin
  ShowMessage('Stream Sent');
end;

procedure TForm1.NMStrm1Connect(Sender: TObject);
begin
  StatusBar1.SimpleText := 'Connected';
end;

procedure TForm1.NMStrm1Disconnect(Sender: TObject);
begin
  If StatusBar1 <> nil then
    StatusBar1.SimpleText := 'Disconnected';
end;

procedure TForm1.NMStrm1HostResolved(Sender: TComponent);
begin
  StatusBar1.SimpleText := 'Host Resolved';
end;

procedure TForm1.NMStrm1Status(Sender: TComponent; Status: String);
begin
  If StatusBar1 <> nil then
    StatusBar1.SimpleText := status;
end;

procedure TForm1.NMStrm1PacketSent(Sender: TObject);
begin
  StatusBar1.SimpleText := IntToStr(NMStrm1.BytesSent)+' of '+IntToStr(NMStrm1.BytesTotal)+' sent';
end;

procedure TForm1.NMStrm1InvalidHost(var handled: Boolean);
var
  TmpStr: String;
begin
  If InputQuery('Invalid Host!', 'Specify a new host:', TmpStr) then
  Begin
    NMStrm1.Host := TmpStr;
    Handled := TRUE;
  End;
end;

procedure TForm1.NMStrm1ConnectionFailed(Sender: TObject);
begin
  ShowMessage('Connection Failed');
end;

procedure TForm1.NMStrmServ1ClientContact(Sender: TObject);
begin
  NMStrmServ1.ReportLevel := Status_Basic;
  NMStrmServ1.TimeOut := 90000;
  StatusBar1.SimpleText := 'Client connected';
end;

procedure TForm1.NMStrmServ1Status(Sender: TComponent; Status: String);
begin
  If StatusBar1 <> nil then
    StatusBar1.SimpleText := status;
end;

end.
