{*******************************************************}
{                                                       }
{           CodeGear Delphi Runtime Library             }
{ Copyright(c) 2014-2019 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}
unit RSConsole.FrameViews;

interface

uses
  System.Classes, FMX.StdCtrls, FMX.Forms,
  RSConsole.Data, FMX.Grid, System.Generics.Collections,
  RSConsole.FrameAdd, FMX.TabControl,
  RSConsole.Types, RSConsole.TypesViews, FMX.Controls,
  FMX.Controls.Presentation, FMX.Types, RSConsole.FramePush,
  RSConsole.FrameExplorer;

type
  TViewsFrame = class(TFrame)
    ViewsControl: TTabControl;
    PushTabItem: TTabItem;
    PushFrame1: TPushFrame;
    ExplorerTabItem: TTabItem;
    ExplorerFrame: TExplorerFrame;
    procedure ViewsControlChange(Sender: TObject);
  private
    { Private declarations }
    FEMSConsoleData: TEMSConsoleData;
    // procedure OnTabItemClick(Sender: TObject);
    function CreateTab(const AName: string): TEMSTabItem;

  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure DisableTabs(ATab: TEMSTabItem = nil);
    procedure EnableTabs;
    procedure ChangeTab(AIndex: Integer);
    procedure CreateUsersView(const AUserID: string);
    procedure CreateGroupsView(const AGroupName: string);
    procedure CreateInstallationsView(const AInstallationID: string);
    procedure CreateEdgeModulesView(const AEdgePointID: string);
    procedure CreateResourcesView(const AResourceID: string);
    procedure RefreshEndpoints;
    procedure UpdateStyle(const AStyle: String);
    property EMSConsoleData: TEMSConsoleData read FEMSConsoleData
      write FEMSConsoleData;
  end;

implementation

uses RSConsole.Form, RSConsole.Consts;

{$R *.fmx}
{ TViewsFrame }

constructor TViewsFrame.Create(AOwner: TComponent);
begin
  inherited;
  FEMSConsoleData := TEMSConsoleData.Create;
  CreateUsersView('');
  CreateGroupsView('');
  CreateInstallationsView('');
  CreateEdgeModulesView('');
  CreateResourcesView('');
  ViewsControl.ActiveTab := ExplorerTabItem;
  ViewsControl.Repaint;
end;


procedure TViewsFrame.UpdateStyle(const AStyle: String);
var
  LIndex: Integer;
begin
  for LIndex := 0 to 4 do
    TEMSTabItem(ViewsControl.Tabs[LIndex]).FrameJSONGrid.UpdateStyle(AStyle);

  ExplorerFrame.UpdateStyle(AStyle);
end;

procedure TViewsFrame.ChangeTab(AIndex: Integer);
begin
  case AIndex of
    USERS_ITEM:
    begin
      ViewsControl.TabIndex := 0;
      TEMSTabItem(ViewsControl.ActiveTab).OnTabItemClick(Self);
    end;
    GROUPS_ITEM:
    begin
      ViewsControl.TabIndex := 1;
      TEMSTabItem(ViewsControl.ActiveTab).OnTabItemClick(Self);
    end;
    INSTALLATIONS_ITEM:
    begin
      ViewsControl.TabIndex := 2;
      TEMSTabItem(ViewsControl.ActiveTab).OnTabItemClick(Self);
    end;
    MODULES_ITEM:
    begin
      ViewsControl.TabIndex := 3;
      TEMSTabItem(ViewsControl.ActiveTab).OnTabItemClick(Self);
    end;
    RESOURCES_ITEM:
    begin
      ViewsControl.TabIndex := 4;
      TEMSTabItem(ViewsControl.ActiveTab).OnTabItemClick(Self);
    end;
    PUSH_ITEM:
    begin
      ViewsControl.ActiveTab := PushTabItem;
    end;
    ENDPOINTS_ITEM:
    begin
      ViewsControl.ActiveTab := ExplorerTabItem;
    end;
  end;
end;

procedure TViewsFrame.CreateUsersView(const AUserID: string);
var
  LTabItem: TEMSTabItem;
begin
  LTabItem := CreateTab(strUsers);
  LTabItem.FrameJSONGrid.ColumnsReadOnly.Add(0);
  LTabItem.FrameJSONGrid.ColumnsReadOnly.Add(1);
  LTabItem.FrameJSONGrid.ColumnsReadOnly.Add(2);
end;

