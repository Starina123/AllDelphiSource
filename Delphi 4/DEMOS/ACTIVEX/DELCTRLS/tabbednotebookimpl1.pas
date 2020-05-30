unit TabbedNotebookImpl1;

interface

uses
  Windows, ActiveX, Classes, Controls, Graphics, Menus, Forms, StdCtrls,
  ComServ, StdVCL, AXCtrls, DelCtrls_TLB, Tabnotbk, ComCtrls;

type
  TTabbedNotebookX = class(TActiveXControl, ITabbedNotebookX)
  private
    { Private declarations }
    FDelphiControl: TTabbedNotebook;
    FEvents: ITabbedNotebookXEvents;
    procedure ChangeEvent(Sender: TObject; NewTab: Integer;
      var AllowChange: Boolean);
    procedure ClickEvent(Sender: TObject);
  protected
    { Protected declarations }
    procedure DefinePropertyPages(DefinePropertyPage: TDefinePropertyPage); override;
    procedure EventSinkChanged(const EventSink: IUnknown); override;
    procedure InitializeControl; override;
    function ClassNameIs(const Name: WideString): WordBool; safecall;
    function DrawTextBiDiModeFlags(Flags: Integer): Integer; safecall;
    function DrawTextBiDiModeFlagsReadingOnly: Integer; safecall;
    function Get_ActivePage: WideString; safecall;
    function Get_BiDiMode: TxBiDiMode; safecall;
    function Get_Cursor: Smallint; safecall;
    function Get_DoubleBuffered: WordBool; safecall;
    function Get_Enabled: WordBool; safecall;
    function Get_Font: IFontDisp; safecall;
    function Get_PageIndex: Integer; safecall;
    function Get_Pages: IStrings; safecall;
    function Get_TabFont: IFontDisp; safecall;
    function Get_TabsPerRow: Integer; safecall;
    function Get_TopFont: IFontDisp; safecall;
    function Get_Visible: WordBool; safecall;
    function GetControlsAlignment: TxAlignment; safecall;
    function GetIndexForPage(const PageName: WideString): Integer; safecall;
    function IsRightToLeft: WordBool; safecall;
    function UseRightToLeftAlignment: WordBool; safecall;
    function UseRightToLeftReading: WordBool; safecall;
    function UseRightToLeftScrollBar: WordBool; safecall;
    procedure _Set_Font(const Value: IFontDisp); safecall;
    procedure AboutBox; safecall;
    procedure FlipChildren(AllLevels: WordBool); safecall;
    procedure InitiateAction; safecall;
    procedure Set_ActivePage(const Value: WideString); safecall;
    procedure Set_BiDiMode(Value: TxBiDiMode); safecall;
    procedure Set_Cursor(Value: Smallint); safecall;
    procedure Set_DoubleBuffered(Value: WordBool); safecall;
    procedure Set_Enabled(Value: WordBool); safecall;
    procedure Set_Font(const Value: IFontDisp); safecall;
    procedure Set_PageIndex(Value: Integer); safecall;
    procedure Set_Pages(const Value: IStrings); safecall;
    procedure Set_TabFont(const Value: IFontDisp); safecall;
    procedure Set_TabsPerRow(Value: Integer); safecall;
    procedure Set_Visible(Value: WordBool); safecall;
  end;

implementation

uses ComObj, About33;

{ TTabbedNotebookX }

procedure TTabbedNotebookX.DefinePropertyPages(DefinePropertyPage: TDefinePropertyPage);
begin
  { Define property pages here.  Property pages are defined by calling
    DefinePropertyPage with the class id of the page.  For example,
      DefinePropertyPage(Class_TabbedNotebookXPage); }
end;

procedure TTabbedNotebookX.EventSinkChanged(const EventSink: IUnknown);
begin
  FEvents := EventSink as ITabbedNotebookXEvents;
end;

procedure TTabbedNotebookX.InitializeControl;
begin
  FDelphiControl := Control as TTabbedNotebook;
  FDelphiControl.OnChange := ChangeEvent;
  FDelphiControl.OnClick := ClickEvent;
end;

function TTabbedNotebookX.ClassNameIs(const Name: WideString): WordBool;
begin
  Result := FDelphiControl.ClassNameIs(Name);
end;

function TTabbedNotebookX.DrawTextBiDiModeFlags(Flags: Integer): Integer;
begin
  Result := FDelphiControl.DrawTextBiDiModeFlags(Flags);
end;

function TTabbedNotebookX.DrawTextBiDiModeFlagsReadingOnly: Integer;
begin
  Result := FDelphiControl.DrawTextBiDiModeFlagsReadingOnly;
end;

function TTabbedNotebookX.Get_ActivePage: WideString;
begin
  Result := WideString(FDelphiControl.ActivePage);
end;

function TTabbedNotebookX.Get_BiDiMode: TxBiDiMode;
begin
  Result := Ord(FDelphiControl.BiDiMode);
end;

function TTabbedNotebookX.Get_Cursor: Smallint;
begin
  Result := Smallint(FDelphiControl.Cursor);
end;

