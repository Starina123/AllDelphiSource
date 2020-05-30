unit empe_tlb;

// ************************************************************************ //
// WARNING                                                                  //
// -------                                                                  //
// The types declared in this file were generated from data read from a     //
// Type Library. If this type library is explicitly or indirectly (via      //
// another type library referring to this type library) re-imported, or the //
// 'Refresh' command of the Type Library Editor activated while editing the //
// Type Library, the contents of this file will be regenerated and all      //
// manual modifications will be lost.                                       //
// ************************************************************************ //

// PASTLWTR : $Revision:   1.1  $
// File generated on 6/12/98 8:31:55 AM from Type Library described below.

// ************************************************************************ //
// Type Lib: G:\DEMOS\MIDAS\ACTIVEFM\Empeditx.tlb
// IID\LCID: {21F7A315-FDF0-11D0-9FFC-00A0248E4B9A}\0
// Helpfile: 
// HelpString: EmpE Library
// Version:    1.0
// ************************************************************************ //

interface

uses Windows, ActiveX, Classes, Graphics, OleCtrls, StdVCL;

// *********************************************************************//
// GUIDS declared in the TypeLibrary. Following prefixes are used:      //
//   Type Libraries     : LIBID_xxxx                                    //
//   CoClasses          : CLASS_xxxx                                    //
//   DISPInterfaces     : DIID_xxxx                                     //
//   Non-DISP interfaces: IID_xxxx                                      //
// *********************************************************************//
const
  LIBID_EmpE: TGUID = '{21F7A315-FDF0-11D0-9FFC-00A0248E4B9A}';
  IID_IEmpEditForm: TGUID = '{21F7A316-FDF0-11D0-9FFC-00A0248E4B9A}';
  DIID_IEmpEditFormEvents: TGUID = '{21F7A317-FDF0-11D0-9FFC-00A0248E4B9A}';
  CLASS_EmpEditForm: TGUID = '{21F7A318-FDF0-11D0-9FFC-00A0248E4B9A}';

// *********************************************************************//
// Declaration of Enumerations defined in Type Library                  //
// *********************************************************************//
// TxActiveFormBorderStyle constants
type
  TxActiveFormBorderStyle = TOleEnum;
const
  afbNone = $00000000;
  afbSingle = $00000001;
  afbSunken = $00000002;
  afbRaised = $00000003;

// TxPrintScale constants
type
  TxPrintScale = TOleEnum;
const
  poNone = $00000000;
  poProportional = $00000001;
  poPrintToFit = $00000002;

// TxMouseButton constants
type
  TxMouseButton = TOleEnum;
const
  mbLeft = $00000000;
  mbRight = $00000001;
  mbMiddle = $00000002;

// TxWindowState constants
type
  TxWindowState = TOleEnum;
const
  wsNormal = $00000000;
  wsMinimized = $00000001;
  wsMaximized = $00000002;

type

// *********************************************************************//
// Forward declaration of interfaces defined in Type Library            //
// *********************************************************************//
  IEmpEditForm = interface;
  IEmpEditFormDisp = dispinterface;
  IEmpEditFormEvents = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                     //
// (NOTE: Here we map each CoClass to its Default Interface)            //
// *********************************************************************//
  EmpEditForm = IEmpEditForm;


