///////////////////////////////////////////////////////////////////////////
//                                                                       //
// Copyright © 1997-1998, NetMasters, L.L.C                              //
//  - All rights reserved worldwide. -                                   //
//  Portions may be Copyright © Inprise.                                 //
//                                                                       //
// DayTime Demo Unit1 :  (UNIT1.PAS)                                     //
//                                                                       //
// DESCRIPTION:                                                          //
//                                                                       //
// THIS CODE AND INFORMATION IS PROVIDED "AS IS" WITHOUT WARRANTY OF ANY //
// KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE   //
// IMPLIED WARRANTIES OF MERCHANTABILITY AND/OR FITNESS FOR A PARTICULAR //
// PURPOSE.                                                              //
//                                                                       //
///////////////////////////////////////////////////////////////////////////
//									 //
// Revision History							 //
//									 //
//                                                                       //
///////////////////////////////////////////////////////////////////////////
unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Psock, NMDayTim, ExtCtrls, ComCtrls;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    Edit1: TEdit;
    Edit2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    NMDayTime1: TNMDayTime;
    Button1: TButton;
    Label3: TLabel;
    StatusBar1: TStatusBar;
    procedure Button1Click(Sender: TObject);
    procedure NMDayTime1Connect(Sender: TObject);
    procedure NMDayTime1Disconnect(Sender: TObject);
    procedure NMDayTime1HostResolved(Sender: TComponent);
    procedure NMDayTime1Status(Sender: TComponent; Status: String);
    procedure NMDayTime1ConnectionFailed(Sender: TObject);
    procedure NMDayTime1InvalidHost(var handled: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

const
  StdCap = 'The Current Date and Time is : ';

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.Button1Click(Sender: TObject);
begin
  NMDayTime1.ReportLevel := Status_Basic;
  NMDayTime1.TimeOut := 300;
  NMDayTime1.Host := Edit1.Text;
  NMDayTime1.Port := StrToInt(Edit2.Text); 
  Label3.Caption := StdCap+NMDayTime1.DayTimeStr;
end;

procedure TForm1.NMDayTime1Connect(Sender: TObject);
begin
  StatusBar1.SimpleText := 'Connected';
end;

procedure TForm1.NMDayTime1Disconnect(Sender: TObject);
begin
  If StatusBar1 <> nil then
    StatusBar1.SimpleText := 'disconnected';
end;

procedure TForm1.NMDayTime1HostResolved(Sender: TComponent);
begin
  StatusBar1.SimpleText := 'Host resolved';
end;

procedure TForm1.NMDayTime1Status(Sender: TComponent; Status: String);
begin
  If StatusBar1 <> nil then
    StatusBar1.SimpleText := status;
end;

procedure TForm1.NMDayTime1ConnectionFailed(Sender: TObject);
begin
  ShowMessage('Connection Failed');
end;

procedure TForm1.NMDayTime1InvalidHost(var handled: Boolean);
var
  TmpStr: String;
begin
  If InputQuery('Invalid Host!', 'Specify a new host:', TmpStr) then
  Begin
    NMDayTime1.Host := TmpStr;
    Handled := TRUE;
  End;
end;

end.
