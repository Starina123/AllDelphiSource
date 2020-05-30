unit EditFrm;

{ This unit implements TEditForm, the MDI child form class, and TMemoDoc,
  the automation object for a memo editor form. TMemoDoc implements the
  following automated methods and properties:

  procedure Clear;
    Clears the contents of the memo.

  procedure Insert(const Text: string);
    Inserts the given string at the current cursor position.

  procedure Save;
    Saves the contents of the memo.

  procedure Close;
    Closes the memo.

  property FileName: string;
    The name of the file associated with the memo. The memo can be renamed
    by assigning to this property.

  property Modified: WordBool;
    True if the memo has been modified since it was loaded or last saved.

  OLE Automation controllers obtain instances of TMemoDoc using the NewMemo
  and OpenMemo methods of the "MemoApp.Application" OLE class. Since
  instances of TMemoDoc cannot be created through OLE, there is no need to
  register the class. }

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Menus, ComObj, Memo_TLB;

type
  TMemoDoc = class;

  TEditForm = class(TForm)
    Memo: TMemo;
    MainMenu: TMainMenu;
    FileMenu: TMenuItem;
    FileNewItem: TMenuItem;
    FileOpenItem: TMenuItem;
    FileSaveItem: TMenuItem;
    FileSaveAsItem: TMenuItem;
    FileCloseItem: TMenuItem;
    FileExitItem: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FileNewItemClick(Sender: TObject);
    procedure FileOpenItemClick(Sender: TObject);
    procedure FileSaveItemClick(Sender: TObject);
    procedure FileSaveAsItemClick(Sender: TObject);
    procedure FileCloseItemClick(Sender: TObject);
    procedure FileExitItemClick(Sender: TObject);
    procedure MemoChange(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    FMemoDoc: TMemoDoc;
    FFileName: string;
    FModified: Boolean;
    FUnnamed: Boolean;
    function GetOleObject: Variant;
    procedure Rename(const NewName: string);
    function Save(ChangeName, ForceSave: Boolean): Boolean;
    procedure SaveToFile;
  public
    property OleObject: Variant read GetOleObject;
  end;

  TMemoDoc = class(TAutoObject, IMemoDoc)
  private
    FEditForm: TEditForm;
  protected
    function Get_FileName: WideString; safecall;
    function Get_Modified: WordBool; safecall;
    procedure Clear; safecall;
    procedure Close; safecall;
    procedure Insert(const Text: WideString); safecall;
    procedure Save; safecall;
    procedure Set_FileName(const Value: WideString); safecall;
  end;

implementation

{$R *.dfm}

uses MainFrm, ComServ;

{ TEditForm }

procedure TEditForm.FormCreate(Sender: TObject);
begin
  if not MainForm.Local then
  begin
    FMemoDoc := TMemoDoc.Create;
    FMemoDoc.FEditForm := Self;
  end;
  if MainForm.NewFileName = '' then
  begin
    FFileName := 'Untitled.txt';
    FUnnamed := True;
  end else
  begin
    FFileName := MainForm.NewFileName;
    Memo.Lines.LoadFromFile(FFileName);
    FUnnamed := False;
  end;
  Caption := FFileName;
  FModified := False;
  MainForm.Local := False;
end;

procedure TEditForm.FormDestroy(Sender: TObject);
begin
  if FMemoDoc <> nil then
  begin
    FMemoDoc.FEditForm := nil;
    FMemoDoc := nil;
  end;
end;

procedure TEditForm.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose := Save(False, False);
end;

procedure TEditForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TEditForm.FileNewItemClick(Sender: TObject);
begin
  MainForm.FileNewItemClick(Sender);
end;

procedure TEditForm.FileOpenItemClick(Sender: TObject);
begin
  MainForm.FileOpenItemClick(Sender);
end;

procedure TEditForm.FileSaveItemClick(Sender: TObject);
begin
  Save(False, True);
end;

procedure TEditForm.FileSaveAsItemClick(Sender: TObject);
begin
  Save(True, True);
end;

procedure TEditForm.FileCloseItemClick(Sender: TObject);
begin
  Close;
end;

procedure TEditForm.FileExitItemClick(Sender: TObject);
begin
  MainForm.Close;
end;

procedure TEditForm.MemoChange(Sender: TObject);
begin
  FModified := True;
end;

function TEditForm.GetOleObject: Variant;
begin
  Result := FMemoDoc as IDispatch;
end;

procedure TEditForm.Rename(const NewName: string);
begin
  FFileName := ExpandFileName(NewName);
  FUnnamed := False;
  Caption := FFileName;
end;

function TEditForm.Save(ChangeName, ForceSave: Boolean): Boolean;
begin
  Result := False;
  if not ForceSave and FModified then
    case MessageDlg(Format('Save changes to %s?',
      [ExtractFileName(FFileName)]), mtConfirmation, mbYesNoCancel, 0) of
      mrYes: ForceSave := True;
      mrCancel: Exit;
    end;
  if ForceSave then
  begin
    if ChangeName or FUnnamed then
      with MainForm.SaveDialog do
      begin
        FileName := FFileName;
        DefaultExt := #0;
        if not Execute then Exit;
        Rename(FileName);
      end;
    SaveToFile;
  end;
  Result := True;
end;

procedure TEditForm.SaveToFile;
begin
  Memo.Lines.SaveToFile(FFileName);
  FModified := False;
end;

{ TMemoDoc }

procedure TMemoDoc.Clear;
begin
  if FEditForm <> nil then
  begin
    FEditForm.Memo.Clear;
    FEditForm.FModified := True;
  end;
end;

procedure TMemoDoc.Close;
begin
  FEditForm.Free;
end;

function TMemoDoc.Get_FileName: WideString;
begin
  if FEditForm <> nil then
    Result := FEditForm.FFileName else
    Result := '';
end;

function TMemoDoc.Get_Modified: WordBool;
begin
  if FEditForm <> nil then
    Result := FEditForm.FModified else
    Result := False;
end;

procedure TMemoDoc.Insert(const Text: WideString);
begin
  if FEditForm <> nil then FEditForm.Memo.SelText := Text;
end;

procedure TMemoDoc.Save;
begin
  if FEditForm <> nil then FEditForm.SaveToFile;
end;

procedure TMemoDoc.Set_FileName(const Value: WideString);
begin
  if FEditForm <> nil then FEditForm.Rename(Value);
end;

initialization
  TAutoObjectFactory.Create(ComServer, TMemoDoc, Class_MemoDoc, ciInternal);
end.
