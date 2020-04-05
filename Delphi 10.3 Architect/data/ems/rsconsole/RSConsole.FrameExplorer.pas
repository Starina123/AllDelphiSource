{*******************************************************}
{                                                       }
{           CodeGear Delphi Runtime Library             }
{ Copyright(c) 2014-2019 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}
unit RSConsole.FrameExplorer;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Rtti, System.Classes,
  System.Variants, System.IOUtils, System.IniFiles, System.JSON,
  System.Generics.Collections,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.ComboEdit, FMX.NumberBox,
  FMX.StdCtrls, FMX.Objects, FMX.Edit, FMX.ListBox, FMX.Layouts, FMX.Memo,
  FMX.TabControl, FMX.Grid, FMX.Bind.DBEngExt, FMX.Bind.Grid,  FMX.EditBox,
  FMX.Controls.Presentation, System.Net.URLClient, FMX.ScrollBox,
  FMX.Grid.Style, FMX.Menus, FMX.Effects, FMX.Filter.Effects,
  REST.Response.Adapter, REST.Client, REST.Consts, REST.JSON, REST.Types, REST.Utils,
  REST.Backend.ServiceTypes, REST.Backend.MetaTypes, REST.Backend.EMSServices,
  REST.Backend.EndPoint, REST.Backend.BindSource, RSConsole.ModuleBackend,
  REST.Backend.ServiceComponents, REST.Backend.EMSProvider,
  Data.DB, Data.Bind.EngExt, System.Bindings.Outputs, FMX.Bind.Editors,
  Data.Bind.Components, Data.Bind.Grid, Data.Bind.DBScope, Data.Bind.ObjectScope,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,
  RSConsole.RESTObjects, RSConsole.MRUList, RSConsole.SettingsList, RSConsole.Wait;

