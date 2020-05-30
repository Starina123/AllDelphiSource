unit ShareServer_TLB;

// ************************************************************************ //
// WARNING                                                                    
// -------                                                                    
// The types declared in this file were generated from data read from a       
// Type Library. If this type library is explicitly or indirectly (via        
// another type library referring to this type library) re-imported, or the   
// 'Refresh' command of the Type Library Editor activated while editing the   
// Type Library, the contents of this file will be regenerated and all        
// manual modifications will be lost.                                         
// ************************************************************************ //

// PASTLWTR : $Revision:   1.0  $
// File generated on 5/10/2001 10:14:09 PM from Type Library described below.

// ************************************************************************  //
// Type Lib: D:\dev\midas4\ShrdConn\ShareServer.tlb (1)
// LIBID: {43E4A517-95EA-11D3-8DEA-006097319291}
// LCID: 0
// Helpfile: 
// DepndLst: 
//   (1) v1.0 Midas, (C:\WINNT\System32\midas.dll)
//   (2) v2.0 stdole, (C:\WINNT\System32\stdole2.tlb)
//   (3) v4.0 StdVCL, (C:\WINNT\System32\STDVCL40.DLL)
// ************************************************************************ //
{$TYPEDADDRESS OFF} // Unit must be compiled without type-checked pointers. 
{$WARN SYMBOL_PLATFORM OFF}
{$WRITEABLECONST ON}

interface

uses ActiveX, Classes, Graphics, Midas, StdVCL, Variants, Windows;
  


// *********************************************************************//
// GUIDS declared in the TypeLibrary. Following prefixes are used:        
//   Type Libraries     : LIBID_xxxx                                      
//   CoClasses          : CLASS_xxxx                                      
//   DISPInterfaces     : DIID_xxxx                                       
//   Non-DISP interfaces: IID_xxxx                                        
// *********************************************************************//
const
  // TypeLibrary Major and minor versions
  ShareServerMajorVersion = 1;
  ShareServerMinorVersion = 0;

  LIBID_ShareServer: TGUID = '{43E4A517-95EA-11D3-8DEA-006097319291}';

  IID_IMainRDM: TGUID = '{43E4A518-95EA-11D3-8DEA-006097319291}';
  CLASS_MainRDM: TGUID = '{43E4A51A-95EA-11D3-8DEA-006097319291}';
  IID_IBaseRDM: TGUID = '{3411F7E2-9632-11D3-8DEA-006097319291}';
  IID_IChildRDM: TGUID = '{43E4A51C-95EA-11D3-8DEA-006097319291}';
  CLASS_ChildRDM: TGUID = '{43E4A51E-95EA-11D3-8DEA-006097319291}';
type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  IMainRDM = interface;
  IMainRDMDisp = dispinterface;
  IBaseRDM = interface;
  IBaseRDMDisp = dispinterface;
  IChildRDM = interface;
  IChildRDMDisp = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  MainRDM = IMainRDM;
  ChildRDM = IChildRDM;


// *********************************************************************//
// Interface: IMainRDM
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {43E4A518-95EA-11D3-8DEA-006097319291}
// *********************************************************************//
  IMainRDM = interface(IAppServer)
    ['{43E4A518-95EA-11D3-8DEA-006097319291}']
    function  Get_ChildDM: IChildRDM; safecall;
    function  MainMethod: WideString; safecall;
    function  Get_Session: Integer; safecall;
    property ChildDM: IChildRDM read Get_ChildDM;
    property Session: Integer read Get_Session;
  end;

// *********************************************************************//
// DispIntf:  IMainRDMDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {43E4A518-95EA-11D3-8DEA-006097319291}
// *********************************************************************//
  IMainRDMDisp = dispinterface
    ['{43E4A518-95EA-11D3-8DEA-006097319291}']
    property ChildDM: IChildRDM dispid 2;
    function  MainMethod: WideString; dispid 3;
    property Session: Integer dispid 1;
    function  AS_ApplyUpdates(const ProviderName: WideString; Delta: OleVariant; 
                              MaxErrors: Integer; out ErrorCount: Integer; var OwnerData: OleVariant): OleVariant; dispid 20000000;
    function  AS_GetRecords(const ProviderName: WideString; Count: Integer; out RecsOut: Integer; 
                            Options: Integer; const CommandText: WideString; 
                            var Params: OleVariant; var OwnerData: OleVariant): OleVariant; dispid 20000001;
    function  AS_DataRequest(const ProviderName: WideString; Data: OleVariant): OleVariant; dispid 20000002;
    function  AS_GetProviderNames: OleVariant; dispid 20000003;
    function  AS_GetParams(const ProviderName: WideString; var OwnerData: OleVariant): OleVariant; dispid 20000004;
    function  AS_RowRequest(const ProviderName: WideString; Row: OleVariant; RequestType: Integer; 
                            var OwnerData: OleVariant): OleVariant; dispid 20000005;
    procedure AS_Execute(const ProviderName: WideString; const CommandText: WideString; 
                         var Params: OleVariant; var OwnerData: OleVariant); dispid 20000006;
  end;

