{*******************************************************}
{                                                       }
{              Delphi FireMonkey Platform               }
{                                                       }
{ Copyright(c) 2018 Embarcadero Technologies, Inc.      }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

unit FMX.Platform.Text.Android;

interface

{$SCOPEDENUMS ON}

uses
  Androidapi.JNIBridge, Androidapi.JNI.GraphicsContentViewText, AndroidApi.JNI.Embarcadero, FMX.Types;

type

  /// <summary>Context menu for all text input controls.</summary>
  TAndroidTextInputContextMenu = class(TJavaLocal, JOnTextContextMenuListener)
  private type
    TContextMenuItem = (Cut, Copy, Paste, Share, SelectAll);
  private
    [Weak] FControl: IControl;
    FActionMode: JActionMode;
    FScreenScale: Single;
    procedure ResetSelection;
    procedure SelectAll;
    procedure ShareText;
    procedure CopyToClipboard;
    procedure PasteFromClipboard;
    procedure CutToClipboard;
    function IsTextReadOnly: Boolean;
    function IsPassword: Boolean;
    function HasClipboardValue: Boolean;
    function HasSelectedText: Boolean;
    function HasText: Boolean;
  public
    constructor Create;

    procedure Show(const AControl: IControl);
    procedure Hide;

    function CanCut: Boolean;
    function CanPaste: Boolean;
    function CanCopy: Boolean;
    function CanShare: Boolean;
    function CanSelectAll: Boolean;

    { JActionMode_Callback }
    function onActionItemClicked(mode: JActionMode; item: JMenuItem): Boolean; cdecl;
    function onCreateActionMode(mode: JActionMode; menu: JMenu): Boolean; cdecl;
    procedure onDestroyActionMode(mode: JActionMode); cdecl;
    function onPrepareActionMode(mode: JActionMode; menu: JMenu): Boolean; cdecl;
    procedure onGetContentRect(mode: JActionMode; view: JView; outRect: JRect); cdecl;
  end;

implementation

uses
  System.SysUtils, System.Rtti, System.Types, AndroidApi.Helpers, AndroidApi.JNI.App, AndroidApi.JNI.JavaTypes, FMX.Text,
  FMX.Platform, FMX.Platform.Android, FMX.Consts, FMX.Controls;

{ TAndroidTextInputContextMenu }

function TAndroidTextInputContextMenu.CanCopy: Boolean;
begin
  Result := HasSelectedText and not IsPassword;
end;

function TAndroidTextInputContextMenu.CanCut: Boolean;
begin
  Result := HasSelectedText and not IsTextReadOnly and not IsPassword;
end;

function TAndroidTextInputContextMenu.CanPaste: Boolean;
begin
  Result := HasClipboardValue and not IsTextReadOnly;
end;

function TAndroidTextInputContextMenu.CanSelectAll: Boolean;
begin
  Result := HasText;
end;

function TAndroidTextInputContextMenu.CanShare: Boolean;
begin
  Result := HasSelectedText and not IsPassword;
end;

procedure TAndroidTextInputContextMenu.CopyToClipboard;
var
  TextActions: ITextActions;
begin
  if Supports(FControl, ITextActions, TextActions) then
    TextActions.CopyToClipboard;
end;

constructor TAndroidTextInputContextMenu.Create;
var
  ScreenService: IFMXScreenService;
begin
  inherited Create;
  if not TPlatformServices.Current.SupportsPlatformService(IFMXScreenService, ScreenService) then
    raise Exception.CreateFmt(SUnsupportedPlatformService, ['IFMXScreenService']);

  FScreenScale := ScreenService.GetScreenScale;
end;

procedure TAndroidTextInputContextMenu.CutToClipboard;
var
  TextActions: ITextActions;
begin
  if Supports(FControl, ITextActions, TextActions) then
    TextActions.CutToClipboard;
end;

function TAndroidTextInputContextMenu.HasClipboardValue: Boolean;
var
  ClipboardSvc: IFMXClipboardService;
  ClipboardValue: TValue;
