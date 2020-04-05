{*******************************************************}
{                                                       }
{             Delphi LiveBindings Framework             }
{                                                       }
{ Copyright(c) 2011 Embarcadero Technologies, Inc.      }
{                                                       }
{*******************************************************}

unit BindCompEdit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, DesignWindows,
  Vcl.StdCtrls, Vcl.Menus, Vcl.ExtCtrls, Vcl.StdActns, DesignIntf, Vcl.ComCtrls, Vcl.ToolWin, Vcl.ActnList,
  Vcl.ImgList, ToolWnds, Vcl.ActnPopup, Vcl.PlatformDefaultStyleActnCtrls,
  Data.Bind.Components;

const
  AM_DeferUpdate = WM_USER + 100;  // avoids break-before-make listview ugliness

type

  TCategoryKind = (ckCategory, ckNone, ckAll);

  TDataBindingListDesigner = class;

  TDataBindingListDesigner = class(TToolbarDesignWindow)
    MoveUp1: TMenuItem;
    MoveDown1: TMenuItem;
    SelectAllItem: TMenuItem;
    N2: TMenuItem;
    CutItem: TMenuItem;
    CopyItem: TMenuItem;
    PasteItem: TMenuItem;
    DeleteItem: TMenuItem;
    RemoveBindComp: TAction;
    MoveUp: TAction;
    MoveDown: TAction;
    ImageList1: TImageList;
    SelectAllAction: TAction;
    AddCommon1: TMenuItem;
    NewDataBindingsPopup: TPopupMenu;
    CategoryPanel: TPanel;
    ListBox1: TListBox;
    Panel3: TPanel;
    Label1: TLabel;
    ActionPanel: TPanel;
    ListView1: TListView;
    Panel4: TPanel;
    Label2: TLabel;
    NewDataBinding1: TMenuItem;
    NewBindCompDialog: TAction;
    NewStandardDataBinding1: TMenuItem;
    EditCopy1: TEditCopy;
    EditCut1: TEditCut;
    EditPaste1: TEditPaste;
    DescriptionsAction: TAction;
    PanelDescriptions1: TMenuItem;
    Splitter2: TSplitter;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton5: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    N3: TMenuItem;
    NewCommonDataBinding: TAction;
    procedure DeleteClick(Sender: TObject);
    procedure ListView1Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure MoveUpClick(Sender: TObject);
    procedure ListView1DragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure ListView1DragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure MoveDownClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure ListView1Change(Sender: TObject; Item: TListItem;
      Change: TItemChange);
    procedure SelectAllItemClick(Sender: TObject);
    procedure PasteItemClick(Sender: TObject);
    procedure CopyItemClick(Sender: TObject);
    procedure CutItemClick(Sender: TObject);
    procedure SelectedUpdate(Sender: TObject);
    procedure ListBox1Click(Sender: TObject);
    procedure NewBindCompDialogExecute(Sender: TObject);
    procedure ListView1KeyPress(Sender: TObject; var Key: Char);
    procedure ListView1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SelectAllActionUpdate(Sender: TObject);
    procedure NewDataBindingsPopupPopup(Sender: TObject);
    procedure DescriptionsActionExecute(Sender: TObject);
    procedure ListView1StartDrag(Sender: TObject;
      var DragObject: TDragObject);
    procedure ListView1EndDrag(Sender, Target: TObject; X, Y: Integer);
    procedure ListView1DblClick(Sender: TObject);
    procedure NewCommonDataBindingExecute(Sender: TObject);
    procedure MoveUpUpdate(Sender: TObject);
    procedure MoveDownUpdate(Sender: TObject);
    procedure ListView1Resize(Sender: TObject);
  private
    FDataBindingListClassName: string;
    FCategory: string;
    FCategoryKind: TCategoryKind;
    FCommonDataBindingClass: TContainedBindCompClass;
    FItemIDList: TList;
    FStateLock: Integer;
    FSelectionError: Boolean;
    FFixups: TList;
    FUpdateCount: Integer;
    FDragObject: TDragObject;
    function GetRegKey: string;
    procedure AMDeferUpdate(var Msg); message AM_DeferUpdate;
    procedure Copy;
    procedure Cut;
    procedure Paste;
    procedure Remove;
    procedure SelectAll(DoUpdate: Boolean = True);
    procedure SelectNone(DoUpdate: Boolean = True);
    function GetDataBindingIndex(ListIndex: Integer): Integer;
    function GetDescriptionsVisible: Boolean;
    procedure SetDescriptionsVisible(Value: Boolean);
    procedure SetCommonDataBindingClass(Value: TContainedBindCompClass);
    procedure UpdateCaption;
    procedure ComponentRead(Component: TComponent);
    procedure ReaderSetName(Reader: TReader; Component: TComponent;
      var Name: string);
    procedure ReaderSetName2(Reader: TReader; Component: TComponent;
      var Name: string);
    procedure LoadFromClipboard(AOwner, AParent: TComponent; Components: TList);
    procedure ReadStream(Stream: TStream; AOwner, AParent: TComponent; Components: TList);
    procedure NotifyDataBindingListChange;
    procedure NotifyNewDataBindings(const Classes: array of TContainedBindCompClass);
    procedure CategoryOfClassEnumProc(const Category: string;
      BindCompClass: TContainedBindCompClass;
      Info: TEnumBindCompProcInfo);
    function CategoryOfClass(AClass: TContainedBindCompClass): string;
  protected
    function DataBindingVisible(DataBinding: TContainedBindComponent): Boolean;
    procedure BeginUpdate;
    procedure BuildNewDataBindings; virtual;
    procedure EndUpdate;
    procedure FocusDataBinding(DataBinding: TContainedBindComponent);
    function IndexOfDataBinding(DataBinding: TContainedBindComponent): Integer;
    procedure Activated; override;
    procedure DoNewDataBinding(const Category: string; DataBinding: TContainedBindComponent);
    procedure Clear;
    procedure LockState;
    function UniqueName(Component: TComponent): string; override;
    procedure UnlockState;
    property StateLock: Integer read FStateLock;
    property DescriptionsVisible: Boolean read GetDescriptionsVisible write SetDescriptionsVisible;
  public
    FDataBindingList: TCustomBindingsList;
    procedure ItemDeleted(const ADesigner: IDesigner; AItem: TPersistent); override;
    function EditAction(Action: TEditAction): Boolean; override;
    procedure DesignerClosed(const ADesigner: IDesigner; AGoingDormant: Boolean); override;
    procedure ItemsModified(const ADesigner: IDesigner); override;
    function GetEditState: TEditState; override;
    function GetItemName(Index, ItemIndex: Integer): string;
    procedure GetSelection;
    procedure SelectionChanged(const Designer: IDesigner;
      const ASelection: IDesignerSelections); override;
    procedure SetSelection;
    procedure UpdateView(AUpdateColumns: Boolean = False);
    property CommonDataBindingClass: TContainedBindCompClass read FCommonDataBindingClass
      write SetCommonDataBindingClass;
  end;

  TExecuteNewDataBinding = class
  private
    FBindingsList: TCustomBindingsList;
    FDesigner: IDesigner;
  public
    destructor Destroy; override;
    constructor Create(ABindingsList: TCustomBindingsList;
      ADesigner: IDesigner);
    function Execute(ABeforeCreate: TProc;
      ACreated: TProc<string, TContainedBindComponent>; AAfterCreate: TProc;
      AAllowClass: TFunc<TContainedBindCompClass, Boolean>): Boolean;
  end;

  TDataBindingListDesignerClass = class of TDataBindingListDesigner;

  TNotifyDataBindingListChange = procedure;
