{*******************************************************}
{                                                       }
{           CodeGear Delphi Runtime Library             }
{ Copyright(c) 2014-2019 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}
unit RSConfig.ServerFrame;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Edit, FMX.EditBox, FMX.SpinBox, FMX.Layouts, FMX.Controls.Presentation,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  System.Rtti, System.Bindings.Outputs, FMX.Bind.Editors, Data.Bind.EngExt,
  FMX.Bind.DBEngExt, Data.Bind.Components, Data.Bind.DBScope, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TServerFrame = class(TFrame)
    VertScrollBox3: TVertScrollBox;
    Label23: TLabel;
    Label54: TLabel;
    Label55: TLabel;
    Label56: TLabel;
    Label58: TLabel;
    Label65: TLabel;
    Label70: TLabel;
    Label74: TLabel;
    Layout12: TLayout;
    MaxConnectionsSB: TSpinBox;
    MaxConnectionsHelpButton: TButton;
    Layout13: TLayout;
    MaxUsersHelpButton: TButton;
    Layout14: TLayout;
    MasterSecretEdit: TEdit;
    MasterSecretHelpButton: TButton;
    Layout15: TLayout;
    AppSecretEdit: TEdit;
    AppSecretHelpButton: TButton;
    Layout16: TLayout;
    ApplicationIDEdit: TEdit;
    ApplicationIDHelpButton: TButton;
    Layout17: TLayout;
    PortEdit: TEdit;
    Layout18: TLayout;
    CertFileEdit: TEdit;
    LocateCertFileButton: TButton;
    CheckBox34: TCheckBox;
    Layout19: TLayout;
    KeyFileEdit: TEdit;
    KeyFileButton: TButton;
    CheckBox36: TCheckBox;
    Layout20: TLayout;
    CheckBox33: TCheckBox;
    HTTPSHelpButton: TButton;
    Layout21: TLayout;
    RootCertFileEdit: TEdit;
    RootCertFileButton: TButton;
    CheckBox35: TCheckBox;
    RootCertFileHelpButton: TButton;
    Layout22: TLayout;
    KeyFilePasswordEdit: TEdit;
    CheckBox37: TCheckBox;
    Layout24: TLayout;
    CheckBox30: TCheckBox;
    ThreadPoolHelpButton: TButton;
    Layout25: TLayout;
    ThreadPoolSizeSB: TSpinBox;
    CheckBox31: TCheckBox;
    ThreadPoolSizeHelpButton: TButton;
    Layout26: TLayout;
    ListenQueueSB: TSpinBox;
    CheckBox32: TCheckBox;
    ListenQueueHelpButton: TButton;
    Layout46: TLayout;
    CrossDomainEdit: TEdit;
    CrossDomainHelpButton: TButton;
    Layout60: TLayout;
    ProxyHostEdit: TEdit;
    CheckBox15: TCheckBox;
    Layout61: TLayout;
    ProxyPortEdit: TEdit;
    CheckBox16: TCheckBox;
    Layout62: TLayout;
    ProxyUserNameEdit: TEdit;
    CheckBox17: TCheckBox;
    Layout63: TLayout;
    ProxyPasswordEdit: TEdit;
    CheckBox18: TCheckBox;
    Layout64: TLayout;
    Label71: TLabel;
    MultiTenantModeHelpButton: TButton;
    Layout65: TLayout;
    TenantIDCookieName: TEdit;
    CheckBox20: TCheckBox;
    TenantIDCookieNameHelpButton: TButton;
    Layout66: TLayout;
    DefaultTenantIdEdit: TEdit;
    CheckBox19: TCheckBox;
    DefaultTenantIdHelpButton: TButton;
    Layout67: TLayout;
    ResourcesEdit: TEdit;
    CheckBox21: TCheckBox;
    ResourceHelpButton: TButton;
    Layout1: TLayout;
    KeekAliveCB: TCheckBox;
    KeepAliveHelpButton: TButton;
    BindSourceDBServer: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkControlToField1: TLinkControlToField;
    LinkControlToField3: TLinkControlToField;
    LinkControlToField4: TLinkControlToField;
    LinkControlToField5: TLinkControlToField;
    LinkControlToField6: TLinkControlToField;
    LinkControlToField8: TLinkControlToField;
    LinkControlToField9: TLinkControlToField;
    LinkControlToField10: TLinkControlToField;
    LinkControlToField11: TLinkControlToField;
    LinkControlToField12: TLinkControlToField;
    LinkControlToField15: TLinkControlToField;
    LinkControlToField17: TLinkControlToField;
    LinkControlToField18: TLinkControlToField;
    LinkControlToField19: TLinkControlToField;
    LinkControlToField20: TLinkControlToField;
    LinkControlToField22: TLinkControlToField;
    LinkControlToField23: TLinkControlToField;
    LinkControlToField24: TLinkControlToField;
    OpenDialog: TOpenDialog;
    Label1: TLabel;
    Layout2: TLayout;
    AppendHelpButton: TButton;
    Layout3: TLayout;
    LogFileEdit: TEdit;
    FileNameButton: TButton;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    BindSourceDB1: TBindSourceDB;
    LinkControlToField25: TLinkControlToField;
    LinkControlToField26: TLinkControlToField;
    LinkControlToField27: TLinkControlToField;
    LinkControlToField28: TLinkControlToField;
    LinkControlToField29: TLinkControlToField;
    LinkControlToField30: TLinkControlToField;
    LinkControlToField31: TLinkControlToField;
    LinkControlToField32: TLinkControlToField;
    LinkControlToField33: TLinkControlToField;
    LinkControlToField34: TLinkControlToField;
    LinkControlToField35: TLinkControlToField;
    LinkControlToField36: TLinkControlToField;
    LinkControlToField37: TLinkControlToField;
    LinkControlToField38: TLinkControlToField;
    LinkControlToField39: TLinkControlToField;
    LinkControlToField40: TLinkControlToField;
    LinkControlToField41: TLinkControlToField;
    LinkControlToField42: TLinkControlToField;
    LinkControlToField43: TLinkControlToField;
    PortCB: TCheckBox;
    ApplicationIDCB: TCheckBox;
    AppSecretCB: TCheckBox;
    MasterSecretCB: TCheckBox;
    MaxUsersCB: TCheckBox;
    MaxConnectionsCB: TCheckBox;
    Layout4: TLayout;
    Label2: TLabel;
    Label3: TLabel;
    HTTPSSwitch: TSwitch;
    LinkControlToField7: TLinkControlToField;
    Layout5: TLayout;
    Label4: TLabel;
    Label5: TLabel;
    ThreadPoolSwitch: TSwitch;
    LinkControlToField13: TLinkControlToField;
    Layout6: TLayout;
    Label6: TLabel;
    Label7: TLabel;
    MultiTenantSwitch: TSwitch;
    LinkControlToField21: TLinkControlToField;
    Layout7: TLayout;
    Label8: TLabel;
    Label9: TLabel;
    ServerLoggingAppendSwitch: TSwitch;
    LinkControlToField44: TLinkControlToField;
    LinkControlToField45: TLinkControlToField;
    LinkControlToField46: TLinkControlToField;
    LinkControlToField47: TLinkControlToField;
    LinkControlToField48: TLinkControlToField;
    LinkControlToField49: TLinkControlToField;
    LinkControlToField50: TLinkControlToField;
    CrossDomainCB: TCheckBox;
    LinkControlToField51: TLinkControlToField;
    MaxUsersSB: TSpinBox;
    LinkControlToField2: TLinkControlToField;
    LinkControlToField14: TLinkControlToField;
    Label10: TLabel;
    KeepAliveSwitch: TSwitch;
    Label11: TLabel;
    LinkControlToField16: TLinkControlToField;
    procedure LocateCertFileButtonClick(Sender: TObject);
    procedure RootCertFileButtonClick(Sender: TObject);
    procedure KeyFileButtonClick(Sender: TObject);
    procedure FileNameButtonClick(Sender: TObject);
    procedure HelpButtonClick(Sender: TObject);
    procedure MaxConnectionsSBChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    procedure LoadSection;
    procedure SaveSection;
  end;

