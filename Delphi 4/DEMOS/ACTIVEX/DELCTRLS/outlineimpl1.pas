unit OutlineImpl1;

interface

uses
  Windows, ActiveX, Classes, Controls, Graphics, Menus, Forms, StdCtrls,
  ComServ, StdVCL, AXCtrls, DelCtrls_TLB, Outline, Grids;

type
  TOutlineX = class(TActiveXControl, IOutlineX)
  private
    { Private declarations }
    FDelphiControl: TOutline;
    FEvents: IOutlineXEvents;
    procedure ClickEvent(Sender: TObject);
    procedure CollapseEvent(Sender: TObject; Index: Integer);
    procedure DblClickEvent(Sender: TObject);
    procedure ExpandEvent(Sender: TObject; Index: Integer);
    procedure KeyPressEvent(Sender: TObject; var Key: Char);
  protected
    { Protected declarations }
    procedure DefinePropertyPages(DefinePropertyPage: TDefinePropertyPage); override;
    procedure EventSinkChanged(const EventSink: IUnknown); override;
    procedure InitializeControl; override;
    function Add(Index: Integer; const Text: WideString): Integer; safecall;
    function AddChild(Index: Integer; const Text: WideString): Integer;
      safecall;
    function ClassNameIs(const Name: WideString): WordBool; safecall;
    function DrawTextBiDiModeFlags(Flags: Integer): Integer; safecall;
    function DrawTextBiDiModeFlagsReadingOnly: Integer; safecall;
    function Get_BiDiMode: TxBiDiMode; safecall;
    function Get_BorderStyle: TxBorderStyle; safecall;
    function Get_Color: OLE_COLOR; safecall;
    function Get_Ctl3D: WordBool; safecall;
    function Get_Cursor: Smallint; safecall;
    function Get_DoubleBuffered: WordBool; safecall;
    function Get_DragCursor: Smallint; safecall;
    function Get_DragMode: TxDragMode; safecall;
    function Get_Enabled: WordBool; safecall;
    function Get_Font: IFontDisp; safecall;
    function Get_ItemCount: Integer; safecall;
    function Get_ItemHeight: Integer; safecall;
    function Get_ItemSeparator: WideString; safecall;
    function Get_Lines: IStrings; safecall;
    function Get_OutlineStyle: TxOutlineStyle; safecall;
    function Get_ParentColor: WordBool; safecall;
    function Get_ParentCtl3D: WordBool; safecall;
    function Get_ParentFont: WordBool; safecall;
    function Get_Row: Integer; safecall;
    function Get_ScrollBars: TxScrollStyle; safecall;
    function Get_SelectedItem: Integer; safecall;
    function Get_Style: TxOutlineType; safecall;
    function Get_Visible: WordBool; safecall;
    function GetControlsAlignment: TxAlignment; safecall;
    function GetItem(X, Y: Integer): Integer; safecall;
    function GetTextItem(const Param1: WideString): Integer; safecall;
    function Insert(Index: Integer; const Text: WideString): Integer; safecall;
    function IsRightToLeft: WordBool; safecall;
    function UseRightToLeftAlignment: WordBool; safecall;
    function UseRightToLeftReading: WordBool; safecall;
    function UseRightToLeftScrollBar: WordBool; safecall;
    procedure _Set_Font(const Value: IFontDisp); safecall;
    procedure AboutBox; safecall;
    procedure BeginUpdate; safecall;
    procedure Clear; safecall;
    procedure Delete(Index: Integer); safecall;
    procedure EndUpdate; safecall;
    procedure FlipChildren(AllLevels: WordBool); safecall;
    procedure FullCollapse; safecall;
    procedure FullExpand; safecall;
    procedure InitiateAction; safecall;
    procedure LoadFromFile(const FileName: WideString); safecall;
    procedure SaveToFile(const FileName: WideString); safecall;
    procedure Set_BiDiMode(Value: TxBiDiMode); safecall;
    procedure Set_BorderStyle(Value: TxBorderStyle); safecall;
    procedure Set_Color(Value: OLE_COLOR); safecall;
    procedure Set_Ctl3D(Value: WordBool); safecall;
    procedure Set_Cursor(Value: Smallint); safecall;
    procedure Set_DoubleBuffered(Value: WordBool); safecall;
    procedure Set_DragCursor(Value: Smallint); safecall;
    procedure Set_DragMode(Value: TxDragMode); safecall;
    procedure Set_Enabled(Value: WordBool); safecall;
    procedure Set_Font(const Value: IFontDisp); safecall;
    procedure Set_ItemHeight(Value: Integer); safecall;
    procedure Set_ItemSeparator(const Value: WideString); safecall;
    procedure Set_Lines(const Value: IStrings); safecall;
    procedure Set_OutlineStyle(Value: TxOutlineStyle); safecall;
    procedure Set_ParentColor(Value: WordBool); safecall;
    procedure Set_ParentCtl3D(Value: WordBool); safecall;
    procedure Set_ParentFont(Value: WordBool); safecall;
    procedure Set_Row(Value: Integer); safecall;
    procedure Set_ScrollBars(Value: TxScrollStyle); safecall;
    procedure Set_SelectedItem(Value: Integer); safecall;
    procedure Set_Style(Value: TxOutlineType); safecall;
    procedure Set_Visible(Value: WordBool); safecall;
    procedure SetUpdateState(Value: WordBool); safecall;
  end;

