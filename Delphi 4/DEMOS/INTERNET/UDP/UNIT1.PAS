///////////////////////////////////////////////////////////////////////////
//                                                                       //
// Copyright © 1997-1998, NetMasters, L.L.C                              //
//  - All rights reserved worldwide. -                                   //
//  Portions may be Copyright © Inprise.                                 //
//                                                                       //
// UDP Demo Unit 1:  (UNIT1.PAS)                                         //
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
  StdCtrls, ComCtrls, NMUDP, ExtCtrls;

type
  TForm1 = class(TForm)
    NMUDP1: TNMUDP;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Edit1: TEdit;
    Edit2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Edit3: TEdit;
    Label3: TLabel;
    Button1: TButton;
    Panel1: TPanel;
    Button2: TButton;
    Memo1: TMemo;
    StatusBar1: TStatusBar;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure NMUDP1Status(Sender: TComponent; status: String);
    procedure NMUDP1DataSend(Sender: TObject);
    procedure NMUDP1InvalidHost(var handled: Boolean);
    procedure NMUDP1DataReceived(Sender: TComponent; NumberBytes: Integer;
      FromIP: String);
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
  MyStream: TMemoryStream;
  TmpStr: String;
Begin
  NMUDP1.ReportLevel := Status_Basic;
  NMUDP1.RemoteHost := Edit1.Text;
  NMUDP1.RemotePort := StrToInt(Edit2.Text);
  TmpStr := Edit3.Text;
  MyStream := TMemoryStream.Create;
  try
    MyStream.Write(TmpStr[1], Length(Edit3.Text));
    NMUDP1.SendStream(MyStream);
  finally
    MyStream.Free;
  end;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  Memo1.Clear;
end;

procedure TForm1.NMUDP1Status(Sender: TComponent; status: String);
begin
  If StatusBar1 <> nil then
    StatusBar1.SimpleText := status;
end;

procedure TForm1.NMUDP1DataSend(Sender: TObject);
begin
  StatusBar1.SimpleText := 'Data Sent';
end;

procedure TForm1.NMUDP1InvalidHost(var handled: Boolean);
var
  TmpStr: String;
begin
  If InputQuery('Invalid Host!', 'Specify a new host:', TmpStr) then
  Begin
    NMUDP1.RemoteHost := TmpStr;
    Handled := TRUE;
  End;
end;

procedure TForm1.NMUDP1DataReceived(Sender: TComponent;
  NumberBytes: Integer; FromIP: String);
var
  MyStream: TMemoryStream;
  TmpStr: String;
begin
  MyStream := TMemoryStream.Create;
  try
    NMUDP1.ReadStream(MyStream);
    SetLength(TmpStr,NumberBytes);
    MyStream.Read(TmpStr[1],NumberBytes);
    Memo1.Lines.Add(FromIP+': '+TmpStr);
  finally
    MyStream.Free;
  end;
end;  

end.
