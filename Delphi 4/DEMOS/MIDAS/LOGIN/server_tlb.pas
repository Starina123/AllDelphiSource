unit Server_TLB;

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

// PASTLWTR : $Revision:   1.11.1.40  $
// File generated on 5/29/98 9:59:56 AM from Type Library described below.

// ************************************************************************ //
// Type Lib: D:\Temp\demos\midas\Login\Server.tlb
// IID\LCID: {5E6A5BD2-F709-11D1-AABE-00C04FA35CFA}\0
// Helpfile: 
// HelpString: Server Library
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
  LIBID_Server: TGUID = '{5E6A5BD2-F709-11D1-AABE-00C04FA35CFA}';
  IID_ILoginDemo: TGUID = '{5E6A5BD3-F709-11D1-AABE-00C04FA35CFA}';
  CLASS_LoginDemo: TGUID = '{5E6A5BD5-F709-11D1-AABE-00C04FA35CFA}';

// *********************************************************************//
// Forward declaration of interfaces defined in Type Library            //
// *********************************************************************//
type
  ILoginDemo = interface;
  ILoginDemoDisp = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                     //
// (NOTE: Here we map each CoClass to its Default Interface)            //
// *********************************************************************//
  LoginDemo = ILoginDemo;

// *********************************************************************//
// Interface: ILoginDemo
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {5E6A5BD3-F709-11D1-AABE-00C04FA35CFA}
// *********************************************************************//
  ILoginDemo = interface(IDataBroker)
    ['{5E6A5BD3-F709-11D1-AABE-00C04FA35CFA}']
    function Get_Country: IProvider; safecall;
    procedure Login(const UserName: WideString; const Password: WideString); safecall;
    property Country: IProvider read Get_Country;
  end;

// *********************************************************************//
// DispIntf:  ILoginDemo
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {5E6A5BD3-F709-11D1-AABE-00C04FA35CFA}
// *********************************************************************//
  ILoginDemoDisp = dispinterface
    ['{5E6A5BD3-F709-11D1-AABE-00C04FA35CFA}']
    property Country: IProvider readonly dispid 1;
    procedure Login(const UserName: WideString; const Password: WideString); dispid 2;
  end;

implementation

uses ComObj;

end.
