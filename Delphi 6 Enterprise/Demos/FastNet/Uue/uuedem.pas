///////////////////////////////////////////////////////////////////////////
//                                                                       //
// Copyright © 1997-1998, NetMasters, L.L.C                              //
//  - All rights reserved worldwide. -                                   //
//  Portions may be Copyright © Inprise.                                 //
//                                                                       //
// UUEncode/Decode/MIME Demo Unit 1:  (UNIT1.PAS)                        //
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
unit uuedem;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  NMUUE, StdCtrls, ComCtrls, Buttons;

type
  TForm1 = class(TForm)
    Edit1: TEdit;
    Label1: TLabel;
    NMUUE1: TNMUUProcessor;
    Edit2: TEdit;
    Label2: TLabel;
    Button1: TButton;
    GroupBox1: TGroupBox;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    GroupBox2: TGroupBox;
    RadioButton3: TRadioButton;
    RadioButton4: TRadioButton;
    StatusBar1: TStatusBar;
    SpeedButton1: TSpeedButton;
    OpenDialog1: TOpenDialog;
    procedure Button1Click(Sender: TObject);
    procedure NMUUE1BeginDecode(Sender: TObject);
    procedure NMUUE1BeginEncode(Sender: TObject);
    procedure NMUUE1EndDecode(Sender: TObject);
    procedure NMUUE1EndEncode(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
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
  InStream,
  OutStream: TFileStream;
begin
  InStream := TFileStream.Create(Edit1.Text, fmOpenRead);
  OutStream := TFileStream.Create(Edit2.Text, fmCreate);
  try
    If RadioButton4.Checked then
      NMUUE1.Method := uuMIME
    else
      NMUUE1.Method := uuCode;
    NMUUE1.InputStream := InStream;
    NMUUE1.OutputStream := OutStream;
    If RadioButton1.Checked then
      NMUUE1.Encode
    else
      NMUUE1.Decode;
  finally
    InStream.Free;
    OutStream.Free;
  end;
end;

procedure TForm1.NMUUE1BeginDecode(Sender: TObject);
begin
  StatusBar1.SimpleText := 'Decoding stream'; 
end;

procedure TForm1.NMUUE1BeginEncode(Sender: TObject);
begin
  StatusBar1.SimpleText := 'encoding stream';
end;

procedure TForm1.NMUUE1EndDecode(Sender: TObject);
begin
  StatusBar1.SimpleText := 'Completed decoding stream';
end;

procedure TForm1.NMUUE1EndEncode(Sender: TObject);
begin
  StatusBar1.SimpleText := 'Completed encoding stream';
end;

procedure TForm1.SpeedButton1Click(Sender: TObject);
begin
  If OpenDialog1.Execute then
    Edit1.Text := OpenDialog1.FileName;
end;

end.
