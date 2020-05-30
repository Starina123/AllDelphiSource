unit MainFrm;

interface

uses
  SysUtils, Types, Classes, QGraphics, QControls, QForms, QDialogs,
  QExtCtrls, QComCtrls, QTypes, QMenus, QStdCtrls, QImgList, QActnList,
  QStdActns;

type
  TMainForm = class(TForm)
    MainMenu: TMainMenu;
    StatusBar1: TStatusBar;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    mnuFile: TMenuItem;
    mnuNew: TMenuItem;
    mnuOpen: TMenuItem;
    mnuSave: TMenuItem;
    mnuEdit: TMenuItem;
    mnuCut: TMenuItem;
    mnuCopy: TMenuItem;
    mnuPaste: TMenuItem;
    mnuExit: TMenuItem;
    mnuHelp: TMenuItem;
    mnuAbout: TMenuItem;
    OpenDialog: TOpenDialog;
    SaveDialog: TSaveDialog;
    ActionList: TActionList;
    actnCut: TEditCut;
    actnCopy: TEditCopy;
    actnPaste: TEditPaste;
    actnSelectAll: TEditSelectAll;
    actnDelete: TEditDelete;
    actnWinClose: TWindowClose;
    actnWinCascade: TWindowCascade;
    actnWinTile: TWindowTile;
    actnWinMinimizeAll: TWindowMinimizeAll;
    actnNew: TAction;
    actnSave: TAction;
    actnOpen: TAction;
    actnExit: TAction;
    mnuWindow: TMenuItem;
    mnuTile: TMenuItem;
    N1: TMenuItem;
    mnuSelectAll: TMenuItem;
    mnuMinimize: TMenuItem;
    mnuCascade: TMenuItem;
    mnuClose: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    ToolButton7: TToolButton;
    ImageList: TImageList;
    procedure mnuAboutClick(Sender: TObject);
    procedure actnNewExecute(Sender: TObject);
    procedure actnSaveExecute(Sender: TObject);
    procedure actnOpenExecute(Sender: TObject);
    procedure actnExitExecute(Sender: TObject);
    procedure actnWinCloseExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    procedure CreateMDIChild(const Name: string);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

{$R *.xfm}

uses
  AboutFrm, EditFrm;

resourcestring
  sUntitled = 'Untitled';

procedure TMainForm.CreateMDIChild(const Name: string);
var
  Child: TEditForm;
begin
  { create a new MDI child window }
  Child := TEditForm.Create(Application);
  Child.Caption := Name;
  if FileExists(Name) then Child.MemText.Lines.LoadFromFile(Name);
end;

procedure TMainForm.mnuAboutClick(Sender: TObject);
begin
  ShowAboutBox;
end;

procedure TMainForm.actnNewExecute(Sender: TObject);
begin
  CreateMDIChild(sUntitled + IntToStr(MDIChildCount + 1));
end;

procedure TMainForm.actnSaveExecute(Sender: TObject);
begin
  SaveDialog.FileName := ActiveMDIChild.Caption;
  if SaveDialog.Execute then
  begin
    if ActiveMDIChild is TEditForm then
      TEditForm(ActiveMDIChild).memText.Lines.SaveToFile(SaveDialog.FileName);
    ActiveMDIChild.Caption := SaveDialog.FileName;
  end;
end;

procedure TMainForm.actnOpenExecute(Sender: TObject);
begin
  if OpenDialog.Execute then
  begin
    if ActiveMDIChild is TEditForm then
      TEditForm(ActiveMDIChild).memText.Lines.LoadFromFile(OpenDialog.FileName);
    ActiveMDIChild.Caption := OpenDialog.FileName;
  end;
end;

procedure TMainForm.actnExitExecute(Sender: TObject);
begin
  Close;
end;

procedure TMainForm.actnWinCloseExecute(Sender: TObject);
begin
  ActiveMDIChild.Close;
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  actnNewExecute(nil);
end;

end.