//
var
  NotifyDataBindingListChange: TNotifyDataBindingListChange = nil;

const
  CategoryKinds: array[0..2] of TCategoryKind = (ckCategory, ckNone, ckAll);

procedure ShowBindCompListDesigner(const ADesigner: IDesigner;
  ADataBindingList: TCustomBindingsList);

function ShowDataBindingListDesignerClass(const ADesigner: IDesigner;
  DesignerClass: TDataBindingListDesignerClass; ADataBindingList: TCustomBindingsList): TDataBindingListDesigner;

var
  DesignersList: TList = nil;


implementation

{$R *.dfm}

uses System.Win.Registry, System.TypInfo, Winapi.CommCtrl, StdConst, DsnConst,
  DesignEditors, VCLEditors, BindCompDrag, BindCompDsnResStrs, BindCompNewStd,
  Vcl.Dialogs;

//type
//  DefDataBindingClass = TBindLink;

procedure NotifyDataBindingListChangeImpl;
var
  I: Integer;
begin
  if DesignersList <> nil then
    for I := 0 to DesignersList.Count - 1 do
      TDataBindingListDesigner(DesignersList[I]).NotifyDataBindingListChange;
end;

function ShowDataBindingListDesignerClass(const ADesigner: IDesigner;
  DesignerClass: TDataBindingListDesignerClass;
  ADataBindingList: TCustomBindingsList): TDataBindingListDesigner;
var
  I: Integer;
begin
  if DesignersList = nil then
    DesignersList := TList.Create;
  for I := 0 to DesignersList.Count - 1 do
  begin
    Result := TDataBindingListDesigner(DesignersList[I]);
    with Result do
      if (Designer = ADesigner) and (FDataBindingList = ADataBindingList) then
      begin
        Show;
        BringToFront;
        Exit;
      end;
  end;
  Result := DesignerClass.Create(Application);
  with Result do
  try
    Designer := ADesigner;
    FDataBindingList := ADataBindingList;
    FDataBindingListClassName := ADataBindingList.ClassName + '1'; // registry key
    UpdateView(True);
    UpdateCaption;
    Show;
  except
    Free;
  end;
end;

procedure ShowBindCompListDesigner(const ADesigner: IDesigner;
 ADataBindingList: TCustomBindingsList);
begin
  ShowDataBindingListDesignerClass(ADesigner, TDataBindingListDesigner, ADataBindingList);
end;

{ TDataBindingListDesigner }

procedure TDataBindingListDesigner.NotifyDataBindingListChange;
begin
  BuildNewDataBindings;
end;

procedure TDataBindingListDesigner.NotifyNewDataBindings(const Classes: array of TContainedBindCompClass);
begin
  BuildNewDataBindings;
end;

procedure TDataBindingListDesigner.Activated;
begin
  Designer.Activate;
  SetSelection;
end;

procedure TDataBindingListDesigner.ItemDeleted(const ADesigner: IDesigner; AItem: TPersistent);
begin
  if AItem = FDataBindingList then
  begin
    FDataBindingList := nil;  // Component is already in its destructor; component is gone
    Close;
  end
  else if AItem is TComponent then
    FItemIDList.Remove(TComponent(AItem));
end;

procedure TDataBindingListDesigner.DesignerClosed(const ADesigner: IDesigner; AGoingDormant: Boolean);
begin
  if Designer = ADesigner then
  begin
    FDataBindingList := nil;
    Close;
  end;
end;

procedure TDataBindingListDesigner.FocusDataBinding(DataBinding: TContainedBindComponent);
var
  I: Integer;
  Category: string;
  CategoryKind: TCategoryKind;
  LUpdateNeeded: Boolean;
begin
  if DataBinding <> nil then
  begin
    { Attempt to use current category }
    Category := DataBinding.Category;
    if Category <> '' then
      CategoryKind := ckCategory else
      CategoryKind := ckNone;
    LUpdateNeeded := False;
    if  FCategoryKind = ckAll then
    begin
      // Leave category
    end
    else if FCategoryKind = ckNone then
    begin
      if CategoryKind <> ckNone then
        LUpdateNeeded := True;
    end
    else if FCategoryKind = ckCategory then
    begin
      if (CategoryKind <> ckCategory) or (not SameText(FCategory, Category)) then
        LUpdateNeeded := True;
    end;
    if LUpdateNeeded then
    begin
      FCategory := Category;
      FCategoryKind := CategoryKind;
      UpdateView;
    end;
    

         
//      if not ((ListBox1.Items.Count > 0) and ((FCategoryKind = ckAll) and
//        (Integer(ListBox1.Items.Objects[ListBox1.Items.Count - 1]) = Ord(ckAll))) or
//        ((FCategoryKind = ckNone) and (Integer(ListBox1.Items.Objects[0]) = Ord(ckNone)) or
//        ((FCategoryKind = ckCategory) and (AnsiCompareText(FCategory, Category) = 0)))) then
//        if (AnsiCompareText(Category, FCategory) <> 0) or (CategoryKind <> FCategoryKind) then
//        begin
//          FCategory := Category;
//          FCategoryKind := CategoryKind;
//          UpdateView;
//        end;
    for I := 0 to ListView1.Items.Count - 1 do
      if Integer(ListView1.Items[I].Data) = DataBinding.Index then
      begin
        LockState;
        try
          with ListView1.Items[I] do
          begin
            Focused := True;
            MakeVisible(False);
          end;
        finally
          UnLockState;
        end;
        Exit;
      end;
  end;
end;

procedure TDataBindingListDesigner.ItemsModified(const ADesigner: IDesigner);
var
  LastFocused: TContainedBindComponent;
