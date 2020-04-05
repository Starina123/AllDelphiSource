{*******************************************************}
{                                                       }
{           CodeGear Delphi Runtime Library             }
{ Copyright(c) 2014-2019 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}
unit RSConsole.Form;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Menus,
  FMX.StdCtrls, FMX.Layouts, System.IOUtils, FMX.Controls.Presentation,
  FMX.Grid.Style, FMX.ScrollBox, FMX.ListBox, FMX.MultiView, FMX.DialogService,
  RSConsole.FrameAdd, RSConsole.FramePush, RSConsole.FrameViews,
  RSConsole.FrameSettings, RSConsole.FrameExplorer, System.ImageList,
  FMX.ImgList, FMX.Styles, FMX.TreeView, FMX.Effects, FMX.Filter.Effects,
  FMX.Objects;

type
  TMainForm = class(TForm)
    ViewsLayout: TLayout;
    MainMenu: TMainMenu;
    ProfileMenu: TMenuItem;
    RenameProfile: TMenuItem;
    ExportProfile: TMenuItem;
    ImportProfile: TMenuItem;
    NewProfile: TMenuItem;
    RemoveProfile: TMenuItem;
    FileMenu: TMenuItem;
    HelpMenu: TMenuItem;
    MultiView: TMultiView;
    ConfigServerButton: TButton;
    EditProfile: TMenuItem;
    StyleMenu: TMenuItem;
    DarkStyleMenu: TMenuItem;
    LightStyleMenu: TMenuItem;
    NewProfileButton: TButton;
    RemoveProfileButton: TButton;
    SeperatorItem: TMenuItem;
    ConfigServerItem: TMenuItem;
    CloseItem: TMenuItem;
    Seperater2Item: TMenuItem;
    StatusBar: TStatusBar;
    StatusBarLabel: TLabel;
    ToggleStyleButton: TButton;
    ToolBar1: TToolBar;
    ConnTreeView: TTreeView;
    ViewsFrame: TViewsFrame;
    Label3: TLabel;
    Image3: TImage;
    NewFillRGBEffect: TFillRGBEffect;
    Label1: TLabel;
    Image1: TImage;
    ConfigFillRGBEffect: TFillRGBEffect;
    Label2: TLabel;
    Image2: TImage;
    RemoveFillRGBEffect: TFillRGBEffect;
    ViewMenu: TMenuItem;
    ToggleConnMenu: TMenuItem;
    Image5: TImage;
    ToggleFillRGBEffect: TFillRGBEffect;
    Label5: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure NewProfileClick(Sender: TObject);
    procedure ImportProfileClick(Sender: TObject);
    procedure ExportProfileClick(Sender: TObject);
    procedure RenameProfileClick(Sender: TObject);
    procedure RemoveProfileClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure HelpMenuClick(Sender: TObject);
    procedure EditProfileClick(Sender: TObject);
    procedure NewProfileButtonClick(Sender: TObject);
    procedure RemoveProfileButtonClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
    procedure DarkStyleMenuClick(Sender: TObject);
    procedure LightStyleMenuClick(Sender: TObject);
    procedure ConfigServerButtonClick(Sender: TObject);
    procedure CloseItemClick(Sender: TObject);
    procedure ConfigServerItemClick(Sender: TObject);
    procedure ConnTreeViewChange(Sender: TObject);
    procedure ConnTreeViewDblClick(Sender: TObject);
    procedure ToggleConnMenuClick(Sender: TObject);
    procedure ToggleStyleButtonClick(Sender: TObject);
  private
    { Private declarations }
    FSelection: String;
    FCurrentStyle: String;
  public
    { Public declarations }
    procedure UpdateStyle(const AStyle: string);
    procedure ApplyStyle(AForm: TForm);
    function GetStyle: String;
    procedure SetStyle(const AStyle: String);
    procedure SaveProfile;
    procedure RefreshProfile;
    procedure RefreshEndpoints;
    procedure ChangeTab(AIndex: Integer);
    procedure SetStatus(const AStatus: String);
    procedure ChildItemClick(Sender: TObject);
  end;

var
  MainForm: TMainForm;

var
  DefaultStorageFolder: string = '';
  // will be initialized on startup

implementation

uses
  RSConsole.FormConfig, System.StrUtils, RSConsole.FormConnection,
  RSConsole.Consts, RSConsole.ExplorerConsts,
  RSConsole.ModuleBackend, RSConsole.MRUList, RSConsole.SettingsList,
  RSConsole.RESTObjects
{$IF DEFINED(MSWINDOWS)}
    , Winapi.Windows, Winapi.ShellAPI, Registry
{$ENDIF}
    ;

{$R *.fmx}

procedure TMainForm.CloseItemClick(Sender: TObject);
begin
  Close;
end;

procedure TMainForm.ConfigServerButtonClick(Sender: TObject);
begin
  ConfigForm.ShowModal;
