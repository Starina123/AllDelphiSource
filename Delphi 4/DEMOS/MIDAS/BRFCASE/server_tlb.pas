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
// File generated on 5/29/98 1:46:56 PM from Type Library described below.

// ************************************************************************ //
// Type Lib: D:\Temp\demos\midas\BrfCase\Server.tlb
// IID\LCID: {A1695C19-F724-11D1-AABE-00C04FA35CFA}\0
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
  LIBID_Server: TGUID = '{A1695C19-F724-11D1-AABE-00C04FA35CFA}';
  IID_IBriefCaseDemo: TGUID = '{A1695C1A-F724-11D1-AABE-00C04FA35CFA}';
  CLASS_BriefCaseDemo: TGUID = '{A1695C1C-F724-11D1-AABE-00C04FA35CFA}';

// *********************************************************************//
// Forward declaration of interfaces defined in Type Library            //
// *********************************************************************//
type
  IBriefCaseDemo = interface;
  IBriefCaseDemoDisp = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                     //
// (NOTE: Here we map each CoClass to its Default Interface)            //
// *********************************************************************//
  BriefCaseDemo = IBriefCaseDemo;

// *********************************************************************//
// Interface: IBriefCaseDemo
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {A1695C1A-F724-11D1-AABE-00C04FA35CFA}
// *********************************************************************//
  IBriefCaseDemo = interface(IDataBroker)
    ['{A1695C1A-F724-11D1-AABE-00C04FA35CFA}']
    function Get_Query1: IProvider; safecall;
    property Query1: IProvider read Get_Query1;
  end;

// *********************************************************************//
// DispIntf:  IBriefCaseDemo
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {A1695C1A-F724-11D1-AABE-00C04FA35CFA}
// *********************************************************************//
  IBriefCaseDemoDisp = dispinterface
    ['{A1695C1A-F724-11D1-AABE-00C04FA35CFA}']
    property Query1: IProvider readonly dispid 1;
  end;

  CoBriefCaseDemo = class
    class function Create: IBriefCaseDemo;
    class function CreateRemote(const MachineName: string): IBriefCaseDemo;
  end;

implementation

uses ComObj;

class function CoBriefCaseDemo.Create: IBriefCaseDemo;
begin
  Result := CreateComObject(CLASS_BriefCaseDemo) as IBriefCaseDemo;
end;

class function CoBriefCaseDemo.CreateRemote(const MachineName: string): IBriefCaseDemo;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_BriefCaseDemo) as IBriefCaseDemo;
end;

end.
