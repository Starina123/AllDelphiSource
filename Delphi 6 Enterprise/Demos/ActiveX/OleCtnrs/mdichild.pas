unit mdichild;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  OleCtnrs, Menus, ExtCtrls;

type
  TMDIChildForm = class(TForm)
    Cut1: TMenuItem;
    Copy1: TMenuItem;
    Paste1: TMenuItem;
    PasteSpecial1: TMenuItem;
    LocalMenu: TPopupMenu;
    InsertObject1: TMenuItem;
    CopyObject1: TMenuItem;
    DeleteObject1: TMenuItem;
    Properties1: TMenuItem;
    Panel1: TPanel;
    OleContainer1: TOleContainer;
    MainMenu1: TMainMenu;
    Insert1: TMenuItem;
    Object2: TMenuItem;
    CLear1: TMenuItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure LocalMenuPopup(Sender: TObject);
    procedure InsertObject1Click(Sender: TObject);
    procedure CopyObject1Click(Sender: TObject);
    procedure DeleteObject1Click(Sender: TObject);
    procedure Properties1Click(Sender: TObject);
    procedure Cut1Click(Sender: TObject);
    procedure Copy1Click(Sender: TObject);
    procedure Paste1Click(Sender: TObject);
    procedure PasteSpecial1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Edit1Click(Sender: TObject);
    procedure OleContainer1Activate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    FFileName: TFileName;
    FSaved: Boolean;
    procedure VerbClick(Sender: TObject);
  public
    procedure CreateFromFile(FileName: TFileName; Linked: Boolean);
    procedure SaveFile(FileName: TFileName);
    property FileName: TFileName read FFileName;
  end;

var
  MDIChildForm: TMDIChildForm;

implementation

uses mdimain;

{$R *.dfm}

procedure TMDIChildForm.SaveFile(FileName: TFileName);
begin
  OleContainer1.SaveAsDocument(FileName);
  FFileName := FileName;
  Caption := FFileName;
  OleContainer1.Modified := False;
end;

procedure TMDIChildForm.CreateFromFile(FileName: TFileName; Linked: Boolean);
begin
  if Linked then
    OleContainer1.CreateLinkToFile(FileName, False)
  else
    OleContainer1.CreateObjectFromFile(FileName, False);
  Caption := FileName;
  FFileName := FileName;
end;

procedure TMDIChildForm.VerbClick(Sender: TObject);
begin
  with Sender as TMenuItem do
    OleContainer1.DoVerb(OleContainer1.ObjectVerbs.IndexOf(Caption));
end;

procedure TMDIChildForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  with MainForm do
  begin
    CutButton.Enabled := False;
    CopyButton.Enabled := False;
    PasteButton.Enabled := False;
    SaveButton.Enabled := False;
  end;
end;

procedure TMDIChildForm.LocalMenuPopup(Sender: TObject);
var
  i: integer;
begin
  with OleContainer1 do
  begin
    CopyObject1.Enabled := State <> osEmpty;
    DeleteObject1.Enabled := State <> osEmpty;
    Properties1.Enabled := State <> osEmpty;
    if LocalMenu.Tag > 0 then exit;
    if (State <> osEmpty) and (ObjectVerbs.Count > 0) then
    begin
      LocalMenu.Items.Insert(0, NewLine);
      for i := 0 to ObjectVerbs.Count - 1 do
        LocalMenu.Items.Insert(i, NewItem(ObjectVerbs[i], 0, false, true, VerbClick, 0, ''));
      LocalMenu.Tag := 1;
    end;
  end;
end;

procedure TMDIChildForm.InsertObject1Click(Sender: TObject);
begin
  if (OleContainer1.State = osEmpty) or
    (MessageDlg('Delete current OLE object?', mtConfirmation, mbOkCancel, 0) = mrOk) then
    if OleContainer1.InsertObjectDialog then
    begin
      MainForm.CutButton.Enabled := True;
      MainForm.CopyButton.Enabled := True;
      MainForm.SaveButton.Enabled := OleContainer1.Modified;
    end;
end;

procedure TMDIChildForm.CopyObject1Click(Sender: TObject);
begin
  OleContainer1.Copy;
  MainForm.PasteButton.Enabled := True;
end;

procedure TMDIChildForm.DeleteObject1Click(Sender: TObject);
begin
  if (OleContainer1.State = osEmpty) or
    (MessageDlg('Delete current OLE object?', mtConfirmation, mbOkCancel, 0) = mrOk) then
  begin
    OleContainer1.DestroyObject;
    LocalMenu.Tag := 0;
    while LocalMenu.Items.Count <> 4 do
      LocalMenu.Items[0].Free;
  end;
  MainForm.SaveButton.Enabled := OleContainer1.State <> osEmpty;  
end;

procedure TMDIChildForm.Properties1Click(Sender: TObject);
begin
  OleContainer1.ObjectPropertiesDialog;
end;

procedure TMDIChildForm.Cut1Click(Sender: TObject);
begin
  OleContainer1.Copy;
  OleContainer1.DestroyObject;
  MainForm.CutButton.Enabled := False;
  MainForm.CopyButton.Enabled := False;
  MainForm.PasteButton.Enabled := True;
  FFileName := '';
end;

procedure TMDIChildForm.Copy1Click(Sender: TObject);
begin
  OleContainer1.Copy;
  MainForm.PasteButton.Enabled := True;
end;

procedure TMDIChildForm.Paste1Click(Sender: TObject);
begin
  if (OleContainer1.State = osEmpty) or
    (MessageDlg('Delete current OLE object?', mtConfirmation, mbOkCancel, 0) = mrOk) then
    OleContainer1.Paste;
  MainForm.SaveButton.Enabled := OleContainer1.Modified;
end;

procedure TMDIChildForm.PasteSpecial1Click(Sender: TObject);
begin
  if (OleContainer1.State = osEmpty) or
    (MessageDlg('Delete current OLE object?', mtConfirmation, mbOkCancel, 0) = mrOk) then
  begin
    if OleContainer1.PasteSpecialDialog then
    with MainForm do
    begin
      CutButton.Enabled := True;
      CopyButton.Enabled := True;
      PasteButton.Enabled := OleContainer1.CanPaste;
    end;
  end;
end;

procedure TMDIChildForm.FormCreate(Sender: TObject);
begin
  FFileName := '';
  FSaved := False;
end;

procedure TMDIChildForm.Edit1Click(Sender: TObject);
begin
  with OleContainer1 do
  begin
    Cut1.Enabled := State <> osEmpty;
    Copy1.Enabled := State <> osEmpty;
    Paste1.Enabled := CanPaste;
    PasteSpecial1.Enabled := CanPaste;
    Object2.Enabled := State <> osEmpty;
    Clear1.Enabled := State <> osEmpty;
  end;
end;

procedure TMDIChildForm.OleContainer1Activate(Sender: TObject);
begin
  OleContainer1.Modified := True;
end;

procedure TMDIChildForm.FormActivate(Sender: TObject);
begin
  with MainForm, OleContainer1 do
  begin
    CopyButton.Enabled := State <> osEmpty;
    CutButton.Enabled := State <> osEmpty;
    PasteButton.Enabled := CanPaste;
    SaveButton.Enabled := Modified;
  end;
end;

procedure TMDIChildForm.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  CanClose := True;
  if OleContainer1.Modified then
    case MessageDlg('Save changes to object?', mtConfirmation, mbYesNoCancel, 0) of
      mrYes:
        begin
          MainForm.Save1Click(Sender);
          if OleContainer1.Modified then
            CanClose := False;
        end;
      mrCancel: CanClose := False;
    end;
end;

end.
