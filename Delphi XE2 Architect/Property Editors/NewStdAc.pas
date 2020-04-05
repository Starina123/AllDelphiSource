{*******************************************************}
{                                                       }
{            Delphi Visual Component Library            }
{                                                       }
{ Copyright(c) 1995-2011 Embarcadero Technologies, Inc. }
{                                                       }
{*******************************************************}

unit NewStdAc;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ExtCtrls, ComCtrls, ActnList;

type
  TNewStdActionDlg = class(TForm)
    HelpBtn: TButton;
    OKBtn: TButton;
    CancelBtn: TButton;
    ActionList1: TActionList;
    AcceptAction: TAction;
    ActionTree: TTreeView;
    Label1: TLabel;
    procedure HelpBtnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ActionListCompare(Sender: TObject; Item1, Item2: TListItem;
      Data: Integer; var Compare: Integer);
    procedure ActionListDblClick(Sender: TObject);
    procedure AcceptActionUpdate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    FSortColumn: Integer;
    procedure AddAction(const Category: string; ActionClass: TBasicActionClass;
      Info: Pointer);
    function GetRegKey: string;
    procedure ReadSettings;
    procedure WriteSettings;
  end;

implementation

{$R *.dfm}

uses DsnConst, Registry;

procedure TNewStdActionDlg.HelpBtnClick(Sender: TObject);
begin
  Application.HelpContext(HelpContext);
end;

procedure TNewStdActionDlg.AddAction(const Category: string;
  ActionClass: TBasicActionClass; Info: Pointer);
var
  Node: TTreeNode;
  ACat: String;
begin
  Node := nil;
  ACat := Category;
  if Length(ACat) = 0 then
    ACat := SActionCategoryNone;
  if ActionTree.Items.Count > 0 then
  begin
    Node := ActionTree.Items[0];
    while Assigned(Node) do
      if AnsiCompareText(Node.Text, ACat) = 0 then
        Break
      else
        Node := Node.getNextSibling;
  end;
  if not Assigned(Node) then
    Node := ActionTree.Items.AddObject(nil, ACat, nil);
  ActionTree.Items.AddChildObject(Node, ActionClass.ClassName, Pointer(ActionClass));
  Node.Expanded := True;
end;

function TNewStdActionDlg.GetRegKey: string;
begin
                                                                                    
//  Result := Designer.GetBaseRegKey + '\' + sIniEditorsName + '\ActionList Editor';
end;

procedure TNewStdActionDlg.ReadSettings;
var
  I: Integer;
begin
{  with TRegIniFile.Create(GetRegKey) do
  try
    I := ReadInteger('StandardActionsDlg', 'Width', Width);
    if I <= Screen.Width then
      Width := I;
    I := ReadInteger('StandardActionsDlg', 'Height', Height);
    if I <= Screen.Height then
      Height := I;
  finally
    Free;
  end;}
end;

procedure TNewStdActionDlg.WriteSettings;
begin
{  with TRegIniFile.Create(GetRegKey) do
  begin
    EraseSection('StandardActionsDlg');
    WriteInteger('StandardActionsDlg', 'Width', Width);
    WriteInteger('StandardActionsDlg', 'Height', Height);
  end;}
end;

procedure TNewStdActionDlg.FormCreate(Sender: TObject);
var
  Item: TTreeNode;
begin
  ReadSettings;
  ActionTree.Items.BeginUpdate;
  try
    EnumRegisteredActions(AddAction, nil);
//    ActionTree.AlphaSort;
  finally
    ActionTree.Items.EndUpdate;
  end;
  if ActionTree.Items.Count > 1 then
    Item := ActionTree.Items[1]
  else
    Item := ActionTree.Items[0];
  if Item <> nil then
  begin
    Item.Selected := True;
    Item.Focused := True;
  end;
end;

procedure TNewStdActionDlg.FormShow(Sender: TObject);
begin
  ActionTree.SetFocus;
end;

procedure TNewStdActionDlg.ActionListCompare(Sender: TObject; Item1,
  Item2: TListItem; Data: Integer; var Compare: Integer);
begin
  if Abs(FSortColumn) = 1 then
    Compare := FSortColumn * AnsiCompareText(Item1.Caption, Item2.Caption) else
    Compare := FSortColumn * AnsiCompareText(Item1.SubItems[0], Item2.SubItems[0]);
end;

procedure TNewStdActionDlg.ActionListDblClick(Sender: TObject);
begin
  if OKBtn.Enabled then OKBtn.Click;
end;

procedure TNewStdActionDlg.AcceptActionUpdate(Sender: TObject);
begin
  AcceptAction.Enabled := ActionTree.SelectionCount > 0;
end;

procedure TNewStdActionDlg.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  WriteSettings;
end;

end.