begin
  TPlatformServices.Current.SupportsPlatformService(IFMXClipboardService, ClipboardSvc);
  ClipboardValue := ClipboardSvc.GetClipboard;
  Result := not ClipboardValue.IsEmpty and not ClipboardValue.ToString.IsEmpty;
end;

function TAndroidTextInputContextMenu.HasSelectedText: Boolean;
var
  TextInput: ITextInput;
begin
  Result := Supports(FControl, ITextInput, TextInput) and not TextInput.GetSelection.IsEmpty;
end;

function TAndroidTextInputContextMenu.HasText: Boolean;
var
  TextInput: ITextInput;
begin
  Result := Supports(FControl, ITextInput, TextInput) and TextInput.HasText;
end;

procedure TAndroidTextInputContextMenu.Hide;
begin
  if FActionMode <> nil then
  begin
    FActionMode.finish;
    FActionMode := nil;
  end;
end;

function TAndroidTextInputContextMenu.IsPassword: Boolean;
var
  VirtualKeyboard: IVirtualKeyboardControl;
begin
  Result := Supports(FControl, IVirtualKeyboardControl, VirtualKeyboard) and VirtualKeyboard.IsPassword;
end;

function TAndroidTextInputContextMenu.IsTextReadOnly: Boolean;
var
  ReadOnly: IReadOnly;
begin
  Result := False;
  if Supports(FControl, IReadOnly, ReadOnly) then
    Result := ReadOnly.ReadOnly;
end;

function TAndroidTextInputContextMenu.onActionItemClicked(mode: JActionMode; item: JMenuItem): Boolean;
var
  ItemType: TContextMenuItem;
begin
  Result := True;
  ItemType := TContextMenuItem(item.getItemId);

  case ItemType of
    TContextMenuItem.Cut:
    begin
      CutToClipboard;
      ResetSelection;
      Hide;
    end;
    TContextMenuItem.Copy:
    begin
      CopyToClipboard;
      ResetSelection;
      Hide;
    end;
    TContextMenuItem.Paste:
    begin
      PasteFromClipboard;
      ResetSelection;
      Hide;
    end;
    TContextMenuItem.Share:
    begin
      ShareText;
      ResetSelection;
      Hide;
    end;
    TContextMenuItem.SelectAll:
    begin
      SelectAll;
      Show(FControl);
    end;
  end;
end;

function TAndroidTextInputContextMenu.onCreateActionMode(mode: JActionMode; menu: JMenu): Boolean;
var
  ResID: Integer;
begin
  if CanCut then
  begin
    ResID := TAndroidHelper.GetResourceID('android:string/cut'); // Do not localize
    menu.add(TJMenu.JavaClass.NONE, Integer(TContextMenuItem.Cut), 1, ResID)
        .setAlphabeticShortcut('x')
        .setShowAsAction(TJMenuItem.JavaClass.SHOW_AS_ACTION_ALWAYS);
  end;

  if CanCopy then
  begin
    ResID := TAndroidHelper.GetResourceID('android:string/copy'); // Do not localize
    menu.add(TJMenu.JavaClass.NONE, Integer(TContextMenuItem.Copy), 2, ResID)
        .setAlphabeticShortcut('c')
        .setShowAsAction(TJMenuItem.JavaClass.SHOW_AS_ACTION_ALWAYS);
  end;

  if CanPaste then
  begin
    ResID := TAndroidHelper.GetResourceID('android:string/paste'); // Do not localize
    menu.add(TJMenu.JavaClass.NONE, Integer(TContextMenuItem.Paste), 3, ResID)
        .setAlphabeticShortcut('v')
        .setShowAsAction(TJMenuItem.JavaClass.SHOW_AS_ACTION_ALWAYS);
  end;

  if CanShare then
  begin
    ResID := TAndroidHelper.GetResourceID('android:string/share'); // Do not localize
    menu.add(TJMenu.JavaClass.NONE, Integer(TContextMenuItem.Share), 4, ResID)
        .setShowAsAction(TJMenuItem.JavaClass.SHOW_AS_ACTION_IF_ROOM);
  end;

  if CanSelectAll then
  begin
    ResID := TAndroidHelper.GetResourceID('android:string/selectAll'); // Do not localize
    menu.add(TJMenu.JavaClass.NONE, Integer(TContextMenuItem.SelectAll), 5, ResID)
        .setAlphabeticShortcut('a')
        .setShowAsAction(TJMenuItem.JavaClass.SHOW_AS_ACTION_ALWAYS);
  end;

  Result := menu.size > 0;
