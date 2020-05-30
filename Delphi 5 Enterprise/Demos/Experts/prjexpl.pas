{ Project Explorer

  This demo shows how to use many of the new APIs available in the Tools API.

  What it demos:
    How to get notified when certain events occur in Delphi.
    Add a menu item to an arbitrary location in the Delphi main menu tree.
    How to obtain and use interfaces for the form designer.
    Accessing components on the form and get and set properties.
}

unit PrjExpl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  IniFiles, ComCtrls, EditIntf, ExptIntf, ToolIntf, Menus, VirtIntf;

type
  TProjectExplorer = class(TForm)
    TreeView1: TTreeView;
    StatusBar1: TStatusBar;
    PopupMenu1: TPopupMenu;
    EditItem: TMenuItem;
    SelectItem: TMenuItem;
    N1: TMenuItem;
    RenameItem: TMenuItem;
    DeleteItem: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure TreeView1Expanding(Sender: TObject; Node: TTreeNode;
      var AllowExpansion: Boolean);
    procedure TreeView1KeyPress(Sender: TObject; var Key: Char);
    procedure TreeView1Change(Sender: TObject; Node: TTreeNode);
    procedure TreeView1Editing(Sender: TObject; Node: TTreeNode;
      var AllowEdit: Boolean);
    procedure TreeView1Edited(Sender: TObject; Node: TTreeNode;
      var NewText: string);
    procedure EditItemClick(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure RenameItemClick(Sender: TObject);
    procedure SelectItemClick(Sender: TObject);
    procedure DeleteItemClick(Sender: TObject);
  private
    procedure SaveWindowState(Desktop: TIniFile);
    procedure LoadWindowState(Desktop: TIniFile);
  public
    { Public declarations }
  end;

  TFormBrowserExpert = class;
  TModuleNotifier = class;

  TModuleEntry = class
    FileName: string;
    UnitName: string;
    FormName: string;
    ModuleNode: TTreeNode;
    FormNode: TTreeNode;
    ModuleInterface: TIModuleInterface;
    ModuleNotifier: TModuleNotifier;
    FormHandle: Pointer;
    constructor Create(const AFileName, AUnitName, AFormName: string);
    destructor Destroy; override;
  end;

  TAddInNotifier = class(TIAddInNotifier)
  private
    FFormBrowser: TFormBrowserExpert;
  public
    constructor Create(AFormBrowser: TFormBrowserExpert);
    procedure FileNotification(NotifyCode: TFileNotification;
      const FileName: string; var Cancel: Boolean); override;
    procedure EventNotification(NotifyCode: TEventNotification;
      var Cancel: Boolean); override;
  end;

  TModuleNotifier = class(TIModuleNotifier)
  private
    FFormBrowser: TFormBrowserExpert;
    FModuleEntry: TModuleEntry;
  public
    constructor Create(AFormBrowser: TFormBrowserExpert; ModuleEntry: TModuleEntry);
    destructor Destroy; override;
    procedure Notify(NotifyCode: TNotifyCode); override;
    procedure ComponentRenamed(ComponentHandle: Pointer;
      const OldName, NewName: string); override;
  end;

  TProjectNotifier = class(TIModuleNotifier)
  private
    FFormBrowser: TFormBrowserExpert;
  public
    constructor Create(AFormBrowser: TFormBrowserExpert);
    procedure Notify(NotifyCode: TNotifyCode); override;
    procedure ComponentRenamed(ComponentHandle: Pointer;
      const OldName, NewName: string); override;
  end;

  TFormBrowserExpert = class(TIExpert)
  private
    ViewProjectExplorerItem: TIMenuItemIntf;
    AddInNotifier: TAddInNotifier;
    ProjectNotifier: TProjectNotifier;
    ProjectModule: TIModuleInterface;
    ModuleList: TStringList;
  public
    constructor Create;
    destructor Destroy; override;
    function EnumProc(const FileName, UnitName, FormName: string): Boolean;
    procedure OpenProject(const FileName: string);
    procedure CloseProject;
    procedure AddedToProject(const FileName: string);
    procedure RemovedFromProject(const FileName: string);
    procedure LoadDesktop(const FileName: string);
    procedure SaveDesktop(const FileName: string);
    procedure ViewProjectExplorerClick(Sender: TIMenuItemIntf);
    function GetName: string; override;
    function GetStyle: TExpertStyle; override;
    function GetIDString: string; override;
    function GetAuthor: string; override;
    function GetComment: string; override;
    function GetPage: string; override;
    function GetGlyph: HICON; override;
    function GetState: TExpertState; override;
    function GetMenuText: string; override;
    procedure Execute; override;
  end;

var
  ProjectExplorer: TProjectExplorer = nil;
  FormBrowserExpert: TFormBrowserExpert = nil;

function InitExpert(ToolServices: TIToolServices; RegisterProc: TExpertRegisterProc;
  var Terminate: TExpertTerminateProc): Boolean; stdcall;

implementation

{$R *.DFM}
{$I PRJEXPL.INC}

function GetComponentName(Component: TIComponentInterface): string;
begin
  Result := '';
  Component.GetPropValueByName('Name', Result);  
end;

procedure SetComponentName(Component: TIComponentInterface; const Value: string);
begin
  Component.SetPropByName('Name', Value);
end;

procedure CreateForm(InstanceClass: TComponentClass; var Reference);
begin
  if TComponent(Reference) = nil then
  begin
    TComponent(Reference) := TComponent(InstanceClass.NewInstance);
    try
      TComponent(Reference).Create(Application);
    except
      TComponent(Reference).Free;
      TComponent(Reference) := nil;
      raise
    end;
  end;
end;

{ TModuleEntry }

constructor TModuleEntry.Create(const AFileName, AUnitName, AFormName: string);
begin
  FileName := AFileName;
  UnitName := AUnitName;
  FormName := AFormName;
end;

destructor TModuleEntry.Destroy;
begin
  ModuleNotifier.Free;
  ModuleInterface.Free;
  inherited Destroy;
end;

{ TAddInNotifier }

constructor TAddInNotifier.Create(AFormBrowser: TFormBrowserExpert);
begin
  inherited Create;
  FFormBrowser := AFormBrowser;
end;

procedure TAddInNotifier.FileNotification(NotifyCode: TFileNotification;
  const FileName: string; var Cancel: Boolean);
begin
  if ProjectExplorer <> nil then
    if NotifyCode = fnProjectOpened then
      FFormBrowser.OpenProject(FileName)
    else if NotifyCode = fnAddedToProject then
      FFormBrowser.AddedToProject(FileName)
    else if NotifyCode = fnRemovedFromProject then
      FFormBrowser.RemovedFromProject(FileName);  
  if NotifyCode = fnProjectDesktopLoad then
    FFormBrowser.LoadDesktop(FileName)
  else if NotifyCode = fnProjectDesktopSave then
    FFormBrowser.SaveDesktop(FileName);
end;

procedure TAddInNotifier.EventNotification(NotifyCode: TEventNotification;
  var Cancel: Boolean);
begin
end;

function FindNode(TreeView: TCustomTreeView; Node: TTreeNode;
  ComponentHandle: Pointer): TTreeNode;

  function SearchNodes(Node: TTreeNode): TTreeNode;
  var
    ChildNode: TTreeNode;
  begin
    Result := nil;
    if Node.Data = ComponentHandle then
      Result := Node
    else
    begin
      ChildNode := Node.GetFirstChild;
      while ChildNode <> nil do
      begin
        Result := SearchNodes(ChildNode);
        if Result <> nil then
          Break
        else ChildNode := Node.GetNextChild(ChildNode);
      end;
    end;
  end;

begin
  if Node = nil then Node := TTreeView(TreeView).Items.GetFirstNode;
  Result := SearchNodes(Node);
end;

{ TModuleNotifier }

constructor TModuleNotifier.Create(AFormBrowser: TFormBrowserExpert; ModuleEntry: TModuleEntry);
begin
  inherited Create;
  FFormBrowser := AFormBrowser;
  FModuleEntry := ModuleEntry;
  FModuleEntry.ModuleInterface.AddNotifier(Self);
end;

destructor TModuleNotifier.Destroy;
begin
  with FModuleEntry do
  begin
    ModuleInterface.RemoveNotifier(Self);
    ModuleNotifier := nil;
    ModuleInterface := nil;
    FormHandle := nil;
  end;
  inherited Destroy;
end;

procedure TModuleNotifier.Notify(NotifyCode: TNotifyCode);
begin
  if NotifyCode = ncModuleDeleted then
  begin
    with FModuleEntry do
      if FormNode <> nil then
      begin
        FormNode.DeleteChildren;
        FormNode.HasChildren := True;
      end;
    Free;
  end;
end;

procedure TModuleNotifier.ComponentRenamed(ComponentHandle: Pointer;
  const OldName, NewName: string);
var
  Component, ParentComponent: TIComponentInterface;
  Node, ParentNode: TTreeNode;
begin
  try
    with FModuleEntry do
      if ComponentHandle = FormHandle then
        Node := FormNode
      else Node := FindNode(FormNode.TreeView, FormNode, ComponentHandle);
    if (Node <> nil) and (NewName <> '') then
      Node.Text := NewName
    else if (Node <> nil) and (NewName = '') then
      Node.Free
    else if (Node = nil) and (NewName <> '') then
      with FModuleEntry.ModuleInterface.GetFormInterface do
      try
        Component := GetComponentFromHandle(ComponentHandle);
        if Component <> nil then
          try
            ParentNode := FModuleEntry.FormNode;
            if Component.IsTControl then
            begin
              ParentComponent := GetCreateParent;
              try
                if ParentComponent.GetComponentHandle <> FModuleEntry.FormHandle then
                  ParentNode := FindNode(FModuleEntry.FormNode.TreeView,
                    FModuleEntry.FormNode, ParentComponent.GetComponentHandle);
              finally
                ParentComponent.Free;
              end;
            end;
            if ParentNode <> nil then
              ParentNode.Owner.AddChildObject(ParentNode, NewName,
                ComponentHandle).MakeVisible;
          finally
            Component.Free;
          end;
      finally
        Free;
      end;
  except
  end;
end;

{ TProjectNotifier }

constructor TProjectNotifier.Create(AFormBrowser: TFormBrowserExpert);
begin
  inherited Create;
  FFormBrowser := AFormBrowser;
end;

procedure TProjectNotifier.Notify(NotifyCode: TNotifyCode);
begin
  if NotifyCode = ncModuleDeleted then
  begin
    if ProjectExplorer <> nil then ProjectExplorer.Hide;
    FFormBrowser.CloseProject;
  end;
end;

procedure TProjectNotifier.ComponentRenamed(ComponentHandle: Pointer;
  const OldName, NewName: string);
begin
//  Nothing to do here but needs to be overridden anyway
end;

{ TFormBrowserExpert }

constructor TFormBrowserExpert.Create;
var
  MainMenu: TIMainMenuIntf;
  ProjManMenu: TIMenuItemIntf;
  ViewMenu: TIMenuItemIntf;
  MenuItems: TIMenuItemIntf;
begin
  inherited Create;
  ModuleList := TStringList.Create;
  MainMenu := ToolServices.GetMainMenu;
  if MainMenu <> nil then
  try
    MenuItems := MainMenu.GetMenuItems;
    if MenuItems <> nil then
    try
      ProjManMenu := MainMenu.FindMenuItem('ViewPrjMgrItem');
      if ProjManMenu <> nil then
      try
        ViewMenu := ProjManMenu.GetParent;
        if ViewMenu <> nil then
        try
          ViewProjectExplorerItem := ViewMenu.InsertItem(ProjManMenu.GetIndex + 1,
            sMenuItemCaption, 'ViewProjectExplorerItem', '', 0, 0, 0,
            [mfVisible, mfEnabled], ViewProjectExplorerClick);
        finally
          ViewMenu.Free;
        end;
      finally
        ProjManMenu.Free;
      end;
    finally
      MenuItems.Free;
    end;
  finally
    MainMenu.Free;
  end;
  AddInNotifier := TAddInNotifier.Create(Self);
  ToolServices.AddNotifier(AddInNotifier);
end;

destructor TFormBrowserExpert.Destroy;
begin
  ToolServices.RemoveNotifier(AddInNotifier);
  CloseProject;
  ViewProjectExplorerItem.Free;
  AddInNotifier.Free;
  ModuleList.Free;
  inherited Destroy;
end;

function TFormBrowserExpert.EnumProc(const FileName, UnitName,
  FormName: string): Boolean;
begin
  ModuleList.AddObject(UnitName,
    TModuleEntry.Create(FileName, UnitName, FormName));
  Result := True;
end;

function ProjEnumProc(Param: Pointer; const FileName, UnitName,
  FormName: string): Boolean; stdcall;
begin
  try
    Result := TFormBrowserExpert(Param).EnumProc(FileName, UnitName, FormName);
  except
    Result := False;
  end;
end;

procedure TFormBrowserExpert.OpenProject(const FileName: string);
var
  I: Integer;
  Node: TTreeNode;
begin
  CloseProject;
  ToolServices.EnumProjectUnits(ProjEnumProc, Self);
  ProjectModule := ToolServices.GetModuleInterface(FileName);
  if ProjectModule <> nil then
  begin
    ProjectNotifier := TProjectNotifier.Create(Self);
    ProjectModule.AddNotifier(ProjectNotifier);
    if (ProjectExplorer <> nil) and (ModuleList.Count > 0) then
      with ProjectExplorer, ToolServices do
      begin
        with TModuleEntry(ModuleList.Objects[0]) do
        begin
          Node := TreeView1.Items.Add(nil, UnitName);
          ModuleNode := Node;
        end;
        for I := 1 to ModuleList.Count - 1 do
          with TModuleEntry(ModuleList.Objects[I]) do
            if UnitName <> '' then
            begin
              ModuleNode := TreeView1.Items.AddChildObject(Node, UnitName,
                ModuleList.Objects[I]);
              if FormName <> '' then
              begin
                FormNode := TreeView1.Items.AddChildObject(ModuleNode, FormName,
                  ModuleList.Objects[I]);
                FormNode.HasChildren := True;
              end;
            end;
        Node.Expanded := True;
      end;
  end;
end;

procedure TFormBrowserExpert.CloseProject;
var
  I: Integer;
begin
  if ProjectModule <> nil then
  begin
    if ProjectExplorer <> nil then
      ProjectExplorer.TreeView1.Items.Clear;
    for I := 0 to ModuleList.Count - 1 do
      TModuleEntry(ModuleList.Objects[I]).Free;
    ModuleList.Clear;
    ProjectModule.RemoveNotifier(ProjectNotifier);
    ProjectNotifier.Free;
    ProjectModule.Free;
    ProjectNotifier := nil;
    ProjectModule := nil;
  end;
end;

function FindNewProjectItem(Param: Pointer; const ModFileName, ModUnitName,
  ModFormName: string): Boolean; stdcall;
begin
  try
    with TModuleEntry(Param) do
      if AnsiCompareText(FileName, ModFileName) = 0 then
      begin
        Result := False;
        UnitName := ModUnitName;
        FormName := ModFormName;
      end else Result := True;
  except
    Result := False;
  end;
end;

procedure TFormBrowserExpert.AddedToProject(const FileName: string);
var
  NewModuleEntry: TModuleEntry;
begin
  if ModuleList.Count > 0 then
  begin
    NewModuleEntry := TModuleEntry.Create(FileName, '', '');
    ToolServices.EnumProjectUnits(FindNewProjectItem, NewModuleEntry);
    ModuleList.AddObject(FileName, NewModuleEntry);
    if ProjectExplorer <> nil then
      with ProjectExplorer, NewModuleEntry do
      begin
        ModuleNode :=
          TreeView1.Items.AddChildObject(TModuleEntry(ModuleList.Objects[0]).ModuleNode,
          NewModuleEntry.UnitName, NewModuleEntry);
        if FormName <> '' then
        begin
          FormNode := TreeView1.Items.AddChildObject(NewModuleEntry.ModuleNode,
            FormName, NewModuleEntry);
          FormNode.HasChildren := True;
        end;
      end;
  end;
end;

procedure TFormBrowserExpert.RemovedFromProject(const FileName: string);
var
  I: Integer;
  ModuleEntry: TModuleEntry;
begin
  for I := 0 to ModuleList.Count - 1 do
  begin
    ModuleEntry := TModuleEntry(ModuleList.Objects[I]);
    if AnsiCompareText(ModuleEntry.FileName, FileName) = 0 then
    begin
      ModuleList.Delete(I);
      ModuleEntry.ModuleNode.Free;
      ModuleEntry.Free;
      Break;
    end;
  end;
end;

const
  isProjectFormViewer = 'ProjectExplorer';

  ivCreate = 'Create';
  ivVisible = 'Visible';
  ivState = 'State';
  ivTop = 'Top';
  ivLeft = 'Left';
  ivWidth = 'Width';
  ivHeight = 'Height';
  ivMaxLeft = 'MaxLeft';
  ivMaxTop = 'MaxTop';
  ivMaxWidth = 'MaxWidth';
  ivMaxHeight = 'MaxHeight';

procedure TFormBrowserExpert.LoadDesktop(const FileName: string);
var
  Desktop: TIniFile;
begin
  Desktop := TIniFile.Create(FileName);
  try
    if DeskTop.ReadBool(isProjectFormViewer, ivCreate, False) then
    begin
      CreateForm(TProjectExplorer, ProjectExplorer);
      ProjectExplorer.LoadWindowState(Desktop);
    end else if ProjectExplorer <> nil then ProjectExplorer.Hide;
  finally
    Desktop.Free;
  end;
end;

procedure TFormBrowserExpert.SaveDesktop(const FileName: string);
var
  Desktop: TIniFile;
begin
  Desktop := TIniFile.Create(FileName);
  try
    if ProjectExplorer <> nil then ProjectExplorer.SaveWindowState(Desktop);
  finally
    Desktop.Free;
  end;
end;

procedure TFormBrowserExpert.ViewProjectExplorerClick(Sender: TIMenuItemIntf);
begin
  CreateForm(TProjectExplorer, ProjectExplorer);
  ProjectExplorer.Show;
end;

function TFormBrowserExpert.GetName: string;
begin
  Result := sExpertName;
end;

function TFormBrowserExpert.GetStyle: TExpertStyle;
begin
  Result := esAddIn;
end;

function TFormBrowserExpert.GetIDString: string;
begin
  Result := 'Borland.ProjectExplorer';
end;

function TFormBrowserExpert.GetAuthor: string;
begin
end;

function TFormBrowserExpert.GetComment: string;
begin
end;

function TFormBrowserExpert.GetPage: string;
begin
end;

function TFormBrowserExpert.GetGlyph: HICON;
begin
  Result := 0;
end;

function TFormBrowserExpert.GetState: TExpertState;
begin
  Result := [];
end;

function TFormBrowserExpert.GetMenuText: string;
begin
end;

procedure TFormBrowserExpert.Execute;
begin
end;

{ TProjectExplorer }

procedure TProjectExplorer.FormCreate(Sender: TObject);
var
  ProjectName: string;
begin
  ProjectName := ToolServices.GetProjectName;
  if ProjectName <> '' then
    FormBrowserExpert.OpenProject(ProjectName);
end;

procedure TProjectExplorer.FormDestroy(Sender: TObject);
begin
  ProjectExplorer := nil;
end;

function OpenModule(ModuleEntry: TModuleEntry; Ask: Boolean): Boolean;
begin
  with ModuleEntry do
  begin
    Result := False;
    if ModuleInterface = nil then
    begin
      if not ToolServices.IsFileOpen(FileName) then
        if not Ask or (MessageDlg(Format(sFileNotLoaded, [FileName]),
          mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
        begin
          if not ToolServices.OpenFile(FileName) then Exit;
        end else Exit;
      ModuleInterface := ToolServices.GetModuleInterface(FileName);
      ModuleNotifier := TModuleNotifier.Create(FormBrowserExpert, ModuleEntry);
      Result := True;
    end else Result := True;
  end;
end;

procedure AddChildControl(Node: TTreeNode; IsRoot: Boolean; Component: TIComponentInterface); forward;

function GetChildProc(Param: Pointer; Component: TIComponentInterface): Boolean; stdcall;
begin
  try
    try
      AddChildControl(TTreeNode(Param), False, Component);
    finally
      Component.Free; // Release the component interface.
    end;    
    Result := True;
  except
    Result := False;
  end;
end;

procedure AddChildControl(Node: TTreeNode; IsRoot: Boolean; Component: TIComponentInterface);
var
  ChildNode: TTreeNode;
begin
  if IsRoot then
    ChildNode := Node
  else ChildNode := ProjectExplorer.TreeView1.Items.AddChildObject(Node,
    GetComponentName(Component), Component.GetComponentHandle);
  Component.GetChildren(ChildNode, GetChildProc);
end;

procedure TProjectExplorer.TreeView1Expanding(Sender: TObject;
  Node: TTreeNode; var AllowExpansion: Boolean);
var
  ModuleEntry: TModuleEntry;
  Component: TIComponentInterface;
begin
  if Node.Level = 2 then
  begin
    ModuleEntry := TModuleEntry(Node.Data);
    with ModuleEntry do
    begin
      if ModuleInterface = nil then
        if OpenModule(ModuleEntry, True) then
        begin
          TreeView1.Items.BeginUpdate;
          try
            with ModuleInterface.GetFormInterface do
            try
              Component := GetFormComponent;
              try
                FormHandle := Component.GetComponentHandle;
                AddChildControl(Node, True, Component);
              finally
                Component.Free;
              end;
            finally
              Free;
            end;
          finally
            TreeView1.Items.EndUpdate;
          end;
          if Node.GetFirstChild = nil then
            Node.HasChildren := False;
        end;
    end;
  end;
end;

procedure TProjectExplorer.TreeView1KeyPress(Sender: TObject; var Key: Char);
begin
  with TreeView1 do
    if not IsEditing and (Selected <> nil) and (Selected.Level < 3) and
      (Key = '*') then Key := #0;
end;

function GetModuleEntry(Node: TTreeNode): TModuleEntry;
begin
  while Node.Level > 2 do
    Node := Node.Parent;
  Result := TModuleEntry(Node.Data);
end;

function GetNodeComponent(Node: TTreeNode): TIComponentInterface;
var
  ModuleEntry: TModuleEntry;
  FormInterface: TIFormInterface;
  Handle: Pointer;
begin
  Result := nil;
  if (Node <> nil) and (Node.Level >= 2) then
  begin
    ModuleEntry := GetModuleEntry(Node);
    if ModuleEntry.ModuleInterface <> nil then
    begin
      FormInterface := ModuleEntry.ModuleInterface.GetFormInterface;
      try
        if Node.Level = 2 then
          Handle := ModuleEntry.FormHandle
        else Handle := Node.Data;
        Result := FormInterface.GetComponentFromHandle(Handle);
      finally
        FormInterface.Free;
      end;
    end;
  end;
end;

procedure TProjectExplorer.TreeView1Change(Sender: TObject; Node: TTreeNode);
var
  ModuleEntry: TModuleEntry;
  Component: TIComponentInterface;
begin
  if Node = nil then Exit;
  if Node.Level > 2 then
  begin
    Component := GetNodeComponent(Node);
    if Component <> nil then
    try
      StatusBar1.SimpleText := Component.GetComponentType;
    finally
      Component.Free;
    end else StatusBar1.SimpleText := '';
  end else if (Node.Level = 1) or (Node.Level = 2) then
  begin
    ModuleEntry := TModuleEntry(Node.Data);
    if Node.Level = 1 then
      StatusBar1.SimpleText := ModuleEntry.FileName
    else StatusBar1.SimpleText := ChangeFileExt(ModuleEntry.FileName, '.dfm');
  end else if Node.Level = 0 then
    if FormBrowserExpert.ProjectModule <> nil then
      with FormBrowserExpert.ProjectModule.GetEditorInterface do
      try
        StatusBar1.SimpleText := FileName;
      finally
        Free;
      end;
end;

procedure TProjectExplorer.TreeView1Editing(Sender: TObject; Node: TTreeNode;
  var AllowEdit: Boolean);
var
  Component: TIComponentInterface;
begin
  if Node <> nil then
  begin
    Component := GetNodeComponent(Node);
    try
      if (Node.Level < 2) or (Component = nil) then
        AllowEdit := False;
    finally
      Component.Free;
    end;
  end;        
end;

procedure TProjectExplorer.TreeView1Edited(Sender: TObject; Node: TTreeNode;
  var Newtext: string);
var
  Component: TIComponentInterface;
begin
  if Node.Level >= 2 then
  begin
    Component := GetNodeComponent(Node);
    try
      SetComponentName(Component, NewText);
    finally
      Component.Free;
    end;
    NewText := Node.Text;
  end;
end;

procedure TProjectExplorer.PopupMenu1Popup(Sender: TObject);
var
  Node: TTreeNode;
  NodeComponent: TIComponentInterface;
begin
  Node := TreeView1.Selected;
  EditItem.Enabled := Node <> nil;
  NodeComponent := GetNodeComponent(Node);
  try
    SelectItem.Enabled := (Node <> nil) and (Node.Level > 1) and
      (NodeComponent <> nil);
    RenameItem.Enabled := (Node <> nil) and (Node.Level > 1) and
      (NodeComponent <> nil);
    DeleteItem.Enabled := (Node <> nil) and (Node.Level > 2) and
      (NodeComponent <> nil);
  finally
    NodeComponent.Free;
  end;
end;

procedure TProjectExplorer.EditItemClick(Sender: TObject);
var
  Node: TTreeNode;
  ModuleEntry: TModuleEntry;
  Component: TIComponentInterface;
begin
  Node := TreeView1.Selected;
  if Node <> nil then
    if Node.Level >= 2 then
    begin
      ModuleEntry := GetModuleEntry(Node);
      Component := GetNodeComponent(Node);
      try
        if (Node.Level = 2) and (Component = nil) then
        begin
          if OpenModule(ModuleEntry, False) then
            ModuleEntry.ModuleInterface.ShowForm;
        end else if Component <> nil then
        begin
          Component.Select;
          Component.Focus;
        end;
      finally
        Component.Free;
      end;
    end else if Node.Level = 1 then
    begin
      ModuleEntry := TModuleEntry(Node.Data);
      if OpenModule(ModuleEntry, False) then
        ModuleEntry.ModuleInterface.ShowSource;
    end else if Node.Level = 0 then
      if FormBrowserExpert.ProjectModule <> nil then
        FormBrowserExpert.ProjectModule.ShowSource;
end;

procedure TProjectExplorer.SelectItemClick(Sender: TObject);
var
  Node: TTreeNode;
  Component: TIComponentInterface;
begin
  Node := TreeView1.Selected;
  if Node <> nil then
    if Node.Level >= 2 then
    begin
      Component := GetNodeComponent(Node);
      try
        Component.Select;
      finally
        Component.Free;
      end;
    end;
end;

procedure TProjectExplorer.RenameItemClick(Sender: TObject);
var
  Node: TTreeNode;
begin
  Node := TreeView1.Selected;
  if Node <> nil then Node.EditText;
end;

procedure TProjectExplorer.DeleteItemClick(Sender: TObject);
var
  Node: TTreeNode;
  Component: TIComponentInterface;
begin
  Node := TreeView1.Selected;
  if Node <> nil then
    if Node.Level > 2 then
    begin
      Component := GetNodeComponent(Node);
      try
        Component.Delete;
      finally
        Component.Free;
      end;
    end;
end;

procedure TProjectExplorer.SaveWindowState(Desktop: TIniFile);
var
  WindowPlacement: TWindowPlacement;
begin
  if Visible then with Desktop do
  begin
    WriteBool(isProjectFormViewer, ivCreate, True);
    WriteBool(isProjectFormViewer, ivVisible, Visible);
    WriteInteger(isProjectFormViewer, ivState, Ord(WindowState));

    if WindowState in [wsMinimized, wsMaximized] then  { 3.1 only }
    begin
      WindowPlacement.length := SizeOf(WindowPlacement);
      GetWindowPlacement(Handle, @WindowPlacement);
      with WindowPlacement.rcNormalPosition do
      begin
        WriteInteger(isProjectFormViewer, ivLeft, left);
        WriteInteger(isProjectFormViewer, ivTop, top);
        WriteInteger(isProjectFormViewer, ivWidth, right - left);
        WriteInteger(isProjectFormViewer, ivHeight, bottom - top);
        WriteInteger(isProjectFormViewer, ivMaxLeft, WindowPlacement.ptMaxPosition.x);
        WriteInteger(isProjectFormViewer, ivMaxTop, WindowPlacement.ptMaxPosition.y);
        if WindowState = wsMaximized then
        begin
          WriteInteger(isProjectFormViewer, ivMaxWidth, Width);
          WriteInteger(isProjectFormViewer, ivMaxHeight, Height);
        end;
      end;
    end
    else
    begin
      WriteInteger(isProjectFormViewer, ivLeft, Left);
      WriteInteger(isProjectFormViewer, ivTop, Top);
      WriteInteger(isProjectFormViewer, ivWidth, Width);
      WriteInteger(isProjectFormViewer, ivHeight, Height);
    end;
  end;
end;

procedure TProjectExplorer.LoadWindowState(Desktop: TIniFile);
var
  X, Y, W, H: Integer;
  Visible: Boolean;
  WindowState: TWindowState;
  WindowPlacement: TWindowPlacement;
begin
  if Desktop.ReadBool(isProjectFormViewer, ivCreate, False) then with Desktop do
  begin
    Position := poDesigned;
    Visible := ReadBool(isProjectFormViewer, ivVisible, False);
    WindowState := TWindowState(ReadInteger(isProjectFormViewer, ivState, Ord(wsNormal)));
    X := ReadInteger(isProjectFormViewer, ivLeft, Left);
    Y := ReadInteger(isProjectFormViewer, ivTop, Top);
    W := ReadInteger(isProjectFormViewer, ivWidth, Width);
    H := ReadInteger(isProjectFormViewer, ivHeight, Height);

    with WindowPlacement do
    begin
      length := SizeOf(WindowPlacement);
      rcNormalPosition.left := X;
      rcNormalPosition.top := Y;
      rcNormalPosition.right := X + W;
      rcNormalPosition.bottom := Y + H;
      ptMaxPosition.x := ReadInteger(isProjectFormViewer, ivMaxLeft, -GetSystemMetrics(SM_CXFRAME));
      ptMaxPosition.y := ReadInteger(isProjectFormViewer, ivMaxTop, -GetSystemMetrics(SM_CYFRAME));
      case WindowState of
        wsMinimized: showCmd := SW_SHOWMINIMIZED;
        wsMaximized: showCmd := SW_SHOWMAXIMIZED;
        wsNormal: showCmd := SW_NORMAL;
      end;
      flags := 0;
    end;
    SetWindowPlacement(Handle, @WindowPlacement);
    if WindowState = wsMaximized then
    begin
      W := ReadInteger(isProjectFormViewer, ivMaxWidth, Width);
      H := ReadInteger(isProjectFormViewer, ivMaxHeight, Height);
      SetBounds(Left, Top, W, H);
    end;
    Self.Visible := Visible;
  end;
end;

function InitExpert(ToolServices: TIToolServices; RegisterProc: TExpertRegisterProc;
  var Terminate: TExpertTerminateProc): Boolean;
begin
  Result := True;
  try
    ExptIntf.ToolServices := ToolServices;
    Application.Handle := ToolServices.GetParentHandle;
    FormBrowserExpert := TFormBrowserExpert.Create;
    RegisterProc(FormBrowserExpert);
  except
    ToolServices.RaiseException(ReleaseException);
  end;
end;

end.
