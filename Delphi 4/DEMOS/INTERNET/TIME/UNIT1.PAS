///////////////////////////////////////////////////////////////////////////
//                                                                       //
// Copyright © 1997-1998, NetMasters, L.L.C                              //
//  - All rights reserved worldwide. -                                   //
//  Portions may be Copyright © Inprise.                                 //
//                                                                       //
// Time Demo Unit 1:  (UNIT1.PAS)                                        //
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
  StdCtrls, Psock, ExtCtrls, NMTime, ComCtrls;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    Edit2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Button1: TButton;
    Label3: TLabel;
    NMTime1: TNMTime;
    StatusBar1: TStatusBar;
    cbHost: TComboBox;
    procedure Button1Click(Sender: TObject);
    procedure NMTime1Connect(Sender: TObject);
    procedure NMTime1ConnectionFailed(Sender: TObject);
    procedure NMTime1Disconnect(Sender: TObject);
    procedure NMTime1HostResolved(Sender: TComponent);
    procedure NMTime1InvalidHost(var handled: Boolean);
    procedure NMTime1Status(Sender: TComponent; Status: String);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

const
  StdCap = 'The Current Time is : ';

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.Button1Click(Sender: TObject);
begin
  NMTime1.Host := cbHost.Text;
  NMTime1.Port := StrToInt(Edit2.Text);
  Label3.Caption := StdCap+NMTime1.TimeStr;
end;

procedure TForm1.NMTime1Connect(Sender: TObject);
begin
  StatusBar1.SimpleText := 'Connected';
end;

procedure TForm1.NMTime1ConnectionFailed(Sender: TObject);
begin
  ShowMessage('Connection Failed');
end;

procedure TForm1.NMTime1Disconnect(Sender: TObject);
begin
  if StatusBar1 <> nil then
    StatusBar1.SimpleText := 'Disconnected';
end;

procedure TForm1.NMTime1HostResolved(Sender: TComponent);
begin
  StatusBar1.SimpleText := 'Host resolved';
end;

procedure TForm1.NMTime1InvalidHost(var handled: Boolean);
var
  TmpStr: String;
begin
  if (InputQuery('Invalid Host', 'Enter a valid host', TmpStr)) then
  begin
    NMTime1.Host := TmpStr;
    handled := TRUE;
  end;
end;

procedure TForm1.NMTime1Status(Sender: TComponent; Status: String);
begin
  if (StatusBar1 <> nil) then
    StatusBar1.SimpleText := Status;
end;


end.