end;

procedure TAndroidTextInputContextMenu.onDestroyActionMode(mode: JActionMode);
begin
end;

procedure TAndroidTextInputContextMenu.onGetContentRect(mode: JActionMode; view: JView; outRect: JRect);
var
  SelectionRect: TRectF;
  TextInput: ITextInput;
begin
  if Supports(FControl, ITextInput, TextInput) then
  begin
    SelectionRect := TextInput.GetSelectionRect;
    outRect.left := Round(SelectionRect.Left * FScreenScale);
    outRect.top := Round(SelectionRect.Top * FScreenScale);
    outRect.right := Round(SelectionRect.Right * FScreenScale);
    outRect.bottom := Round((SelectionRect.Bottom + TextInput.GetSelectionPointSize.Height) * FScreenScale);
  end;
end;

function TAndroidTextInputContextMenu.onPrepareActionMode(mode: JActionMode; menu: JMenu): Boolean;
begin
  Result := True;
end;

procedure TAndroidTextInputContextMenu.PasteFromClipboard;
var
  TextActions: ITextActions;
begin
  if Supports(FControl, ITextActions, TextActions) then
    TextActions.PasteFromClipboard;
end;

procedure TAndroidTextInputContextMenu.ResetSelection;
var
  TextActions: ITextActions;
begin
  if Supports(FControl, ITextActions, TextActions) then
    TextActions.ResetSelection;
end;

procedure TAndroidTextInputContextMenu.SelectAll;
var
  TextActions: ITextActions;
begin
  if Supports(FControl, ITextActions, TextActions) then
    TextActions.SelectAll;
end;

procedure TAndroidTextInputContextMenu.ShareText;
var
  Intent: JIntent;
  TextInput: ITextInput;
  SelectedText: string;
begin
  if not Supports(FControl, ITextInput, TextInput) then
    Exit;

  SelectedText := TextInput.GetSelection;

  if not SelectedText.IsEmpty then
  begin
    Intent := TJIntent.JavaClass.init(TJIntent.JavaClass.ACTION_SEND);
    Intent.setType(StringToJString('text/plain')); // Do not localize
    Intent.putExtra(TJIntent.JavaClass.EXTRA_TEXT, StringToJString(SelectedText));
    MainActivity.startActivity(TJIntent.JavaClass.createChooser(Intent, nil));
  end;
end;

procedure TAndroidTextInputContextMenu.Show(const AControl: IControl);
var
  DelegatedListener: JDelegatedActionModeCallback;
  DelegatedListener2: JDelegatedActionModeCallback2;
begin
  FControl := AControl;
  if TOSVersion.Check(6, 0) then
  begin
    // New versions of Android support floating context menu and ability to specify the area relative to which the menu
    // appears. However, the ability to specify a content area is implemented in Android through an abstract class.
    // Since JNI does not support inheritance of Java classes, we use a proxy class for this.
    DelegatedListener2 := TJDelegatedActionModeCallback2.JavaClass.init(Self);
    FActionMode := MainActivity.getEditText.startActionMode(TJActionMode_Callback.Wrap(DelegatedListener2),
                                                            TJActionMode.JavaClass.TYPE_FLOATING);
  end
  else
  begin
    // In older versions of Android context menu is always pushed from the top of the screen.
    DelegatedListener := TJDelegatedActionModeCallback.JavaClass.init(Self);
    FActionMode := MainActivity.getEditText.startActionMode(TJActionMode_Callback.Wrap(DelegatedListener));
  end;
end;

end.