begin
  if (FDataBindingList <> nil) and (FUpdateCount = 0) then
  begin
    if (ListView1.ItemFocused <> nil) and (FDataBindingList.BindCompCount > Integer(ListView1.ItemFocused.Data)) then
      LastFocused := FDataBindingList[Integer(ListView1.ItemFocused.Data){+ ListView1.ItemFocused.Index}] else
      LastFocused := nil;
    UpdateView;
    if Designer <> ADesigner then Exit;
    FocusDataBinding(LastFocused);
    GetSelection;
  end;
  UpdateCaption;
end;

function TDataBindingListDesigner.GetItemName(Index, ItemIndex: Integer): string;
begin
{  with TAccessCollection(Collection) do
    if GetAttrCount < 1 then
      Result := Format('%d - %s',[ItemIndex, Actions.Items[ItemIndex].DisplayName])
    else Result := GetItemAttr(Index, ItemIndex);}
end;

function TDataBindingListDesigner.GetRegKey: string;
begin
  Result := Designer.GetBaseRegKey + '\' + sIniEditorsName + '\DataBindings Editor';
end;

function TDataBindingListDesigner.IndexOfDataBinding(DataBinding: TContainedBindComponent): Integer;
var
  I: Integer;
begin
  for I := 0 to ListView1.Items.Count - 1 do
    if Integer(ListView1.Items[I].Data) = DataBinding.Index then
    begin
      Result := I;
      Exit;
    end;
  Result := -1;
end;

procedure TDataBindingListDesigner.GetSelection;
var
  I, J: Integer;
  DataBinding: TContainedBindComponent;
  List: IDesignerSelections;

  function IsValidDataBinding(DataBinding: TContainedBindComponent): Boolean;
  var
    I: Integer;
  begin
    Result := False;
    for I := 0 to FDataBindingList.BindCompCount - 1 do
      if FDataBindingList[I] = DataBinding then
      begin
        Result := True;
        Break;
      end;
  end;

begin
  LockState;
  try
    ListView1.Selected := nil;
  finally
    UnlockState;
  end;

  List := CreateSelectionList;
  Designer.GetSelections(List);
  if (List.Count = 0) or (List.Count > FDataBindingList.BindCompCount) then Exit;
  if List.Count > ListView1.Items.Count then UpdateView;

  LockState;
  try
    for I := FItemIDList.Count - 1 downto 0 do
    begin
      DataBinding := TContainedBindComponent(FItemIDList[I]);
      if (DataBinding <> nil) and IsValidDataBinding(DataBinding) and DataBindingVisible(DataBinding) then
      begin
        J := IndexOfDataBinding(DataBinding);
        if J >= 0 then
          ListView1.Items[J].Selected := True;
      end
      else
        FItemIDList.Delete(I);
    end;
  finally
    UnlockState;
  end;
end;

procedure TDataBindingListDesigner.LockState;
begin
  Inc(FStateLock);
end;

procedure TDataBindingListDesigner.SetSelection;
var
  I: Integer;
  List: IDesignerSelections;
  DataBinding: TContainedBindComponent;
begin
  if FSelectionError then Exit;
  try
    if ListView1.SelCount > 0 then
    begin
      List := CreateSelectionList;
      FItemIDList.Clear;
      for I := 0 to ListView1.Items.Count - 1 do
        if ListView1.Items[I].Selected then
        begin
          DataBinding := FDataBindingList[{+ I}Integer(ListView1.Items[I].Data)];
          List.Add(DataBinding);
          FItemIDList.Add(DataBinding);
        end;
      Designer.SetSelections(List);
    end
    else
      Designer.SelectComponent(FDataBindingList);
  except
    FSelectionError := True;
    Application.HandleException(ExceptObject);
    Close;
  end;
end;

procedure TDataBindingListDesigner.UnlockState;
begin
  Dec(FStateLock);
end;

function TDataBindingListDesigner.DataBindingVisible(DataBinding: TContainedBindComponent): Boolean;
begin
  Result := (FCategoryKind = ckAll) or (DataBinding.Category = '') and
    (FCategoryKind in [ckNone, ckAll]) or (FCategoryKind = ckCategory) and
    (AnsiCompareText(DataBinding.Category, FCategory) = 0);
end;

procedure TDataBindingListDesigner.UpdateView(AUpdateColumns: Boolean);

  procedure UpdateSizes;
{  var
    Kind: Integer;}
  var
    LIndex: Integer;
    DefClassName: string;
    DefClass: TPersistentClass;
    DefClass2: TContainedBindCompClass;
  begin
    with TRegIniFile.Create(GetRegKey) do
    try
      Width := ReadInteger(FDataBindingListClassName, 'Width', Width);
      Height := ReadInteger(FDataBindingListClassName, 'Height', Height);
      DescriptionsVisible := ReadBool(FDataBindingListClassName, 'Descriptions', True);
      for LIndex := 0 to ListView1.Columns.Count - 1 do
        with ListView1.Columns.Items[LIndex] do
          Width := ReadInteger(FDataBindingListClassName, 'Width'+IntToStr(LIndex), Width);
{      Kind := ReadInteger(FActionListClassName, 'CategoryKind', Ord(ckNone));
      if not (Kind in [Low(CategoryKinds)..High(CategoryKinds)]) then
        Kind := Ord(ckNone);
      FCategoryKind := CategoryKinds[Kind];
      FCategory := ReadString(FActionListClassName, 'Category', '');}
      CategoryPanel.Width := ReadInteger(FDataBindingListClassName, 'CategoryWidth', CategoryPanel.Width);
      Splitter1.Top := Toolbar1.Top + Toolbar1.Height;
      Toolbar1.Visible := ReadBool(FDataBindingListClassName, 'Toolbar', True);
      Splitter1.Visible := Toolbar1.Visible;
      Toolbar1.HandleNeeded; //! Setting action class touches handle
      LargeButtons := ReadBool(FDataBindingListClassName, 'LargeButtons', False);
      { Load default data binding class }
      DefClassName := ReadString(FDataBindingListClassName, 'DataBindingClass', '');
      if DefClassName = '' then
        DefClass := nil
      else
      begin
        DefClass := GetClass(DefClassName);
        if (DefClass <> nil) and not DefClass.InheritsFrom(TContainedBindComponent) then
          DefClass := nil;
      end;
      if DefClass <> nil then
        DefClass2 := TContainedBindCompClass(DefClass) else
        DefClass2 := nil;
      CommonDataBindingClass := DefClass2;
{+ 
      if ReadBool(FActionListClassName, 'StandardActions', False) then
        ToolButton1.Action := NewStdAction else
        ToolButton1.Action := NewAction;
!}        
    finally
      Free;
    end;
  end;

  procedure UpdateColumns;
  begin
    UpdateSizes;
  end;

  procedure FetchItems(List: TStrings);
  var
    I: Integer;
    DataBinding: TContainedBindComponent;
  begin
    if FDataBindingList <> nil then
      for I := 0 to FDataBindingList.BindCompCount - 1 do
      begin
        DataBinding := FDataBindingList[I];
        if DataBindingVisible(DataBinding) then
          List.AddObject(DataBinding.Name, Pointer(I));
      end;

  end;

  function GetDataBindingDesigner(ADataBinding: TContainedBindComponent): IBindCompDesigner;
  begin
     Result := Data.Bind.Components.GetBindCompDesigner(TContainedBindCompClass(ADataBinding.ClassType));
  end;


  function BindingDescription(ADataBinding: TContainedBindComponent; ADesigner: IBindCompDesigner): string;
  begin
    if ADesigner <> nil then
      Result := ADesigner.GetDescription(ADataBinding)
    else
      Result := '';

  end;


  function ItemsEqual(ListItems: TListItems; Items: TStrings): Boolean;
  var
    I: Integer;