implementation

{$R *.fmx}

uses
  RSConfig.ConfigDM, RSConfig.Consts;

constructor TServerFrame.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  MaxConnectionsHelpButton.Hint := strMaxConnectionsHelp;
  MaxUsersHelpButton.Hint := strMaxUsersHelp;
  MasterSecretHelpButton.Hint := strMasterSecretHelp;
  AppSecretHelpButton.Hint := strAppSecretHelp;
  ApplicationIDHelpButton.Hint := strApplicationIDHelp;
  HTTPSHelpButton.Hint := strHTTPSHelp;
  RootCertFileHelpButton.Hint := strRootCertFileHelp;
  CrossDomainHelpButton.Hint := strCrossDomainHelp;
  ThreadPoolHelpButton.Hint := strThreadPoolHelp;
  ThreadPoolSizeHelpButton.Hint := strThreadPoolSizeHelp;
  ListenQueueHelpButton.Hint := strListenQueueHelp;
  KeepAliveHelpButton.Hint := strKeepAliveHelp;
  MultiTenantModeHelpButton.Hint := strMultiTenantModeHelp;
  DefaultTenantIdHelpButton.Hint := strDefaultTenantIdHelp;
  TenantIDCookieNameHelpButton.Hint := strTenantIDCookieNameHelp;
  ResourceHelpButton.Hint := strResourcesHelp;
  AppendHelpButton.Hint := strServerLoggingAppendHelp;