end;

procedure TMainForm.ConfigServerItemClick(Sender: TObject);
begin
  ConfigServerButtonClick(Sender);
end;

procedure TMainForm.ConnTreeViewChange(Sender: TObject);
begin
  RefreshProfile;
  RefreshEndpoints;
end;

procedure TMainForm.ConnTreeViewDblClick(Sender: TObject);
begin
  EditProfileClick(Sender);
end;

procedure TMainForm.DarkStyleMenuClick(Sender: TObject);
begin
  FCurrentStyle := strDarkStyle;
  SetStyle(FCurrentStyle);
  ApplyStyle(MainForm);
end;

procedure TMainForm.EditProfileClick(Sender: TObject);
begin
  if ConnTreeView.Selected <> nil then
    if ConnTreeView.Selected.Tag = ROOT_ITEM then
      ConnectionForm.ShowModal;
end;

procedure TMainForm.ExportProfileClick(Sender: TObject);
var
  LFileName: string;
  LButtonSelected: Integer;
  LDialog: TSaveDialog;
begin
  LDialog := TSaveDialog.Create(Self);
  try
    LDialog.Filter := strProfileFile + '|*' + strRSP + ';*' + strEMSP + ';';
    if LDialog.Execute then
    begin
      LFileName := LDialog.FileName;
      if SameText(ExtractFileExt(LFileName), '.') then
        LFileName := ChangeFileExt(LFileName, strRSP);
      if FileExists(LFileName) then
      begin
        LButtonSelected := MessageDlg(strFileExist + #10#13 + strReplaceIt,
          TMsgDlgType.mtWarning, [TMsgDlgBtn.mbYes, TMsgDlgBtn.mbNo], 0);
        if LButtonSelected = mrYes then
          ConnectionForm.SettingsFrame.WriteConfiguratonFile(LFileName)
      end
      else
        ConnectionForm.SettingsFrame.WriteConfiguratonFile(LFileName);
    end;
  finally
    LDialog.Free;
  end;
end;

procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  BackendDM.Closing := True;
  SaveProfile;

  ViewsFrame.ExplorerFrame.Cleanup;

  Action := TCloseAction.caFree;
end;

procedure TMainForm.UpdateStyle(const AStyle: string);
begin
  if AStyle = strDarkStyle then
  begin
    NewFillRGBEffect.Enabled := False;
    RemoveFillRGBEffect.Enabled := False;
    ConfigFillRGBEffect.Enabled := False;
    ToggleFillRGBEffect.Enabled := False;
  end
  else if (AStyle = strLightStyle) or (AStyle = '') then
  begin
    NewFillRGBEffect.Enabled := True;
    RemoveFillRGBEffect.Enabled := True;
    ConfigFillRGBEffect.Enabled := True;
    ToggleFillRGBEffect.Enabled := True;
  end;
end;

procedure TMainForm.ApplyStyle(AForm: TForm);
begin
  if FCurrentStyle = strDarkStyle then
    TStyleManager.TrySetStyleFromResource(strDarkResName)
  else if (FCurrentStyle = strLightStyle) or (FCurrentStyle = '') then
    TStyleManager.TrySetStyleFromResource(strLightResName);

  UpdateStyle(FCurrentStyle);
  ViewsFrame.UpdateStyle(FCurrentStyle);
end;

procedure TMainForm.SetStyle(const AStyle: String);
{$IFDEF MSWINDOWS}
var
  LRegistry: TRegistry;
{$ENDIF}
begin
{$IFDEF MSWINDOWS}
  LRegistry := TRegistry.Create;

  try
    if LRegistry.OpenKey(EMS_REGISTRY_KEY, True) then
      LRegistry.WriteString(EMS_STYLE_NAME, AStyle);
  finally
    LRegistry.Free;
  end;
{$ENDIF}
end;

procedure TMainForm.ToggleStyleButtonClick(Sender: TObject);
begin
  if FCurrentStyle=strLightStyle then
    FCurrentStyle := strDarkStyle
  else
    FCurrentStyle := strLightStyle;
  SetStyle(FCurrentStyle);
  ApplyStyle(MainForm);
end;

function TMainForm.GetStyle: String;
{$IFDEF MSWINDOWS}
var
  LRegistry: TRegistry;
{$ENDIF}
begin
{$IFDEF MSWINDOWS}
  LRegistry := TRegistry.Create;

  try
    if LRegistry.OpenKeyReadOnly(EMS_REGISTRY_KEY) then
      Result := LRegistry.ReadString(EMS_STYLE_NAME);
  finally
    LRegistry.Free;
  end;
{$ENDIF}
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  FSelection := '';

  FCurrentStyle := GetStyle;
  ApplyStyle(MainForm);

  ViewsFrame.ExplorerFrame.InitFrame(DefaultStorageFolder);
