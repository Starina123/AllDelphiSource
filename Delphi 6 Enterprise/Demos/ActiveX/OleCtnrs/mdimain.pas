{ This sample application demonstrates the following features of the
  TOLEContainer:

  - Toolbar negotiation
  - Status bar hints while inplace editing
  - Local popup menu with OLE verbs and standard OLE functions
    (See the popup menu in MDICHILD.PAS)
  - Using the TOLEContainer's dialogs including InsertObject,
    ObjectProperties and PasteSpecial.
  - Using the TOLEContainer's constructors CreateLinkToFile,
    CreateObjectFromFile.
  - Menu merging during in-place activation
  - Using OLE object verbs.
}
unit mdimain;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, Buttons, ExtCtrls, Menus, OleCtnrs;

type
  TMainForm = class(TForm)
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    Exit1: TMenuItem;
    Window2: TMenuItem;
    Tile1: TMenuItem;
    Cascade1: TMenuItem;
    Help1: TMenuItem;
    About1: TMenuItem;
    Toolbar: TPanel;
    SpeedButton1: TSpeedButton;
    New1: TMenuItem;
    N1: TMenuItem;
    TileHorizontally1: TMenuItem;
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
    Close2: TMenuItem;
    CloseAll1: TMenuItem;
    SaveDialog1: TSaveDialog;
    Open1: TMenuItem;
    N2: TMenuItem;
    ArrangeIcons1: TMenuItem;
    NewButton: TSpeedButton;
    SaveButton: TSpeedButton;
    procedure New1Click(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure Tile1Click(Sender: TObject);
    procedure TileHorizontally1Click(Sender: TObject);
    procedure Cascade1Click(Sender: TObject);
    procedure Close1Click(Sender: TObject);
    procedure Copy1Click(Sender: TObject);
    procedure Paste1Click(Sender: TObject);
    procedure Object2Click(Sender: TObject);
    procedure LinkButtonClick(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure Save1Click(Sender: TObject);
    procedure File1Click(Sender: TObject);
    procedure Window2Click(Sender: TObject);
    procedure Open1Click(Sender: TObject);
    procedure CutButtonClick(Sender: TObject);
    procedure ArrangeIcons1Click(Sender: TObject);
    procedure CloseAll1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure ShowHint(Sender: TObject);    
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

uses MDIChild, about;

{$R *.dfm}

procedure TMainForm.ShowHint(Sender: TObject);
begin
  Statusbar.Panels[0].Text := Application.Hint;
end;

procedure TMainForm.New1Click(Sender: TObject);
begin
  MDIChildForm := TMDIChildForm.Create(Self);
  with MDIChildForm do
  begin
    InsertObject1Click(Sender);
    with OleContainer1 do
      if NewInserted then
        DoVerb(PrimaryVerb);
  end;
end;

procedure TMainForm.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TMainForm.Tile1Click(Sender: TObject);
begin
  TileMode := tbVertical;
  Tile;
end;

procedure TMainForm.TileHorizontally1Click(Sender: TObject);
begin
  TileMode := tbHorizontal;
  Tile;
end;

procedure TMainForm.Cascade1Click(Sender: TObject);
begin
  Cascade;
end;

procedure TMainForm.Close1Click(Sender: TObject);
begin
  if ActiveMDIChild <> nil then
    TMDIChildForm(ActiveMDIChild).Close;
end;

procedure TMainForm.Copy1Click(Sender: TObject);
begin
  if ActiveMDIChild <> nil then
    TMDIChildForm(ActiveMDIChild).OleContainer1.Copy;
end;

procedure TMainForm.Paste1Click(Sender: TObject);
begin
  if ActiveMDIChild = nil then exit;
  with TMDIChildForm(ActiveMDIChild).OleContainer1 do
    if (State = osEmpty) or
      (MessageDlg('Replace existing object?', mtConfirmation, mbOkCancel, 0) = mrOk) then
      begin
        Paste;
        CutButton.Enabled := True;
        CopyButton.Enabled := True;
      end;
end;

procedure TMainForm.Object2Click(Sender: TObject);
begin
  if ActiveMDIChild <> nil then
    TMDIChildForm(ActiveMDIChild).OleContainer1.ObjectPropertiesDialog;
end;

procedure TMainForm.LinkButtonClick(Sender: TObject);
var
  MDIChild: TMDIChildForm;
begin
  if ActiveMDIChild = nil then
  begin
    if OpenDialog1.Execute then
    begin
      MDIChild := TMDIChildForm.Create(Self);
      MDIChild.CreateFromFile(OpenDialog1.FileName, True);
    end;
  end
  else
    with TMDIChildForm(ActiveMDIChild) do
      if (OleContainer1.State = osEmpty) or
        (MessageDlg('Replace existing object?', mtConfirmation, mbOkCancel, 0) = mrOk) then
        if OpenDialog1.Execute then
          CreateFromFile(OpenDialog1.FileName, True);
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
  with TMDIChildForm(ActiveMDIChild), SaveDialog1 do
    if (Length(FileName) = 0) or (Sender = SaveAs1) then
    begin
      if Execute then
        SaveFile(FileName);
    end
    else
      SaveFile(FileName);
end;

procedure TMainForm.File1Click(Sender: TObject);
begin
  if ActiveMDIChild <> nil then
    with TMDIChildForm(ActiveMDIChild).OleContainer1 do
    begin
      Save1.Enabled := Modified;
      SaveAs1.Enabled := Modified;
    end
  else
  begin
    Save1.Enabled := False;
    SaveAs1.Enabled := False;
  end;
  Close2.Enabled := ActiveMDIChild <> nil;
  CloseAll1.Enabled := ActiveMDIChild <> nil;
end;

procedure TMainForm.Window2Click(Sender: TObject);
begin
  Tile1.Enabled := ActiveMDIChild <> nil;
  TileHorizontally1.Enabled := ActiveMDIChild <> nil;
  Cascade1.Enabled := ActiveMDIChild <> nil;
  ArrangeIcons1.Enabled := ActiveMDIChild <> nil;
end;

procedure TMainForm.Open1Click(Sender: TObject);
begin
  with OpenDialog1 do
    if Execute then
    begin
      with TMDIChildForm.Create(Self) do
        CreateFromFile(OpenDialog1.FileName, False);
      CutButton.Enabled := True;
      CopyButton.Enabled := True;
    end;
end;

procedure TMainForm.CutButtonClick(Sender: TObject);
begin
  if ActiveMDIChild <> nil then
    with TMDIChildForm(ActiveMDIChild).OleContainer1 do
    begin
      Copy;
      DestroyObject;
      CutButton.Enabled := False;
      CopyButton.Enabled := False;
      PasteButton.Enabled := True;      
    end;
end;

procedure TMainForm.ArrangeIcons1Click(Sender: TObject);
begin
  ArrangeIcons;
end;

procedure TMainForm.CloseAll1Click(Sender: TObject);
var
  i: integer;
begin
  for i := 0 to MDIChildCount - 1 do
    MDIChildren[i].Close;
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  Application.OnHint := ShowHint;
end;

end.
