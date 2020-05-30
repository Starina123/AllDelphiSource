unit Memo_TLB;

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

// PASTLWTR : $Revision:   1.11.1.62  $
// File generated on 6/12/98 11:21:03 AM from Type Library described below.

// ************************************************************************ //
// Type Lib: C:\Delphi4\Demos\Activex\Oleauto\Autoserv\memoedit.tlb
// IID\LCID: {55E49D30-9FFE-11D0-8095-0020AF74DE39}\0
// Helpfile: 
// HelpString: Memo Editor Application
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
  LIBID_Memo: TGUID = '{55E49D30-9FFE-11D0-8095-0020AF74DE39}';
  IID_IMemoApp: TGUID = '{55E49D31-9FFE-11D0-8095-0020AF74DE39}';
  CLASS_MemoApp: TGUID = '{F7FF4880-200D-11CF-BD2F-0020AF0E5B81}';
  IID_IMemoDoc: TGUID = '{55E49D34-9FFE-11D0-8095-0020AF74DE39}';
  CLASS_MemoDoc: TGUID = '{55E49D35-9FFE-11D0-8095-0020AF74DE39}';
type

// *********************************************************************//
// Forward declaration of interfaces defined in Type Library            //
// *********************************************************************//
  IMemoApp = interface;
  IMemoAppDisp = dispinterface;
  IMemoDoc = interface;
  IMemoDocDisp = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                     //
// (NOTE: Here we map each CoClass to its Default Interface)            //
// *********************************************************************//
  MemoApp = IMemoApp;
  MemoDoc = IMemoDoc;


// *********************************************************************//
// Interface: IMemoApp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {55E49D31-9FFE-11D0-8095-0020AF74DE39}
// *********************************************************************//
  IMemoApp = interface(IDispatch)
    ['{55E49D31-9FFE-11D0-8095-0020AF74DE39}']
    function NewMemo: OleVariant; safecall;
    function OpenMemo(const MemoFileName: WideString): OleVariant; safecall;
    procedure TileWindows; safecall;
    procedure CascadeWindows; safecall;
    function Get_MemoCount: Integer; safecall;
    function Get_Memos(MemoIndex: Integer): OleVariant; safecall;
    property MemoCount: Integer read Get_MemoCount;
    property Memos[MemoIndex: Integer]: OleVariant read Get_Memos;
  end;

// *********************************************************************//
// DispIntf:  IMemoAppDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {55E49D31-9FFE-11D0-8095-0020AF74DE39}
// *********************************************************************//
  IMemoAppDisp = dispinterface
    ['{55E49D31-9FFE-11D0-8095-0020AF74DE39}']
    function NewMemo: OleVariant; dispid 1;
    function OpenMemo(const MemoFileName: WideString): OleVariant; dispid 2;
    procedure TileWindows; dispid 3;
    procedure CascadeWindows; dispid 4;
    property MemoCount: Integer readonly dispid 5;
    property Memos[MemoIndex: Integer]: OleVariant readonly dispid 6;
  end;

// *********************************************************************//
// Interface: IMemoDoc
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {55E49D34-9FFE-11D0-8095-0020AF74DE39}
// *********************************************************************//
  IMemoDoc = interface(IDispatch)
    ['{55E49D34-9FFE-11D0-8095-0020AF74DE39}']
    procedure Clear; safecall;
    procedure Insert(const Text: WideString); safecall;
    procedure Save; safecall;
    procedure Close; safecall;
    function Get_FileName: WideString; safecall;
    procedure Set_FileName(const Value: WideString); safecall;
    function Get_Modified: WordBool; safecall;
    property FileName: WideString read Get_FileName write Set_FileName;
    property Modified: WordBool read Get_Modified;
  end;

// *********************************************************************//
// DispIntf:  IMemoDocDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {55E49D34-9FFE-11D0-8095-0020AF74DE39}
// *********************************************************************//
  IMemoDocDisp = dispinterface
    ['{55E49D34-9FFE-11D0-8095-0020AF74DE39}']
    procedure Clear; dispid 1;
    procedure Insert(const Text: WideString); dispid 2;
    procedure Save; dispid 3;
    procedure Close; dispid 4;
    property FileName: WideString dispid 5;
    property Modified: WordBool readonly dispid 6;
  end;

  CoMemoApp = class
    class function Create: IMemoApp;
    class function CreateRemote(const MachineName: string): IMemoApp;
  end;

  CoMemoDoc = class
    class function Create: IMemoDoc;
    class function CreateRemote(const MachineName: string): IMemoDoc;
  end;

implementation

uses ComObj;

class function CoMemoApp.Create: IMemoApp;
begin
  Result := CreateComObject(CLASS_MemoApp) as IMemoApp;
end;

class function CoMemoApp.CreateRemote(const MachineName: string): IMemoApp;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_MemoApp) as IMemoApp;
end;

class function CoMemoDoc.Create: IMemoDoc;
begin
  Result := CreateComObject(CLASS_MemoDoc) as IMemoDoc;
end;

class function CoMemoDoc.CreateRemote(const MachineName: string): IMemoDoc;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_MemoDoc) as IMemoDoc;
end;

end.