end;

procedure TMainForm.FormKeyDown(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin
  if Key = vkF9 then
  begin
    Key := 0;
    ViewsFrame.ExplorerFrame.DoExecuteRequest;
  end;
end;

procedure TMainForm.HelpMenuClick(Sender: TObject);
begin
{$IF DEFINED(MSWINDOWS)}
  ShellExecute(0, 'OPEN', PChar('http://docwiki.embarcadero.com/RADStudio' +
    strURLtoHelp), '', '', SW_SHOWNORMAL);
{$ENDIF}
end;

procedure TMainForm.ImportProfileClick(Sender: TObject);
var
  LDialog: TOpenDialog;
begin
  LDialog := TOpenDialog.Create(Self);
  try
    LDialog.Filter := strProfileFile + '|*' + strRSP + ';*' + strEMSP + ';';
    if LDialog.Execute then
      ConnectionForm.SettingsFrame.OpenProfiles(LDialog.FileName)
  finally
    LDialog.Free;
  end;
end;

procedure TMainForm.NewProfileButtonClick(Sender: TObject);
begin
  NewProfileClick(Sender);
end;

procedure TMainForm.NewProfileClick(Sender: TObject);
begin
  BackendDM.Closing := False;
  SaveProfile;
  ConnectionForm.SettingsFrame.NewConnection;
  ConnectionForm.SettingsFrame.Enabled := True;
  ViewsLayout.Enabled := True;
  ConnectionForm.ShowModal;
end;

procedure TMainForm.RefreshProfile;
begin
  if ConnTreeView.Selected <> nil then
  begin
    if ConnTreeView.Selected.Tag = ROOT_ITEM then
      ConnectionForm.SetTitle(ConnTreeView.Selected.Text)
    else
      ConnectionForm.SetTitle(ConnTreeView.Selected.ParentItem.Text);
  end
  else
    ConnectionForm.SetTitle('');

  ConnectionForm.SettingsFrame.RefreshProfile;
end;

procedure TMainForm.RemoveProfileButtonClick(Sender: TObject);
begin
  RemoveProfileClick(Sender);
end;

procedure TMainForm.RemoveProfileClick(Sender: TObject);
begin
  if ConnTreeView.Selected <> nil then
  begin
    if ConnTreeView.Selected.Tag = ROOT_ITEM then
      ConnectionForm.SettingsFrame.DeleteFromRegistry(ConnTreeView.Selected.Text)
    else
      ConnectionForm.SettingsFrame.DeleteFromRegistry(ConnTreeView.Selected.ParentItem.Text);
  end;
  if ConnTreeView.Count <= 0 then
  begin
    ViewsLayout.Enabled := False;
    ConnectionForm.SettingsFrame.Enabled := False;
  end;
end;

procedure TMainForm.RenameProfileClick(Sender: TObject);
var
  LName: string;
begin
  if ConnTreeView.Selected <> nil then
  begin
    LName := InputBox(strSaveProfileReg, strTypeProfName, '');
    if LName <> '' then
      ConnectionForm.SettingsFrame.RenameProfile(LName);
  end;
end;

procedure TMainForm.SetStatus(const AStatus: String);
begin
  StatusBarLabel.Text := AStatus;
end;

procedure TMainForm.SaveProfile;
begin
  if (ConnTreeView.Selected <> nil) and ConnectionForm.SettingsFrame.Registry.RegSettingsMofified then
  begin
    if ConnTreeView.Selected.Tag = ROOT_ITEM then
      ConnectionForm.SettingsFrame.SaveToRegistry(ConnTreeView.Selected.Text)
    else
      ConnectionForm.SettingsFrame.SaveToRegistry(ConnTreeView.Selected.ParentItem.Text);
  end;
end;

procedure TMainForm.LightStyleMenuClick(Sender: TObject);
begin
  FCurrentStyle := strLightStyle;
  SetStyle(FCurrentStyle);
  ApplyStyle(MainForm);
end;

procedure TMainForm.ToggleConnMenuClick(Sender: TObject);
begin
  MultiView.Visible := not MultiView.Visible;
end;

procedure TMainForm.ChangeTab(AIndex: Integer);
begin
  ViewsFrame.ChangeTab(AIndex);
end;

procedure TMainForm.ChildItemClick(Sender: TObject);
begin
  if Sender is TTreeViewItem then
    MainForm.ChangeTab(TTreeViewItem(Sender).Tag);
end;

procedure TMainForm.RefreshEndpoints;
begin
  ViewsFrame.RefreshEndpoints;
end;

initialization

  DefaultStorageFolder := IncludeTrailingPathDelimiter
    (System.IOUtils.TPath.GetDocumentsPath) + strSettingsPath + PathDelim;

  if not TDirectory.Exists(DefaultStorageFolder) then
    TDirectory.CreateDirectory(DefaultStorageFolder);

end.
