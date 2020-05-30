unit main;

interface

uses
  SysUtils, Types, Classes, QGraphics, QControls, QForms, QDialogs,
  QActnList, QImgList, QExtCtrls, QComCtrls, QStdCtrls, QStdActns, QMenus,
  QTypes, About;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    StatusBar1: TStatusBar;
    ActionList1: TActionList;
    ImageList1: TImageList;
    FileNew: TAction;
    FileOpen: TAction;
    FileSave: TAction;
    FileSaveAs: TAction;
    FileExit: TAction;
    HelpAbout: TAction;
    EditCut1: TEditCut;
    EditCopy1: TEditCopy;
    EditPaste1: TEditPaste;
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    About1: TMenuItem;
    Open1: TMenuItem;
    Save1: TMenuItem;
    SaveAs1: TMenuItem;
    N1: TMenuItem;
    Exit1: TMenuItem;
    Edit1: TMenuItem;
    Cut1: TMenuItem;
    Copy1: TMenuItem;
    Paste1: TMenuItem;
    Help1: TMenuItem;
    About2: TMenuItem;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    procedure FileNewExecute(Sender: TObject);
    procedure FileOpenExecute(Sender: TObject);
    procedure FileSaveExecute(Sender: TObject);
    procedure FileSaveAsExecute(Sender: TObject);
    procedure FileExitExecute(Sender: TObject);
    procedure HelpAboutExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    FileName: string;
  end;

var
  Form1: TForm1;

implementation

{$R *.xfm}

procedure TForm1.FileNewExecute(Sender: TObject);
begin
  Memo1.Clear;
  FileName := 'untitled.txt';
  StatusBar1.Panels[0].Text := FileName;
end;

procedure TForm1.FileOpenExecute(Sender: TObject);
begin
  if OpenDialog1.Execute then
  begin
    Memo1.Lines.LoadFromFile(OpenDialog1.FileName);
    FileName := OpenDialog1.FileName;
    StatusBar1.Panels[0].Text := FileName;
  end;
end;

procedure TForm1.FileSaveExecute(Sender: TObject);
begin
  if (FileName = 'untitled.txt') then
    FileSaveAsExecute(nil)
  else
    Memo1.Lines.SaveToFile(FileName);
end;

procedure TForm1.FileSaveAsExecute(Sender: TObject);
begin
  SaveDialog1.FileName := FileName;
  SaveDialog1.InitialDir := ExtractFilePath(FileName);
  if SaveDialog1.Execute then
  begin
    Memo1.Lines.SaveToFile(SaveDialog1.FileName);
    FileName := SaveDialog1.FileName;
    StatusBar1.Panels[0].Text := FileName;
  end;
end;

procedure TForm1.FileExitExecute(Sender: TObject);
begin
   Close;
end;

procedure TForm1.HelpAboutExecute(Sender: TObject);
begin
  AboutBox.ShowModal;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  FileName := 'untitled.txt';
  StatusBar1.Panels[0].Text := FileName;
  Memo1.Clear;
end;

end.