type
  TExplorerFrame = class(TFrame)
    gb_Response: TGroupBox;
    tc_Response: TTabControl;
    ti_Response_Headers: TTabItem;
    memo_ResponseHeader: TMemo;
    ti_Response_Body: TTabItem;
    memo_ResponseBody: TMemo;
    ToolBar1: TToolBar;
    LabelJson: TLabel;
    LabelRootElement: TLabel;
    ButtonRootElement: TButton;
    EditRootElement: TClearingEdit;
    ti_Response_TableView: TTabItem;
    StringGrid1: TGrid;
    ToolBar2: TToolBar;
    LabelJSONTab: TLabel;
    LabelRootElementTab: TLabel;
    ButtonRootElementTab: TButton;
    EditRootElementTab: TClearingEdit;
    cb_NestedFields: TCheckBox;
    lbl_LastRequestStats: TLabel;
    lbl_LastRequestURL: TLabel;
    Splitter1: TSplitter;
    dlg_LoadRequestSettings: TOpenDialog;
    dlg_SaveRequestSettings: TSaveDialog;
    layout_Request: TLayout;
    gb_Request: TGroupBox;
    Layout1: TLayout;
    cmb_RequestMethod: TComboBox;
    lbl_RequestMethodCaption: TLabel;
    memo_RequestBody: TMemo;
    lbl_RequestBodyCaption: TLabel;
    edt_ContentType: TComboEdit;
    Label16: TLabel;
    Layout2: TLayout;
    lb_CustomParameters: TListBox;
    btn_AddCustomParameter: TButton;
    btn_EditCustomParameter: TButton;
    btn_DeleteCustomParameter: TButton;
    Label10: TLabel;
    lbl_CustomHeadersCaption: TLabel;
    RESTResponse: TRESTResponse;
    RESTResponseDataSetAdapter: TRESTResponseDataSetAdapter;
    BindSourceRESTResponse: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkGridToDataSourceBindSourceDB1: TLinkGridToDataSource;
    BindSourceDB1: TBindSourceDB;
    FDMemTable1: TFDMemTable;
    BackendEndpoint: TBackendEndpoint;
    EMSResponse: TRESTResponse;
    EMSResponseDataSetAdapter: TRESTResponseDataSetAdapter;
    EMSEndpoints: TFDMemTable;
    BackendEndpointDocs: TBackendEndpoint;
    edt_Resource: TComboEdit;
    Layout3: TLayout;
    Layout5: TLayout;
    ToolBar3: TToolBar;
    btn_CopyToClipboard: TButton;
    btn_ExecuteRequest: TButton;
    btn_LoadRequest: TButton;
    btn_Newrequest: TButton;
    btn_SaveRequest: TButton;
    GridPanelLayout1: TGridPanelLayout;
    Layout6: TLayout;
    Layout7: TLayout;
    Layout8: TLayout;
    Layout9: TLayout;
    Layout10: TLayout;
    MenuButton: TButton;
    PopupMenu: TPopupMenu;
    SendRequestMI: TMenuItem;
    NewRequestMI: TMenuItem;
    LoadRequestMI: TMenuItem;
    SaveRequestMI: TMenuItem;
    CopyComponentsMI: TMenuItem;
    Layout4: TLayout;
    CenterLayout: TLayout;
    Layout12: TLayout;
    GridPanelLayout3: TGridPanelLayout;
    GridPanelLayout4: TGridPanelLayout;
    Image2: TImage;
    MenuFillRGBEffect: TFillRGBEffect;
    Image1: TImage;
    ExecuteFillRGBEffect: TFillRGBEffect;
    Label3: TLabel;
    Image3: TImage;
    NewFillRGBEffect: TFillRGBEffect;
    Label1: TLabel;
    Image4: TImage;
    LoadFillRGBEffect: TFillRGBEffect;
    Label2: TLabel;
    Image5: TImage;
    SaveFillRGBEffect: TFillRGBEffect;
    Label4: TLabel;
    Image6: TImage;
    CopyFillRGBEffect: TFillRGBEffect;
    Label5: TLabel;
    procedure btn_ExecuteRequestClick(Sender: TObject);
    procedure btn_LoadRequestClick(Sender: TObject);
    procedure btn_SaveRequestClick(Sender: TObject);
    procedure btn_EditCustomParameterClick(Sender: TObject);
    procedure lb_CustomParametersDblClick(Sender: TObject);
    procedure btn_AddCustomParameterClick(Sender: TObject);
    procedure btn_DeleteCustomParameterClick(Sender: TObject);
    procedure cmb_RequestMethodChange(Sender: TObject);
    procedure tc_RequestChange(Sender: TObject);
    procedure btn_NewrequestClick(Sender: TObject);
    procedure btn_ClearMRUListClick(Sender: TObject);
    procedure ButtonRootElementClick(Sender: TObject);
    procedure edt_ResourceExit(Sender: TObject);
    procedure lbl_BaseURLCaptionClick(Sender: TObject);
    procedure EditRootElementChangeTracking(Sender: TObject);
    procedure EditRootElementTabChangeTracking(Sender: TObject);
    procedure EditRootElementTabKeyDown(Sender: TObject; var Key: Word;
      var KeyChar: Char; Shift: TShiftState);
    procedure EditRootElementKeyDown(Sender: TObject; var Key: Word;
      var KeyChar: Char; Shift: TShiftState);
    procedure ti_Response_BodyClick(Sender: TObject);
    procedure ti_Response_TableViewClick(Sender: TObject);
    procedure StringGrid1HeaderClick(Column: TColumn);
    procedure btn_CopyToClipboardClick(Sender: TObject);
    procedure RESTResponseDataSetAdapterBeforeOpenDataSet(Sender: TObject);
    procedure ButtonRootElementTabClick(Sender: TObject);
    procedure EMSProviderValidateCertificate(const Sender: TObject;
      const ARequest: TURLRequest; const Certificate: TCertificate;
      var Accepted: Boolean);
    procedure edt_ResourceChange(Sender: TObject);
    procedure MenuButtonClick(Sender: TObject);
  private
    { Private declarations }
    FCurrentStyle: String;
  public
    { Public declarations }
    FMRUList: TMRUList;
    FSettingsList: TSettingsList;
    FRESTParams: TRESTRequestParams;
    FCurrentRootElement: string;

    FPopupClosed: Boolean;

    procedure InitBackend;

    procedure InitRequestMethodCombo;

    procedure InitEndpointsCombo;
    procedure RefreshEndpoints;

    procedure DoLoadRequestSettings;
    procedure DoSaveRequestSettings;

    procedure DoResetControls;
    procedure DoFetchRequestParamsFromControls;
    procedure DoPushRequestParamsToControls;

    procedure DoAddCustomParameter;
    procedure DoEditCustomParameter;
    procedure DoDeleteCustomParameter;

    procedure DoExecuteRequest;

    procedure DoAddToMRUList(const AParams: TRESTRequestParams);
    procedure DoClearMRUList;
    procedure DoUpdateMRUList;
    procedure DoClearRequest;

    procedure DoDisplayHTTPResponse(ARequest: TBackendEndpoint;
      AClient: TEMSProvider; AResponse: TRESTResponse);

    procedure ConfigureHTTPConnection;
    procedure FillReponseContentMemo;
    procedure SynchEditCaret(AEdit1, AEdit2: TCustomEdit);
    procedure UpdateRootElement;
    procedure UpdateComponentProperties;

    procedure SaveGridColumnWidths;
    procedure RestoreGridColumnWidths;
    function MakeWidthKey(const AHeader: string): string;

    procedure InitFrame(const APath: string);
    procedure Cleanup;
    procedure UpdateStyle(const AStyle: String);
  end;

implementation

{$R *.fmx}

uses
  RSConsole.Form,
  RSConsole.Consts,
  System.UIConsts,
  RSConsole.CustomHeaderDlgForm, RSConsole.ComponentToClipboard,
  REST.HttpClient,
  RSConsole.ExplorerConsts;

