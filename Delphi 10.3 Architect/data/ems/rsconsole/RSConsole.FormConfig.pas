{*******************************************************}
{                                                       }
{           CodeGear Delphi Runtime Library             }
{ Copyright(c) 2014-2019 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}
unit RSConsole.FormConfig;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Edit, FMX.StdCtrls, FMX.TabControl, FMX.Layouts, FMX.DialogService,
  System.IOUtils,
  FMX.Controls.Presentation, FMX.ScrollBox, FMX.Memo, FMX.EditBox, FMX.SpinBox,
  Data.Bind.EngExt, FMX.Bind.DBEngExt, System.Rtti, System.Bindings.Outputs,
  Data.Bind.Controls, FMX.Bind.Navigator, Data.Bind.Components, Data.Bind.Grid,
  Data.Bind.DBScope, FMX.ComboEdit, RSConfig.DataFrame,
  RSConfig.PushNotificationsFrame,
  RSConfig.ServerFrame, RSConfig.PackagesFrame, FMX.Grid.Style, FMX.Bind.Grid,
  FMX.Bind.Editors,
  FMX.Grid, RSConfig.PublicPaths, RSConfig.RedirectFrame,
  RSConfig.AuthorizationFrame
{$IFDEF MSWINDOWS}
    , Windows, Registry
{$ENDIF};

type
  TConfigForm = class(TForm)
    TabControl1: TTabControl;
    LocateTab: TTabItem;
    ConfigTab: TTabItem;
    Label4: TLabel;
    TabControl2: TTabControl;
    DataTab: TTabItem;
    ServerTab: TTabItem;
    Packages: TTabItem;
    PushTab: TTabItem;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    AuthTab: TTabItem;
    RedirectTab: TTabItem;
    PublicPathsTab: TTabItem;
    SaveLayout: TLayout;
    SaveButton: TButton;
    Layout1: TLayout;
    Layout3: TLayout;
    LocateButton: TButton;
    Label18: TLabel;
    SettingsEdit: TEdit;
    ConfigureButton: TButton;
    Layout4: TLayout;
    Label1: TLabel;
    Label2: TLabel;
    PackagesFrame1: TPackagesFrame;
    BindSourceDB2: TBindSourceDB;
    DataFrame1: TDataFrame;
    OpenDialog: TOpenDialog;
    RedirectFrame1: TRedirectFrame;
    AuthorizationFrame1: TAuthorizationFrame;
    CancelButton: TButton;
    SaveAndCloseButton: TButton;
    PublicPathsFrame1: TPublicPathsFrame;
    Layout2: TLayout;
    CloseButton: TButton;
    StatusBar1: TStatusBar;
    ServerFrame1: TServerFrame;
    PushNotificationsFrame1: TPushNotificationsFrame;
    procedure LocateButtonClick(Sender: TObject);
    procedure ConfigureButtonClick(Sender: TObject);
    procedure SaveButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure TabControlChange(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
    procedure SaveAndCloseButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CloseButtonClick(Sender: TObject);
  private
    { Private declarations }
    FEMSPath: String;
    FIsSaved: Boolean;
  public
    { Public declarations }
  end;

var
  ConfigForm: TConfigForm;

implementation

{$R *.fmx}

uses
  RSConsole.Form, RSConfig.ConfigDM, RSConsole.Consts, RSConfig.Consts;

procedure TConfigForm.LocateButtonClick(Sender: TObject);
begin
  OpenDialog.InitialDir := ExtractFilePath(FEMSPath);
  if OpenDialog.Execute then
    SettingsEdit.Text := OpenDialog.FileName;
end;

procedure TConfigForm.CloseButtonClick(Sender: TObject);
begin
  Close;
end;

procedure TConfigForm.CancelButtonClick(Sender: TObject);
begin
  if not FIsSaved then
  begin
    TDialogService.MessageDialog(strAreYouSureExit, TMsgDlgType.mtConfirmation,
      [TMsgDlgBtn.mbYes, TMsgDlgBtn.mbNo], TMsgDlgBtn.mbNo, 0,
      procedure(const AResult: TModalResult)
      begin
        case AResult of
          mrYes:
            begin
              TabControl1.ActiveTab := LocateTab;
              FIsSaved := True;
            end;
          mrNo:
            begin
              // do nothing
            end;
        end;
      end);
  end
  else
  begin
    TabControl1.ActiveTab := LocateTab;
    FIsSaved := True;
  end;
end;

procedure TConfigForm.ConfigureButtonClick(Sender: TObject);
begin
  if not TFile.Exists(SettingsEdit.Text) then
  begin
    TDialogService.ShowMessage(strConfigMissing);
    Exit;
  end;

  ConfigDM.LoadFromFile(SettingsEdit.Text);
  DataFrame1.LoadSection;
  ServerFrame1.LoadSection;
  PackagesFrame1.LoadSectionList;
  PushNotificationsFrame1.LoadSection;
  AuthorizationFrame1.LoadSectionList;
  RedirectFrame1.LoadSectionList;
  PublicPathsFrame1.LoadSectionList;
  TabControl1.ActiveTab := ConfigTab;
  TabControl2.ActiveTab := DataTab;
  FIsSaved := False;
end;

procedure TConfigForm.SaveAndCloseButtonClick(Sender: TObject);
begin
  SaveButtonClick(Sender);
  TabControl1.ActiveTab := LocateTab;
end;

procedure TConfigForm.SaveButtonClick(Sender: TObject);
begin
  FIsSaved := True;
  DataFrame1.SaveSection;
  ServerFrame1.SaveSection;
  PackagesFrame1.SaveSectionList;
  PushNotificationsFrame1.SaveSection;
  AuthorizationFrame1.SaveSectionList;
  RedirectFrame1.SaveSectionList;
  PublicPathsFrame1.SaveSectionList;
  ConfigDM.SaveToFile;
end;

procedure TConfigForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if ConfigForm.Visible then
    Action := TCloseAction.caHide;
end;

procedure TConfigForm.FormCreate(Sender: TObject);
{$IFDEF MSWINDOWS}
var
  LRegistry: TRegistry;
{$ENDIF}
begin
  MainForm.ApplyStyle(ConfigForm);

{$IFDEF MSWINDOWS}
  LRegistry := TRegistry.Create;

  LRegistry.RootKey := HKEY_LOCAL_MACHINE;
  if LRegistry.OpenKeyReadOnly(EMS_WOW64_REGISTRY_KEY) then
  begin
    SettingsEdit.Text := LRegistry.ReadString(EMS_CONFIG_NAME);
    FEMSPath := SettingsEdit.Text;
  end
  else if LRegistry.OpenKeyReadOnly(EMS_REGISTRY_KEY) then
  begin
    SettingsEdit.Text := LRegistry.ReadString(EMS_CONFIG_NAME);
    FEMSPath := SettingsEdit.Text;
  end
  else
  begin
    LRegistry.RootKey := HKEY_CURRENT_USER;
    if LRegistry.OpenKeyReadOnly(EMS_REGISTRY_KEY) then
    begin
      SettingsEdit.Text := LRegistry.ReadString(EMS_CONFIG_NAME);
      FEMSPath := SettingsEdit.Text;
    end;
  end;

  LRegistry.Free;
{$ENDIF}
end;

procedure TConfigForm.TabControlChange(Sender: TObject);
begin
  if not SaveLayout.Visible then
  begin
    RedirectFrame1.Reset;
    AuthorizationFrame1.Reset;
    PublicPathsFrame1.Reset;
  end;
end;

end.
