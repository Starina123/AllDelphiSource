{*******************************************************}
{                                                       }
{           CodeGear Delphi Runtime Library             }
{ Copyright(c) 2014-2019 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}
unit RSConsole.FrameSettings;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.TabControl, FMX.Controls.Presentation, FMX.Edit, FMX.ListBox,
  RSConsole.Data, RSSetUp.Config, FMX.Layouts, FMX.TreeView;

type
  TSettingsFrame = class(TFrame)
    ConnectionInfoControl: TTabControl;
    ConnectionTabItem: TTabItem;
    KeysTabItem: TTabItem;
    ProxyTabItem: TTabItem;
    AuthenticateTabItem: TTabItem;
    Layout3: TLayout;
    PortLabel: TLabel;
    URLLabel: TLabel;
    Layout5: TLayout;
    Layout7: TLayout;
    Layout9: TLayout;
    CheckBoxHTTPS: TCheckBox;
    HostEdit: TEdit;
    PortEdit: TEdit;
    TestConnectionButton: TButton;
    URLEdit: TEdit;
    ProxyPortLabel: TLabel;
    ProxyServerLabel: TLabel;
    ProxyPortEdit: TEdit;
    ProxyServerEdit: TEdit;
    ApplicationIDLabel: TLabel;
    AppSecretLabel: TLabel;
    AppIDEdit: TEdit;
    AppSecretEdit: TEdit;
    MasterSecretLabel: TLabel;
    PassLabel: TLabel;
    UserLabel: TLabel;
    LoginButton: TButton;
    LogoutButton: TButton;
    MasterSecretEdit: TEdit;
    MSecretCheckBox: TCheckBox;
    PassEdit: TEdit;
    UserEdit: TEdit;
    TabItem1: TTabItem;
    Layout10: TLayout;
    TenantSecretEdit: TEdit;
    TenantIDEdit: TEdit;
    TenantSecretLabel: TLabel;
    TenantIDLabel: TLabel;
    HostLayout: TLayout;
    HostLabel: TLabel;
    PortLayout: TLayout;
    URLPathLayout: TLayout;
    ButtonLayout: TLayout;
    CloseButton: TButton;
    ProxyServerLayout: TLayout;
    ProxyPortLayout: TLayout;
    AppSecretLayout: TLayout;
    AppIdLayout: TLayout;
    UsernameLayout: TLayout;
    PasswordLayout: TLayout;
    MasterSecretCBLayout: TLayout;
    MasterSecretLayout: TLayout;
    ButtonsLayout: TLayout;
    TenantIdLayout: TLayout;
    TenantSecretLayout: TLayout;
    Layout2: TLayout;
    Layout1: TLayout;
    TimeoutEdit: TEdit;
    Label1: TLabel;
    procedure EditChange(Sender: TObject);
    procedure MSecretCheckBoxChange(Sender: TObject);
    procedure TestConnectionButtonClick(Sender: TObject);
    procedure UserEditKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
    procedure LoginButtonClick(Sender: TObject);
    procedure LogoutButtonClick(Sender: TObject);
    procedure HostEditKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
    procedure CloseButtonClick(Sender: TObject);
  private
    { Private declarations }
    FRegistry: TEMSManagementRegistry;
    procedure LoadProfileNamesToCombo(const AName: string);
    procedure SetConnectionInfo;
    procedure SetCredentialsInfo;
    function LoadConfiguratonFile(const AFileName: string): Boolean;
    procedure SetFieldsToEdits;
    function GetConnectionProperties
      : TEMSManagementRegistry.TConnectionProperties;
    function GetCredentialsProperties
      : TEMSManagementRegistry.TCredentialsProperties;
    function GetProtocol: String;
    procedure ResetConnection;
    procedure ResetCredentials;
    function LoadDefaultProfileFromRegistry: Boolean;
    function GetNewProfileName: string;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure NewConnection;
    function ShowDefaultProfile: Boolean;
    procedure SaveToRegistry(const AName: string);
    procedure DeleteFromRegistry(const AName: string);
    procedure OpenProfiles(AFileName: TFileName);
    procedure RenameProfile(const AName: string);
    function WriteConfiguratonFile(const AFileName: string): Boolean;
    procedure SetRequestInfo;
    procedure RefreshProfile;
    procedure AddConn(const AName: String; ATreeView: TTreeView; AEvent: TNotifyEvent; ASelected: Boolean = False);
    procedure AddConnChild(const AName: String; AItemType: Integer; ATreeViewItem: TTreeViewItem; AEvent: TNotifyEvent);
    function GetTreeViewItemIndexOf(const AName: String): Integer;
    property Registry: TEMSManagementRegistry read FRegistry write FRegistry;
  end;