procedure TExplorerFrame.UpdateStyle(const AStyle: string);
begin
  FCurrentStyle := AStyle;

  if AStyle = strDarkStyle then
  begin
    MenuFillRGBEffect.Enabled := False;
    ExecuteFillRGBEffect.Enabled := False;
    NewFillRGBEffect.Enabled := False;
    LoadFillRGBEffect.Enabled := False;
    SaveFillRGBEffect.Enabled := False;
    CopyFillRGBEffect.Enabled := False;
  end
  else if (AStyle = strLightStyle) or (AStyle = '') then
  begin
    MenuFillRGBEffect.Enabled := True;
    ExecuteFillRGBEffect.Enabled := True;
    NewFillRGBEffect.Enabled := True;
    LoadFillRGBEffect.Enabled := True;
    SaveFillRGBEffect.Enabled := True;
    CopyFillRGBEffect.Enabled := True;
  end;
end;

procedure TExplorerFrame.InitFrame(const APath: string);
begin
  // init the explorer frame
  InitBackend;

  tc_Response.ActiveTab := ti_Response_Headers;

  InitEndpointsCombo;
  InitRequestMethodCombo;
  DoResetControls;

  FPopupClosed := False;

  dlg_LoadRequestSettings.InitialDir := APath;
  dlg_SaveRequestSettings.InitialDir := APath;

  FRESTParams := TRESTRequestParams.Create;
  FMRUList := TMRUList.Create(APath + MRUDBFILE);
  FSettingsList := TSettingsList.Create(APath + SETTINGSDBFILE);
  FSettingsList.LoadFromFile;

  DoUpdateMRUList;
  DoPushRequestParamsToControls;
end;

procedure TExplorerFrame.Cleanup;
begin
  FSettingsList.SaveToFile;

  FreeAndNil(FRESTParams);
  FreeAndNil(FMRUList);
  FreeAndNil(FSettingsList);
end;

procedure TExplorerFrame.InitBackend;
begin
  BackendEndpointDocs.Provider := BackendDM.EMSProvider;
  BackendEndpointDocs.Auth := BackendDM.BackendAuth1;
  BackendEndpoint.Provider := BackendDM.EMSProvider;
  BackendEndpoint.Auth := BackendDM.BackendAuth1;
  BackendEndpoint.Timeout := BackendDM.BackendEndpoint1.Timeout;
end;

procedure TExplorerFrame.RefreshEndpoints;
begin
  InitEndpointsCombo;
end;

procedure TExplorerFrame.InitEndpointsCombo;
var
  SL: TStringList;
begin
  if (BackendDM.EMSProvider.URLHost = '') or (BackendDM.EMSProvider.URLPort = 0) then
    Exit;

  if BackendEndpointDocs.Tag = NOT_BUSY then
  begin
    edt_Resource.Items.Clear;
    BackendEndpointDocs.Tag := BUSY;
    BackendEndpointDocs.ExecuteAsync(
      procedure
      var
        LIndex: Integer;
      begin

        // Ignore built-in endpoints.
        SL := TStringList.Create;
        try
          SL.Append('/api');
          SL.Append('/api/apidoc.json');
          SL.Append('/api/apidoc.yaml');
          SL.Append('/api/{item}/apidoc.yaml');
          SL.Append('/edgemodules');
          SL.Append('/edgemodules/fields');
          SL.Append('/edgemodules/resources');
          SL.Append('/edgemodules/resources/fields');
          SL.Append('/edgemodules/{mname}');
          SL.Append('/edgemodules/{mname}/resources');
          SL.Append('/edgemodules/{mname}/resources/{name}');
          SL.Append('/edgemodules/{mname}/{rname}');
          SL.Append('/edgemodules/{mname}/{rname}/{wildcard}');
          SL.Append('/groups');
          SL.Append('/groups/fields');
          SL.Append('/groups/{item}');
          SL.Append('/installations');
          SL.Append('/installations/channels');
          SL.Append('/installations/fields');
          SL.Append('/installations/{id}');
          SL.Append('/push');
          SL.Append('/users');
          SL.Append('/users/fields');
          SL.Append('/users/login');
          SL.Append('/users/logout');
          SL.Append('/users/signup');
          SL.Append('/users/{id}');
          SL.Append('/users/{id}/groups');
          SL.Append('/version');

          edt_Resource.BeginUpdate;
          try
            for LIndex := 0 to EMSEndpoints.FieldDefList.Count - 1 do
              if SL.IndexOf(EMSEndpoints.FieldDefList.FieldDefs[LIndex].Name) = -1 then
                edt_Resource.Items.Append(EMSEndpoints.FieldDefList.FieldDefs[LIndex].Name);
          finally
            edt_Resource.EndUpdate;
          end;
        finally
          SL.Free;
        end;
        //cmb_RequestURL.Text := 'http://localhost:8080';

        BackendEndpointDocs.Tag := NOT_BUSY;
      end, True, True,
      procedure(E: TObject)
      begin
        BackendEndpointDocs.Tag := NOT_BUSY;
        if E is Exception then
          MainForm.SetStatus((E as Exception).Message);
      end);
  end;
end;

procedure TExplorerFrame.btn_AddCustomParameterClick(Sender: TObject);
begin
  DoAddCustomParameter;
end;

procedure TExplorerFrame.btn_ClearMRUListClick(Sender: TObject);
begin
  DoClearMRUList;
end;