// *********************************************************************//
// Interface: IBaseRDM
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {3411F7E2-9632-11D3-8DEA-006097319291}
// *********************************************************************//
  IBaseRDM = interface(IAppServer)
    ['{3411F7E2-9632-11D3-8DEA-006097319291}']
    function  Get_SessionName: WideString; safecall;
    procedure Set_SessionName(const Value: WideString); safecall;
    function  Get_MainDM: IMainRDM; safecall;
    procedure Set_MainDM(const Value: IMainRDM); safecall;
    property SessionName: WideString read Get_SessionName write Set_SessionName;
    property MainDM: IMainRDM read Get_MainDM write Set_MainDM;
  end;

// *********************************************************************//
// DispIntf:  IBaseRDMDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {3411F7E2-9632-11D3-8DEA-006097319291}
// *********************************************************************//
  IBaseRDMDisp = dispinterface
    ['{3411F7E2-9632-11D3-8DEA-006097319291}']
    property SessionName: WideString dispid 4;
    property MainDM: IMainRDM dispid 5;
    function  AS_ApplyUpdates(const ProviderName: WideString; Delta: OleVariant; 
                              MaxErrors: Integer; out ErrorCount: Integer; var OwnerData: OleVariant): OleVariant; dispid 20000000;
    function  AS_GetRecords(const ProviderName: WideString; Count: Integer; out RecsOut: Integer; 
                            Options: Integer; const CommandText: WideString; 
                            var Params: OleVariant; var OwnerData: OleVariant): OleVariant; dispid 20000001;
    function  AS_DataRequest(const ProviderName: WideString; Data: OleVariant): OleVariant; dispid 20000002;
    function  AS_GetProviderNames: OleVariant; dispid 20000003;
    function  AS_GetParams(const ProviderName: WideString; var OwnerData: OleVariant): OleVariant; dispid 20000004;
    function  AS_RowRequest(const ProviderName: WideString; Row: OleVariant; RequestType: Integer; 
                            var OwnerData: OleVariant): OleVariant; dispid 20000005;
    procedure AS_Execute(const ProviderName: WideString; const CommandText: WideString; 
                         var Params: OleVariant; var OwnerData: OleVariant); dispid 20000006;
  end;

// *********************************************************************//
// Interface: IChildRDM
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {43E4A51C-95EA-11D3-8DEA-006097319291}
// *********************************************************************//
  IChildRDM = interface(IBaseRDM)
    ['{43E4A51C-95EA-11D3-8DEA-006097319291}']
  end;

// *********************************************************************//
// DispIntf:  IChildRDMDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {43E4A51C-95EA-11D3-8DEA-006097319291}
// *********************************************************************//
  IChildRDMDisp = dispinterface
    ['{43E4A51C-95EA-11D3-8DEA-006097319291}']
    property SessionName: WideString dispid 4;
    property MainDM: IMainRDM dispid 5;
    function  AS_ApplyUpdates(const ProviderName: WideString; Delta: OleVariant; 
                              MaxErrors: Integer; out ErrorCount: Integer; var OwnerData: OleVariant): OleVariant; dispid 20000000;
    function  AS_GetRecords(const ProviderName: WideString; Count: Integer; out RecsOut: Integer; 
                            Options: Integer; const CommandText: WideString; 
                            var Params: OleVariant; var OwnerData: OleVariant): OleVariant; dispid 20000001;
    function  AS_DataRequest(const ProviderName: WideString; Data: OleVariant): OleVariant; dispid 20000002;
    function  AS_GetProviderNames: OleVariant; dispid 20000003;
    function  AS_GetParams(const ProviderName: WideString; var OwnerData: OleVariant): OleVariant; dispid 20000004;
    function  AS_RowRequest(const ProviderName: WideString; Row: OleVariant; RequestType: Integer; 
                            var OwnerData: OleVariant): OleVariant; dispid 20000005;
    procedure AS_Execute(const ProviderName: WideString; const CommandText: WideString; 
                         var Params: OleVariant; var OwnerData: OleVariant); dispid 20000006;
  end;

// *********************************************************************//
// The Class CoMainRDM provides a Create and CreateRemote method to          
// create instances of the default interface IMainRDM exposed by              
// the CoClass MainRDM. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoMainRDM = class
    class function Create: IMainRDM;
    class function CreateRemote(const MachineName: string): IMainRDM;
  end;

// *********************************************************************//
// The Class CoChildRDM provides a Create and CreateRemote method to          
// create instances of the default interface IChildRDM exposed by              
// the CoClass ChildRDM. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoChildRDM = class
    class function Create: IChildRDM;
    class function CreateRemote(const MachineName: string): IChildRDM;
  end;

implementation

uses ComObj;

class function CoMainRDM.Create: IMainRDM;
begin
  Result := CreateComObject(CLASS_MainRDM) as IMainRDM;
end;

class function CoMainRDM.CreateRemote(const MachineName: string): IMainRDM;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_MainRDM) as IMainRDM;
end;

class function CoChildRDM.Create: IChildRDM;
begin
  Result := CreateComObject(CLASS_ChildRDM) as IChildRDM;
end;

class function CoChildRDM.CreateRemote(const MachineName: string): IChildRDM;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_ChildRDM) as IChildRDM;
end;

end.
