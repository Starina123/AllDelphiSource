{*******************************************************}
{                                                       }
{           CodeGear Delphi Runtime Library             }
{ Copyright(c) 2014-2019 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}
unit RSConfig.AuthorizationFrame;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants, System.Json, Rest.Json,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  Data.Bind.Controls, FMX.Controls.Presentation, FMX.Edit, FMX.Layouts,
  FMX.TabControl, FMX.ListBox, FMX.DialogService, RSConfig.ListControlFrame,
  RSConfig.NameValueFrame;

type
  TAuthorizationFrame = class(TFrame)
    ListControlFrame1: TListControlFrame;
    TabControl: TTabControl;
    ListItem: TTabItem;
    EditItem: TTabItem;
    Layout72: TLayout;
    SaveButton: TButton;
    CancelButton: TButton;
    Layout1: TLayout;
    Label1: TLabel;
    VertScrollBox2: TVertScrollBox;
    Layout4: TLayout;
    Label4: TLabel;
    UsersLB: TListBox;
    Layout7: TLayout;
    RemoveUsersButton: TButton;
    AddUsersButton: TButton;
    Layout3: TLayout;
    Label3: TLabel;
    GroupsLB: TListBox;
    Layout8: TLayout;
    RemoveGroupsButton: TButton;
    AddGroupsButton: TButton;
    Label2: TLabel;
    PublicSwitch: TSwitch;
    Label5: TLabel;
    ListBox1: TListBox;
    procedure RemoveGroupsButtonClick(Sender: TObject);
    procedure AddGroupsButtonClick(Sender: TObject);
    procedure RemoveUsersButtonClick(Sender: TObject);
    procedure AddUsersButtonClick(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
    procedure SaveButtonClick(Sender: TObject);
    procedure PublicSwitchSwitch(Sender: TObject);
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

constructor TAuthorizationFrame.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  ListControlFrame1.HelpButton.Hint := strAuthorizationHelp;
end;

procedure TAuthorizationFrame.Reset;
begin
  if TabControl.ActiveTab = EditItem then
    CancelButtonClick(Self);
end;

procedure TAuthorizationFrame.AddGroupsButtonClick(Sender: TObject);
begin
  TDialogService.InputQuery(strAddGroups, [strGroupPrompt], [''],
    procedure(const AResult: TModalResult; const Values: array of string)
    begin
      if AResult = mrOk then
        GroupsLB.Items.Add(Values[0]);
    end);
end;

procedure TAuthorizationFrame.AddUsersButtonClick(Sender: TObject);
begin
  TDialogService.InputQuery(strAddUsers, [strUserPrompt], [''],
    procedure(const AResult: TModalResult; const Values: array of string)
    begin
      if AResult = mrOk then
        UsersLB.Items.Add(Values[0]);
    end);
end;

procedure TAuthorizationFrame.Callback(Sender: TObject);
var
  LAuthorizationItem: TAuthorizationItem;
  LIndex: Integer;
begin
  ActiveFrame := TNameValueFrame(Sender);
  if Assigned(ActiveFrame) then
  begin
    if ActiveFrame.ValueEdit.Text <> '' then
    begin
      LAuthorizationItem := TAuthorizationItem.FromJson(ActiveFrame.ValueEdit.Text);
      try
        PublicSwitch.IsChecked := LAuthorizationItem.&Public;
        // handle third state where public is not defined
        PublicSwitch.Tag := ActiveFrame.ValueEdit.Text.IndexOf('"public":');
        // default to true if public is not defined
        if PublicSwitch.Tag = -1 then
          PublicSwitch.IsChecked := True;
        // reset changed state
        PublicSwitch.TagFloat := 0;

        for LIndex := Low(LAuthorizationItem.Users) to High(LAuthorizationItem.Users) do
          UsersLB.Items.Add(LAuthorizationItem.Users[LIndex]);
        for LIndex := Low(LAuthorizationItem.Groups) to High(LAuthorizationItem.Groups) do
          GroupsLB.Items.Add(LAuthorizationItem.Groups[LIndex]);
      finally
        LAuthorizationItem.Free;
      end;
    end;
    TabControl.ActiveTab := EditItem;
    ConfigForm.SaveLayout.Visible := False;
  end;
end;

procedure TAuthorizationFrame.CancelButtonClick(Sender: TObject);
begin
  ClearFields;
  TabControl.ActiveTab := ListItem;
  ConfigForm.SaveLayout.Visible := True;
end;

procedure TAuthorizationFrame.LoadSectionList;
begin
  ListControlFrame1.SetFrameType(AUTHORIZATION_FRAME);
  ListControlFrame1.SetListBox(ListBox1);
  ListControlFrame1.SetCallback(Callback);
  ConfigDM.LoadSectionList(strServerAuthorization, ListBox1, Callback);
end;

procedure TAuthorizationFrame.PublicSwitchSwitch(Sender: TObject);
begin
  // designate a changed state
  PublicSwitch.TagFloat := 1;
end;

procedure TAuthorizationFrame.RemoveGroupsButtonClick(Sender: TObject);
begin
  if GroupsLB.ItemIndex > -1 then
    GroupsLB.Items.Delete(GroupsLB.ItemIndex);
end;

procedure TAuthorizationFrame.RemoveUsersButtonClick(Sender: TObject);
begin
  if UsersLB.ItemIndex > -1 then
    UsersLB.Items.Delete(UsersLB.ItemIndex);
end;

procedure TAuthorizationFrame.SaveButtonClick(Sender: TObject);
var
  LAuthorizationItem: TAuthorizationItem;
  LIndex: Integer;
  LJsonObject: TJSONObject;
begin
  if Assigned(ActiveFrame) then
  begin
    LAuthorizationItem := TAuthorizationItem.Create;
    try
      LAuthorizationItem.&Public := PublicSwitch.IsChecked;
      for LIndex := 0 to UsersLB.Items.Count - 1 do
        LAuthorizationItem.Users := LAuthorizationItem.Users + [UsersLB.Items[LIndex]];
      for LIndex := 0 to GroupsLB.Items.Count - 1 do
        LAuthorizationItem.Groups := LAuthorizationItem.Groups + [GroupsLB.Items[LIndex]];
      // if public was not defined and not changed remove it
      if (PublicSwitch.Tag = -1) and (PublicSwitch.TagFloat = 0) then
      begin
        LJsonObject := TJson.ObjectToJsonObject(LAuthorizationItem,[TJsonOption.joIgnoreEmptyArrays,TJsonOption.joIgnoreEmptyStrings]);
        try
          LJsonObject.RemovePair('public');
          ActiveFrame.ValueEdit.Text := LJsonObject.ToJSON;
        finally
          LJsonObject.Free;
        end;
      end
      else
        ActiveFrame.ValueEdit.Text := LAuthorizationItem.ToJson;
    finally
      LAuthorizationItem.Free;
    end;
    ClearFields;
    ActiveFrame := nil;
  end;
  TabControl.ActiveTab := ListItem;
  ConfigForm.SaveLayout.Visible := True;
end;

procedure TAuthorizationFrame.ClearFields;
begin
  PublicSwitch.IsChecked := True;
  UsersLB.Items.Clear;
  GroupsLB.Items.Clear;
end;

procedure TAuthorizationFrame.SaveSectionList;
begin
  ConfigDM.SaveSectionList(strServerAuthorization, ListBox1);
end;

end.