procedure TExplorerFrame.btn_CopyToClipboardClick(Sender: TObject);
var
  LList: TList<TComponent>;
  LNames: string;
  LComponent: TComponent;
  LDataSetActive: Boolean;
begin
  LDataSetActive := False;
  LList := TList<TComponent>.Create;
  try
    LList.AddRange([BackendDM.EMSProvider, BackendEndpoint, RESTResponse]);
    if tc_Response.ActiveTab = ti_Response_TableView then
    begin
      LDataSetActive := RESTResponseDataSetAdapter.Active;
      SaveGridColumnWidths;
      RESTResponseDataSetAdapter.Active := False;
      FDMemTable1.StoreDefs := False; // don't copy field defs to clipboard
      LList.AddRange([RESTResponseDataSetAdapter, FDMemTable1]);
    end;
    UpdateComponentProperties;
    if BackendEndpoint.Auth <> nil then
      LList.Add(BackendDM.BackendAuth1);
    StreamToClipboard(LList.ToArray);
    if LDataSetActive then
    begin
      RESTResponseDataSetAdapter.Active := True;
      RestoreGridColumnWidths;
    end;
    for LComponent in LList do
    begin
      if LNames <> '' then
        LNames := LNames + ', ';
      LNames := LNames + LComponent.ClassName;
    end;
    MessageDlg(Format(RSComponentsCopied, [LNames]), TMsgDlgType.mtInformation,
      [TMsgDlgBtn.mbOK], 0);
  finally
    LList.Free;
  end;
end;

procedure TExplorerFrame.btn_DeleteCustomParameterClick(Sender: TObject);
begin
  DoDeleteCustomParameter;
end;

procedure TExplorerFrame.btn_EditCustomParameterClick(Sender: TObject);
begin
  DoEditCustomParameter;
end;

procedure TExplorerFrame.btn_ExecuteRequestClick(Sender: TObject);
begin
  TWait.Start;
  try
    DoExecuteRequest;
  finally
    TWait.Done;
  end;
end;

procedure TExplorerFrame.btn_LoadRequestClick(Sender: TObject);
begin
  DoLoadRequestSettings;
end;

procedure TExplorerFrame.btn_NewrequestClick(Sender: TObject);
begin
  DoClearRequest;
end;

procedure TExplorerFrame.btn_SaveRequestClick(Sender: TObject);
begin
  DoSaveRequestSettings;
end;

procedure TExplorerFrame.ButtonRootElementClick(Sender: TObject);
begin
  UpdateRootElement;
end;

procedure TExplorerFrame.ButtonRootElementTabClick(Sender: TObject);
begin
  UpdateRootElement;
end;

procedure TExplorerFrame.cmb_RequestMethodChange(Sender: TObject);
var
  LMethod: TRESTRequestMethod;
begin
  if cmb_RequestMethod.ItemIndex > -1 then
  begin
    LMethod := RESTRequestMethodFromString(cmb_RequestMethod.Items[cmb_RequestMethod.ItemIndex]);
    memo_RequestBody.Enabled := LMethod in [TRESTRequestMethod.rmPOST, TRESTRequestMethod.rmPUT];
  end
  else
    memo_RequestBody.Enabled := False;
end;

procedure TExplorerFrame.DoAddCustomParameter;
var
  LParameter: TRESTRequestParameter;
  LDialog: Tfrm_CustomHeaderDlg;
  LKind: TRESTRequestParameterKind;
begin
  DoFetchRequestParamsFromControls;

  LDialog := Tfrm_CustomHeaderDlg.Create(Self, nil);
  try
    if LDialog.ShowModal = mrOk then
    begin

      if LDialog.cmb_ParameterKind.ItemIndex > -1 then
        LKind := RESTRequestParameterKindFromString
          (LDialog.cmb_ParameterKind.Items[LDialog.cmb_ParameterKind.ItemIndex])
      else
        LKind := DefaultRESTRequestParameterKind;

      LParameter := FRESTParams.CustomParams.AddItem;
      LParameter.Name := LDialog.cmb_ParameterName.Text;
      LParameter.Value := LDialog.edt_ParameterValue.Text;
      LParameter.Kind := LKind;
      if LDialog.cbx_DoNotEncode.IsChecked then
        LParameter.Options := LParameter.Options + [poDoNotEncode]
      else
        LParameter.Options := LParameter.Options - [poDoNotEncode];

      DoPushRequestParamsToControls;
    end;
  finally
    LDialog.Release;
  end;
end;

procedure TExplorerFrame.DoAddToMRUList(const AParams: TRESTRequestParams);
begin
  Assert(Assigned(AParams));

  FMRUList.AddItem(FRESTParams);
  DoUpdateMRUList;
end;

procedure TExplorerFrame.DoClearMRUList;
begin
  if (MessageDlg(RSConfirmClearRecentRequests, TMsgDlgType.mtConfirmation,
    [TMsgDlgBtn.mbYes, TMsgDlgBtn.mbNo], 0, TMsgDlgBtn.mbNo) = mrYes) then
  begin
    DoFetchRequestParamsFromControls;

    FMRUList.Clear;

    DoPushRequestParamsToControls;
  end;