implementation

uses RSConsole.Consts, REST.Backend.Providers,
  RSConsole.ModuleBackend, RSConsole.Form, RSConsole.FormConnection;

{$R *.fmx}
{ TSettingsFrame }

constructor TSettingsFrame.Create(AOwner: TComponent);
begin
  inherited;
  Registry := TEMSManagementRegistry.Create;
  Registry.RegSettingsMofified := False;
  SetRequestInfo;
end;

destructor TSettingsFrame.Destroy;
begin
  Registry.Free;
  inherited;
end;

procedure TSettingsFrame.RefreshProfile;
begin
  if BackendDM.SessionID <> '' then
    LogoutButtonClick(Self);
  if MainForm.ConnTreeView.Selected <> nil then
  begin
    if MainForm.ConnTreeView.Selected.Tag = ROOT_ITEM then
      Registry.LoadProfileFromRegistry(MainForm.ConnTreeView.Selected.Text)
    else
      Registry.LoadProfileFromRegistry(MainForm.ConnTreeView.Selected.ParentItem.Text)
  end;
  SetFieldsToEdits;
  Registry.RegSettingsMofified := False;
  SetRequestInfo;
end;

procedure TSettingsFrame.SetFieldsToEdits;
begin
  HostEdit.Text := Registry.Connection.Host;
  PortEdit.Text := IntToStr(Registry.Connection.Port);
  CheckBoxHTTPS.IsChecked := CheckBoxHTTPS.Text = Registry.Connection.Protocol;
  URLEdit.Text := Registry.Connection.BaseURL;
  ProxyServerEdit.Text := Registry.Connection.ProxyServer;
  ProxyPortEdit.Text := IntToStr(Registry.Connection.ProxyPort);

  TimeoutEdit.Text := IntToStr(Registry.Connection.Timeout);

  UserEdit.Text := Registry.Credentials.ServerUserName;
  PassEdit.Text := Registry.Credentials.ServerPassword;

  MasterSecretEdit.Text := Registry.Credentials.MasterSecret;
  AppSecretEdit.Text := Registry.Credentials.AppSecret;
  AppIDEdit.Text := Registry.Credentials.ApplicationID;

  TenantIDEdit.Text := Registry.Credentials.TenantID;
  TenantSecretEdit.Text := Registry.Credentials.TenantSecret;

  MSecretCheckBox.IsChecked := Registry.Credentials.UseMasterSecret;
  if MSecretCheckBox.IsChecked then
    MSecretCheckBox.Enabled := True
  else
    MasterSecretEdit.Enabled := False;

  LoginButton.Enabled := not MSecretCheckBox.IsChecked and
    (BackendDM.SessionID = '') and (UserEdit.Text <> '');
  LogoutButton.Enabled := not MSecretCheckBox.IsChecked and
    (BackendDM.SessionID <> '');
end;

function TSettingsFrame.GetConnectionProperties: TEMSManagementRegistry.TConnectionProperties;
begin
  Result.Host := HostEdit.Text;
  try
    Result.Port := StrToInt(PortEdit.Text);
  except
    Result.Port := 0;
    PortEdit.Text := '0';
  end;
  Result.Protocol := GetProtocol;
  try
    Result.Timeout := StrToInt(TimeoutEdit.Text);
  except
    Result.Timeout := 30000;
    TimeoutEdit.Text := '30000';
  end;
  Result.BaseURL := URLEdit.Text;
  Result.ProxyServer := ProxyServerEdit.Text;
  try
    Result.ProxyPort := StrToInt(ProxyPortEdit.Text);
  except
    Result.ProxyPort := 0;
    ProxyPortEdit.Text := '0';
  end;
end;