implementation

uses ComObj, About20;

{ TOutlineX }

procedure TOutlineX.DefinePropertyPages(DefinePropertyPage: TDefinePropertyPage);
begin
  { Define property pages here.  Property pages are defined by calling
    DefinePropertyPage with the class id of the page.  For example,
      DefinePropertyPage(Class_OutlineXPage); }
end;

procedure TOutlineX.EventSinkChanged(const EventSink: IUnknown);
begin
  FEvents := EventSink as IOutlineXEvents;
end;

procedure TOutlineX.InitializeControl;
begin
  FDelphiControl := Control as TOutline;
  FDelphiControl.OnClick := ClickEvent;
  FDelphiControl.OnCollapse := CollapseEvent;
  FDelphiControl.OnDblClick := DblClickEvent;
  FDelphiControl.OnExpand := ExpandEvent;
  FDelphiControl.OnKeyPress := KeyPressEvent;
end;

function TOutlineX.Add(Index: Integer; const Text: WideString): Integer;
begin
  Result := FDelphiControl.Add(Index, Text);
end;

function TOutlineX.AddChild(Index: Integer;
  const Text: WideString): Integer;
begin
  Result := FDelphiControl.AddChild(Index, Text);
end;

function TOutlineX.ClassNameIs(const Name: WideString): WordBool;
begin
  Result := FDelphiControl.ClassNameIs(Name);
end;

function TOutlineX.DrawTextBiDiModeFlags(Flags: Integer): Integer;
begin
  Result := FDelphiControl.DrawTextBiDiModeFlags(Flags);
end;

function TOutlineX.DrawTextBiDiModeFlagsReadingOnly: Integer;
begin
  Result := FDelphiControl.DrawTextBiDiModeFlagsReadingOnly;
end;

function TOutlineX.Get_BiDiMode: TxBiDiMode;
begin
  Result := Ord(FDelphiControl.BiDiMode);
end;

function TOutlineX.Get_BorderStyle: TxBorderStyle;
begin
  Result := Ord(FDelphiControl.BorderStyle);
end;

function TOutlineX.Get_Color: OLE_COLOR;
begin
  Result := OLE_COLOR(FDelphiControl.Color);
end;

function TOutlineX.Get_Ctl3D: WordBool;
begin
  Result := FDelphiControl.Ctl3D;
end;

function TOutlineX.Get_Cursor: Smallint;
begin
  Result := Smallint(FDelphiControl.Cursor);
end;

function TOutlineX.Get_DoubleBuffered: WordBool;
begin
  Result := FDelphiControl.DoubleBuffered;
end;

function TOutlineX.Get_DragCursor: Smallint;
begin
  Result := Smallint(FDelphiControl.DragCursor);
end;

function TOutlineX.Get_DragMode: TxDragMode;
begin
  Result := Ord(FDelphiControl.DragMode);
end;

function TOutlineX.Get_Enabled: WordBool;
begin
  Result := FDelphiControl.Enabled;
end;

function TOutlineX.Get_Font: IFontDisp;
begin
  GetOleFont(FDelphiControl.Font, Result);
end;