//    Tmp: TContainedBindComponent;
//    ImageIndex: Integer;
  begin
    Result := False;
    if ListItems.Count <> Items.Count then Exit;
    for I := 0 to ListItems.Count - 1 do
    begin
      if ListItems[I].Caption = Items[I] then
      begin
//        Tmp := FDataBindingList[Integer(Items.Objects[I])];
//        if (Tmp is TContainedBindComponent) then
//          ImageIndex := TContainedBindComponent(Tmp).ImageIndex else
//          ImageIndex := -1;
//        if ListItems[I].ImageIndex <> ImageIndex then Exit;
      end
      else
        Exit;
    end;
    Result := True;
  end;

var
  TmpItems: TStringList;
  LItem: TListItem;
  LCaption: string;
  LDesigner: IBindCompDesigner;
  I, J: Integer;
  Categories: TStringList;
  BlankCategoryCount: Integer;
  DataBinding: TContainedBindComponent;
begin
  if FDataBindingList = nil then Exit;
  LockState;
  try
    { Update actions }
    Categories := TStringList.Create;
    try
      Categories.Sorted := True;
      BlankCategoryCount := 0;
      if FDataBindingList <> nil then
        for I := 0 to FDataBindingList.BindCompCount - 1 do
          if FDataBindingList[I].Category <> '' then
            Categories.Add(FDataBindingList[I].Category)
          else if BlankCategoryCount = 0 then
            Inc(BlankCategoryCount);

      { Update categories }
      ListBox1.Items.BeginUpdate;
      try
        ListBox1.Items.Clear;
        ListBox1.Items.Assign(Categories);
        // Always include all
        ListBox1.Items.InsertObject(0, SDataBindingCategoryAll, TObject(Ord(ckAll)));
        if Categories.Count + BlankCategoryCount = 0 then
        begin
          // No components
          
        end
        else if BlankCategoryCount <> 0 then
        begin
          // Some blank categories
          //if Categories.Count > 0 then
          //  ListBox1.Items.InsertObject(0, SDataBindingCategoryAll, TObject(Ord(ckAll)));
          ListBox1.Items.AddObject(SDataBindingCategoryNone, TObject(Ord(ckNone)));
        end
        else if Categories.Count > 1 then
        begin
          // multiple categories
          // ListBox1.Items.InsertObject(0, SDataBindingCategoryAll, TObject(Ord(ckAll)));
        end;
        
        if BlankCategoryCount = 0 then
          if FCategoryKind = ckNone then
          begin
            FCategoryKind := ckAll;
            FCategory := '';
          end;

        { Select category }
        if FCategoryKind = ckCategory then
        begin
          I := ListBox1.Items.IndexOf(FCategory);
          if I < 0 then
          begin
            I := 0;
            FCategoryKind := ckAll;
            FCategory := '';
          end
          else
            FCategory := ListBox1.Items[I];
        end
        else
          I := ListBox1.Items.IndexOfObject(TObject(Ord(FCategoryKind)));
        if I < 0 then
          if ListBox1.Count > 0 then
            I := 0;
        ListBox1.ItemIndex := I;
      finally
        ListBox1.Items.EndUpdate;
      end;

      { Update actions }
      TmpItems := TStringList.Create;
      FetchItems(TmpItems);
      //if (TmpItems.Count = 0) or not ItemsEqual(ListView1.Items, TmpItems) then
      try
        ListView1.Items.BeginUpdate;
        try
          if AUpdateColumns then
            UpdateColumns;
          ListView1.Items.Clear;
          if FDataBindingList <> nil then
            for I := 0 to FDataBindingList.BindCompCount - 1 do
            begin
              DataBinding := FDataBindingList[I];
              LDesigner := GetDataBindingDesigner(DataBinding);
              if DataBindingVisible(DataBinding) then
              begin
                LItem := ListView1.Items.Add;
                with LItem do
                begin
                  Caption := DataBinding.Name;
                  Data := Pointer(I);
                  for J := 1 to ListView1.Columns.Count  - 1 do
                  begin
                    case J of
                      1: LCaption := BindingDescription(DataBinding, LDesigner)
                    else
                      LCaption := '';
                    end;
                    LItem.SubItems.Add(LCaption);
                  end;
                end;
              end;
            end;
        finally
          ListView1.Items.EndUpdate;
        end;
      finally
        TmpItems.Free;
      end;
    finally
      Categories.Free;
    end;
  finally
    UnlockState;
  end;
end;

procedure TDataBindingListDesigner.Clear;
begin
  if FDataBindingList <> nil then
    while FDataBindingList.BindCompCount > 0 do
      FDataBindingList[0].Free;
  FItemIDList.Clear;
end;

procedure TDataBindingListDesigner.DoNewDataBinding(const Category: string; DataBinding: TContainedBindComponent);
begin
  try
    DataBinding.BindingsList := FDataBindingList;
    DataBinding.Name := UniqueName(DataBinding);
    with ListView1.Items.Add do
    begin
      Data := Pointer(DataBinding.Index);
      Selected := True;
      Focused := True;
//!      MakeVisible(False);
{+
      Selected := Items.Add;
      ItemFocused := Selected;
      ItemFocused.MakeVisible(False);
!}
    end;
    { Setting the Category causes the Designer to be modified }
    BeginUpdate;
    try
      DataBinding.Category := Category;
    finally
      EndUpdate;
    end;

  except
    DataBinding.Free;
    raise;
  end;
  SetSelection;
  Designer.Modified;
end;

type
  TInfo = record
    FClass: TContainedBindCompClass;
    FFound: Boolean;
    FCategory: string;
  end;

  PInfo = ^TInfo;

procedure TDataBindingListDesigner.CategoryOfClassEnumProc(const Category: string; BindCompClass: TContainedBindCompClass;
    Info: TEnumBindCompProcInfo);
