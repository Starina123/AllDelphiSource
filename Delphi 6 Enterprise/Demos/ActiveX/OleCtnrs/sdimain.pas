{ This sample application demonstrates the following features of the
  TOLEContainer:

  - Toolbar negotiation
  - Status bar hints while inplace editing
  - Using the TOLEContainer's dialogs including InsertObject,
    ObjectProperties and PasteSpecial.
  - Using the TOLEContainer's constructors CreateLinkToFile,
    CreateObjectFromFile.
  - Menu merging during in-place activation
}
unit sdimain;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, Buttons, ExtCtrls, Menus, OleCtnrs, StdCtrls;

type
  TMainForm = class(TForm)
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    Exit1: TMenuItem;
    Help1: TMenuItem;
    About1: TMenuItem;
    Toolbar: TPanel;
    SpeedButton1: TSpeedButton;
    LinkButton: TSpeedButton;
    CopyButton: TSpeedButton;
    CutButton: TSpeedButton;
    PasteButton: TSpeedButton;
    OpenButton: TSpeedButton;
    OpenDialog1: TOpenDialog;
    StatusPanel: TPanel;
    StatusBar: TStatusBar;
    Save1: TMenuItem;
    SaveAs1: TMenuItem;
    SaveDialog1: TSaveDialog;
    Open1: TMenuItem;
    N2: TMenuItem;
    SaveButton: TSpeedButton;
    Edit1: TMenuItem;
    Object1: TMenuItem;
    N4: TMenuItem;
    PasteSpecial1: TMenuItem;
    Paste1: TMenuItem;
    Copy1: TMenuItem;
    Cut1: TMenuItem;
    New1: TMenuItem;
    Panel1: TPanel;
    OleContainer1: TOleContainer;
    procedure Exit1Click(Sender: TObject);
    procedure Copy1Click(Sender: TObject);
    procedure Paste1Click(Sender: TObject);
    procedure Object2Click(Sender: TObject);
    procedure LinkButtonClick(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure Save1Click(Sender: TObject);
    procedure File1Click(Sender: TObject);
    procedure Open1Click(Sender: TObject);
    procedure CutButtonClick(Sender: TObject);
    procedure New1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Object1Click(Sender: TObject);
    procedure Cut1Click(Sender: TObject);
    procedure PasteSpecial1Click(Sender: TObject);
    procedure Edit1Click(Sender: TObject);
  private
    ObjectFileName: TFileName;
    InsertCanceled: Boolean;
    procedure ShowHint(Sender: TObject);
  end;

var
  MainForm: TMainForm;

implementation

uses about;

{$R *.dfm}

procedure TMainForm.ShowHint(Sender: TObject);
begin
  Statusbar.Panels[0].Text := Application.Hint;
end;

procedure TMainForm.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TMainForm.Copy1Click(Sender: TObject);
begin
  OleContainer1.Copy;
  PasteButton.Enabled := True;
end;

procedure TMainForm.Paste1Click(Sender: TObject);
begin
  if (OleContainer1.State = osEmpty) or
    (MessageDlg('Replace existing object?', mtConfirmation, mbOkCancel, 0) = mrOk) then
  begin
    OleContainer1.Paste;
    CopyButton.Enabled := True;
    CutButton.Enabled := True;
  end;
end;

procedure TMainForm.Object2Click(Sender: TObject);
begin
  if OleContainer1.State <> osEmpty then
    OleContainer1.ObjectPropertiesDialog;
end;

procedure TMainForm.LinkButtonClick(Sender: TObject);
begin
  if (OleContainer1.State = osEmpty) or
    (MessageDlg('Replace existing object?', mtConfirmation, mbOkCancel, 0) = mrOk) then
    with OpenDialog1 do
      if OpenDialog1.Execute then
      begin
        OleContainer1.CreateLinkToFile(FileName, False);
        ObjectFileName := FileName;
        CutButton.Enabled := True;
        CopyButton.Enabled := True;
        PasteButton.Enabled := OleContainer1.CanPaste;
      end;
end;

procedure TMainForm.About1Click(Sender: TObject);
begin
  AboutBox := TAboutBox.Create(Self);
  try
    AboutBox.ShowModal;
  finally
    AboutBox.Free;
  end;
end;

procedure TMainForm.Save1Click(Sender: TObject);
begin
  with SaveDialog1 do
  begin
    SaveDialog1.FileName := ObjectFileName;
    if (Length(FileName) = 0) or (Sender = SaveAs1) then
    begin
      if Execute then
      begin
        OleContainer1.SaveToFile(FileName);
        ObjectFileName := FileName;
      end
    end
    else
      OleContainer1.SaveToFile(FileName);
  end;
end;

procedure TMainForm.File1Click(Sender: TObject);
begin
  with OleContainer1 do
  begin
    Save1.Enabled := Modified;
    SaveAs1.Enabled := Modified;
  end;
end;

procedure TMainForm.Open1Click(Sender: TObject);
begin
  with OpenDialog1 do
    if Execute then
    begin
      OleContainer1.CreateObjectFromFile(FileName, False);
      ObjectFileName := FileName;
      CutButton.Enabled := True;
      CopyButton.Enabled := True;
      PasteButton.Enabled := True;
    end;
end;

procedure TMainForm.CutButtonClick(Sender: TObject);
begin
  if OleContainer1.State <> osEmpty then
    with OleContainer1 do
    begin
      Copy;
      DestroyObject;
      CopyButton.Enabled := False;
      PasteButton.Enabled := OleContainer1.CanPaste;
      ObjectFilename := '';
    end;
end;

procedure TMainForm.New1Click(Sender: TObject);
begin
  if (OleContainer1.State = osEmpty) or
    (MessageDlg('Delete existing object?', mtConfirmation, mbOkCancel, 0) = mrOk) then
    begin
      InsertCanceled := false;
      with OleContainer1 do
      begin
        DestroyObject;
        Object1Click(Sender);
        if not InsertCanceled then
        begin
        DoVerb(PrimaryVerb);
        ObjectFileName := '';
        end;
      end
    end;
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  ObjectFileName := '';
  Application.OnHint := ShowHint;
end;

procedure TMainForm.Object1Click(Sender: TObject);
begin
  if (OleContainer1.State = osEmpty) or
    (MessageDlg('Delete current OLE object?', mtConfirmation, mbOkCancel, 0) = mrOk) then
    if OleContainer1.InsertObjectDialog then
    begin
      CutButton.Enabled := True;
      CopyButton.Enabled := True;
      PasteButton.Enabled := OleContainer1.CanPaste;
      with OleContainer1 do
        DoVerb(PrimaryVerb);
    end
    else
     InsertCanceled := true;
end;

procedure TMainForm.Cut1Click(Sender: TObject);
begin
  OleContainer1.Copy;
  OleContainer1.DestroyObject;
  CutButton.Enabled := False;
  CopyButton.Enabled := False;  
  PasteButton.Enabled := OleContainer1.CanPaste;  
end;

procedure TMainForm.PasteSpecial1Click(Sender: TObject);
begin
  if (OleContainer1.State = osEmpty) or
    (MessageDlg('Delete current OLE object?', mtConfirmation, mbOkCancel, 0) = mrOk) then
  begin
    if OleContainer1.PasteSpecialDialog then
    begin
      CutButton.Enabled := True;
      CopyButton.Enabled := True;
      PasteButton.Enabled := OleContainer1.CanPaste;
    end;
  end;
end;

procedure TMainForm.Edit1Click(Sender: TObject);
begin
  with OleContainer1 do
  begin
    Cut1.Enabled := State <> osEmpty;
    Copy1.Enabled := State <> osEmpty;
    Paste1.Enabled := CanPaste;
    PasteSpecial1.Enabled := CanPaste;
  end;
end;

end.