end;

procedure TExplorerFrame.DoClearRequest;
begin
  EditRootElement.Text := '';
  FRESTParams.ResetToDefaults;
  DoPushRequestParamsToControls;
end;

procedure TExplorerFrame.DoEditCustomParameter;
var
  LParameter: TRESTRequestParameter;
  LDialog: Tfrm_CustomHeaderDlg;
begin
  if lb_CustomParameters.ItemIndex < 0 then
  begin
    MessageDlg(RSNoCustomParameterSelected, TMsgDlgType.mtError,
      [TMsgDlgBtn.mbOK], 0);
    Exit;
  end;

  DoFetchRequestParamsFromControls;

  LParameter := FRESTParams.CustomParams.ParameterByIndex(lb_CustomParameters.ItemIndex);

  LDialog := Tfrm_CustomHeaderDlg.Create(Self, LParameter);
  try
    if LDialog.ShowModal = mrOk then
    begin
      LParameter.Name := LDialog.cmb_ParameterName.Text;
      LParameter.Value := LDialog.edt_ParameterValue.Text;
      if (LDialog.cmb_ParameterKind.ItemIndex > -1) then
        LParameter.Kind := RESTRequestParameterKindFromString
          (LDialog.cmb_ParameterKind.Items[LDialog.cmb_ParameterKind.ItemIndex])
      else
        LParameter.Kind := DefaultRESTRequestParameterKind;
      if LDialog.cbx_DoNotEncode.IsChecked then
        LParameter.Options := LParameter.Options + [poDoNotEncode]
      else
        LParameter.Options := LParameter.Options - [poDoNotEncode];

      DoPushRequestParamsToControls;
    end;
  finally
    LDialog.Release;
  end;
end;

procedure TExplorerFrame.DoDeleteCustomParameter;
var
  LParameter: TRESTRequestParameter;
begin
  if (lb_CustomParameters.ItemIndex < 0) then
  begin
    MessageDlg(RSNoCustomParameterSelected, TMsgDlgType.mtError,
      [TMsgDlgBtn.mbOK], 0);
    Exit;
  end;

  DoFetchRequestParamsFromControls;

  LParameter := FRESTParams.CustomParams.ParameterByIndex(lb_CustomParameters.ItemIndex);

  if (MessageDlg(RSConfirmDeleteCustomParameter + LineFeed + '"' +
    LParameter.ToString + '"?', TMsgDlgType.mtConfirmation, [TMsgDlgBtn.mbYes,
    TMsgDlgBtn.mbNo], 0, TMsgDlgBtn.mbNo) = mrYes) then
  begin
    FRESTParams.CustomParams.Delete(LParameter);
    DoPushRequestParamsToControls;
  end;
end;

procedure TExplorerFrame.DoDisplayHTTPResponse(ARequest: TBackendEndpoint;
  AClient: TEMSProvider; AResponse: TRESTResponse);
var
  i: Integer;
begin
  if AResponse.StatusCode >= 300 then
    lbl_LastRequestStats.FontColor := claRed
  else
    if FCurrentStyle = strDarkStyle then
      lbl_LastRequestStats.FontColor := claWhite
    else
      lbl_LastRequestStats.FontColor := claBlack;

  // we need to duplicate the ampersands to display them in a label ... ...
  lbl_LastRequestURL.Text := StringReplace(AResponse.FullRequestURI, '&', '&&',
    [rfReplaceAll]);

  lbl_LastRequestStats.Text := Format(RSBytesOfDataReturnedAndTiming,
    [AResponse.StatusCode, AResponse.StatusText, AResponse.ContentLength,
    ARequest.ExecutionPerformance.PreProcessingTime,
    ARequest.ExecutionPerformance.ExecutionTime,
    ARequest.ExecutionPerformance.PostProcessingTime,
    ARequest.ExecutionPerformance.TotalExecutionTime]);

  // transfer http-headers into memo
  memo_ResponseHeader.Lines.Clear;
  for i := 0 to AResponse.Headers.Count - 1 do
    memo_ResponseHeader.Lines.Add(AResponse.Headers[i]);

  FillReponseContentMemo;
end;

procedure TExplorerFrame.DoExecuteRequest;
begin
  DoFetchRequestParamsFromControls;
  ConfigureHTTPConnection;

  // Fielddefs are recreated with every request. If FieldDefs already exist,
  // then RestResponseDatasetadpater will try to re-use them - which means that
  // we would end up with no-matching Responses and FieldDefs for different requests
  SaveGridColumnWidths;
  RESTResponseDataSetAdapter.FieldDefs.Clear;

  BackendEndpoint.ResetToDefaults;
  RESTResponse.ResetToDefaults;

  UpdateComponentProperties;

  if Trim(BackendEndpoint.Resource) = '' then
  begin
    TWait.Done;
    MessageDlg(sRESTErrorEmptyURL, TMsgDlgType.mtError, [TMsgDlgBtn.mbOK], 0);
    Exit;
  end;

  try
    BackendEndpoint.Execute;
  except
    on E: TRESTResponseDataSetAdapter.EJSONValueError do
    begin
      // Ignore
    end;
    on E: TRESTResponse.EJSONValueError do
    begin
      // Ignore
    end
    else
      raise;
  end;
  RestoreGridColumnWidths;

  DoDisplayHTTPResponse(BackendEndpoint, BackendDM.EMSProvider, RESTResponse);

  // add the current request to the MRU-list
  DoAddToMRUList(FRESTParams);
