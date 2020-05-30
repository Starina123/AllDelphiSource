unit ServerCust_TLB;

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
// File generated on 4/24/2001 2:22:01 PM from Type Library described below.

// ************************************************************************  //
// Type Lib: C:\fldtest3\ServerCust.tlb (1)
// LIBID: {2D5C3D4B-CDAC-411B-94C7-7471558CD0BD}
// LCID: 0
// Helpfile: 
// DepndLst: 
//   (1) v2.0 stdole, (C:\WINNT\System32\stdole2.tlb)
//   (2) v1.0 Midas, (C:\tp6\bin\midas.dll)
// ************************************************************************ //
{$TYPEDADDRESS OFF} // Unit must be compiled without type-checked pointers. 
{$WARN SYMBOL_PLATFORM OFF}
{$WRITEABLECONST ON}
interface

uses Windows, ActiveX, Variants, Classes, Graphics, StdVCL, 
  MIDAS;

// *********************************************************************//
// GUIDS declared in the TypeLibrary. Following prefixes are used:        
//   Type Libraries     : LIBID_xxxx                                      
//   CoClasses          : CLASS_xxxx                                      
//   DISPInterfaces     : DIID_xxxx                                       
//   Non-DISP interfaces: IID_xxxx                                        
// *********************************************************************//
const
  // TypeLibrary Major and minor versions
  ServerCustMajorVersion = 1;
  ServerCustMinorVersion = 0;

  LIBID_ServerCust: TGUID = '{2D5C3D4B-CDAC-411B-94C7-7471558CD0BD}';

  IID_ICustomer_MinMax: TGUID = '{5D1CC163-8D4F-40AF-9FDC-165ECD85CFC3}';
  CLASS_Customer_MinMax: TGUID = '{CD0930FC-14E7-468B-BB7A-069B3B861B0F}';
type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  ICustomer_MinMax = interface;
  ICustomer_MinMaxDisp = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  Customer_MinMax = ICustomer_MinMax;


// *********************************************************************//
// Interface: ICustomer_MinMax
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {5D1CC163-8D4F-40AF-9FDC-165ECD85CFC3}
// *********************************************************************//
  ICustomer_MinMax = interface(IAppServer)
    ['{5D1CC163-8D4F-40AF-9FDC-165ECD85CFC3}']
  end;

// *********************************************************************//
// DispIntf:  ICustomer_MinMaxDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {5D1CC163-8D4F-40AF-9FDC-165ECD85CFC3}
// *********************************************************************//
  ICustomer_MinMaxDisp = dispinterface
    ['{5D1CC163-8D4F-40AF-9FDC-165ECD85CFC3}']
    function  AS_ApplyUpdates {Flags(2), (6/5) CC:0, INV:1, DBG:4}({VT_8:0}const ProviderName: WideString; 
                                                                   {VT_12:0}Delta: OleVariant; 
                                                                   {VT_3:0}MaxErrors: Integer; 
                                                                   {VT_3:1}out ErrorCount: Integer; 
                                                                   {VT_12:1}var OwnerData: OleVariant): OleVariant; dispid 20000000;
    function  AS_GetRecords {Flags(2), (8/7) CC:0, INV:1, DBG:4}({VT_8:0}const ProviderName: WideString; 
                                                                 {VT_3:0}Count: Integer; 
                                                                 {VT_3:1}out RecsOut: Integer; 
                                                                 {VT_3:0}Options: Integer; 
                                                                 {VT_8:0}const CommandText: WideString; 
                                                                 {VT_12:1}var Params: OleVariant; 
                                                                 {VT_12:1}var OwnerData: OleVariant): OleVariant; dispid 20000001;
    function  AS_DataRequest {Flags(2), (3/2) CC:0, INV:1, DBG:4}({VT_8:0}const ProviderName: WideString; 
                                                                  {VT_12:0}Data: OleVariant): OleVariant; dispid 20000002;
    function  AS_GetProviderNames {Flags(2), (1/0) CC:0, INV:1, DBG:4}: OleVariant; dispid 20000003;
    function  AS_GetParams {Flags(2), (3/2) CC:0, INV:1, DBG:4}({VT_8:0}const ProviderName: WideString; 
                                                                {VT_12:1}var OwnerData: OleVariant): OleVariant; dispid 20000004;
    function  AS_RowRequest {Flags(2), (5/4) CC:0, INV:1, DBG:4}({VT_8:0}const ProviderName: WideString; 
                                                                 {VT_12:0}Row: OleVariant; 
                                                                 {VT_3:0}RequestType: Integer; 
                                                                 {VT_12:1}var OwnerData: OleVariant): OleVariant; dispid 20000005;
    procedure AS_Execute {Flags(2), (4/4) CC:0, INV:1, DBG:4}({VT_8:0}const ProviderName: WideString; 
                                                              {VT_8:0}const CommandText: WideString; 
                                                              {VT_12:1}var Params: OleVariant; 
                                                              {VT_12:1}var OwnerData: OleVariant); dispid 20000006;
  end;

// *********************************************************************//
// The Class CoCustomer_MinMax provides a Create and CreateRemote method to          
// create instances of the default interface ICustomer_MinMax exposed by              
// the CoClass Customer_MinMax. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoCustomer_MinMax = class
    class function Create: ICustomer_MinMax;
    class function CreateRemote(const MachineName: string): ICustomer_MinMax;
  end;

implementation

uses ComObj;

class function CoCustomer_MinMax.Create: ICustomer_MinMax;
begin
  Result := CreateComObject(CLASS_Customer_MinMax) as ICustomer_MinMax;
end;

class function CoCustomer_MinMax.CreateRemote(const MachineName: string): ICustomer_MinMax;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_Customer_MinMax) as ICustomer_MinMax;
end;

end.