procedure TViewsFrame.CreateGroupsView(const AGroupName: string);
var
  LTabItem: TEMSTabItem;
begin
  LTabItem := CreateTab(strGroups);
  LTabItem.FrameJSONGrid.ColumnsReadOnly.Add(0);
  LTabItem.FrameJSONGrid.ColumnsReadOnly.Add(1);
  LTabItem.FrameJSONGrid.ColumnsReadOnly.Add(2);
end;

procedure TViewsFrame.CreateInstallationsView(const AInstallationID: string);
var
  LTabItem: TEMSTabItem;
begin
  LTabItem := CreateTab(strInstallations);
  LTabItem.FrameJSONGrid.ColumnsReadOnly.Add(0);
  LTabItem.FrameJSONGrid.ColumnsReadOnly.Add(1);
  LTabItem.FrameJSONGrid.ColumnsReadOnly.Add(2);
  LTabItem.FrameJSONGrid.ColumnsReadOnly.Add(3);
  LTabItem.FrameJSONGrid.ColumnsReadOnly.Add(4);
{$IFNDEF DEBUG}
  LTabItem.FrameJSONGrid.AddItemButton.Visible := False;
{$ENDIF}
end;

procedure TViewsFrame.CreateEdgeModulesView(const AEdgePointID: string);
var
  LTabItem: TEMSTabItem;
begin
  LTabItem := CreateTab(strEdgeModules);
  LTabItem.FrameJSONGrid.ColumnsReadOnly.Add(0);
  LTabItem.FrameJSONGrid.ColumnsReadOnly.Add(1);
  LTabItem.FrameJSONGrid.ColumnsReadOnly.Add(2);
  LTabItem.FrameJSONGrid.ColumnsReadOnly.Add(3);
  LTabItem.FrameJSONGrid.ColumnsReadOnly.Add(4);
  LTabItem.FrameJSONGrid.ColumnsReadOnly.Add(5);

  LTabItem.FrameJSONGrid.AddItemButton.Visible := False;
end;

procedure TViewsFrame.CreateResourcesView(const AResourceID: string);
var
  LTabItem: TEMSTabItem;
begin

  LTabItem := CreateTab(strResources);
  LTabItem.FrameJSONGrid.ColumnsReadOnly.Add(0);
  LTabItem.FrameJSONGrid.ColumnsReadOnly.Add(1);
  LTabItem.FrameJSONGrid.ColumnsReadOnly.Add(2);
  LTabItem.FrameJSONGrid.ColumnsReadOnly.Add(3);

  LTabItem.FrameJSONGrid.AddItemButton.Visible := False;
end;

function TViewsFrame.CreateTab(const AName: string): TEMSTabItem;
begin
  Result := nil;
  if AName = strUsers then
    Result := TEMSTabItem(ViewsControl.Insert(0, TUsersTabItem));
  if AName = strGroups then
    Result := TEMSTabItem(ViewsControl.Insert(1, TGroupsTabItem));
  if AName = strInstallations then
    Result := TEMSTabItem(ViewsControl.Insert(2, TInstallationTabItem));
  if AName = strEdgeModules then
    Result := TEMSTabItem(ViewsControl.Insert(3, TEdgeModuleTabItem));
  if AName = strResources then
    Result := TEMSTabItem(ViewsControl.Insert(4, TResourceTabItem));

  Result.Name := AName + cTab;
  Result.Text := AName;
  Result.EMSConsoleData := FEMSConsoleData;
  ViewsControl.ActiveTab := Result;
end;

destructor TViewsFrame.Destroy;
begin
  FEMSConsoleData.Free;
  inherited;
end;

procedure TViewsFrame.DisableTabs(ATab: TEMSTabItem = nil);
var
  I: Integer;
begin
  for I := 0 to ViewsControl.TabCount - 1 do
    if ATab <> ViewsControl.Tabs[I] then
      ViewsControl.Tabs[I].Enabled := False;
end;

procedure TViewsFrame.EnableTabs;
var
  I: Integer;
begin
  for I := 0 to ViewsControl.TabCount - 1 do
    ViewsControl.Tabs[I].Enabled := True;
end;

procedure TViewsFrame.ViewsControlChange(Sender: TObject);
begin
  RefreshEndpoints;
end;

procedure TViewsFrame.RefreshEndpoints;
begin
  if ViewsControl.ActiveTab = ExplorerTabItem then
    ExplorerFrame.RefreshEndpoints;
end;

end.
