{*******************************************************}
{                                                       }
{           CodeGear Delphi Runtime Library             }
{ Copyright(c) 2014-2019 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}
unit RSConfig.RedirectFrame;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  Data.Bind.Controls, FMX.Controls.Presentation, FMX.Edit, FMX.Layouts,
  FMX.TabControl, RSConfig.NameValueFrame, FMX.ListBox,
  RSConfig.ListControlFrame;

type
  TRedirectFrame = class(TFrame)
    ListControlFrame1: TListControlFrame;
    TabControl: TTabControl;
    ListItem: TTabItem;
    EditItem: TTabItem;
    Layout72: TLayout;
    SaveButton: TButton;
    CancelButton: TButton;
    DestinationEdit: TEdit;
    Layout1: TLayout;
    Label1: TLabel;
    ListBox1: TListBox;
    procedure SaveButtonClick(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
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

constructor TRedirectFrame.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  ListControlFrame1.HelpButton.Hint := strRedirectsHelp;
end;

procedure TRedirectFrame.Callback(Sender: TObject);
var
  LRedirectItem: TRedirectItem;
begin
  ActiveFrame := TNameValueFrame(Sender);
  if Assigned(ActiveFrame) then
  begin
    if ActiveFrame.ValueEdit.Text <> '' then
    begin
      LRedirectItem := TRedirectItem.FromJson(ActiveFrame.ValueEdit.Text);
      try
        DestinationEdit.Text := LRedirectItem.Destination;
      finally
        LRedirectItem.Free;
      end;
    end;
    TabControl.ActiveTab := EditItem;
    ConfigForm.SaveLayout.Visible := False;
  end;
end;

procedure TRedirectFrame.Reset;
begin
  if TabControl.ActiveTab = EditItem then
    CancelButtonClick(Self);
end;

procedure TRedirectFrame.CancelButtonClick(Sender: TObject);
begin
  ClearFields;
  TabControl.ActiveTab := ListItem;
  ConfigForm.SaveLayout.Visible := True;
end;

procedure TRedirectFrame.LoadSectionList;
begin
  ListControlFrame1.SetFrameType(REDIRECT_FRAME);
  ListControlFrame1.SetListBox(ListBox1);
  ListControlFrame1.SetCallback(Callback);
  ConfigDM.LoadSectionList(strServerRedirect, ListBox1, Callback);
end;

procedure TRedirectFrame.SaveButtonClick(Sender: TObject);
var
  LRedirectItem: TRedirectItem;
begin
  if Assigned(ActiveFrame) then
  begin
    LRedirectItem := TRedirectItem.Create;
    try
      LRedirectItem.Destination := DestinationEdit.Text;
      ActiveFrame.ValueEdit.Text := LRedirectItem.ToJson;
    finally
      LRedirectItem.Free;
    end;
    ClearFields;
    ActiveFrame := nil;
  end;
  TabControl.ActiveTab := ListItem;
  ConfigForm.SaveLayout.Visible := True;
end;

procedure TRedirectFrame.ClearFields;
begin
  DestinationEdit.Text := '';
end;

procedure TRedirectFrame.SaveSectionList;
begin
  ConfigDM.SaveSectionList(strServerRedirect, ListBox1);
end;

end.
