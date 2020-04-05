{*******************************************************}
{                                                       }
{           CodeGear Delphi Runtime Library             }
{ Copyright(c) 2014-2019 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}
unit RSConfig.PublicPaths;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  Data.Bind.Controls, FMX.Controls.Presentation, FMX.Edit, FMX.Layouts,
  FMX.DialogService, RSConfig.NameValueFrame, FMX.TabControl, FMX.ListBox,
  RSConfig.ListControlFrame;

type
  TPublicPathsFrame = class(TFrame)
    ListControlFrame1: TListControlFrame;
    TabControl: TTabControl;
    ListItem: TTabItem;
    EditItem: TTabItem;
    Layout72: TLayout;
    SaveButton: TButton;
    CancelButton: TButton;
    Layout2: TLayout;
    PathEdit: TEdit;
    Label2: TLabel;
    Layout3: TLayout;
    Label3: TLabel;
    Layout4: TLayout;
    Label4: TLabel;
    Layout5: TLayout;
    DirectoryEdit: TEdit;
    Label5: TLabel;
    Layout6: TLayout;
    DefaultEdit: TEdit;
    Label6: TLabel;
    ExtensionsLB: TListBox;
    MimesLB: TListBox;
    VertScrollBox2: TVertScrollBox;
    Layout7: TLayout;
    Layout8: TLayout;
    RemoveExtButton: TButton;
    AddExtButton: TButton;
    RemoveMimesButton: TButton;
    AddMimesButton: TButton;
    ConfigButton: TButton;
    ListBox1: TListBox;
    Layout1: TLayout;
    CharsetEdit: TEdit;
    Label1: TLabel;
    procedure AddExtButtonClick(Sender: TObject);
    procedure RemoveExtButtonClick(Sender: TObject);
    procedure RemoveMimesButtonClick(Sender: TObject);
    procedure AddMimesButtonClick(Sender: TObject);
    procedure SaveButtonClick(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
    procedure ConfigButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    ActiveFrame: TNameValueFrame;
    constructor Create(AOwner: TComponent); override;
    procedure Callback(Sender: TObject);
    procedure LoadSectionList;
    procedure SaveSectionList;
    procedure ClearFields;
    procedure Reset;
  end;

implementation

{$R *.fmx}

uses
  RSConsole.FormConfig, RSConfig.ConfigDM, RSConfig.Consts;

constructor TPublicPathsFrame.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  ListControlFrame1.HelpButton.Hint := strPublicPathsHelp;
end;

procedure TPublicPathsFrame.Reset;
begin
  if TabControl.ActiveTab = EditItem then
    CancelButtonClick(Self);
end;

procedure TPublicPathsFrame.AddExtButtonClick(Sender: TObject);
begin
  TDialogService.InputQuery(strFileExtInputQuery, [strFileExtPrompt], [''],
    procedure(const AResult: TModalResult; const Values: array of string)
    begin
      if AResult = mrOk then
        ExtensionsLB.Items.Add(Values[0]);
    end);
end;

procedure TPublicPathsFrame.AddMimesButtonClick(Sender: TObject);
begin
  TDialogService.InputQuery(strMimeInputQuery, [strMimePrompt], [''],
    procedure(const AResult: TModalResult; const Values: array of string)
    begin
      if AResult = mrOk then
        MimesLB.Items.Add(Values[0]);
    end);
end;

procedure TPublicPathsFrame.Callback(Sender: TObject);
var
  LPublicPathsItem: TPublicPathsItem;
  LIndex: Integer;
begin
  ActiveFrame := TNameValueFrame(Sender);
  if Assigned(ActiveFrame) then
  begin
    if ActiveFrame.ValueEdit.Text <> '' then
    begin
      LPublicPathsItem := TPublicPathsItem.FromJson(ActiveFrame.ValueEdit.Text);
      try
        DefaultEdit.Text := LPublicPathsItem.Default;
        DirectoryEdit.Text := LPublicPathsItem.Directory;
        for LIndex := Low(LPublicPathsItem.Extensions) to High(LPublicPathsItem.Extensions) do
          ExtensionsLB.Items.Add(LPublicPathsItem.Extensions[LIndex]);
        for LIndex := Low(LPublicPathsItem.Mimes) to High(LPublicPathsItem.Mimes) do
          MimesLB.Items.Add(LPublicPathsItem.Mimes[LIndex]);
        PathEdit.Text := LPublicPathsItem.Path;
        CharsetEdit.Text := LPublicPathsItem.Charset;
      finally
        LPublicPathsItem.Free;
      end;
    end;
    TabControl.ActiveTab := EditItem;
    ConfigForm.SaveLayout.Visible := False;
  end;
end;

procedure TPublicPathsFrame.CancelButtonClick(Sender: TObject);
begin
  ClearFields;
  TabControl.ActiveTab := ListItem;
  ConfigForm.SaveLayout.Visible := True;
end;

procedure TPublicPathsFrame.LoadSectionList;
begin
  ListControlFrame1.SetFrameType(PUBLICPATHS_FRAME);
  ListControlFrame1.SetListBox(ListBox1);
  ListControlFrame1.SetCallback(Callback);
  ConfigDM.LoadSectionList(strServerPublicPaths, ListBox1, Callback);
end;

procedure TPublicPathsFrame.RemoveExtButtonClick(Sender: TObject);
begin
  if ExtensionsLB.ItemIndex > -1 then
    ExtensionsLB.Items.Delete(ExtensionsLB.ItemIndex);
end;

procedure TPublicPathsFrame.RemoveMimesButtonClick(Sender: TObject);
begin
  if MimesLB.ItemIndex > -1 then
    MimesLB.Items.Delete(MimesLB.ItemIndex);
end;

procedure TPublicPathsFrame.SaveButtonClick(Sender: TObject);
var
  LPublicPathsItem: TPublicPathsItem;
  LIndex: Integer;
begin
  if Assigned(ActiveFrame) then
  begin
    LPublicPathsItem := TPublicPathsItem.Create;
    try
      LPublicPathsItem.Default := DefaultEdit.Text;
      LPublicPathsItem.Directory := DirectoryEdit.Text;
      for LIndex := 0 to ExtensionsLB.Items.Count - 1 do
        LPublicPathsItem.Extensions := LPublicPathsItem.Extensions +
          [ExtensionsLB.Items[LIndex]];
      for LIndex := 0 to MimesLB.Items.Count - 1 do
        LPublicPathsItem.Mimes := LPublicPathsItem.Mimes +
          [MimesLB.Items[LIndex]];
      LPublicPathsItem.Path := PathEdit.Text;
      LPublicPathsItem.Charset := CharsetEdit.Text;
      ActiveFrame.ValueEdit.Text := LPublicPathsItem.ToJson;
    finally
      LPublicPathsItem.Free;
    end;
    ClearFields;
    ActiveFrame := nil;
  end;
  TabControl.ActiveTab := ListItem;
  ConfigForm.SaveLayout.Visible := True;
end;

procedure TPublicPathsFrame.ClearFields;
begin
  DefaultEdit.Text := '';
  DirectoryEdit.Text := '';
  ExtensionsLB.Items.Clear;
  MimesLB.Items.Clear;
  PathEdit.Text := '';
end;

procedure TPublicPathsFrame.ConfigButtonClick(Sender: TObject);
var
  LRoot: string;
  LDirectory: string;
begin
  if DirectoryEdit.Text <> '' then
    LDirectory := DirectoryEdit.Text
  else
    LDirectory := GetCurrentDir;

  LRoot := '';

  if SelectDirectory(strSelectDirPrompt, LRoot, LDirectory) then
    DirectoryEdit.Text := LDirectory;
end;

procedure TPublicPathsFrame.SaveSectionList;
begin
  ConfigDM.SaveSectionList(strServerPublicPaths, ListBox1);
end;

end.
