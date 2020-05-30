unit Sample_TLB;

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
// File generated on 4/19/2001 7:17:55 AM from Type Library described below.

// ************************************************************************  //
// Type Lib: C:\wpgdemos\examples\pascal\SiteExpress\ScriptObject\Sample.tlb (1)
// LIBID: {9406A03E-58D9-4549-84E1-0AA98DA7E384}
// LCID: 0
// Helpfile: 
// DepndLst: 
//   (1) v2.0 stdole, (C:\WINNT\System32\stdole2.tlb)
//   (2) v1.0 WebScript, (C:\Delphi6\bin\webbrokerscript.tlb)
//   (3) v4.0 StdVCL, (C:\WINNT\System32\STDVCL40.DLL)
// ************************************************************************ //
{$TYPEDADDRESS OFF} // Unit must be compiled without type-checked pointers. 
{$WARN SYMBOL_PLATFORM OFF}
{$WRITEABLECONST ON}

interface

uses ActiveX, Classes, Graphics, StdVcl, Variants, WebScript_TLB, Windows;
  


// *********************************************************************//
// GUIDS declared in the TypeLibrary. Following prefixes are used:        
//   Type Libraries     : LIBID_xxxx                                      
//   CoClasses          : CLASS_xxxx                                      
//   DISPInterfaces     : DIID_xxxx                                       
//   Non-DISP interfaces: IID_xxxx                                        
// *********************************************************************//
const
  // TypeLibrary Major and minor versions
  SampleMajorVersion = 1;
  SampleMinorVersion = 0;

  LIBID_Sample: TGUID = '{9406A03E-58D9-4549-84E1-0AA98DA7E384}';

  IID_ISimpleScriptObjectWrapper: TGUID = '{3E97E207-EEFE-43E6-B90F-76670152F89F}';
  CLASS_SimpleScriptObjectWrapper: TGUID = '{6DFBD5C7-D180-4B39-B02C-6CC7B7509F68}';
  IID_IExtendedAdapterWrapper: TGUID = '{8348FEB8-DB46-4EDD-ACD4-7436D46B4E75}';
  CLASS_ExtendedAdapterWrapper: TGUID = '{4A99B28A-E1D7-4C4C-8FB3-D4651F17AB2A}';
type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  ISimpleScriptObjectWrapper = interface;
  ISimpleScriptObjectWrapperDisp = dispinterface;
  IExtendedAdapterWrapper = interface;
  IExtendedAdapterWrapperDisp = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  SimpleScriptObjectWrapper = ISimpleScriptObjectWrapper;
  ExtendedAdapterWrapper = IExtendedAdapterWrapper;


// *********************************************************************//
// Interface: ISimpleScriptObjectWrapper
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {3E97E207-EEFE-43E6-B90F-76670152F89F}
// *********************************************************************//
  ISimpleScriptObjectWrapper = interface(IDispatch)
    ['{3E97E207-EEFE-43E6-B90F-76670152F89F}']
    function  Get_SampleValue {Flags(1), (1/0) CC:0, INV:2, DBG:6}: WideString; safecall;
    property SampleValue: WideString read Get_SampleValue;
  end;

// *********************************************************************//
// DispIntf:  ISimpleScriptObjectWrapperDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {3E97E207-EEFE-43E6-B90F-76670152F89F}
// *********************************************************************//
  ISimpleScriptObjectWrapperDisp = dispinterface
    ['{3E97E207-EEFE-43E6-B90F-76670152F89F}']
    property SampleValue {Flags(2), (1/0) CC:0, INV:2, DBG:6}: WideString writeonly dispid 2;
  end;

// *********************************************************************//
// Interface: IExtendedAdapterWrapper
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {8348FEB8-DB46-4EDD-ACD4-7436D46B4E75}
// *********************************************************************//
  IExtendedAdapterWrapper = interface(IAdapterWrapper)
    ['{8348FEB8-DB46-4EDD-ACD4-7436D46B4E75}']
    function  Get_SampleValue {Flags(1), (1/0) CC:0, INV:2, DBG:6}: WideString; safecall;
    property SampleValue: WideString read Get_SampleValue;
  end;