end;

procedure TExplorerFrame.UpdateComponentProperties;
begin
  // EditRootElement.Text := '';
  DoFetchRequestParamsFromControls;
  ConfigureHTTPConnection;

  // BackendDM.EMSProvider.URLHost := cmb_RequestURL.Text;
  // BackendDM.EMSProvider.URLPort := cmb_RequestURL.Text;
  // EMSProvider.URLHost := cmb_RequestURL.Text;
  // EMSProvider.URLPort := cmb_RequestURL.Text;
  BackendEndpoint.Resource := FRESTParams.Resource;

  BackendEndpoint.Params.Clear;
  BackendEndpoint.Params.Assign(FRESTParams.CustomParams);

  if FRESTParams.CustomBody.Size > 0 then
    BackendEndpoint.AddBody(FRESTParams.CustomBody, ContentTypeFromString(FRESTParams.ContentType));

  BackendEndpoint.Method := FRESTParams.Method;

  case FRESTParams.AuthMethod of
    TRESTAuthMethod.amNONE:
      begin
        BackendEndpoint.Auth := nil;
      end;
    TRESTAuthMethod.amSIMPLE:
      begin
        BackendEndpoint.Auth := BackendDM.BackendAuth1;
        BackendDM.BackendAuth1.Username := FRESTParams.AuthUsername;
        BackendDM.BackendAuth1.Password := FRESTParams.AuthPassword;
      end;
  else
    raise ERESTException.Create(sRESTUnsupportedAuthMethod);
  end;

  BackendEndpoint.Provider := BackendDM.EMSProvider;
end;

procedure TExplorerFrame.DoFetchRequestParamsFromControls;
begin
  // workaround for a bug in FMX - the onchange-events are triggered too early.
  // this is not a problem for our objects, but we get an AV while querying a
  // tedit for it's text.
  if not MainForm.Visible and not BackendDM.Closing then
    Exit;

  if cmb_RequestMethod.ItemIndex > -1 then
    FRESTParams.Method := RESTRequestMethodFromString(cmb_RequestMethod.Items[cmb_RequestMethod.ItemIndex])
  else
    FRESTParams.Method := DefaultRESTRequestMethod;

  FRESTParams.Resource := edt_Resource.Text;
  FRESTParams.ContentType := edt_ContentType.Text;

  // after fetching the resource, we try to re-create the parameter-list
  // FRESTParams.CustomParams.FromString('', FRESTParams.Resource);
  FRESTParams.CustomParams.CreateURLSegmentsFromString(FRESTParams.Resource);

  FRESTParams.AuthMethod := DefaultRESTAuthMethod;

  FRESTParams.CustomBody.Clear;
  memo_RequestBody.Lines.WriteBOM := False;
  memo_RequestBody.Lines.SaveToStream(FRESTParams.CustomBody, TEncoding.UTF8);
end;

procedure TExplorerFrame.DoPushRequestParamsToControls;
var
  s: string;
  LParameter: TRESTRequestParameter;
begin
  s := RESTRequestMethodToString(FRESTParams.Method);
  cmb_RequestMethod.ItemIndex := cmb_RequestMethod.Items.IndexOf(s);

  //cmb_RequestURL.Text := FRESTParams.URL;
  edt_Resource.Text := FRESTParams.Resource;

  if edt_ContentType.Items.IndexOf(FRESTParams.ContentType) > -1 then
  begin
    edt_ContentType.ItemIndex := edt_ContentType.Items.IndexOf(FRESTParams.ContentType);
    edt_ContentType.Text := FRESTParams.ContentType;
  end
  else
  begin
    edt_ContentType.ItemIndex := -1;
    edt_ContentType.Text := '';
  end;

  lb_CustomParameters.BeginUpdate;
  lb_CustomParameters.Items.BeginUpdate;
  try
    lb_CustomParameters.Clear;
    for LParameter in FRESTParams.CustomParams do
      lb_CustomParameters.Items.AddObject(LParameter.ToString, LParameter);
  finally
    lb_CustomParameters.Items.EndUpdate;
    lb_CustomParameters.EndUpdate;
  end;

  if FRESTParams.CustomBody.Size > 0 then
  begin
    FRESTParams.CustomBody.Seek(0, soFromBeginning);
    memo_RequestBody.Lines.LoadFromStream(FRESTParams.CustomBody);
  end
  else
    memo_RequestBody.Lines.Clear;
end;

procedure TExplorerFrame.DoResetControls;
begin
  lbl_LastRequestStats.Text := '';

  memo_RequestBody.Lines.Clear;
  memo_ResponseHeader.Lines.Clear;
  memo_ResponseBody.Lines.Clear;

  cmb_RequestMethod.ItemIndex := cmb_RequestMethod.Items.IndexOf
    (RESTRequestMethodToString(DefaultRESTRequestMethod));

  lb_CustomParameters.Clear;
