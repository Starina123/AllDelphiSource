{*******************************************************}
{                                                       }
{           CodeGear Delphi Runtime Library             }
{ Copyright(c) 2014-2019 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}
unit RSConfig.PushNotificationsFrame;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.EditBox, FMX.SpinBox, FMX.Edit, FMX.Layouts, FMX.Controls.Presentation,
  System.Rtti, System.Bindings.Outputs, FMX.Bind.Editors, Data.Bind.EngExt,
  FMX.Bind.DBEngExt, Data.Bind.Components, Data.Bind.DBScope;

type
  TPushNotificationsFrame = class(TFrame)
    VertScrollBox1: TVertScrollBox;
    Label59: TLabel;
    Label60: TLabel;
    Layout48: TLayout;
    ApiKeyEdit: TEdit;
    Layout49: TLayout;
    CertificateFilePasswordEdit: TEdit;
    Layout50: TLayout;
    Layout51: TLayout;
    CertificateFileNameEdit: TEdit;
    CertFileNameButton: TButton;
    OpenDialog: TOpenDialog;
    BindSourceDBPushNotifications: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkControlToField1: TLinkControlToField;
    LinkControlToField2: TLinkControlToField;
    LinkControlToField3: TLinkControlToField;
    ApiKeyCB: TCheckBox;
    CertificateFileNameCB: TCheckBox;
    CertificateFilePasswordCB: TCheckBox;
    ProductionEnvironmentCB: TCheckBox;
    BindSourceDB1: TBindSourceDB;
    LinkControlToField5: TLinkControlToField;
    LinkControlToField6: TLinkControlToField;
    LinkControlToField7: TLinkControlToField;
    LinkControlToField8: TLinkControlToField;
    Layout7: TLayout;
    Label8: TLabel;
    Label9: TLabel;
    ProductionEnvironmentSwitch: TSwitch;
    LinkControlToField4: TLinkControlToField;
    ApiKeyHelpButton: TButton;
    CertFileNameHelpButton: TButton;
    CertFilePasswordHelpButton: TButton;
    ProductionEnvironmentHelpButton: TButton;
    Layout1: TLayout;
    ApiURLEdit: TEdit;
    ApiURLCB: TCheckBox;
    ApiURLHelpButton: TButton;
    LinkControlToField9: TLinkControlToField;
    LinkControlToField10: TLinkControlToField;
    procedure CertFileNameButtonClick(Sender: TObject);
    procedure HelpButtonClick(Sender: TObject);
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

constructor TPushNotificationsFrame.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  ApiKeyHelpButton.Hint := strApiKeyHelp;
  ApiURLHelpButton.Hint := strApiURLHelp;
  CertFileNameHelpButton.Hint := strCertificateFileNameHelp;
  CertFilePasswordHelpButton.Hint := strCertificateFilePasswordHelp;
  ProductionEnvironmentHelpButton.Hint := strProductionEnvironmentHelp;
end;

procedure TPushNotificationsFrame.HelpButtonClick(Sender: TObject);
begin
  ConfigDM.ShowHelp(Sender);
end;

procedure TPushNotificationsFrame.LoadSection;
begin
  ConfigDM.LoadSection(strServerPushGCM, ConfigDM.PushNotificationsMT,
    ConfigDM.PushNotificationsStatusMT);
  ConfigDM.LoadSection(strServerPushAPNS, ConfigDM.PushNotificationsMT,
    ConfigDM.PushNotificationsStatusMT);
end;

procedure TPushNotificationsFrame.SaveSection;
begin
  ConfigDM.SaveSection(strServerPushGCM, ConfigDM.PushNotificationsMT,
    ConfigDM.PushNotificationsStatusMT);
  ConfigDM.SaveSection(strServerPushAPNS, ConfigDM.PushNotificationsMT,
    ConfigDM.PushNotificationsStatusMT);
end;

procedure TPushNotificationsFrame.CertFileNameButtonClick(Sender: TObject);
begin
  ConfigDM.OpenDialogForEdit(CertificateFileNameEdit, OpenDialog);
end;

end.