function TOutlineX.Get_ItemCount: Integer;
begin
  Result := FDelphiControl.ItemCount;
end;

function TOutlineX.Get_ItemHeight: Integer;
begin
  Result := FDelphiControl.ItemHeight;
end;

function TOutlineX.Get_ItemSeparator: WideString;
begin
  Result := WideString(FDelphiControl.ItemSeparator);
end;

function TOutlineX.Get_Lines: IStrings;
begin
  GetOleStrings(FDelphiControl.Lines, Result);
end;

function TOutlineX.Get_OutlineStyle: TxOutlineStyle;
begin
  Result := Ord(FDelphiControl.OutlineStyle);
end;

function TOutlineX.Get_ParentColor: WordBool;
begin
  Result := FDelphiControl.ParentColor;
end;

function TOutlineX.Get_ParentCtl3D: WordBool;
begin
  Result := FDelphiControl.ParentCtl3D;
end;

function TOutlineX.Get_ParentFont: WordBool;
begin
  Result := FDelphiControl.ParentFont;
end;

function TOutlineX.Get_Row: Integer;
begin
  Result := FDelphiControl.Row;
end;

function TOutlineX.Get_ScrollBars: TxScrollStyle;
begin
  Result := Ord(FDelphiControl.ScrollBars);
end;

function TOutlineX.Get_SelectedItem: Integer;
begin
  Result := FDelphiControl.SelectedItem;
end;

function TOutlineX.Get_Style: TxOutlineType;
begin
  Result := Ord(FDelphiControl.Style);
end;

function TOutlineX.Get_Visible: WordBool;
begin
  Result := FDelphiControl.Visible;
end;

function TOutlineX.GetControlsAlignment: TxAlignment;
begin
 Result := TxAlignment(FDelphiControl.GetControlsAlignment);
end;

function TOutlineX.GetItem(X, Y: Integer): Integer;
begin
  Result := FDelphiControl.GetItem(X, Y);
end;

function TOutlineX.GetTextItem(const Param1: WideString): Integer;
begin
  Result := FDelphiControl.GetTextItem(Param1);
end;

function TOutlineX.Insert(Index: Integer; const Text: WideString): Integer;
begin
  Result := FDelphiControl.Insert(Index, Text);
end;

function TOutlineX.IsRightToLeft: WordBool;
begin
  Result := FDelphiControl.IsRightToLeft;
end;

function TOutlineX.UseRightToLeftAlignment: WordBool;
begin
  Result := FDelphiControl.UseRightToLeftAlignment;
end;

function TOutlineX.UseRightToLeftReading: WordBool;
begin
  Result := FDelphiControl.UseRightToLeftReading;
end;

function TOutlineX.UseRightToLeftScrollBar: WordBool;
begin
  Result := FDelphiControl.UseRightToLeftScrollBar;
end;

procedure TOutlineX._Set_Font(const Value: IFontDisp);
begin
  SetOleFont(FDelphiControl.Font, Value);
end;

procedure TOutlineX.AboutBox;
begin
  ShowOutlineXAbout;
end;

procedure TOutlineX.BeginUpdate;
begin
  FDelphiControl.BeginUpdate;
end;

procedure TOutlineX.Clear;
begin
  FDelphiControl.Clear;
end;

procedure TOutlineX.Delete(Index: Integer);
begin
  FDelphiControl.Delete(Index);
end;

procedure TOutlineX.EndUpdate;
begin
  FDelphiControl.EndUpdate;
end;

procedure TOutlineX.FlipChildren(AllLevels: WordBool);
begin
  FDelphiControl.FlipChildren(AllLevels);
end;

procedure TOutlineX.FullCollapse;
begin
  FDelphiControl.FullCollapse;
end;

procedure TOutlineX.FullExpand;
begin
  FDelphiControl.FullExpand;
end;

procedure TOutlineX.InitiateAction;
begin
  FDelphiControl.InitiateAction;
end;

procedure TOutlineX.LoadFromFile(const FileName: WideString);
begin
  FDelphiControl.LoadFromFile(FileName);
end;

procedure TOutlineX.SaveToFile(const FileName: WideString);
begin
  FDelphiControl.SaveToFile(FileName);
end;