end;

procedure TExplorerFrame.DoLoadRequestSettings;
begin
  if dlg_LoadRequestSettings.Execute then
  begin
    FRESTParams.LoadFromFile(dlg_LoadRequestSettings.FileName);
    DoPushRequestParamsToControls;
  end;
end;

procedure TExplorerFrame.DoSaveRequestSettings;
begin
  DoFetchRequestParamsFromControls;
  if dlg_SaveRequestSettings.Execute then
    FRESTParams.SaveToFile(dlg_SaveRequestSettings.FileName);
end;

procedure TExplorerFrame.DoUpdateMRUList;
begin
end;

procedure TExplorerFrame.EditRootElementChangeTracking(Sender: TObject);
begin
  EditRootElementTab.Text := EditRootElement.Text;
end;

procedure TExplorerFrame.EditRootElementKeyDown(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin
  if (KeyChar = #0) and (Key = 13) and (Shift = []) then
    UpdateRootElement;
end;

procedure TExplorerFrame.EditRootElementTabChangeTracking(Sender: TObject);
begin
  EditRootElement.Text := EditRootElementTab.Text;
end;

procedure TExplorerFrame.UpdateRootElement;
var
  LIntf: IRESTResponseJSON;
begin
  Assert(EditRootElement.Text = EditRootElementTab.Text);
  if (RESTResponse.RootElement <> EditRootElement.Text) or
    (cb_NestedFields.IsChecked <> RESTResponseDataSetAdapter.NestedElements) then
  begin

    SaveGridColumnWidths;
    try
      LIntf := RESTResponse;
      if not LIntf.HasJSONResponse then
        if RESTResponse.ContentLength > 0 then
          raise Exception.Create(Format(RSRootElementAppliesToJSON, [EditRootElement.Text]));
      RESTResponse.RootElement := EditRootElement.Text;
    except
      TWait.Done;
      RESTResponse.RootElement := FCurrentRootElement;
      if tc_Response.ActiveTab = ti_Response_TableView then
        EditRootElementTab.SetFocus
      else
      begin
        tc_Response.ActiveTab := ti_Response_Body;
        EditRootElement.SetFocus
      end;
      raise;
    end;
    RESTResponseDataSetAdapter.NestedElements := cb_NestedFields.IsChecked;
    RestoreGridColumnWidths;
    FillReponseContentMemo;
  end;
end;

procedure TExplorerFrame.EditRootElementTabKeyDown(Sender: TObject;
  var Key: Word; var KeyChar: Char; Shift: TShiftState);
begin
  if (KeyChar = #0) and (Key = 13) and (Shift = []) then
    UpdateRootElement;
end;

procedure TExplorerFrame.edt_ResourceChange(Sender: TObject);
begin
  DoFetchRequestParamsFromControls;
  DoPushRequestParamsToControls;
end;

procedure TExplorerFrame.edt_ResourceExit(Sender: TObject);
begin
  DoFetchRequestParamsFromControls;
  // FRESTParams.CustomParams.FromString('', edt_Resource.Text);
  FRESTParams.CustomParams.CreateURLSegmentsFromString(edt_Resource.Text);
  DoPushRequestParamsToControls;
end;

procedure TExplorerFrame.EMSProviderValidateCertificate(const Sender: TObject;
  const ARequest: TURLRequest; const Certificate: TCertificate;
  var Accepted: Boolean);
begin
  if not Accepted then
    if MessageDlg(RSUnableToValidateCertifcate, TMsgDlgType.mtError,
      [TMsgDlgBtn.mbYes, TMsgDlgBtn.mbNo], 0) = mrYes then
      Accepted := True;
end;

procedure TExplorerFrame.InitRequestMethodCombo;
var
  LRequestMethod: TRESTRequestMethod;
begin
  cmb_RequestMethod.BeginUpdate;
  try
    cmb_RequestMethod.Clear;
    for LRequestMethod in [Low(TRESTRequestMethod) .. High(TRESTRequestMethod)] do
      cmb_RequestMethod.Items.Add(RESTRequestMethodToString(LRequestMethod));
  finally
    cmb_RequestMethod.EndUpdate;
  end;

  // try to set the itemindex to the default-value
  if (cmb_RequestMethod.Items.IndexOf(RESTRequestMethodToString
    (DefaultRESTRequestMethod)) > -1) then
    cmb_RequestMethod.ItemIndex := cmb_RequestMethod.Items.IndexOf
      (RESTRequestMethodToString(DefaultRESTRequestMethod));
end;

procedure TExplorerFrame.FillReponseContentMemo;

  procedure SetLabel(const AValue: string);
  begin
    LabelJson.Text := AValue;
    LabelJSONTab.Text := AValue;
  end;

var
  LJson: TJSONValue;
  LIntf: IRESTResponseJSON;
  s: string;
begin
  // Json or not?
  LJson := RESTResponse.JSONValue;

  if Assigned(LJson) then
  begin
    // it's Json
    s := LJson.Format;
    if Length(s) > 200000 then
      s := Copy(s, 1, 200000) + ' ...';
    memo_ResponseBody.Lines.Text := s;
    SetLabel(RSContentIsValidJSON);
  end
  else
  begin
    LIntf := RESTResponse;
    // pure text
    memo_ResponseBody.Lines.Text := RESTResponse.Content;
    if LIntf.HasJSONResponse then
      SetLabel(RSInvalidRootElement)
    else
      SetLabel(RSContentIsNotJSON);
    // EditRootElement.Enabled := false;
    // ButtonRootElement.Enabled := false;
  end;
  memo_ResponseBody.Repaint;
end;

procedure TExplorerFrame.ConfigureHTTPConnection;
begin
  BackendEndpoint.Timeout := Trunc(BackendDM.BackendEndpoint1.Timeout)
end;

procedure TExplorerFrame.lbl_BaseURLCaptionClick(Sender: TObject);
begin
  DoFetchRequestParamsFromControls;
  DoAddToMRUList(FRESTParams);
end;

procedure TExplorerFrame.lb_CustomParametersDblClick(Sender: TObject);
begin
  DoEditCustomParameter;
end;

function TExplorerFrame.MakeWidthKey(const AHeader: string): string;
var
  i, j: Integer;
begin
  Result := AHeader;
  if RESTResponse.RootElement <> '' then
    if RESTResponse.JSONValue is TJSONObject then
      Result := RESTResponse.RootElement + '.' + AHeader;
  // Normalize [0]
  repeat
    i := Result.IndexOf('[');
    if i >= 0 then
    begin
      j := Result.IndexOf(']', i);
      if j > 0 then
        Result := Result.Substring(0, i) + '||' + Result.Substring(j + 1,
          Length(Result))
      else
        Result := Result.Substring(0, i) + '||';
    end;
  until i < 0;
  if Result.StartsWith('||.') then
    Result := Result.Substring(3);
end;

procedure TExplorerFrame.MenuButtonClick(Sender: TObject);
var
  LP: TPointF;
begin
  LP.X := 0;
  LP.Y := 0;
  LP := MenuButton.LocalToAbsolute(LP);
  LP := MainForm.ClientToScreen(LP);
  PopupMenu.Popup(LP.X, LP.Y + MenuButton.Height);
end;

procedure TExplorerFrame.RestoreGridColumnWidths;
var
  i: Integer;
  LColumn: TColumn;
  LKey: string;
  LWidth: Integer;
begin
  for i := 0 to StringGrid1.ColumnCount - 1 do
  begin
    LColumn := StringGrid1.Columns[i];
    LKey := MakeWidthKey(LColumn.Header);
    if FSettingsList.GetWidth(LKey, LWidth) then
      LColumn.Width := LWidth;
  end;
end;

procedure TExplorerFrame.RESTResponseDataSetAdapterBeforeOpenDataSet(Sender: TObject);
begin
  FCurrentRootElement := RESTResponse.RootElement;
end;

procedure TExplorerFrame.SaveGridColumnWidths;
var
  i: Integer;
  LColumn: TColumn;
  LKey: string;
begin
  for i := 0 to StringGrid1.ColumnCount - 1 do
  begin
    LColumn := StringGrid1.Columns[i];
    LKey := MakeWidthKey(LColumn.Header);
    FSettingsList.AddWidth(LKey, Round(LColumn.Width));
  end;
  FSettingsList.SaveToFile;
end;

procedure TExplorerFrame.StringGrid1HeaderClick(Column: TColumn);
var
  LPath: string;
begin
  if (Column <> nil) and not Column.Header.StartsWith('TJSON') then
  begin
    LPath := FCurrentRootElement;
    if RESTResponse.JSONValue is TJSONArray then
    begin
      if TJSONArray(RESTResponse.JSONValue).Count > 0 then
        LPath := LPath + '[0].' + Column.Header;
    end
    else
    begin
      if LPath <> '' then
        LPath := LPath + '.';
      LPath := LPath + Column.Header;
    end;
  end;
  if LPath <> '' then
    EditRootElementTab.Text := LPath;
end;

procedure TExplorerFrame.tc_RequestChange(Sender: TObject);
begin
  RefreshEndpoints;
  DoFetchRequestParamsFromControls;
end;

procedure TExplorerFrame.SynchEditCaret(AEdit1, AEdit2: TCustomEdit);
var
  LCaret: Integer;
begin
  if AEdit2.Text <> '' then
  begin
    AEdit2.SetFocus;
    AEdit2.SelLength := 0;
    LCaret := AEdit1.CaretPosition;
    AEdit2.CaretPosition := LCaret;
  end;
end;

procedure TExplorerFrame.ti_Response_BodyClick(Sender: TObject);
begin
  SynchEditCaret(EditRootElementTab, EditRootElement);
end;

procedure TExplorerFrame.ti_Response_TableViewClick(Sender: TObject);
begin
  SynchEditCaret(EditRootElement, EditRootElementTab);
end;

end.
