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

// PASTLWTR : $Revision:   1.11.1.62  $
// File generated on 6/12/98 8:30:33 AM from Type Library described below.

// ************************************************************************ //
// Type Lib: G:\DEMOS\MIDAS\POOLER\Server.tlb
// IID\LCID: {0CE99800-9F28-11D1-8944-00A0248E5091}\0
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
  LIBID_Server: TGUID = '{0CE99800-9F28-11D1-8944-00A0248E5091}';
  IID_IPooledRDM: TGUID = '{0CE99801-9F28-11D1-8944-00A0248E5091}';
  CLASS_PooledRDM: TGUID = '{0CE99802-9F28-11D1-8944-00A0248E5091}';
  CLASS_Pooler: TGUID = '{0CE99804-9F28-11D1-8944-00A0248E5091}';
type

// *********************************************************************//
// Forward declaration of interfaces defined in Type Library            //
// *********************************************************************//
  IPooledRDM = interface;
  IPooledRDMDisp = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                     //
// (NOTE: Here we map each CoClass to its Default Interface)            //
// *********************************************************************//
  PooledRDM = IPooledRDM;
  Pooler = IPooledRDM;


// *********************************************************************//
// Interface: IPooledRDM
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {0CE99801-9F28-11D1-8944-00A0248E5091}
// *********************************************************************//
  IPooledRDM = interface(IDataBroker)
    ['{0CE99801-9F28-11D1-8944-00A0248E5091}']
    procedure Select(const SQLStr: WideString; out Data: OleVariant); safecall;
  end;

// *********************************************************************//
// DispIntf:  IPooledRDMDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {0CE99801-9F28-11D1-8944-00A0248E5091}
// *********************************************************************//
  IPooledRDMDisp = dispinterface
    ['{0CE99801-9F28-11D1-8944-00A0248E5091}']
    procedure Select(const SQLStr: WideString; out Data: OleVariant); dispid 1;
    function GetProviderNames: OleVariant; dispid 22929905;
  end;

  CoPooledRDM = class
    class function Create: IPooledRDM;
    class function CreateRemote(const MachineName: string): IPooledRDM;
  end;

  CoPooler = class
    class function Create: IPooledRDM;
    class function CreateRemote(const MachineName: string): IPooledRDM;
  end;

implementation

uses ComObj;

class function CoPooledRDM.Create: IPooledRDM;
begin
  Result := CreateComObject(CLASS_PooledRDM) as IPooledRDM;
end;

class function CoPooledRDM.CreateRemote(const MachineName: string): IPooledRDM;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_PooledRDM) as IPooledRDM;
end;

class function CoPooler.Create: IPooledRDM;
begin
  Result := CreateComObject(CLASS_Pooler) as IPooledRDM;
end;

class function CoPooler.CreateRemote(const MachineName: string): IPooledRDM;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_Pooler) as IPooledRDM;
end;

end.
