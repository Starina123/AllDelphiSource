{*******************************************************}
{                                                       }
{           CodeGear Delphi Runtime Library             }
{ Copyright(c) 2014-2019 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}
unit RSConsole.CustomHeaderDlgForm;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Rtti, System.Classes,
  System.Variants, FMX.Types, FMX.Controls, FMX.Forms, FMX.Dialogs,
  FMX.StdCtrls, FMX.Objects, FMX.Edit, FMX.ListBox, FMX.ComboEdit,
  REST.Client, REST.Consts, REST.Types, FMX.Controls.Presentation, FMX.Layouts;

type
  Tfrm_CustomHeaderDlg = class(TForm)
    btn_Cancel: TButton;
    btn_Apply: TButton;
    Line1: TLine;
    cmb_ParameterKind: TComboBox;
    Label3: TLabel;
    cmb_ParameterName: TComboEdit;
    edt_ParameterValue: TEdit;
    Label2: TLabel;
    Label1: TLabel;
    cbx_DoNotEncode: TCheckBox;
    Layout1: TLayout;
    procedure btn_CancelClick(Sender: TObject);
    procedure btn_ApplyClick(Sender: TObject);
    procedure cmb_ParameterKindChange(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    FStandardHeaderNames: TStrings;
    procedure SetStandardHeaderNames(const Value: TStrings);
    { Private declarations }
    property StandardHeaderNames: TStrings read FStandardHeaderNames
      write SetStandardHeaderNames;
    procedure InitParamKind;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent; AParameter: TRESTRequestParameter);
      reintroduce;
  end;

var
  frm_CustomHeaderDlg: Tfrm_CustomHeaderDlg;

implementation

{$R *.fmx}

uses
  RSConsole.ExplorerConsts;

{ Tfrm_CustomHeaderDlg }

procedure Tfrm_CustomHeaderDlg.btn_ApplyClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure Tfrm_CustomHeaderDlg.btn_CancelClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

constructor Tfrm_CustomHeaderDlg.Create(AOwner: TComponent;
  AParameter: TRESTRequestParameter);
begin
  inherited Create(AOwner);

  FStandardHeaderNames := TStringList.Create;
  // Store standard headers, that have been put in using the IDE
  FStandardHeaderNames.Assign(cmb_ParameterName.Items);

  InitParamKind;

  if Assigned(AParameter) then
  begin
    Caption := RSEditCustomParameter;

    cmb_ParameterName.Text := AParameter.Name;
    edt_ParameterValue.Text := AParameter.Value;

    if cmb_ParameterKind.Items.IndexOf(RESTRequestParameterKindToString(AParameter.Kind)) > -1 then
      cmb_ParameterKind.ItemIndex := cmb_ParameterKind.Items.IndexOf
        (RESTRequestParameterKindToString(AParameter.Kind))
    else
      cmb_ParameterKind.ItemIndex := cmb_ParameterKind.Items.IndexOf
        (RESTRequestParameterKindToString(DefaultRESTRequestParameterKind));

    cbx_DoNotEncode.IsChecked := poDoNotEncode in AParameter.Options;
  end
  else
  begin
    Caption := RSAddCustomParameter;

    cmb_ParameterName.Text := '';
    edt_ParameterValue.Text := '';

    cmb_ParameterKind.ItemIndex := cmb_ParameterKind.Items.IndexOf
      (RESTRequestParameterKindToString(DefaultRESTRequestParameterKind));

    cbx_DoNotEncode.IsChecked := False;
  end;
end;

procedure Tfrm_CustomHeaderDlg.cmb_ParameterKindChange(Sender: TObject);
begin
  // If Kind is "Header" then present available standard header parameters
  if cmb_ParameterKind.ItemIndex = ord(TRESTRequestParameterKind.pkHTTPHEADER) then
  begin
    cmb_ParameterName.BeginUpdate;
    try
      cmb_ParameterName.Items.Assign(StandardHeaderNames);
    finally
      cmb_ParameterName.EndUpdate;
      cmb_ParameterName.DropDown;
    end;
  end
  else
    cmb_ParameterName.Items.Clear;
end;

procedure Tfrm_CustomHeaderDlg.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if IsPositiveResult(ModalResult) then
    if Trim(cmb_ParameterName.Text) = '' then
    begin
      MessageDlg(sRESTErrorEmptyParamName, TMsgDlgType.mtError,
        [TMsgDlgBtn.mbOK], 0);
      CanClose := False;
    end;
end;

procedure Tfrm_CustomHeaderDlg.FormDeactivate(Sender: TObject);
begin
  FreeAndNil(FStandardHeaderNames);
end;

procedure Tfrm_CustomHeaderDlg.InitParamKind;
var
  LKind: TRESTRequestParameterKind;
begin
  cmb_ParameterKind.BeginUpdate;
  try
    cmb_ParameterKind.Clear;
    for LKind in [Low(TRESTRequestParameterKind)..High(TRESTRequestParameterKind)] do
      cmb_ParameterKind.Items.Add(RESTRequestParameterKindToString(LKind));
  finally
    cmb_ParameterKind.EndUpdate;
  end;

  // try to set the itemindex to the default-value
  if cmb_ParameterKind.Items.IndexOf(RESTRequestParameterKindToString
    (DefaultRESTRequestParameterKind)) > -1 then
    cmb_ParameterKind.ItemIndex := cmb_ParameterKind.Items.IndexOf
      (RESTRequestParameterKindToString(DefaultRESTRequestParameterKind));
end;

procedure Tfrm_CustomHeaderDlg.SetStandardHeaderNames(const Value: TStrings);
begin
  FStandardHeaderNames := Value;
end;

end.