// *********************************************************************//
// Interface: IEmpEditForm
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {21F7A316-FDF0-11D0-9FFC-00A0248E4B9A}
// *********************************************************************//
  IEmpEditForm = interface(IDispatch)
    ['{21F7A316-FDF0-11D0-9FFC-00A0248E4B9A}']
    function Get_AutoScroll: WordBool; safecall;
    procedure Set_AutoScroll(AutoScroll: WordBool); safecall;
    function Get_AxBorderStyle: TxActiveFormBorderStyle; safecall;
    procedure Set_AxBorderStyle(AxBorderStyle: TxActiveFormBorderStyle); safecall;
    function Get_Caption: WideString; safecall;
    procedure Set_Caption(const Caption: WideString); safecall;
    function Get_Color: OLE_COLOR; safecall;
    procedure Set_Color(Color: OLE_COLOR); safecall;
    function Get_Font: IFontDisp; safecall;
    procedure Set_Font(const Font: IFontDisp); safecall;
    function Get_KeyPreview: WordBool; safecall;
    procedure Set_KeyPreview(KeyPreview: WordBool); safecall;
    function Get_PixelsPerInch: Integer; safecall;
    procedure Set_PixelsPerInch(PixelsPerInch: Integer); safecall;
    function Get_PrintScale: TxPrintScale; safecall;
    procedure Set_PrintScale(PrintScale: TxPrintScale); safecall;
    function Get_Scaled: WordBool; safecall;
    procedure Set_Scaled(Scaled: WordBool); safecall;
    function Get_Active: WordBool; safecall;
    function Get_DropTarget: WordBool; safecall;
    procedure Set_DropTarget(DropTarget: WordBool); safecall;
    function Get_HelpFile: WideString; safecall;
    procedure Set_HelpFile(const HelpFile: WideString); safecall;
    function Get_WindowState: TxWindowState; safecall;
    procedure Set_WindowState(WindowState: TxWindowState); safecall;
    function Get_Visible: WordBool; safecall;
    procedure Set_Visible(Visible: WordBool); safecall;
    function Get_Enabled: WordBool; safecall;
    procedure Set_Enabled(Enabled: WordBool); safecall;
    function Get_Cursor: Smallint; safecall;
    procedure Set_Cursor(Cursor: Smallint); safecall;
    property AutoScroll: WordBool read Get_AutoScroll write Set_AutoScroll;
    property AxBorderStyle: TxActiveFormBorderStyle read Get_AxBorderStyle write Set_AxBorderStyle;
    property Caption: WideString read Get_Caption write Set_Caption;
    property Color: OLE_COLOR read Get_Color write Set_Color;
    property Font: IFontDisp read Get_Font write Set_Font;
    property KeyPreview: WordBool read Get_KeyPreview write Set_KeyPreview;
    property PixelsPerInch: Integer read Get_PixelsPerInch write Set_PixelsPerInch;
    property PrintScale: TxPrintScale read Get_PrintScale write Set_PrintScale;
    property Scaled: WordBool read Get_Scaled write Set_Scaled;
    property Active: WordBool read Get_Active;
    property DropTarget: WordBool read Get_DropTarget write Set_DropTarget;
    property HelpFile: WideString read Get_HelpFile write Set_HelpFile;
    property WindowState: TxWindowState read Get_WindowState write Set_WindowState;
    property Visible: WordBool read Get_Visible write Set_Visible;
    property Enabled: WordBool read Get_Enabled write Set_Enabled;
    property Cursor: Smallint read Get_Cursor write Set_Cursor;
  end;

// *********************************************************************//
// DispIntf:  IEmpEditFormDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {21F7A316-FDF0-11D0-9FFC-00A0248E4B9A}
// *********************************************************************//
  IEmpEditFormDisp = dispinterface
    ['{21F7A316-FDF0-11D0-9FFC-00A0248E4B9A}']
    property AutoScroll: WordBool dispid 1;
    property AxBorderStyle: TxActiveFormBorderStyle dispid 2;
    property Caption: WideString dispid 3;
    property Color: OLE_COLOR dispid 4;
    property Font: IFontDisp dispid 5;
    property KeyPreview: WordBool dispid 6;
    property PixelsPerInch: Integer dispid 7;
    property PrintScale: TxPrintScale dispid 8;
    property Scaled: WordBool dispid 9;
    property Active: WordBool readonly dispid 10;
    property DropTarget: WordBool dispid 11;
    property HelpFile: WideString dispid 12;
    property WindowState: TxWindowState dispid 13;
    property Visible: WordBool dispid 14;
    property Enabled: WordBool dispid 15;
    property Cursor: Smallint dispid 16;
  end;

// *********************************************************************//
// DispIntf:  IEmpEditFormEvents
// Flags:     (4096) Dispatchable
// GUID:      {21F7A317-FDF0-11D0-9FFC-00A0248E4B9A}
// *********************************************************************//
  IEmpEditFormEvents = dispinterface
    ['{21F7A317-FDF0-11D0-9FFC-00A0248E4B9A}']
    procedure OnActivate; dispid 1;
    procedure OnClick; dispid 2;
    procedure OnCreate; dispid 3;
    procedure OnDblClick; dispid 4;
    procedure OnDestroy; dispid 5;
    procedure OnDeactivate; dispid 6;
    procedure OnKeyPress(var Key: Smallint); dispid 7;
    procedure OnPaint; dispid 8;
  end;


