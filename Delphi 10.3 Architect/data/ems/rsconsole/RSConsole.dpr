{*******************************************************}
{                                                       }
{           CodeGear Delphi Runtime Library             }
{ Copyright(c) 2014-2019 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

program RSConsole;

{$R *.dres}

uses
  System.StartUpCopy,
  FMX.Forms,
  RSConsole.Types in 'RSConsole.Types.pas',
  RSConsole.ModuleBackend in 'RSConsole.ModuleBackend.pas' {BackendDM: TDataModule},
  RSSetUp.Config in 'RSSetUp.Config.pas',
  RSConsole.Data in 'RSConsole.Data.pas',
  RSConsole.Consts in 'RSConsole.Consts.pas',
  RSConsole.TypesViews in 'RSConsole.TypesViews.pas',
  RSConsole.DlgModifyU in 'RSConsole.DlgModifyU.pas' {FormAddDlg},
  RSConsole.DlgPushChannelsU in 'RSConsole.DlgPushChannelsU.pas' {Dialog},
  RSConsole.DlgPushDataU in 'RSConsole.DlgPushDataU.pas' {Dialog},
  RSConsole.DlgPushWhereU in 'RSConsole.DlgPushWhereU.pas' {Dialog},
  RSSetUp.QueryU in 'RSSetUp.QueryU.pas',
  RSConsole.FrameJSONGridU in 'RSConsole.FrameJSONGridU.pas' {FrameJSONGrid: TFrame},
  RSConsole.Form in 'RSConsole.Form.pas' {MainForm},
  RSConsole.FrameAdd in 'RSConsole.FrameAdd.pas' {AddFrame: TFrame},
  RSConsole.FramePush in 'RSConsole.FramePush.pas' {PushFrame: TFrame},
  RSConsole.FrameSettings in 'RSConsole.FrameSettings.pas' {SettingsFrame: TFrame},
  RSConsole.FrameViews in 'RSConsole.FrameViews.pas' {ViewsFrame: TFrame},
  RSConsole.FormConnection in 'RSConsole.FormConnection.pas' {ConnectionForm},
  RSConsole.ComponentToClipboard in 'RSConsole.ComponentToClipboard.pas',
  RSConsole.CustomHeaderDlgForm in 'RSConsole.CustomHeaderDlgForm.pas' {frm_CustomHeaderDlg},
  RSConsole.ExplorerConsts in 'RSConsole.ExplorerConsts.pas',
  RSConsole.FrameExplorer in 'RSConsole.FrameExplorer.pas' {ExplorerFrame: TFrame},
  RSConsole.MRUList in 'RSConsole.MRUList.pas',
  RSConsole.OSUtils in 'RSConsole.OSUtils.pas',
  RSConsole.RESTObjects in 'RSConsole.RESTObjects.pas',
  RSConsole.SettingsList in 'RSConsole.SettingsList.pas',
  RSConsole.Wait in 'RSConsole.Wait.pas' {Wait},
  RSConfig.AuthorizationFrame in 'RSConfig.AuthorizationFrame.pas' {AuthorizationFrame: TFrame},
  RSConfig.ConfigDM in 'RSConfig.ConfigDM.pas' {ConfigDM: TDataModule},
  RSConfig.Consts in 'RSConfig.Consts.pas',
  RSConfig.DataFrame in 'RSConfig.DataFrame.pas' {DataFrame: TFrame},
  RSConfig.ListControlFrame in 'RSConfig.ListControlFrame.pas' {ListControlFrame: TFrame},
  RSConfig.NameValueFrame in 'RSConfig.NameValueFrame.pas' {NameValueFrame: TFrame},
  RSConfig.PackagesFrame in 'RSConfig.PackagesFrame.pas' {PackagesFrame: TFrame},
  RSConfig.PublicPaths in 'RSConfig.PublicPaths.pas' {PublicPathsFrame: TFrame},
  RSConfig.PushNotificationsFrame in 'RSConfig.PushNotificationsFrame.pas' {PushNotificationsFrame: TFrame},
  RSConfig.RedirectFrame in 'RSConfig.RedirectFrame.pas' {RedirectFrame: TFrame},
  RSConfig.ServerFrame in 'RSConfig.ServerFrame.pas' {ServerFrame: TFrame},
  RSConsole.FormConfig in 'RSConsole.FormConfig.pas' {ConfigForm};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TBackendDM, BackendDM);
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TConnectionForm, ConnectionForm);
  Application.CreateForm(Tfrm_CustomHeaderDlg, frm_CustomHeaderDlg);
  Application.CreateForm(TConfigDM, ConfigDM);
  Application.CreateForm(TConfigForm, ConfigForm);
  Application.Run;

end.
