unit Serv_TLB;

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

// PASTLWTR : $Revision:   1.11.1.43  $
// File generated on 6/1/98 8:56:18 AM from Type Library described below.

// ************************************************************************ //
// Type Lib: D:\Temp\demos\midas\MSTRDTL\Server.tlb
// IID\LCID: {F409BC30-963E-11D0-880E-00A0248E5091}\0
// Helpfile: 
// HelpString: 
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
  LIBID_Serv: TGUID = '{F409BC30-963E-11D0-880E-00A0248E5091}';
  IID_IProjectData: TGUID = '{CEF55D0F-F964-11D1-AAC0-00C04FA35CFA}';
  CLASS_ProjectData: TGUID = '{F409BC32-963E-11D0-880E-00A0248E5091}';

// *********************************************************************//
// Forward declaration of interfaces defined in Type Library            //
// *********************************************************************//
type
  IProjectData = interface;
  IProjectDataDisp = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                     //
// (NOTE: Here we map each CoClass to its Default Interface)            //
// *********************************************************************//
  ProjectData = IProjectData;

// *********************************************************************//
// Interface: IProjectData
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {CEF55D0F-F964-11D1-AAC0-00C04FA35CFA}
// *********************************************************************//
  IProjectData = interface(IDispatch)
    ['{CEF55D0F-F964-11D1-AAC0-00C04FA35CFA}']
    function Get_ProjectProvider: IProvider; safecall;
    function Get_Employee: IProvider; safecall;
    property ProjectProvider: IProvider read Get_ProjectProvider;
    property Employee: IProvider read Get_Employee;
  end;

// *********************************************************************//
// DispIntf:  IProjectData
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {CEF55D0F-F964-11D1-AAC0-00C04FA35CFA}
// *********************************************************************//
  IProjectDataDisp = dispinterface
    ['{CEF55D0F-F964-11D1-AAC0-00C04FA35CFA}']
    property ProjectProvider: IProvider readonly dispid 1;
    property Employee: IProvider readonly dispid 2;
  end;

  CoProjectData = class
    class function Create: IProjectData;
    class function CreateRemote(const MachineName: string): IProjectData;
  end;

implementation

uses ComObj;

class function CoProjectData.Create: IProjectData;
begin
  Result := CreateComObject(CLASS_ProjectData) as IProjectData;
end;

class function CoProjectData.CreateRemote(const MachineName: string): IProjectData;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_ProjectData) as IProjectData;
end;

end.
