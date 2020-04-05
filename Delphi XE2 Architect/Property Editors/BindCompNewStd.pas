{*******************************************************}
{                                                       }
{             Delphi LiveBindings Framework             }
{                                                       }
{ Copyright(c) 2011 Embarcadero Technologies, Inc.      }
{                                                       }
{*******************************************************}

unit BindCompNewStd;

interface

uses Winapi.Windows, System.SysUtils, System.Classes, Vcl.Graphics, Vcl.Forms, Vcl.Controls, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.ActnList, Data.Bind.Components, DesignIntf;

type
  TNewStdDataBindingDlg = class(TForm)
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
    procedure DataBindingListCompare(Sender: TObject; Item1, Item2: TListItem;
      Data: Integer; var Compare: Integer);
    procedure DataBindingListDblClick(Sender: TObject);
    procedure AcceptActionUpdate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    FSortColumn: Integer;
    FActiveClassGroup: TPersistentClass;
    FDesigner: IDesigner;
    FAllowClass: TFunc<TContainedBindCompClass, Boolean>;
    procedure AddDataBinding(const Category: string; DataBindingClass: TContainedBindCompClass;
      Info: Pointer);
    function GetRegKey: string;
    procedure ReadSettings;
    procedure WriteSettings;
    procedure SetDesigner(const Value: IDesigner);
    procedure SetAllowClass(
      const Value: TFunc<TContainedBindCompClass, Boolean>);
  public
    property DesignerIntf: IDesigner read FDesigner write SetDesigner;
    property AllowClass: TFunc<TContainedBindCompClass, Boolean> read FAllowClass write SetAllowClass;
  end;

implementation

{$R *.dfm}

uses DsnConst, System.Win.Registry;

procedure TNewStdDataBindingDlg.HelpBtnClick(Sender: TObject);
begin
  Application.HelpContext(HelpContext);
end;

procedure TNewStdDataBindingDlg.AddDataBinding(const Category: string;
  DataBindingClass: TContainedBindCompClass; Info: Pointer);
var
  Node: TTreeNode;
  ACat: String;
  LClassGroup: TPersistentClass;
begin

  Assert(FActiveClassGroup <> nil);
  LClassGroup := System.Classes.ClassGroupOf(DataBindingClass);
  //if not (LClassGroup = TPersistent) or (LClassGroup = FActiveClassGroup) then
  if not FActiveClassGroup.InheritsFrom(LClassGroup) then
    Exit;
  if Assigned(FAllowClass) then
    if not FAllowClass(DataBindingClass) then
      Exit;

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
  ActionTree.Items.AddChildObject(Node, DataBindingClass.ClassName, Pointer(DataBindingClass));
  Node.Expanded := True;
end;

function TNewStdDataBindingDlg.GetRegKey: string;
begin
                                                                                    
//  Result := Designer.GetBaseRegKey + '\' + sIniEditorsName + '\ActionList Editor';
end;

procedure TNewStdDataBindingDlg.ReadSettings;
//var
//  I: Integer;
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

procedure TNewStdDataBindingDlg.SetAllowClass(
  const Value: TFunc<TContainedBindCompClass, Boolean>);
begin
  FAllowClass := Value;
end;

procedure TNewStdDataBindingDlg.SetDesigner(const Value: IDesigner);
begin
  FDesigner := Value;
  FActiveClassGroup := FDesigner.ActiveClassGroup;
end;

procedure TNewStdDataBindingDlg.WriteSettings;
begin
{  with TRegIniFile.Create(GetRegKey) do
  begin
    EraseSection('StandardActionsDlg');
    WriteInteger('StandardActionsDlg', 'Width', Width);
    WriteInteger('StandardActionsDlg', 'Height', Height);
  end;}
end;

procedure TNewStdDataBindingDlg.FormCreate(Sender: TObject);
begin
//
end;

procedure TNewStdDataBindingDlg.FormShow(Sender: TObject);
var
  Item: TTreeNode;
begin
  Assert(FDesigner <> nil);
  ReadSettings;
  ActionTree.Items.BeginUpdate;
  try
    EnumRegisteredBindComponents(AddDataBinding, nil);
//    ActionTree.AlphaSort;
  finally
    ActionTree.Items.EndUpdate;
  end;
  Item := nil;
  if ActionTree.Items.Count > 1 then
    Item := ActionTree.Items[1]
  else if ActionTree.Items.Count > 0 then
    Item := ActionTree.Items[0];
  if Item <> nil then
  begin
    Item.Selected := True;
    Item.Focused := True;
  end;



  ActionTree.SetFocus;
end;

procedure TNewStdDataBindingDlg.DataBindingListCompare(Sender: TObject; Item1,
  Item2: TListItem; Data: Integer; var Compare: Integer);
begin
  if Abs(FSortColumn) = 1 then
    Compare := FSortColumn * AnsiCompareText(Item1.Caption, Item2.Caption) else
    Compare := FSortColumn * AnsiCompareText(Item1.SubItems[0], Item2.SubItems[0]);
end;

procedure TNewStdDataBindingDlg.DataBindingListDblClick(Sender: TObject);
begin
  if OKBtn.Enabled then OKBtn.Click;
end;

procedure TNewStdDataBindingDlg.AcceptActionUpdate(Sender: TObject);
begin
  AcceptAction.Enabled := (ActionTree.Selected <> nil) and
     Assigned(ActionTree.Selected.Data);
end;

procedure TNewStdDataBindingDlg.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  WriteSettings;
end;

end.

