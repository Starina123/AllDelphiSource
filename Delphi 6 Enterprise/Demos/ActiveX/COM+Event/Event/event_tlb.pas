unit event_tlb;

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

// PASTLWTR : $Revision:   1.1  $
// File generated on 3/20/2001 1:18:36 PM from Type Library described below.

// ************************************************************************  //
// Type Lib: D:\Projects\COM+Event\Event\Event.tlb (1)
// LIBID: {387BA24B-74F8-4290-984B-7C958C437171}
// LCID: 0
// Helpfile: 
// DepndLst: 
//   (1) v2.0 stdole, (C:\WINNT\System32\stdole2.tlb)
//   (2) v4.0 StdVCL, (C:\WINNT\System32\STDVCL40.DLL)
// ************************************************************************ //
{$TYPEDADDRESS OFF} // Unit must be compiled without type-checked pointers. 
{$WARN SYMBOL_PLATFORM OFF}
interface

uses Windows, ActiveX, Variants, Classes, Graphics, StdVCL;

// *********************************************************************//
// GUIDS declared in the TypeLibrary. Following prefixes are used:        
//   Type Libraries     : LIBID_xxxx                                      
//   CoClasses          : CLASS_xxxx                                      
//   DISPInterfaces     : DIID_xxxx                                       
//   Non-DISP interfaces: IID_xxxx                                        
// *********************************************************************//
const
  // TypeLibrary Major and minor versions
  EventMajorVersion = 1;
  EventMinorVersion = 0;

  LIBID_Event: TGUID = '{387BA24B-74F8-4290-984B-7C958C437171}';

  IID_IClockEvent: TGUID = '{D663CCD1-D4DC-4358-AF60-84102C9C1D0F}';
  CLASS_ClockEvent: TGUID = '{EE7F04CA-5CB1-4213-8874-5AEA140CC7BC}';
type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  IClockEvent = interface;
  IClockEventDisp = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  ClockEvent = IClockEvent;


// *********************************************************************//
// Interface: IClockEvent
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {D663CCD1-D4DC-4358-AF60-84102C9C1D0F}
// *********************************************************************//
  IClockEvent = interface(IDispatch)
    ['{D663CCD1-D4DC-4358-AF60-84102C9C1D0F}']
    procedure HourChange {Flags(1), (1/1) CC:0, INV:1, DBG:6}({VT_3:0}Hour: Integer); safecall;
    procedure MinuteChange {Flags(1), (1/1) CC:0, INV:1, DBG:6}({VT_3:0}Minute: Integer); safecall;
    procedure SecondChange {Flags(1), (1/1) CC:0, INV:1, DBG:6}({VT_3:0}Second: Integer); safecall;
  end;

// *********************************************************************//
// DispIntf:  IClockEventDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {D663CCD1-D4DC-4358-AF60-84102C9C1D0F}
// *********************************************************************//
  IClockEventDisp = dispinterface
    ['{D663CCD1-D4DC-4358-AF60-84102C9C1D0F}']
    procedure HourChange {Flags(2), (1/1) CC:0, INV:1, DBG:4}({VT_3:0}Hour: Integer); dispid 1;
    procedure MinuteChange {Flags(2), (1/1) CC:0, INV:1, DBG:4}({VT_3:0}Minute: Integer); dispid 2;
    procedure SecondChange {Flags(2), (1/1) CC:0, INV:1, DBG:4}({VT_3:0}Second: Integer); dispid 3;
  end;

// *********************************************************************//
// The Class CoClockEvent provides a Create and CreateRemote method to          
// create instances of the default interface IClockEvent exposed by              
// the CoClass ClockEvent. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoClockEvent = class
    class function Create: IClockEvent;
    class function CreateRemote(const MachineName: string): IClockEvent;
  end;

implementation

uses ComObj;

class function CoClockEvent.Create: IClockEvent;
begin
  Result := CreateComObject(CLASS_ClockEvent) as IClockEvent;
end;

class function CoClockEvent.CreateRemote(const MachineName: string): IClockEvent;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_ClockEvent) as IClockEvent;
end;

end.