procedure TOutlineX.Set_BiDiMode(Value: TxBiDiMode);
begin
  FDelphiControl.BiDiMode := TBiDiMode(Value);
end;

procedure TOutlineX.Set_BorderStyle(Value: TxBorderStyle);
begin
  FDelphiControl.BorderStyle := TBorderStyle(Value);
end;

procedure TOutlineX.Set_Color(Value: OLE_COLOR);
begin
  FDelphiControl.Color := TColor(Value);
end;

procedure TOutlineX.Set_Ctl3D(Value: WordBool);
begin
  FDelphiControl.Ctl3D := Value;
end;

procedure TOutlineX.Set_Cursor(Value: Smallint);
begin
  FDelphiControl.Cursor := TCursor(Value);
end;

procedure TOutlineX.Set_DoubleBuffered(Value: WordBool);
begin
  FDelphiControl.DoubleBuffered := Value;
end;

procedure TOutlineX.Set_DragCursor(Value: Smallint);
begin
  FDelphiControl.DragCursor := TCursor(Value);
end;

procedure TOutlineX.Set_DragMode(Value: TxDragMode);
begin
  FDelphiControl.DragMode := TDragMode(Value);
end;

procedure TOutlineX.Set_Enabled(Value: WordBool);
begin
  FDelphiControl.Enabled := Value;
end;

procedure TOutlineX.Set_Font(const Value: IFontDisp);
begin
  SetOleFont(FDelphiControl.Font, Value);
end;

procedure TOutlineX.Set_ItemHeight(Value: Integer);
begin
  FDelphiControl.ItemHeight := Value;
end;

procedure TOutlineX.Set_ItemSeparator(const Value: WideString);
begin
  FDelphiControl.ItemSeparator := String(Value);
end;

procedure TOutlineX.Set_Lines(const Value: IStrings);
begin
  SetOleStrings(FDelphiControl.Lines, Value);
end;

procedure TOutlineX.Set_OutlineStyle(Value: TxOutlineStyle);
begin
  FDelphiControl.OutlineStyle := TOutlineStyle(Value);
end;

procedure TOutlineX.Set_ParentColor(Value: WordBool);
begin
  FDelphiControl.ParentColor := Value;
end;

procedure TOutlineX.Set_ParentCtl3D(Value: WordBool);
begin
  FDelphiControl.ParentCtl3D := Value;
end;

procedure TOutlineX.Set_ParentFont(Value: WordBool);
begin
  FDelphiControl.ParentFont := Value;
end;

procedure TOutlineX.Set_Row(Value: Integer);
begin
  FDelphiControl.Row := Value;
end;

procedure TOutlineX.Set_ScrollBars(Value: TxScrollStyle);
begin
  FDelphiControl.ScrollBars := TScrollStyle(Value);
end;

procedure TOutlineX.Set_SelectedItem(Value: Integer);
begin
  FDelphiControl.SelectedItem := Value;
end;

procedure TOutlineX.Set_Style(Value: TxOutlineType);
begin
  FDelphiControl.Style := TOutlineType(Value);
end;

procedure TOutlineX.Set_Visible(Value: WordBool);
begin
  FDelphiControl.Visible := Value;
end;

procedure TOutlineX.SetUpdateState(Value: WordBool);
begin
  FDelphiControl.SetUpdateState(Value);
end;

procedure TOutlineX.ClickEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnClick;
end;

procedure TOutlineX.CollapseEvent(Sender: TObject; Index: Integer);
begin
  if FEvents <> nil then FEvents.OnCollapse(Index);
end;

procedure TOutlineX.DblClickEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDblClick;
end;

procedure TOutlineX.ExpandEvent(Sender: TObject; Index: Integer);
begin
  if FEvents <> nil then FEvents.OnExpand(Index);
end;

procedure TOutlineX.KeyPressEvent(Sender: TObject; var Key: Char);
var
  TempKey: Smallint;
begin
  TempKey := Smallint(Key);
  if FEvents <> nil then FEvents.OnKeyPress(TempKey);
  Key := Char(TempKey);
end;

initialization
  TActiveXControlFactory.Create(
    ComServer,
    TOutlineX,
    TOutline,
    Class_OutlineX,
    20,
    '{695CDB71-02E5-11D2-B20D-00C04FA368D4}',
    0,
    tmApartment);
end.
