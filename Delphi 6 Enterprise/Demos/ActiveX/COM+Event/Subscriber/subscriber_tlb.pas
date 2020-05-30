unit subscriber_tlb;

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
// File generated on 3/20/2001 4:08:31 PM from Type Library described below.

// ************************************************************************  //
// Type Lib: D:\Projects\COM+Event\Subscriber\Subscriber.tlb (1)
// LIBID: {8478E268-B94F-4D02-AA40-5E76E308611C}
// LCID: 0
// Helpfile: 
// DepndLst: 
//   (1) v2.0 stdole, (C:\WINNT\System32\stdole2.tlb)
//   (2) v4.0 StdVCL, (C:\WINNT\System32\STDVCL40.DLL)
//   (3) v1.0 Event, (D:\Projects\COM+Event\Event\Event.dll)
// ************************************************************************ //
{$TYPEDADDRESS OFF} // Unit must be compiled without type-checked pointers. 
{$WARN SYMBOL_PLATFORM OFF}
interface

uses Windows, ActiveX, Variants, Classes, Graphics, StdVCL,
  event_tlb;

// *********************************************************************//
// GUIDS declared in the TypeLibrary. Following prefixes are used:        
//   Type Libraries     : LIBID_xxxx                                      
//   CoClasses          : CLASS_xxxx                                      
//   DISPInterfaces     : DIID_xxxx                                       
//   Non-DISP interfaces: IID_xxxx                                        
// *********************************************************************//
const
  // TypeLibrary Major and minor versions
  SubscriberMajorVersion = 1;
  SubscriberMinorVersion = 0;

  LIBID_Subscriber: TGUID = '{8478E268-B94F-4D02-AA40-5E76E308611C}';

  CLASS_ClockSubscriber: TGUID = '{3A004265-1C58-44C3-9E72-12F78B5AEFE6}';
type

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  ClockSubscriber = IClockEvent;


// *********************************************************************//
// The Class CoClockSubscriber provides a Create and CreateRemote method to          
// create instances of the default interface IClockEvent exposed by              
// the CoClass ClockSubscriber. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoClockSubscriber = class
    class function Create: IClockEvent;
    class function CreateRemote(const MachineName: string): IClockEvent;
  end;

implementation

uses ComObj;

class function CoClockSubscriber.Create: IClockEvent;
begin
  Result := CreateComObject(CLASS_ClockSubscriber) as IClockEvent;
end;

class function CoClockSubscriber.CreateRemote(const MachineName: string): IClockEvent;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_ClockSubscriber) as IClockEvent;
end;

end.