begin
  if BindCompClass =  PInfo(Info).FClass then
  begin
     PInfo(Info).FFound := True;
     PInfo(Info).FCategory := Category;
  end;
end;

function TDataBindingListDesigner.CategoryOfClass(AClass: TContainedBindCompClass): string;
var
  LInfo: TInfo;
begin
  LInfo.FClass := AClass;
  Data.Bind.Components.EnumRegisteredBindComponents(CategoryOfClassEnumProc, TEnumBindCompProcInfo(@LInfo));
  if LInfo.FFound then
    Result := LInfo.FCategory
  else
    Result := '';
end;


procedure TDataBindingListDesigner.DeleteClick(Sender: TObject);
begin
  Remove;
end;

procedure TDataBindingListDesigner.ListView1Click(Sender: TObject);
begin
//  SetSelection;
end;

procedure TDataBindingListDesigner.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    Designer.ModalEdit(#0, Self);
end;

procedure TDataBindingListDesigner.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_PROCESSKEY then
    Designer.ModalEdit(#0, Self);
end;

procedure TDataBindingListDesigner.FormClose(Sender: TObject;
  var Action: TCloseAction);
var
  I: Integer;
begin
  if FDataBindingList <> nil then
    Designer.SelectComponent(FDataBindingList);
  with TRegIniFile.Create(GetRegKey) do
  try
    EraseSection(FDataBindingListClassName);
    WriteInteger(FDataBindingListClassName, 'Width', Width);
    WriteInteger(FDataBindingListClassName, 'Height', Height);
    for I := 0 to ListView1.Columns.Count - 1 do
      with ListView1.Columns.Items[I] do
        WriteInteger(FDataBindingListClassName, 'Width'+IntToStr(I), Width);
    WriteBool(FDataBindingListClassName, 'Descriptions', DescriptionsVisible);
    WriteBool(FDataBindingListClassName, 'Toolbar', Toolbar1.Visible);
    WriteInteger(FDataBindingListClassName, 'CategoryWidth', CategoryPanel.Width);
    WriteBool(FDataBindingListClassName, 'LargeButtons', LargeButtons);
    if CommonDataBindingClass <> nil then
      WriteString(FDataBindingListClassName, 'DataBindingClass', CommonDataBindingClass.ClassName);
  finally
    Free;
  end;
  Action := caFree;
  LockState;
end;

function TDataBindingListDesigner.GetDataBindingIndex(ListIndex: Integer): Integer;
begin
  Result := FDataBindingList[Integer(ListView1.Items[ListIndex].Data)].Index;
end;

procedure TDataBindingListDesigner.MoveUpClick(Sender: TObject);
var
  I, InsPos: Integer;
begin
  if (ListView1.SelCount = 0) or
    (ListView1.SelCount = FDataBindingList.BindCompCount) then Exit;

  InsPos := 0;
  while not ListView1.Items[InsPos].Selected do
    Inc(InsPos);
  if InsPos > 0 then Dec(InsPos);

  for I := 0 to ListView1.Items.Count - 1 do
   if ListView1.Items[I].Selected then
   begin
     FDataBindingList[Integer(ListView1.Items[I].Data)].Index := GetDataBindingIndex(InsPos);
     Inc(InsPos);
   end;
  GetSelection;
  Designer.Modified;
end;

procedure TDataBindingListDesigner.MoveDownClick(Sender: TObject);
var
  I, InsPos: Integer;
begin
  if (ListView1.SelCount = 0) or
    (ListView1.SelCount = FDataBindingList.BindCompCount) then Exit;

  InsPos := ListView1.Items.Count - 1;
  while not ListView1.Items[InsPos].Selected do
    Dec(InsPos);
  if InsPos < ListView1.Items.Count - 1 then Inc(InsPos);

  for I := ListView1.Items.Count - 1 downto 0 do
   if ListView1.Items[I].Selected then
   begin
     FDataBindingList[Integer(ListView1.Items[I].Data)].Index := GetDataBindingIndex(InsPos);
     Dec(InsPos);
   end;
  GetSelection;
  Designer.Modified;
end;

procedure TDataBindingListDesigner.ListView1DragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
var
  Item: TListItem;
begin
  Item := ListView1.GetItemAt(X, Y);
  Accept := (Item <> nil) {+ and (Source = ListView1)} and
    (not Item.Selected);
end;

procedure TDataBindingListDesigner.ListView1DragDrop(Sender, Source: TObject; X,
  Y: Integer);
var
  Item: TListItem;
  I, J, InsPos: Integer;
  L: TList;
begin
  Item := ListView1.GetItemAt(X, Y);
  if Item <> nil then
    InsPos := Item.Index
  else Exit;
  BeginUpdate;
  try
    L := TList.Create;
    try
      for I := 0 to ListView1.Items.Count - 1 do
        if ListView1.Items[I].Selected then
          L.Add(FDataBindingList[{+ I}Integer(ListView1.Items[I].Data)]);

      for I := 0 to L.Count - 1 do
      with TContainedBindComponent(L[I]) do
      begin
        J := Index;
        Index := InsPos;
        if (J > InsPos) and (InsPos < FDataBindingList.BindCompCount) then
          Inc(InsPos);
      end;
    finally
      L.Free;
    end;
  finally
    EndUpdate;
  end;
//!  GetSelection;
  SetSelection;
  Designer.Modified;
end;

procedure TDataBindingListDesigner.FormCreate(Sender: TObject);
begin
  FItemIdList := TList.Create;
  FCategoryKind := ckAll;
  DesignersList.Add(Self);
  BuildNewDataBindings;
  ToolBar1.HandleNeeded; //! Setting action class touches handle
  CommonDataBindingClass := nil; //DefDataBindingClass;
end;

procedure TDataBindingListDesigner.FormDestroy(Sender: TObject);
begin
  if DesignersList <> nil then
    DesignersList.Remove(Self);
  FItemIdList.Free;
end;

procedure TDataBindingListDesigner.FormResize(Sender: TObject);
begin
{  if not ListView1.ShowColumnHeaders then
    ListView1.Column[0].Width := ListView1.ClientWidth;}
end;

procedure TDataBindingListDesigner.ListView1Change(Sender: TObject;
  Item: TListItem; Change: TItemChange);
var
  Msg: TMsg;
begin
  if (FUpdateCount = 0) and (FStateLock = 0) and (Change = ctState) then
    if not PeekMessage(Msg, Handle, AM_DeferUpdate, AM_DeferUpdate, PM_NOREMOVE) then
      PostMessage(Handle, AM_DeferUpdate, 0, 0);
end;

procedure TDataBindingListDesigner.AMDeferUpdate(var Msg);
begin
  if (FUpdateCount = 0) and (FStateLock = 0)  then
    SetSelection
  else
    PostMessage(Handle, AM_DeferUpdate, 0, 0);
end;

procedure TDataBindingListDesigner.SelectAllItemClick(Sender: TObject);
begin
  SelectAll();
end;

function TDataBindingListDesigner.UniqueName(Component: TComponent): string;
begin
  Result := Designer.UniqueName((Component as TContainedBindComponent).Category +
    Component.ClassName);
end;

function TDataBindingListDesigner.GetEditState: TEditState;

  function ActionsSelected: Boolean;
  var
    I: Integer;
  begin
    Result := True;
    with ListView1 do
      for I := 0 to Items.Count - 1 do
        if Items[I].Selected then Exit;
    Result := False;
  end;

begin
  Result := [];
  if ClipboardComponents then Result := [esCanPaste];
  if ActionsSelected then Result := Result + [esCanCopy, esCanCut, esCanDelete];
end;

function TDataBindingListDesigner.EditAction(Action: TEditAction): Boolean;
begin
  Result := True;
  case Action of
    eaCut: Cut;
    eaCopy: Copy;
    eaPaste: Paste;
    eaDelete: Remove;
    eaSelectAll: SelectAll();
  else
    Result := False;
  end;
end;

procedure TDataBindingListDesigner.SelectAll(DoUpdate: Boolean);
var
  I: Integer;
begin
  LockState;
  ListView1.Items.BeginUpdate;
  try
    for I := 0 to Listview1.Items.Count-1 do
      Listview1.Items[I].Selected := True;
  finally
    ListView1.Items.EndUpdate;
    UnlockState;
    if DoUpdate then SetSelection;
  end;
end;

procedure TDataBindingListDesigner.SelectNone(DoUpdate: Boolean);
begin
  ListView1.Selected := nil;
  if DoUpdate then SetSelection;
end;

procedure TDataBindingListDesigner.Remove;
var
  NewFocused: Integer;
  I: Integer;
  KillActions: TList;
  LName: string;
begin
  if assigned(ListView1.ItemFocused) and
  GetComponentEditor(FDataBindingList[Integer(ListView1.ItemFocused.Data)], Designer).IsInInlined then { for Frames }
    raise Exception.CreateRes(@SCantDeleteAncestor);

  BeginUpdate;
  LockState;
  try
    if ListView1.SelCount = FDataBindingList.BindCompCount then
    begin
      SelectNone(False);
      SetSelection;
      Clear;
    end
    else if ListView1.SelCount > 0 then
    begin
      KillActions := nil;
      try
        { Store deleted items for later destruction }
        KillActions := TList.Create;
        for I := ListView1.Items.Count - 1 downto 0 do
          if ListView1.Items[I].Selected then
          begin
            LName := TComponent(FDataBindingList[Integer(ListView1.Items[I].Data)]).Name;
            if (idYes <> MessageDlg(
                Format(sConfirmDelete, [LName]),
                   mtConfirmation, mbYesNoCancel, 0)) then
              Exit;
            KillActions.Add(TObject(ListView1.Items[I].Data));
          end;

        { Find new focused item from current focused item }
        NewFocused := -1;
        if ListView1.ItemFocused <> nil then
        begin
          for I := ListView1.ItemFocused.Index + 1 to ListView1.Items.Count - 1 do
            if not ListView1.Items[I].Selected then
            begin
              NewFocused := I;
              Break;
            end;
          if NewFocused = -1 then
            for I := ListView1.ItemFocused.Index downto 0 do
              if not ListView1.Items[I].Selected then
              begin
                NewFocused := I;
                Break;
              end;
        end;
        SelectNone(False);
        if NewFocused >= 0 then
          ListView1.Items[NewFocused].Selected := True;
        SetSelection;
        { Delete items }
        for I := 0 to KillActions.Count - 1 do
          if (csAncestor in FDataBindingList[Integer(KillActions[I])].ComponentState) then
            raise Exception.CreateRes(@SCantDeleteAncestor);
        for I := 0 to KillActions.Count - 1 do
          FDataBindingList[Integer(KillActions[I])].Free;
      finally
        KillActions.Free;
      end;
    end;
  finally
    UnLockState;
    EndUpdate;
  end;
  UpdateView;
  Designer.Modified;
  { Make sure we have focus }
  for I := 0 to ListView1.Items.Count - 1 do
    if ListView1.Items[I].Selected then
    begin
      FocusDataBinding(FDataBindingList[Integer(ListView1.Items[I].Data)]);
      Break;
    end;
end;

procedure TDataBindingListDesigner.Cut;
begin
  Copy;
  Remove;
end;

procedure TDataBindingListDesigner.Copy;
var
  I: Integer;
  ComponentList: IDesignerSelections;
begin
  ComponentList := CreateSelectionList;
  with ListView1 do
    for I := 0 to Items.Count - 1 do
      if Items[I].Selected then
        ComponentList.Add(FDataBindingList[{+ }Integer(Items[I].Data)]);
  CopyComponents(FDataBindingList.Owner, ComponentList);
end;


procedure TDataBindingListDesigner.Paste;
var
  I, C: Integer;
  ComponentList: TList;
  Action: TContainedBindComponent;
  Item: TListItem;
begin
  ComponentList := TList.Create;
  try
    C := -1;
    with ListView1 do
      if (Selected <> nil) and (Selected.Index <> -1) and (Items.Count > 0) then
        C := Selected.Index;
    try
      try
        { Try to convert TMenuItem, TControl, and TWinControl to TAction }
        LoadFromClipboard(FDataBindingList.Owner, FDataBindingList, ComponentList);
      finally
      end;
    finally
      UpdateView
    end;
    try
      ListView1.Selected := nil;
      Item := nil;
      for I := ComponentList.Count - 1 downto 0 do
        if TObject(ComponentList[I]) is TBasicAction then
        begin
          Action := TContainedBindComponent(ComponentList[I]);
          if C <> -1 then Action.Index := C;
          Item := ListView1.Items[C];
          if Item <> nil then Item.Selected := True;
        end;
      if Item <> nil then
        Item.Focused := True;
    finally
      GetSelection;
      Designer.Modified;
    end;
  finally
    ComponentList.Free;
  end;
end;

procedure TDataBindingListDesigner.UpdateCaption;
var
  NewCaption: string;
begin
  if (FDataBindingList <> nil) and (FDataBindingList.Owner <> nil) then
    NewCaption := Format(SDataBindingListEditorCaption, [FDataBindingList.Owner.Name, DotSep,
    FDataBindingList.Name]);
  if Caption <> NewCaption then Caption := NewCaption;
end;

procedure TDataBindingListDesigner.PasteItemClick(Sender: TObject);
begin
  Paste;
end;

procedure TDataBindingListDesigner.CopyItemClick(Sender: TObject);
begin
  Copy;
end;

procedure TDataBindingListDesigner.CutItemClick(Sender: TObject);
begin
  Cut;
end;

function TDataBindingListDesigner.GetDescriptionsVisible: Boolean;
begin
  Result := DescriptionsAction.Checked;
end;

procedure TDataBindingListDesigner.SetDescriptionsVisible(Value: Boolean);
begin
  DescriptionsAction.Checked := Value;
end;

procedure TDataBindingListDesigner.LoadFromClipboard(AOwner, AParent: TComponent;
  Components: TList);
var
  S: TStream;
begin
  S := GetClipboardStream;
  try
    ReadStream(S, AOwner, AParent, Components);
  finally
    S.Free;
  end;
end;

procedure TDataBindingListDesigner.ReadStream(Stream: TStream; AOwner,
  AParent: TComponent; Components: TList);
var
  M: TMemoryStream;
  R: TReader;
  I: Integer;
  W: TWriter;
begin
  M := TMemoryStream.Create;
  try
    R := TReader.Create(Stream, 1024);
    try
      R.OnSetName := ReaderSetName;
      FFixups := TList.Create;
      try
        R.ReadComponents(AOwner, AParent, ComponentRead);
        W := TWriter.Create(M, 1024);
        try
          W.Root := AOwner;
          for I := 0 to FFixups.Count - 1 do
            if TComponent(FFixups[I]) is TContainedBindComponent then
            begin
              W.WriteSignature;
              W.WriteComponent(TComponent(FFixups[I]));
            end;
          W.WriteListEnd;
        finally
          W.Free;
        end;
      finally
        for I := 0 to FFixups.Count - 1 do TObject(FFixups[I]).Free;
        FFixups.Free;
      end;
    finally
      R.Free;
    end;
    M.Position := 0;
    R := TReader.Create(M, 1024);
    try
      R.OnSetName := ReaderSetName2;
      FFixups := Components;
      R.ReadComponents(AOwner, AParent, ComponentRead);
    finally
      R.Free;
    end;
  finally
    M.Free;
  end;
end;

procedure TDataBindingListDesigner.ReaderSetName(Reader: TReader; Component: TComponent;
  var Name: string);
begin
  Name := '';
end;

procedure TDataBindingListDesigner.ReaderSetName2(Reader: TReader; Component: TComponent;
  var Name: string);
begin
  Name := UniqueName(Component);
end;

procedure TDataBindingListDesigner.ComponentRead(Component: TComponent);
//var
//  DataBinding: TContainedBindComponent;
begin
  if Component is TContainedBindComponent then
  begin
    FFixups.Add(Component);
  end
  else begin
//    DataBinding := {+ Default}DefDataBindingClass.Create(nil);
//    try
//      try
//        DataBinding.Assign(Component);
//      finally
////!        Component.Free;
//      end;
//    except
//      DataBinding.Free;
//      raise;// Exception.Create(SMenuPasteError);
//    end;
//    FFixups.Add(DataBinding);
//    FFixups.Add(Component);
  end;
end;

procedure TDataBindingListDesigner.SelectedUpdate(Sender: TObject);
begin
  (Sender as TCustomAction).Enabled := ListView1.SelCount > 0;
end;

procedure TDataBindingListDesigner.SelectAllActionUpdate(Sender: TObject);
begin
  (Sender as TCustomAction).Enabled := ListView1.Items.Count > 0;
end;

procedure TDataBindingListDesigner.ListBox1Click(Sender: TObject);
begin
  if ListBox1.ItemIndex >= 0 then
  begin
    FCategoryKind := CategoryKinds[Integer(ListBox1.Items.Objects[ListBox1.ItemIndex])];
    if FCategoryKind = ckCategory then
      FCategory := ListBox1.Items[ListBox1.ItemIndex] else
      FCategory := '';
  end
  else
  begin
    FCategoryKind := ckAll;
    FCategory := '';
  end;
  UpdateView;
  ListView1Resize(nil);
end;

procedure TDataBindingListDesigner.BuildNewDataBindings;
begin
end;

procedure TDataBindingListDesigner.NewBindCompDialogExecute(Sender: TObject);
var
//  I: Integer;
//  LDataBindingClass: TContainedBindCompClass;
  LDataBinding: TContainedBindComponent;
//  LCategory: string;
//  LClass: TPersistentClass;
begin
  if GetComponentEditor(FDataBindingList, Designer).IsInInlined then { for Frames }
    raise Exception.CreateRes(@SCantAddToAncestor);

  with TExecuteNewDataBinding.Create(FDataBindingList, Designer) do
  begin
    Execute(
      procedure
      begin
        SelectNone(False)
      end,
      procedure(ACategory: string; ADataBinding: TContainedBindComponent)
      begin
        LDataBinding := ADataBinding;
        CommonDataBindingClass := TContainedBindCompClass(LDataBinding.ClassType);
        DoNewDataBinding(ACategory, LDataBinding);
      end,
      procedure
      begin
        FocusDataBinding(LDataBinding)
      end,
      function(AClass: TContainedBindCompClass): Boolean
      begin
        // Allow class
        Result := True;
      end)
  end;
end;

procedure TDataBindingListDesigner.BeginUpdate;
begin
  Inc(FUpdateCount);
end;

procedure TDataBindingListDesigner.EndUpdate;
begin
  Dec(FUpdateCount);
end;

procedure TDataBindingListDesigner.SelectionChanged(const Designer: IDesigner;
  const ASelection: IDesignerSelections);
var
  I: Integer;
  S: Boolean;
{  LastItem: TListItem;
  SelChanged: Boolean;}

  function InSelection(Component: TComponent): Boolean;
  var
    I: Integer;
  begin
    Result := True;
    if ASelection <> nil then
      with ASelection do
        for I := 0 to Count - 1 do
          if Component = Items[I] then Exit;
    Result := False;
  end;

begin
exit;
  if (FDataBindingList = nil) or (FUpdateCount > 0) or (FStateLock > 0) then Exit;
  if (GetCaptureControl <> nil) and (GetParentForm(GetCaptureControl) = Self) then Exit;
  BeginUpdate;
  LockState;
  try
    with ListView1 do
    begin
      Items.BeginUpdate;
      try
        for I := 0 to Items.Count - 1 do
        begin
          if I >= FDataBindingList.BindCompCount - 1 then Break;
          S := InSelection(FDataBindingList[{+ I}Integer(Items[I].Data)]);
          if Items[I].Selected <> S then
          begin
            Items[I].Selected := S;
          end;
        end;
      finally
        Items.EndUpdate;
      end;
    end;
  finally
    UnLockState;
    EndUpdate;
  end;
end;

procedure TDataBindingListDesigner.ListView1KeyPress(Sender: TObject;
  var Key: Char);
begin
  if CharInSet(Key, ['!'..'~']) then
  begin
    Designer.ModalEdit(Key, Self);
    Key := #0;
  end;
end;

procedure TDataBindingListDesigner.ListView1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_PROCESSKEY then
    Designer.ModalEdit(#0, Self);
end;

procedure TDataBindingListDesigner.NewDataBindingsPopupPopup(Sender: TObject);
var
  I: Integer;
begin
  { Sync popup menu's default item to that of the button }
  with (Sender as TPopupMenu) do
    for I := 0 to Items.Count - 1 do
      Items[I].Default := Items[I].Action = ToolButton1.Action;
end;

procedure TDataBindingListDesigner.DescriptionsActionExecute(Sender: TObject);
begin
  with DescriptionsAction do
  begin
    Checked := not Checked;
    Panel3.Visible := Checked;
    Panel4.Visible := Checked;
  end;
end;

procedure TDataBindingListDesigner.ListView1StartDrag(Sender: TObject;
  var DragObject: TDragObject);
begin
  FDragObject := TDataBindingDragObject.Create(ListView1);
  DragObject := FDragObject;
end;

procedure TDataBindingListDesigner.ListView1EndDrag(Sender, Target: TObject; X,
  Y: Integer);
begin
  FDragObject.Free;
  FDragObject := nil;
end;

procedure TDataBindingListDesigner.SetCommonDataBindingClass(Value: TContainedBindCompClass);
var
  S: string;
begin
  //if Value = nil then Value := DefDataBindingClass;
  if FCommonDataBindingClass <> Value then
  begin
    FCommonDataBindingClass := Value;
    if FCommonDataBindingClass <> nil then
    begin
      S := Value.ClassName;
      if (Length(S) > 1) and (S[1] = 'T') then
        System.Delete(S, 1, 1);
      NewCommonDataBinding.Caption := Format(SNewDataBinding, [S]);
      NewCommonDataBinding.Hint := Format(SNewDataBindingHint, [S, S]);
    end;
  end;
  NewCommonDataBinding.Visible := FCommonDataBindingClass <> nil; //DefDataBindingClass;
end;

procedure TDataBindingListDesigner.ListView1DblClick(Sender: TObject);
var
  Editor: IComponentEditor;
  DataBinding: TContainedBindComponent;
begin
  { Perform default component editor action }
  if ListView1.ItemFocused <> nil then
  begin
    DataBinding := FDataBindingList[Integer(ListView1.ItemFocused.Data)];
    Editor := GetComponentEditor(DataBinding, Designer);
    if Editor <> nil then Editor.Edit;
  end;
end;

procedure TDataBindingListDesigner.NewCommonDataBindingExecute(Sender: TObject);
var
  DataBinding: TContainedBindComponent;
  LCategory: string;
begin
  if GetComponentEditor(FDataBindingList, Designer).IsInInlined then { for frames }
    raise Exception.CreateRes(@SCantAddToAncestor);

  SelectNone(False);
  LCategory := FCategory;
  if FCategoryKind = TCategoryKind.ckAll then
    LCategory := CategoryOfClass(CommonDataBindingClass);
  DataBinding := CreateBindComponent(Designer.GetRoot, CommonDataBindingClass) as TContainedBindComponent;

  DoNewDataBinding(LCategory, DataBinding);
  FocusDataBinding(DataBinding);//!
end;

procedure TDataBindingListDesigner.MoveUpUpdate(Sender: TObject);
begin 
  inherited;
  (Sender as TCustomAction).Enabled := (ListView1.SelCount > 0) and (ListView1.Items.Count > 1) {and
    (ListView1.Selected.Index > 0)};
end;

procedure TDataBindingListDesigner.MoveDownUpdate(Sender: TObject);
begin
  inherited;
  (Sender as TCustomAction).Enabled := (ListView1.SelCount > 0) and (ListView1.Items.Count > 1){and
    (ListView1.Selected.Index < ListView1.Items.Count - 1)};
end;

procedure TDataBindingListDesigner.ListView1Resize(Sender: TObject);
begin
  ListView1.Columns.BeginUpdate;
  try
    // ListView1.Columns[0].Width := ListView1.ClientWidth - 1;
  finally
    ListView1.Columns.EndUpdate;
  end;
end;

{ TNewDataBindingDialog }

constructor TExecuteNewDataBinding.Create(ABindingsList:
  TCustomBindingsList; ADesigner: IDesigner);
begin
  FBindingsList := ABindingsList;
  FDesigner := ADesigner;
end;

destructor TExecuteNewDataBinding.Destroy;
begin

  inherited;
end;

function TExecuteNewDataBinding.Execute(ABeforeCreate: TProc;
  ACreated: TProc<string, TContainedBindComponent>; AAfterCreate: TProc;
  AAllowClass: TFunc<TContainedBindCompClass, Boolean> ): Boolean;
var
  I: Integer;
  LDataBindingClass: TContainedBindCompClass;
//  LClass: TPersistentClass;
  LCategory: string;
  LBindComp: TContainedBindComponent;
begin
  if GetComponentEditor(FBindingsList, FDesigner).IsInInlined then { for Frames }
    raise Exception.CreateRes(@SCantAddToAncestor);
  with TNewStdDataBindingDlg.Create(Application) do
  try
    AllowClass := AAllowClass;
    DesignerIntf := Self.FDesigner;
    Result := ShowModal = mrOk;
    if Result then
    begin
      ABeforeCreate;
      //SelectNone(False);
      for I := 0 to ActionTree.Items.Count - 1 do
        if ActionTree.Items[I].Selected and Assigned(ActionTree.Items[I].Data) then
        begin
          LDataBindingClass := TContainedBindCompClass(ActionTree.Items[I].Data);
          if LDataBindingClass <> nil then
          begin
            LCategory := ActionTree.Items[I].Parent.Text{ SubItems[0]};
            if AnsiCompareText(LCategory, SDataBindingCategoryNone) = 0 then LCategory := '';
            LBindComp := CreateBindComponent(Self.FDesigner.GetRoot,
              LDataBindingClass) as TContainedBindComponent;
            ACreated(LCategory, LBindComp);
          end;
        end;
      AAfterCreate;
    end;
  finally
    Free;
  end;
end;



initialization
  BindCompEdit.NotifyDataBindingListChange := NotifyDataBindingListChangeImpl;

finalization
  BindCompEdit.NotifyDataBindingListChange := nil;
  FreeAndNil(DesignersList);

end.