function TSettingsFrame.GetCredentialsProperties: TEMSManagementRegistry.TCredentialsProperties;
begin
  Result.ServerUserName := UserEdit.Text;
  Result.ServerPassword := PassEdit.Text;
  Result.UseMasterSecret := MSecretCheckBox.IsChecked;
  Result.MasterSecret := MasterSecretEdit.Text;
  Result.AppSecret := AppSecretEdit.Text;
  Result.ApplicationID := AppIDEdit.Text;
  Result.TenantID := TenantIDEdit.Text;
  Result.TenantSecret := TenantSecretEdit.Text;
end;

function TSettingsFrame.GetTreeViewItemIndexOf(const AName: String): Integer;
var
  LIndex: Integer;
begin
  Result := -1;
  for LIndex := 0 to MainForm.ConnTreeView.Count - 1 do
    if MainForm.ConnTreeView.Items[LIndex].Text = AName then
    begin
      Result := LIndex;
      Break;
    end;
end;

function TSettingsFrame.GetNewProfileName: string;
var
  LInc: Integer;
begin
  LInc := 1;

  while GetTreeViewItemIndexOf(strNewProfile + IntToStr(LInc)) >= 0 do
    Inc(LInc);

  Result := strNewProfile + IntToStr(LInc);
end;

function TSettingsFrame.GetProtocol: String;
begin
  if CheckBoxHTTPS.IsChecked then
    Result := 'HTTPS'
  else
    Result := 'HTTP'
end;