function TTabbedNotebookX.Get_DoubleBuffered: WordBool;
begin
  Result := FDelphiControl.DoubleBuffered;
end;

function TTabbedNotebookX.Get_Enabled: WordBool;
begin
  Result := FDelphiControl.Enabled;
end;

function TTabbedNotebookX.Get_Font: IFontDisp;
begin
  GetOleFont(FDelphiControl.Font, Result);
end;

function TTabbedNotebookX.Get_PageIndex: Integer;
begin
  Result := FDelphiControl.PageIndex;
end;

function TTabbedNotebookX.Get_Pages: IStrings;
begin
  GetOleStrings(FDelphiControl.Pages, Result);
end;

function TTabbedNotebookX.Get_TabFont: IFontDisp;
begin
  GetOleFont(FDelphiControl.TabFont, Result);
end;

function TTabbedNotebookX.Get_TabsPerRow: Integer;
begin
  Result := FDelphiControl.TabsPerRow;
end;

function TTabbedNotebookX.Get_TopFont: IFontDisp;
begin
  GetOleFont(FDelphiControl.TopFont, Result);
end;

function TTabbedNotebookX.Get_Visible: WordBool;
begin
  Result := FDelphiControl.Visible;
end;

function TTabbedNotebookX.GetControlsAlignment: TxAlignment;
begin
 Result := TxAlignment(FDelphiControl.GetControlsAlignment);
end;

function TTabbedNotebookX.GetIndexForPage(
  const PageName: WideString): Integer;
begin
  Result := FDelphiControl.GetIndexForPage(PageName);
end;

function TTabbedNotebookX.IsRightToLeft: WordBool;
begin
  Result := FDelphiControl.IsRightToLeft;
end;

function TTabbedNotebookX.UseRightToLeftAlignment: WordBool;
begin
  Result := FDelphiControl.UseRightToLeftAlignment;
end;

function TTabbedNotebookX.UseRightToLeftReading: WordBool;
begin
  Result := FDelphiControl.UseRightToLeftReading;
end;

function TTabbedNotebookX.UseRightToLeftScrollBar: WordBool;
begin
  Result := FDelphiControl.UseRightToLeftScrollBar;
end;

procedure TTabbedNotebookX._Set_Font(const Value: IFontDisp);
begin
  SetOleFont(FDelphiControl.Font, Value);
end;

procedure TTabbedNotebookX.AboutBox;
begin
  ShowTabbedNotebookXAbout;
end;

procedure TTabbedNotebookX.FlipChildren(AllLevels: WordBool);
begin
  FDelphiControl.FlipChildren(AllLevels);
end;

procedure TTabbedNotebookX.InitiateAction;
begin
  FDelphiControl.InitiateAction;
end;

procedure TTabbedNotebookX.Set_ActivePage(const Value: WideString);
begin
  FDelphiControl.ActivePage := String(Value);
end;

procedure TTabbedNotebookX.Set_BiDiMode(Value: TxBiDiMode);
begin
  FDelphiControl.BiDiMode := TBiDiMode(Value);
end;

procedure TTabbedNotebookX.Set_Cursor(Value: Smallint);
begin
  FDelphiControl.Cursor := TCursor(Value);
end;

procedure TTabbedNotebookX.Set_DoubleBuffered(Value: WordBool);
begin
  FDelphiControl.DoubleBuffered := Value;
end;

procedure TTabbedNotebookX.Set_Enabled(Value: WordBool);
begin
  FDelphiControl.Enabled := Value;
end;

procedure TTabbedNotebookX.Set_Font(const Value: IFontDisp);
begin
  SetOleFont(FDelphiControl.Font, Value);
end;

procedure TTabbedNotebookX.Set_PageIndex(Value: Integer);
begin
  FDelphiControl.PageIndex := Value;
end;

procedure TTabbedNotebookX.Set_Pages(const Value: IStrings);
begin
  SetOleStrings(FDelphiControl.Pages, Value);
end;

procedure TTabbedNotebookX.Set_TabFont(const Value: IFontDisp);
begin
  SetOleFont(FDelphiControl.TabFont, Value);
end;

procedure TTabbedNotebookX.Set_TabsPerRow(Value: Integer);
begin
  FDelphiControl.TabsPerRow := Value;
end;

procedure TTabbedNotebookX.Set_Visible(Value: WordBool);
begin
  FDelphiControl.Visible := Value;
end;

procedure TTabbedNotebookX.ChangeEvent(Sender: TObject; NewTab: Integer;
  var AllowChange: Boolean);
var
  TempAllowChange: WordBool;
begin
  TempAllowChange := WordBool(AllowChange);
  if FEvents <> nil then FEvents.OnChange(NewTab, TempAllowChange);
  AllowChange := Boolean(TempAllowChange);
end;

procedure TTabbedNotebookX.ClickEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnClick;
end;

initialization
  TActiveXControlFactory.Create(
    ComServer,
    TTabbedNotebookX,
    TTabbedNotebook,
    Class_TabbedNotebookX,
    33,
    '{695CDBD3-02E5-11D2-B20D-00C04FA368D4}',
    0,
    tmApartment);
end.