end;

procedure TServerFrame.LoadSection;
begin
  ConfigDM.LoadSection(strServerLimits, ConfigDM.ServerMT, ConfigDM.ServerStatusMT);
  ConfigDM.LoadSection(strServerKeys, ConfigDM.ServerMT, ConfigDM.ServerStatusMT);
  ConfigDM.LoadSection(strServerConnectionDev, ConfigDM.ServerMT, ConfigDM.ServerStatusMT);
  ConfigDM.LoadSection(strServerAPICrossDomain, ConfigDM.ServerMT, ConfigDM.ServerStatusMT);
  ConfigDM.LoadSection(strServerThreadsDev, ConfigDM.ServerMT, ConfigDM.ServerStatusMT);
  ConfigDM.LoadSection(strServerEdgeHTTP, ConfigDM.ServerMT, ConfigDM.ServerStatusMT);
  ConfigDM.LoadSection(strServerTenants, ConfigDM.ServerMT, ConfigDM.ServerStatusMT);
  ConfigDM.LoadSection(strServerRoots, ConfigDM.ServerMT, ConfigDM.ServerStatusMT);
end;

procedure TServerFrame.SaveSection;
begin
  ConfigDM.SaveSection(strServerLimits, ConfigDM.ServerMT, ConfigDM.ServerStatusMT);
  ConfigDM.SaveSection(strServerKeys, ConfigDM.ServerMT, ConfigDM.ServerStatusMT);
  ConfigDM.SaveSection(strServerConnectionDev, ConfigDM.ServerMT, ConfigDM.ServerStatusMT);
  ConfigDM.SaveSection(strServerAPICrossDomain, ConfigDM.ServerMT, ConfigDM.ServerStatusMT);
  ConfigDM.SaveSection(strServerThreadsDev, ConfigDM.ServerMT, ConfigDM.ServerStatusMT);
  ConfigDM.SaveSection(strServerEdgeHTTP, ConfigDM.ServerMT, ConfigDM.ServerStatusMT);
  ConfigDM.SaveSection(strServerTenants, ConfigDM.ServerMT, ConfigDM.ServerStatusMT);
  ConfigDM.SaveSection(strServerRoots, ConfigDM.ServerMT, ConfigDM.ServerStatusMT);
end;

procedure TServerFrame.FileNameButtonClick(Sender: TObject);
begin
  OpenDialog.DefaultExt := 'log';
  OpenDialog.Filter := strRSLogFileDesc + '|*.log';
  ConfigDM.OpenDialogForEdit(LogFileEdit, OpenDialog);
end;

procedure TServerFrame.KeyFileButtonClick(Sender: TObject);
begin
  OpenDialog.DefaultExt := 'key';
  OpenDialog.Filter := strKeyFileDesc + '|*.key';
  ConfigDM.OpenDialogForEdit(KeyFileEdit, OpenDialog);
end;

procedure TServerFrame.RootCertFileButtonClick(Sender: TObject);
begin
  OpenDialog.DefaultExt := 'cer';
  OpenDialog.Filter := strRootCertFileDesc + '|*.cer';
  ConfigDM.OpenDialogForEdit(RootCertFileEdit, OpenDialog);
end;

procedure TServerFrame.LocateCertFileButtonClick(Sender: TObject);
begin
  OpenDialog.DefaultExt := 'cer';
  OpenDialog.Filter := strCertFileDesc + '|*.cer';
  ConfigDM.OpenDialogForEdit(CertFileEdit, OpenDialog);
end;

procedure TServerFrame.MaxConnectionsSBChange(Sender: TObject);
begin
  TLinkObservers.ControlChanged(TSpinBox(Sender));
end;

procedure TServerFrame.HelpButtonClick(Sender: TObject);
begin
  ConfigDM.ShowHelp(Sender);
end;

end.
