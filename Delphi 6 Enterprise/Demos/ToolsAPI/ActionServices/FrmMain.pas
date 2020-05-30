unit FrmMain;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, ToolsAPI,
  StdCtrls, ComCtrls, ToolWin, ImgList;

type
  TForm2 = class(TForm)
    ListBox1: TListBox;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ImageList1: TImageList;
    ToolButton5: TToolButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ToolButton1Click(Sender: TObject);
    procedure ToolButton2Click(Sender: TObject);
    procedure ToolButton3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ToolButton4Click(Sender: TObject);
    procedure ToolButton5Click(Sender: TObject);
    procedure ListBox1DblClick(Sender: TObject);
  private
    { Private declarations }
    procedure UpdateFileNames;
  public
    { Public declarations }
  end;

var
  Form2: TForm2 = nil;

implementation

{$R *.dfm}

procedure TForm2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  Form2 := nil;
end;

procedure TForm2.ToolButton1Click(Sender: TObject);
begin
  with TOpenDialog.Create(nil) do
  begin
    Filter := 'Delphi files|*.bpg;*.dpr;*.dpk;*.pas|All files (*.*)|*.*';
    if Execute then
    begin
      (BorlandIDEServices as IOTAActionServices).OpenFile(FileName);
      UpdateFileNames;
    end;
    Free;
  end;
end;

procedure TForm2.ToolButton2Click(Sender: TObject);
begin
  (BorlandIDEServices as IOTAActionServices).CloseFile(ListBox1.Items[ListBox1.ItemIndex]);
  UpdateFileNames;
end;

procedure TForm2.ToolButton3Click(Sender: TObject);
begin
  (BorlandIDEServices as IOTAActionServices).SaveFile(ListBox1.Items[ListBox1.ItemIndex]);
  UpdateFileNames;
end;

procedure TForm2.FormShow(Sender: TObject);
begin
  UpdateFileNames;
end;

procedure TForm2.UpdateFileNames;
var
  Count: Integer;
  i: Integer;

begin
  ListBox1.Items.Clear;
  Count := (BorlandIDEServices as IOTAModuleServices).ModuleCount;
  for i := 0 to Count-1 do
    ListBox1.Items.Add((BorlandIDEServices as IOTAModuleServices).Modules[i].FileName);

  ListBox1.ItemIndex := 0;
end;

procedure TForm2.ToolButton4Click(Sender: TObject);
begin
  (BorlandIDEServices as IOTAActionServices).ReloadFile(ListBox1.Items[ListBox1.ItemIndex]);
  UpdateFileNames;
end;

procedure TForm2.ToolButton5Click(Sender: TObject);
resourcestring
  sNewGroup = 'Create a new group?';

var
  NewGroup: Boolean;
  
begin
  NewGroup := False;
  
  with TOpenDialog.Create(nil) do
  begin
    Filter := 'Delphi project files|*.bpg;*.dpr;*.dpk|All files (*.*)|*.*';

    if Execute then
    begin
      if MessageDlg(sNewGroup, mtInformation, [mbYes, mbNo], 0) = mrYes then
        NewGroup := True;
      (BorlandIDEServices as IOTAActionServices).OpenProject(FileName, NewGroup);
      UpdateFileNames;
    end;
  end;
end;

procedure TForm2.ListBox1DblClick(Sender: TObject);
begin
  (BorlandIDEServices as IOTAActionServices).OpenFile(ListBox1.Items[ListBox1.ItemIndex]);
  UpdateFileNames;
end;

end.