procedure TSettingsFrame.HostEditKeyUp(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin
  Registry.RegSettingsMofified := True;
  SetRequestInfo;
end;

procedure TSettingsFrame.UserEditKeyUp(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin
  Registry.RegSettingsMofified := True;
  if UserEdit.Text = '' then
    LoginButton.Enabled := False
  else
    LoginButton.Enabled := True;
  SetRequestInfo;
end;

procedure TSettingsFrame.AddConn(const AName: String; ATreeView: TTreeView; AEvent: TNotifyEvent; ASelected: Boolean = False);
var
  LTVI: TTreeViewItem;
begin
  LTVI := TTreeViewItem.Create(Self);
  LTVI.Text := AName;
  LTVI.Tag := ROOT_ITEM;
  LTVI.OnClick := AEvent;
  LTVI.ImageIndex := 0;
  LTVI.Parent := ATreeView;

  AddConnChild(strUsers, USERS_ITEM, LTVI, AEvent);
  AddConnChild(strGroups, GROUPS_ITEM, LTVI, AEvent);
  AddConnChild(strInstallations, INSTALLATIONS_ITEM, LTVI, AEvent);
  AddConnChild(strEdgeModules, MODULES_ITEM, LTVI, AEvent);
  AddConnChild(strResources, RESOURCES_ITEM, LTVI, AEvent);
  AddConnChild(strPush, PUSH_ITEM, LTVI, AEvent);
  AddConnChild(strEndpoints, ENDPOINTS_ITEM, LTVI, AEvent);

  if ASelected then
    ATreeView.Selected := LTVI;
end;

procedure TSettingsFrame.AddConnChild(const AName: String; AItemType: Integer; ATreeViewItem: TTreeViewItem; AEvent: TNotifyEvent);
var
  LTVIChild: TTreeViewItem;
begin
  LTVIChild := TTreeViewItem.Create(ATreeViewItem);
  LTVIChild.Text := AName;
  LTVIChild.Tag := AItemType;
  LTVIChild.OnClick := AEvent;
  LTVIChild.Parent := ATreeViewItem;
end;

procedure TSettingsFrame.LoadProfileNamesToCombo(const AName: string);
var
  i: Integer;
  LProfiles: TStringList;
  LSelected: Boolean;
begin
  MainForm.ConnTreeView.BeginUpdate;
  LProfiles := TStringList.Create;
  try
    MainForm.ConnTreeView.Clear;
    Registry.LoadProfileNamesFromRegistry(LProfiles);
    for i := 0 to LProfiles.Count - 1 do
    begin
      if (AName <> '') and (LProfiles.Strings[i] = AName) then
        LSelected := True
      else
        LSelected := False;
      AddConn(LProfiles.Strings[i], MainForm.ConnTreeView, MainForm.ChildItemClick, LSelected);
    end;
  finally
    LProfiles.Free;
    MainForm.ConnTreeView.EndUpdate;
  end;
end;

procedure TSettingsFrame.RenameProfile(const AName: string);
var
  LOldName: string;
begin
  if AName <> '' then
  begin
    if MainForm.ConnTreeView.Selected <> nil then
    begin
      if MainForm.ConnTreeView.Selected.Tag = ROOT_ITEM then
        LOldName := MainForm.ConnTreeView.Selected.Text
      else
        LOldName := MainForm.ConnTreeView.Selected.ParentItem.Text;
      SaveToRegistry(AName);
      DeleteFromRegistry(LOldName);
      LoadProfileNamesToCombo(AName);
    end;
  end
end;

procedure TSettingsFrame.ResetConnection;
begin
  HostEdit.Text := '';
  PortEdit.Text := '0';
  CheckBoxHTTPS.IsChecked := False;
  URLEdit.Text := '';
  TimeoutEdit.Text := '30000';
  ProxyServerEdit.Text := '';
  ProxyPortEdit.Text := '0';

  SetConnectionInfo;
  Registry.RegSettingsMofified := False;
end;

procedure TSettingsFrame.ResetCredentials;
begin
  UserEdit.Text := '';
  PassEdit.Text := '';
  MSecretCheckBox.IsChecked := False;
  MasterSecretEdit.Text := '';
  AppSecretEdit.Text := '';
  AppIDEdit.Text := '';

  TenantIDEdit.Text := '';
  TenantSecretEdit.Text := '';

  SetCredentialsInfo;
  Registry.RegSettingsMofified := False;
  LoginButton.Enabled := False;
  LogoutButton.Enabled := False;
end;

procedure TSettingsFrame.SaveToRegistry(const AName: string);
begin
  Registry.SaveProfileToRegistryAs(GetConnectionProperties,
    GetCredentialsProperties, AName);
  Registry.RegSettingsMofified := False;
end;

procedure TSettingsFrame.DeleteFromRegistry(const AName: string);
begin
  ResetConnection;
  ResetCredentials;
  Registry.DeleteProfileFromRegistry(AName);
  LoadProfileNamesToCombo('');
end;

procedure TSettingsFrame.SetConnectionInfo;
begin
  Registry.Connection := GetConnectionProperties;
  BackendDM.SetProviderConnectionInfo(Registry);
end;

procedure TSettingsFrame.SetCredentialsInfo;
begin
  Registry.Credentials := GetCredentialsProperties;
  BackendDM.SetProviderCredentials(Registry);
end;

function TSettingsFrame.ShowDefaultProfile: Boolean;
begin
  LoadProfileNamesToCombo('');
  Result := LoadDefaultProfileFromRegistry;
end;

procedure TSettingsFrame.CloseButtonClick(Sender: TObject);
begin
  MainForm.SaveProfile;
  ConnectionForm.Close;
end;

function TSettingsFrame.LoadDefaultProfileFromRegistry: Boolean;
var
  LIndex: Integer;
  LLastProfile: String;
  LItem: TTreeViewItem;
begin
  Result := False;
  if MainForm.ConnTreeView.Count > 0 then
  begin
    LLastProfile := Registry.GetLastProfile;
    LItem := MainForm.ConnTreeView.Items[0];
    for LIndex := 0 to MainForm.ConnTreeView.Count - 1 do
      if MainForm.ConnTreeView.Items[LIndex].Text = LLastProfile then
      begin
        LItem := MainForm.ConnTreeView.Items[LIndex];
        Break;
      end;
    LItem.ExpandAll;
    for LIndex := 0 to LItem.Count - 1 do
      if LItem.Items[LIndex].Tag = ENDPOINTS_ITEM then
      begin
        LItem.Items[LIndex].IsSelected := True;
        Break;
      end;
    Registry.RegSettingsMofified := False;
    Result := True;
  end;
end;

procedure TSettingsFrame.MSecretCheckBoxChange(Sender: TObject);
begin
  MasterSecretEdit.Enabled := MSecretCheckBox.IsChecked;
  UserEdit.Enabled := not MSecretCheckBox.IsChecked;
  PassEdit.Enabled := not MSecretCheckBox.IsChecked;
  LoginButton.Enabled := not MSecretCheckBox.IsChecked and
    (BackendDM.SessionID = '');
  LogoutButton.Enabled := not MSecretCheckBox.IsChecked and
    (BackendDM.SessionID <> '');
  Registry.RegSettingsMofified := True;
  SetRequestInfo;
end;

procedure TSettingsFrame.EditChange(Sender: TObject);
begin
  Registry.RegSettingsMofified := True;
  SetRequestInfo;
end;

procedure TSettingsFrame.TestConnectionButtonClick(Sender: TObject);
begin
  SetRequestInfo;
  BackendDM.AppHandshake;
end;

procedure TSettingsFrame.NewConnection;
var
  LNewName: string;
begin
  if BackendDM.SessionID <> '' then
    LogoutButtonClick(Self);
  LNewName := GetNewProfileName;
  AddConn(LNewName, MainForm.ConnTreeView,MainForm.ChildItemClick, True);
  MainForm.ConnTreeView.Enabled := True;
  ResetConnection;
  ResetCredentials;
  HostEdit.Text := 'localhost';
  PortEdit.Text := '8080';
end;

procedure TSettingsFrame.OpenProfiles(AFileName: TFileName);
begin
  if BackendDM.SessionID <> '' then
    LogoutButtonClick(Self);
  LoadConfiguratonFile(AFileName);
end;

function TSettingsFrame.LoadConfiguratonFile(const AFileName: string): Boolean;
var
  LLastProfile: string;
begin
  LLastProfile := Registry.GetLastProfile;
  Registry.Filename := AFileName;
  Registry.RegSettingsMofified := Registry.ImportProfiles;
  LoadProfileNamesToCombo(LLastProfile);
  SetFieldsToEdits;
  BackendDM.SetProviderConnectionInfo(Registry);
  BackendDM.SetProviderCredentials(Registry);

  Result := Registry.RegSettingsMofified;
end;

function TSettingsFrame.WriteConfiguratonFile(const AFileName: string): Boolean;
begin
  if Registry.RegSettingsMofified then
  begin
    Registry.Connection := GetConnectionProperties;
    Registry.Credentials := GetCredentialsProperties;
  end;
  Registry.Filename := AFileName;
  Result := Registry.ExportProfiles;
end;

procedure TSettingsFrame.SetRequestInfo;
begin
  SetConnectionInfo;
  SetCredentialsInfo;
end;

procedure TSettingsFrame.LoginButtonClick(Sender: TObject);
begin
  SetRequestInfo;
  if BackendDM.Login(not MSecretCheckBox.IsChecked) then
  begin
    LoginButton.Enabled := False;
    UserEdit.Enabled := False;
    PassEdit.Enabled := False;
    MasterSecretEdit.Enabled := False;
    AppSecretEdit.Enabled := False;
    AppIDEdit.Enabled := False;
    MSecretCheckBox.Enabled := False;
    LogoutButton.Enabled := True;
    ProxyServerEdit.Enabled := False;
    ProxyPortEdit.Enabled := False;
    HostEdit.Enabled := False;
    PortEdit.Enabled := False;
    URLEdit.Enabled := False;
    TimeoutEdit.Enabled := False;
    CheckBoxHTTPS.Enabled := False;
    TenantIDEdit.Enabled := False;
    TenantSecretEdit.Enabled := False;
  end;
end;

procedure TSettingsFrame.LogoutButtonClick(Sender: TObject);
begin
  if BackendDM.Logout then
  begin
    if MSecretCheckBox.IsChecked then
    begin
      UserEdit.Enabled := False;
      PassEdit.Enabled := False;
      MasterSecretEdit.Enabled := True;
    end
    else
    begin
      UserEdit.Enabled := True;
      PassEdit.Enabled := True;
      MasterSecretEdit.Enabled := False;
    end;
    LoginButton.Enabled := True;
    MSecretCheckBox.Enabled := True;
    AppSecretEdit.Enabled := True;
    AppIDEdit.Enabled := True;
    LogoutButton.Enabled := False;
    ConnectionTabItem.Enabled := True;
    ProxyServerEdit.Enabled := True;
    ProxyPortEdit.Enabled := True;
    HostEdit.Enabled := True;
    PortEdit.Enabled := True;
    URLEdit.Enabled := True;
    TimeoutEdit.Enabled := True;
    CheckBoxHTTPS.Enabled := True;
    TenantIDEdit.Enabled := True;
    TenantSecretEdit.Enabled := True;
  end;
end;

end.
