{*********************************************}
{ TeeChart Delphi Component Library           }
{ Mixed Text and Chart Print Demo             }
{ Copyright (c) 1995-2001 by David Berneda    }
{ All rights reserved                         }
{*********************************************}
unit uprint;

{ This example shows how to print both Text and Chart in the SAME PAGE }

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, Buttons, Chart, Series, ExtCtrls, Teengine,
  TeeProcs;

type
  TPrintForm = class(TForm)
    Chart1: TChart;
    LineSeries1: TLineSeries;
    BitBtn1: TBitBtn;
    Edit1: TEdit;
    BitBtn2: TBitBtn;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PrintForm: TPrintForm;

implementation

{$R *.dfm}
uses printers;

procedure TPrintForm.FormCreate(Sender: TObject);
begin
  LineSeries1.FillSampleValues(30); { <-- we need some random values }
end;

procedure TPrintForm.BitBtn1Click(Sender: TObject);
var h,w:longint;
begin
  Screen.Cursor := crHourGlass; { <-- nice detail }
  try
    Printer.BeginDoc;       { <-- start printer job }
    try
      { now print some text on printer.canvas }
      With Printer.Canvas do
      begin
        Font.Name:='Arial';
        Font.Size:=10;             { <-- set the font size }
        Font.Style:=[];
        TextOut(0,0,Edit1.Text);   { <-- print some text }
      end;

      h:=Printer.PageHeight; { <-- get page height }
      w:=Printer.PageWidth;  { <-- get page width }

      { And now print the chart component... }
      Chart1.PrintPartial(  Rect(  w div 10,          { <-- left margin }
                                   h div 3 ,          { <-- top margin }
                                   w - (w div 10),    { <-- right margin }
                                   h - (h div 10) )); { <-- bottom margin }


      { print more text.... }
      With Printer.Canvas do
      begin
        Font.Name:='Arial';
        Font.Size:=12;             { <-- set the font size }
        Font.Style:=[fsItalic];
        TextOut(0,60,Edit1.Text+' ...again');   { <-- print some text }
      end;

      Printer.EndDoc; { <-- end job and print !! }
    except
      on Exception do  { just in case an error happens... }
      Begin
        Printer.Abort;
        Printer.EndDoc;
        Raise;       { <-- raise up the exception !!! }
      end;
    end;
  finally
    Screen.Cursor:=crDefault; { <-- restore cursor }
  end;
end;

end.
