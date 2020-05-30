unit MainFrm;

{ MemoEdit is a simple OLE Automation enabled MDI-style text editor. The
  application contains the following units:

  MainFrm    The MDI main form.
  EditFrm    The MDI child form class and its automation class.
  MemoAuto   The Application automation object.

  To register the MemoEdit application as an OLE Automation server, run it
  using the command line "MemoEdit /regserver". To unregister the application,
  use "MemoEdit /unregserver".  You may also do this by running the application
  from the IDE by specifying the command line parameters using the
  Run|Parameters dialog. }

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, EditFrm;

type
  TMainForm = class(TForm)
    MainMenu: TMainMenu;
    FileMenu: TMenuItem;
    FileNewItem: TMenuItem;
    FileOpenItem: TMenuItem;
    FileExitItem: TMenuItem;
    WindowMenu: TMenuItem;
    WindowCascadeItem: TMenuItem;
    WindowTileItem: TMenuItem;
    WindowArrangeIconsItem: TMenuItem;
    OpenDialog: TOpenDialog;
    SaveDialog: TSaveDialog;
    procedure FileNewItemClick(Sender: TObject);
    procedure FileOpenItemClick(Sender: TObject);
    procedure FileExitItemClick(Sender: TObject);
    procedure WindowTileItemClick(Sender: TObject);
    procedure WindowCascadeItemClick(Sender: TObject);
    procedure WindowArrangeIconsItemClick(Sender: TObject);
  public
    Local: Boolean;
    NewFileName: string;
    function CreateMemo(const FileName: string): TEditForm;
    function CreateMemoLocal(const FileName: string): TEditForm;


  end;

var
  MainForm: TMainForm;

implementation

{$R *.dfm}

procedure TMainForm.FileNewItemClick(Sender: TObject);
begin
  CreateMemoLocal('');
end;

procedure TMainForm.FileOpenItemClick(Sender: TObject);
begin
  OpenDialog.FileName := '';
  if OpenDialog.Execute then CreateMemo(OpenDialog.FileName);
end;

procedure TMainForm.FileExitItemClick(Sender: TObject);
begin
  Close;
end;

procedure TMainForm.WindowTileItemClick(Sender: TObject);
begin
  Tile;
end;

procedure TMainForm.WindowCascadeItemClick(Sender: TObject);
begin
  Cascade;
end;

procedure TMainForm.WindowArrangeIconsItemClick(Sender: TObject);
begin
  ArrangeIcons;
end;

function TMainForm.CreateMemo(const FileName: string): TEditForm;
begin
  NewFileName := ExpandFileName(FileName);
  Result := TEditForm.Create(Application);
end;

function TMainForm.CreateMemoLocal(const FileName: string): TEditForm;
begin
  Local := true;
  NewFileName := ExpandFileName(FileName);
  Result := TEditForm.Create(Application);
end;
end.