// *********************************************************************//
// OLE Control Proxy class declaration
// Control Name     : TEmpEditForm
// Help String      : EmpEditFormControl
// Default Interface: IEmpEditForm
// Def. Intf. DISP? : No
// Event   Interface: IEmpEditFormEvents
// TypeFlags        : (34) CanCreate Control
// *********************************************************************//
  TEmpEditFormOnKeyPress = procedure(Sender: TObject; var Key: Smallint) of object;

  TEmpEditForm = class(TOleControl)
  private
    FOnActivate: TNotifyEvent;
    FOnClick: TNotifyEvent;
    FOnCreate: TNotifyEvent;
    FOnDblClick: TNotifyEvent;
    FOnDestroy: TNotifyEvent;
    FOnDeactivate: TNotifyEvent;
    FOnKeyPress: TEmpEditFormOnKeyPress;
    FOnPaint: TNotifyEvent;
    FIntf: IEmpEditForm;
    function  GetControlInterface: IEmpEditForm;
  protected
    procedure CreateControl;
    procedure InitControlData; override;
  public
    property  ControlInterface: IEmpEditForm read GetControlInterface;
    property Active: WordBool index 10 read GetWordBoolProp;
  published
    property AutoScroll: WordBool index 1 read GetWordBoolProp write SetWordBoolProp stored False;
    property AxBorderStyle: TOleEnum index 2 read GetTOleEnumProp write SetTOleEnumProp stored False;
    property Caption: WideString index 3 read GetWideStringProp write SetWideStringProp stored False;
    property Color: TColor index 4 read GetTColorProp write SetTColorProp stored False;
    property Font: TFont index 5 read GetTFontProp write SetTFontProp stored False;
    property KeyPreview: WordBool index 6 read GetWordBoolProp write SetWordBoolProp stored False;
    property PixelsPerInch: Integer index 7 read GetIntegerProp write SetIntegerProp stored False;
    property PrintScale: TOleEnum index 8 read GetTOleEnumProp write SetTOleEnumProp stored False;
    property Scaled: WordBool index 9 read GetWordBoolProp write SetWordBoolProp stored False;
    property DropTarget: WordBool index 11 read GetWordBoolProp write SetWordBoolProp stored False;
    property HelpFile: WideString index 12 read GetWideStringProp write SetWideStringProp stored False;
    property WindowState: TOleEnum index 13 read GetTOleEnumProp write SetTOleEnumProp stored False;
    property Visible: WordBool index 14 read GetWordBoolProp write SetWordBoolProp stored False;
    property Enabled: WordBool index 15 read GetWordBoolProp write SetWordBoolProp stored False;
    property Cursor: Smallint index 16 read GetSmallintProp write SetSmallintProp stored False;
    property OnActivate: TNotifyEvent read FOnActivate write FOnActivate;
    property OnClick: TNotifyEvent read FOnClick write FOnClick;
    property OnCreate: TNotifyEvent read FOnCreate write FOnCreate;
    property OnDblClick: TNotifyEvent read FOnDblClick write FOnDblClick;
    property OnDestroy: TNotifyEvent read FOnDestroy write FOnDestroy;
    property OnDeactivate: TNotifyEvent read FOnDeactivate write FOnDeactivate;
    property OnKeyPress: TEmpEditFormOnKeyPress read FOnKeyPress write FOnKeyPress;
    property OnPaint: TNotifyEvent read FOnPaint write FOnPaint;
  end;

procedure Register;

implementation

uses ComObj;

procedure TEmpEditForm.InitControlData;
const
  CEventDispIDs: array [0..7] of DWORD = (
    $00000001, $00000002, $00000003, $00000004, $00000005, $00000006,
    $00000007, $00000008);
  CTFontIDs: array [0..0] of DWORD = (
    $00000005);
  CControlData: TControlData = (
    ClassID: '{21F7A318-FDF0-11D0-9FFC-00A0248E4B9A}';
    EventIID: '{21F7A317-FDF0-11D0-9FFC-00A0248E4B9A}';
    EventCount: 8;
    EventDispIDs: @CEventDispIDs;
    LicenseKey: nil;
    Flags: $00000000;
    Version: 300;
    FontCount: 1;
    FontIDs: @CTFontIDs);
begin
  ControlData := @CControlData;
end;

procedure TEmpEditForm.CreateControl;

  procedure DoCreate;
  begin
    FIntf := IUnknown(OleObject) as IEmpEditForm;
  end;

begin
  if FIntf = nil then DoCreate;
end;

function TEmpEditForm.GetControlInterface: IEmpEditForm;
begin
  CreateControl;
  Result := FIntf;
end;

procedure Register;
begin
  RegisterComponents('ActiveX',[TEmpEditForm]);
end;

end.
