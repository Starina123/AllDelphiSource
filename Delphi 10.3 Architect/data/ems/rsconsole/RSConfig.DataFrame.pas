{*******************************************************}
{                                                       }
{           CodeGear Delphi Runtime Library             }
{ Copyright(c) 2014-2019 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}
unit RSConfig.DataFrame;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Layouts, FMX.EditBox, FMX.SpinBox, FMX.Edit, FMX.Controls.Presentation,
  System.Rtti, System.Bindings.Outputs, FMX.Bind.Editors, Data.Bind.EngExt,
  FMX.Bind.DBEngExt, Data.Bind.Components, Data.Bind.DBScope;

type
  TDataFrame = class(TFrame)
    Layout10: TLayout;
    UserNameEdit: TEdit;
    Layout11: TLayout;
    DatabaseEdit: TEdit;
    LocateDBButton: TButton;
    Layout5: TLayout;
    PooledMaxHelpButton: TButton;
    Layout6: TLayout;
    InstanceNameEdit: TEdit;
    InstanceNameHelpButton: TButton;
    Layout7: TLayout;
    PooledHelpButton: TButton;
    Layout8: TLayout;
    SEPasswordEdit: TEdit;
    SEPasswordHelpButton: TButton;
    Layout9: TLayout;
    PasswordEdit: TEdit;
    VertScrollBox1: TVertScrollBox;
    BindSourceDBData: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkControlToField1: TLinkControlToField;
    LinkControlToField2: TLinkControlToField;
    LinkControlToField3: TLinkControlToField;
    LinkControlToField5: TLinkControlToField;
    OpenDialog: TOpenDialog;
    PooledMaxSB: TSpinBox;
    LinkControlToField6: TLinkControlToField;
    LinkControlToField7: TLinkControlToField;
    InstanceNameCB: TCheckBox;
    DatabaseCB: TCheckBox;
    UsernameCB: TCheckBox;
    PasswordCB: TCheckBox;
    SEPasswordCB: TCheckBox;
    PooledCB: TCheckBox;
    PooledMaxCB: TCheckBox;
    Layout4: TLayout;
    Label2: TLabel;
    Label3: TLabel;
    PooledSwitch: TSwitch;
    LinkControlToField4: TLinkControlToField;
    BindSourceDB1: TBindSourceDB;
    LinkControlToField8: TLinkControlToField;
    LinkControlToField9: TLinkControlToField;
    LinkControlToField10: TLinkControlToField;
    LinkControlToField11: TLinkControlToField;
    LinkControlToField12: TLinkControlToField;
    LinkControlToField13: TLinkControlToField;
    LinkControlToField14: TLinkControlToField;
    procedure LocateDBButtonClick(Sender: TObject);
    procedure HelpButtonClick(Sender: TObject);
    procedure PooledMaxSBChange(Sender: TObject);
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

constructor TDataFrame.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  InstanceNameHelpButton.Hint := strInstanceNameHelp;
  SEPasswordHelpButton.Hint := strSEPasswordHelp;
  PooledHelpButton.Hint := strPooledHelp;
  PooledMaxHelpButton.Hint := strPooledMax;
end;

procedure TDataFrame.HelpButtonClick(Sender: TObject);
begin
  ConfigDM.ShowHelp(Sender);
end;

procedure TDataFrame.LoadSection;
begin
  ConfigDM.LoadSection(strData, ConfigDM.DataMT, ConfigDM.DataStatusMT);
end;

procedure TDataFrame.SaveSection;
begin
  ConfigDM.SaveSection(strData, ConfigDM.DataMT, ConfigDM.DataStatusMT);
end;

procedure TDataFrame.LocateDBButtonClick(Sender: TObject);
begin
  ConfigDM.OpenDialogForEdit(DatabaseEdit, OpenDialog);
end;

procedure TDataFrame.PooledMaxSBChange(Sender: TObject);
begin
  TLinkObservers.ControlChanged(TSpinBox(Sender));
end;

end.
