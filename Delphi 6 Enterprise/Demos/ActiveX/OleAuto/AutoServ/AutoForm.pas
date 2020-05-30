{ Important Note:

  Before running this AutoDemo application,
  make sure that the MemoEdit application has
  been registered using a "MemoEdit /regserver"
  command line. }

unit AutoForm;

interface

uses
  Variants, Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Memo_TLB;

type
  TMainForm = class(TForm)
    CreateButton: TButton;
    AddTextButton: TButton;
    TileButton: TButton;
    CascadeButton: TButton;
    CloseButton: TButton;
    ExitButton: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure CreateButtonClick(Sender: TObject);
    procedure AddTextButtonClick(Sender: TObject);
    procedure TileButtonClick(Sender: TObject);
    procedure CascadeButtonClick(Sender: TObject);
    procedure CloseButtonClick(Sender: TObject);
    procedure ExitButtonClick(Sender: TObject);
  private
    MemoEdit: IMemoApp;
    Memos: array[1..3] of OleVariant;
    procedure CloseMemos;
  end;

var
  MainForm: TMainForm;

implementation

{$R *.dfm}

uses ComObj;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  try
    MemoEdit := CoMemoApp.Create;
  except
    MessageDlg(
      'An instance of the "MemoApp.Application" OLE Automation class ' +
      'could not be created. Make sure that the MemoEdit application has ' +
      'been registered using a "MemoEdit /regserver" command line.',
      mtError, [mbOk], 0);
    Halt;
  end;
end;

procedure TMainForm.FormDestroy(Sender: TObject);
begin
  CloseMemos;
end;

procedure TMainForm.CloseMemos;
var
  I: Integer;
begin
  for I := 1 to 3 do
    if not VarIsEmpty(Memos[I]) then
    begin
      Memos[I].Close;
      Memos[I] := Unassigned;
    end;
end;

procedure TMainForm.CreateButtonClick(Sender: TObject);
var
  I: Integer;
begin
  CloseMemos;
  for I := 1 to 3 do Memos[I] := MemoEdit.NewMemo;
end;

procedure TMainForm.AddTextButtonClick(Sender: TObject);
var
  I: Integer;
begin
  for I := 1 to 3 do
    if not VarIsEmpty(Memos[I]) then
      Memos[I].Insert('This text was added through OLE Automation'#13#10);
end;

procedure TMainForm.TileButtonClick(Sender: TObject);
begin
  if MemoEdit <> nil then
    MemoEdit.TileWindows;
end;

procedure TMainForm.CascadeButtonClick(Sender: TObject);
begin
  if MemoEdit <> nil then
    MemoEdit.CascadeWindows;
end;

procedure TMainForm.CloseButtonClick(Sender: TObject);
begin
  CloseMemos;
end;

procedure TMainForm.ExitButtonClick(Sender: TObject);
begin
  Close;
end;

end.