// *********************************************************************//
// DispIntf:  IExtendedAdapterWrapperDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {8348FEB8-DB46-4EDD-ACD4-7436D46B4E75}
// *********************************************************************//
  IExtendedAdapterWrapperDisp = dispinterface
    ['{8348FEB8-DB46-4EDD-ACD4-7436D46B4E75}']
    property SampleValue {Flags(2), (1/0) CC:0, INV:2, DBG:6}: WideString writeonly dispid 8;
    property Errors {Flags(2), (1/0) CC:0, INV:2, DBG:6}: IAdapterErrorsWrapper writeonly dispid 14;
    property Mode {Flags(2), (1/0) CC:0, INV:2, DBG:6}: WideString dispid 17;
    property CanView {Flags(2), (1/0) CC:0, INV:2, DBG:6}: WordBool writeonly dispid 3;
    property CanModify {Flags(2), (1/0) CC:0, INV:2, DBG:6}: WordBool writeonly dispid 4;
    property HiddenFields {Flags(2), (1/0) CC:0, INV:2, DBG:6}: IAdapterHiddenFieldsWrapper writeonly dispid 6;
    property HiddenRecordFields {Flags(2), (1/0) CC:0, INV:2, DBG:6}: IAdapterHiddenFieldsWrapper writeonly dispid 5;
    property Records {Flags(2), (1/0) CC:0, INV:2, DBG:6}: IAdapterRecordsWrapper writeonly dispid 7;
    property Fields {Flags(2), (1/0) CC:0, INV:2, DBG:6}: IComponentsWrapper writeonly dispid 1;
    property Actions {Flags(2), (1/0) CC:0, INV:2, DBG:6}: IComponentsWrapper writeonly dispid 2;
    property Name_ {Flags(2), (1/0) CC:0, INV:2, DBG:6}: WideString writeonly dispid 40;
    property ClassName_ {Flags(2), (1/0) CC:0, INV:2, DBG:6}: WideString writeonly dispid 41;
  end;

// *********************************************************************//
// The Class CoSimpleScriptObjectWrapper provides a Create and CreateRemote method to          
// create instances of the default interface ISimpleScriptObjectWrapper exposed by              
// the CoClass SimpleScriptObjectWrapper. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoSimpleScriptObjectWrapper = class
    class function Create: ISimpleScriptObjectWrapper;
    class function CreateRemote(const MachineName: string): ISimpleScriptObjectWrapper;
  end;

// *********************************************************************//
// The Class CoExtendedAdapterWrapper provides a Create and CreateRemote method to          
// create instances of the default interface IExtendedAdapterWrapper exposed by              
// the CoClass ExtendedAdapterWrapper. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoExtendedAdapterWrapper = class
    class function Create: IExtendedAdapterWrapper;
    class function CreateRemote(const MachineName: string): IExtendedAdapterWrapper;
  end;

implementation

uses ComObj;

class function CoSimpleScriptObjectWrapper.Create: ISimpleScriptObjectWrapper;
begin
  Result := CreateComObject(CLASS_SimpleScriptObjectWrapper) as ISimpleScriptObjectWrapper;
end;

class function CoSimpleScriptObjectWrapper.CreateRemote(const MachineName: string): ISimpleScriptObjectWrapper;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_SimpleScriptObjectWrapper) as ISimpleScriptObjectWrapper;
end;

class function CoExtendedAdapterWrapper.Create: IExtendedAdapterWrapper;
begin
  Result := CreateComObject(CLASS_ExtendedAdapterWrapper) as IExtendedAdapterWrapper;
end;

class function CoExtendedAdapterWrapper.CreateRemote(const MachineName: string): IExtendedAdapterWrapper;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_ExtendedAdapterWrapper) as IExtendedAdapterWrapper;
end;

end.
