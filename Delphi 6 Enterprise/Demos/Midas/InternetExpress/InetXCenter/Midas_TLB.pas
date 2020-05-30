unit Midas_TLB;

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
// File generated on 7/26/99 9:22:02 AM from Type Library described below.

// *************************************************************************//
// NOTE:                                                                      
// Items guarded by $IFDEF_LIVE_SERVER_AT_DESIGN_TIME are used by properties  
// which return objects that may need to be explicitly created via a function 
// call prior to any access via the property. These items have been disabled  
// in order to prevent accidental use from within the object inspector. You   
// may enable them by defining LIVE_SERVER_AT_DESIGN_TIME or by selectively   
// removing them from the $IFDEF blocks. However, such items must still be    
// programmatically created via a method of the appropriate CoClass before    
// they can be used.                                                          
// ************************************************************************ //
// Type Lib: E:\tp\bin\midas.dll (1)
// IID\LCID: {83F57D68-CA9A-11D2-9088-00C04FA35CFA}\0
// Helpfile: 
// DepndLst: 
//   (1) v2.0 stdole, (C:\WINNT\System32\STDOLE2.TLB)
// Parent TypeLibrary:
//   (0) v1.0 rdmINetXCenter, (E:\InetXCenter\rdmInetXCenter.tlb)
// ************************************************************************ //
{$TYPEDADDRESS OFF} // Unit must be compiled without type-checked pointers. 
interface

uses Windows, ActiveX, Classes, Graphics, OleServer, OleCtrls, StdVCL;

// *********************************************************************//
// GUIDS declared in the TypeLibrary. Following prefixes are used:        
//   Type Libraries     : LIBID_xxxx                                      
//   CoClasses          : CLASS_xxxx                                      
//   DISPInterfaces     : DIID_xxxx                                       
//   Non-DISP interfaces: IID_xxxx                                        
// *********************************************************************//
const
  // TypeLibrary Major and minor versions
  MidasMajorVersion = 1;
  MidasMinorVersion = 0;

  LIBID_Midas: TGUID = '{83F57D68-CA9A-11D2-9088-00C04FA35CFA}';

  IID_IAppServer: TGUID = '{1AEFCC20-7A24-11D2-98B0-C69BEB4B5B6D}';
type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  IAppServer = interface;
  IAppServerDisp = dispinterface;

// *********************************************************************//
// Interface: IAppServer
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {1AEFCC20-7A24-11D2-98B0-C69BEB4B5B6D}
// *********************************************************************//
  IAppServer = interface(IDispatch)
    ['{1AEFCC20-7A24-11D2-98B0-C69BEB4B5B6D}']
    function  AS_ApplyUpdates {Flags(1), (6/5) CC:0, INV:1, DBG:6}(const ProviderName: {VT_8:0}WideString; 
                                                                   Delta: {VT_12:0}OleVariant; 
                                                                   MaxErrors: {VT_3:0}Integer; 
                                                                   out ErrorCount: {VT_3:1}Integer; 
                                                                   var OwnerData: {VT_12:1}OleVariant): OleVariant; safecall;
    function  AS_GetRecords {Flags(1), (8/7) CC:0, INV:1, DBG:6}(const ProviderName: {VT_8:0}WideString; 
                                                                 Count: {VT_3:0}Integer; 
                                                                 out RecsOut: {VT_3:1}Integer; 
                                                                 Options: {VT_3:0}Integer; 
                                                                 const CommandText: {VT_8:0}WideString; 
                                                                 var Params: {VT_12:1}OleVariant; 
                                                                 var OwnerData: {VT_12:1}OleVariant): OleVariant; safecall;
    function  AS_DataRequest {Flags(1), (3/2) CC:0, INV:1, DBG:6}(const ProviderName: {VT_8:0}WideString; 
                                                                  Data: {VT_12:0}OleVariant): OleVariant; safecall;
    function  AS_GetProviderNames {Flags(1), (1/0) CC:0, INV:1, DBG:6}: OleVariant; safecall;
    function  AS_GetParams {Flags(1), (3/2) CC:0, INV:1, DBG:6}(const ProviderName: {VT_8:0}WideString; 
                                                                var OwnerData: {VT_12:1}OleVariant): OleVariant; safecall;
    function  AS_RowRequest {Flags(1), (5/4) CC:0, INV:1, DBG:6}(const ProviderName: {VT_8:0}WideString; 
                                                                 Row: {VT_12:0}OleVariant; 
                                                                 RequestType: {VT_3:0}Integer; 
                                                                 var OwnerData: {VT_12:1}OleVariant): OleVariant; safecall;
    procedure AS_Execute {Flags(1), (4/4) CC:0, INV:1, DBG:6}(const ProviderName: {VT_8:0}WideString; 
                                                              const CommandText: {VT_8:0}WideString; 
                                                              var Params: {VT_12:1}OleVariant; 
                                                              var OwnerData: {VT_12:1}OleVariant); safecall;
  end;

// *********************************************************************//
// DispIntf:  IAppServerDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {1AEFCC20-7A24-11D2-98B0-C69BEB4B5B6D}
// *********************************************************************//
  IAppServerDisp = dispinterface
    ['{1AEFCC20-7A24-11D2-98B0-C69BEB4B5B6D}']
    function  AS_ApplyUpdates {Flags(2), (6/5) CC:0, INV:1, DBG:4}(const ProviderName: {VT_8:0}WideString; 
                                                                   Delta: {VT_12:0}OleVariant; 
                                                                   MaxErrors: {VT_3:0}Integer; 
                                                                   out ErrorCount: {VT_3:1}Integer; 
                                                                   var OwnerData: {VT_12:1}OleVariant): OleVariant; dispid 20000000;
    function  AS_GetRecords {Flags(2), (8/7) CC:0, INV:1, DBG:4}(const ProviderName: {VT_8:0}WideString; 
                                                                 Count: {VT_3:0}Integer; 
                                                                 out RecsOut: {VT_3:1}Integer; 
                                                                 Options: {VT_3:0}Integer; 
                                                                 const CommandText: {VT_8:0}WideString; 
                                                                 var Params: {VT_12:1}OleVariant; 
                                                                 var OwnerData: {VT_12:1}OleVariant): OleVariant; dispid 20000001;
    function  AS_DataRequest {Flags(2), (3/2) CC:0, INV:1, DBG:4}(const ProviderName: {VT_8:0}WideString; 
                                                                  Data: {VT_12:0}OleVariant): OleVariant; dispid 20000002;
    function  AS_GetProviderNames {Flags(2), (1/0) CC:0, INV:1, DBG:4}: OleVariant; dispid 20000003;
    function  AS_GetParams {Flags(2), (3/2) CC:0, INV:1, DBG:4}(const ProviderName: {VT_8:0}WideString; 
                                                                var OwnerData: {VT_12:1}OleVariant): OleVariant; dispid 20000004;
    function  AS_RowRequest {Flags(2), (5/4) CC:0, INV:1, DBG:4}(const ProviderName: {VT_8:0}WideString; 
                                                                 Row: {VT_12:0}OleVariant; 
                                                                 RequestType: {VT_3:0}Integer; 
                                                                 var OwnerData: {VT_12:1}OleVariant): OleVariant; dispid 20000005;
    procedure AS_Execute {Flags(2), (4/4) CC:0, INV:1, DBG:4}(const ProviderName: {VT_8:0}WideString; 
                                                              const CommandText: {VT_8:0}WideString; 
                                                              var Params: {VT_12:1}OleVariant; 
                                                              var OwnerData: {VT_12:1}OleVariant); dispid 20000006;
  end;

implementation

uses ComObj;

end.
