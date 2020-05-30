unit RDS_TLB;

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

// PASTLWTR : $Revision:   1.76  $
// File generated on 6/8/99 3:43:10 PM from Type Library described below.

// ************************************************************************ //
// Type Lib: C:\PROGRAM FILES\COMMON FILES\SYSTEM\MSADC\MSADCO.DLL (1)
// IID\LCID: {BD96C556-65A3-11D0-983A-00C04FC29E30}\0
// Helpfile: C:\PROGRAM FILES\COMMON FILES\SYSTEM\MSADC\ado210.chm
// DepndLst: 
//   (1) v2.0 stdole, (C:\WINDOWS\SYSTEM\STDOLE2.TLB)
//   (2) v4.0 StdVCL, (D:\TP\BIN\STDVCL40.DLL)
// ************************************************************************ //
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
  RDSMajorVersion = 1;
  RDSMinorVersion = 5;

  LIBID_RDS: TGUID = '{BD96C556-65A3-11D0-983A-00C04FC29E30}';

  DIID_IADCEvents: TGUID = '{24785B20-135E-11D1-A2A7-00A0C9082766}';
  IID_IBindMgr: TGUID = '{BD96C556-65A3-11D0-983A-00C04FC29E31}';
  CLASS_DataControl: TGUID = '{BD96C556-65A3-11D0-983A-00C04FC29E33}';
  IID_IDataspace: TGUID = '{BD96C556-65A3-11D0-983A-00C04FC29E34}';
  CLASS_DataSpace: TGUID = '{BD96C556-65A3-11D0-983A-00C04FC29E36}';

// *********************************************************************//
// Declaration of Enumerations defined in Type Library                    
// *********************************************************************//
// ADCExecuteOptionEnum constants
type
  ADCExecuteOptionEnum = TOleEnum;
const
  adcExecSync = $00000001;
  adcExecAsync = $00000002;

// ADCFetchOptionEnum constants
type
  ADCFetchOptionEnum = TOleEnum;
const
  adcFetchUpFront = $00000001;
  adcFetchBackground = $00000002;
  adcFetchAsync = $00000003;

// ADCReadyStateEnum constants
type
  ADCReadyStateEnum = TOleEnum;
const
  adcReadyStateLoaded = $00000002;
  adcReadyStateInteractive = $00000003;
  adcReadyStateComplete = $00000004;

type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  IADCEvents = dispinterface;
  IBindMgr = interface;
  IBindMgrDisp = dispinterface;
  IDataspace = interface;
  IDataspaceDisp = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  DataControl = IBindMgr;
  DataSpace = IDataspace;


// *********************************************************************//
// Declaration of structures, unions and aliases.                         
// *********************************************************************//
  PWordBool1 = ^WordBool; {*}


// *********************************************************************//
// DispIntf:  IADCEvents
// Flags:     (4112) Hidden Dispatchable
// GUID:      {24785B20-135E-11D1-A2A7-00A0C9082766}
// *********************************************************************//
  IADCEvents = dispinterface
    ['{24785B20-135E-11D1-A2A7-00A0C9082766}']
    procedure onreadystatechange {Flags(1), (0/0) CC:0, INV:1, DBG:4}; dispid -609;
    procedure onerror {Flags(1), (4/4) CC:0, INV:1, DBG:4}(SCode: {VT_2:0}Smallint; 
                                                           const Description: {VT_8:0}WideString; 
                                                           const Source: {VT_8:0}WideString; 
                                                           var CancelDisplay: {VT_11:1}WordBool); dispid -608;
  end;

// *********************************************************************//
// Interface: IBindMgr
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {BD96C556-65A3-11D0-983A-00C04FC29E31}
// *********************************************************************//
  IBindMgr = interface(IDispatch)
    ['{BD96C556-65A3-11D0-983A-00C04FC29E31}']
    function  Get_SQL {Flags(1), (1/0) CC:0, INV:2, DBG:6}: WideString; safecall;
    procedure Set_SQL {Flags(1), (1/1) CC:0, INV:4, DBG:6}(const pbstrQuery: {VT_8:0}WideString); safecall;
    function  Get_Server {Flags(1), (1/0) CC:0, INV:2, DBG:6}: WideString; safecall;
    procedure Set_Server {Flags(1), (1/1) CC:0, INV:4, DBG:6}(const pbstrServer: {VT_8:0}WideString); safecall;
    function  Get_DataSpace {Flags(1), (1/0) CC:0, INV:2, DBG:6}: WideString; safecall;
    procedure Set_DataSpace {Flags(1), (1/1) CC:0, INV:4, DBG:6}(const pbstrDs: {VT_8:0}WideString); safecall;
    procedure _Set_SourceRecordset {Flags(1), (1/1) CC:0, INV:4, DBG:6}(const Param1: {VT_9:0}IDispatch); safecall;
    procedure Set_SourceRecordset {Flags(1), (1/1) CC:0, INV:8, DBG:6}(const Param1: {VT_9:0}IDispatch); safecall;
    function  Get_Recordset {Flags(1), (1/0) CC:0, INV:2, DBG:6}: IDispatch; safecall;
    function  Get_Connect {Flags(1), (1/0) CC:0, INV:2, DBG:6}: WideString; safecall;
    procedure Set_Connect {Flags(1), (1/1) CC:0, INV:4, DBG:6}(const pbstrConnect: {VT_8:0}WideString); safecall;
    function  Get_ExecuteOptions {Flags(1), (1/0) CC:0, INV:2, DBG:6}: Smallint; safecall;
    procedure Set_ExecuteOptions {Flags(1), (1/1) CC:0, INV:4, DBG:6}(pshExecuteOptions: {VT_2:0}Smallint); safecall;
    function  Get_FetchOptions {Flags(1), (1/0) CC:0, INV:2, DBG:6}: Smallint; safecall;
    procedure Set_FetchOptions {Flags(1), (1/1) CC:0, INV:4, DBG:6}(pshFetchOptions: {VT_2:0}Smallint); safecall;
    function  Get_ReadyState {Flags(1), (1/0) CC:0, INV:2, DBG:6}: Integer; safecall;
    function  Get_SortColumn {Flags(1), (1/0) CC:0, INV:2, DBG:6}: WideString; safecall;
    procedure Set_SortColumn {Flags(1), (1/1) CC:0, INV:4, DBG:6}(const pbstrSortColumn: {VT_8:0}WideString); safecall;
    function  Get_SortDirection {Flags(1), (1/0) CC:0, INV:2, DBG:6}: WordBool; safecall;
    procedure Set_SortDirection {Flags(1), (1/1) CC:0, INV:4, DBG:6}(pfSortAscending: {VT_11:0}WordBool); safecall;
    function  Get_FilterValue {Flags(1), (1/0) CC:0, INV:2, DBG:6}: WideString; safecall;
    procedure Set_FilterValue {Flags(1), (1/1) CC:0, INV:4, DBG:6}(const pbstrFilterValue: {VT_8:0}WideString); safecall;
    function  Get_FilterCriterion {Flags(1), (1/0) CC:0, INV:2, DBG:6}: WideString; safecall;
    procedure Set_FilterCriterion {Flags(1), (1/1) CC:0, INV:4, DBG:6}(const pbstrFilterCriterion: {VT_8:0}WideString); safecall;
    function  Get_FilterColumn {Flags(1), (1/0) CC:0, INV:2, DBG:6}: WideString; safecall;
    procedure Set_FilterColumn {Flags(1), (1/1) CC:0, INV:4, DBG:6}(const pbstrFilterColumn: {VT_8:0}WideString); safecall;
    procedure Refresh {Flags(1), (0/0) CC:0, INV:1, DBG:6}; safecall;
    procedure SubmitChanges {Flags(1), (0/0) CC:0, INV:1, DBG:6}; safecall;
    procedure CancelUpdate {Flags(1), (0/0) CC:0, INV:1, DBG:6}; safecall;
    function  CreateRecordSet {Flags(1), (2/1) CC:0, INV:1, DBG:6}(varColumnInfos: {VT_12:0}OleVariant): IDispatch; safecall;
    procedure Reset {Flags(1), (1/1) CC:0, INV:1, DBG:6}(fRefilter: {VT_3:0}Integer); safecall;
    procedure Cancel {Flags(1), (0/0) CC:0, INV:1, DBG:6}; safecall;
    function  Get_Handler {Flags(1), (1/0) CC:0, INV:2, DBG:6}: WideString; safecall;
    procedure Set_Handler {Flags(1), (1/1) CC:0, INV:4, DBG:6}(const pbstrHandler: {VT_8:0}WideString); safecall;
    function  Get_InternetTimeout {Flags(1), (1/0) CC:0, INV:2, DBG:6}: Integer; safecall;
    procedure Set_InternetTimeout {Flags(1), (1/1) CC:0, INV:4, DBG:6}(plInetTimeout: {VT_3:0}Integer); safecall;
    property SQL: WideString read Get_SQL write Set_SQL;
    property Server: WideString read Get_Server write Set_Server;
    property DataSpace: WideString read Get_DataSpace write Set_DataSpace;
    property SourceRecordset: IDispatch write _Set_SourceRecordset;
    property Recordset: IDispatch read Get_Recordset;
    property Connect: WideString read Get_Connect write Set_Connect;
    property ExecuteOptions: Smallint read Get_ExecuteOptions write Set_ExecuteOptions;
    property FetchOptions: Smallint read Get_FetchOptions write Set_FetchOptions;
    property ReadyState: Integer read Get_ReadyState;
    property SortColumn: WideString read Get_SortColumn write Set_SortColumn;
    property SortDirection: WordBool read Get_SortDirection write Set_SortDirection;
    property FilterValue: WideString read Get_FilterValue write Set_FilterValue;
    property FilterCriterion: WideString read Get_FilterCriterion write Set_FilterCriterion;
    property FilterColumn: WideString read Get_FilterColumn write Set_FilterColumn;
    property Handler: WideString read Get_Handler write Set_Handler;
    property InternetTimeout: Integer read Get_InternetTimeout write Set_InternetTimeout;
  end;

// *********************************************************************//
// DispIntf:  IBindMgrDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {BD96C556-65A3-11D0-983A-00C04FC29E31}
// *********************************************************************//
  IBindMgrDisp = dispinterface
    ['{BD96C556-65A3-11D0-983A-00C04FC29E31}']
    property SQL {Flags(2), (1/0) CC:0, INV:2, DBG:6}: WideString dispid 0;
    property Server {Flags(2), (1/0) CC:0, INV:2, DBG:6}: WideString dispid 1;
    property DataSpace {Flags(2), (1/0) CC:0, INV:2, DBG:6}: WideString dispid 144;
    property SourceRecordset {Flags(2), (1/0) CC:0, INV:4, DBG:6}: IDispatch writeonly dispid 146;
    property Recordset {Flags(2), (1/0) CC:0, INV:2, DBG:6}: IDispatch readonly dispid 149;
    property Connect {Flags(2), (1/0) CC:0, INV:2, DBG:6}: WideString dispid 148;
    property ExecuteOptions {Flags(2), (1/0) CC:0, INV:2, DBG:6}: Smallint dispid 18;
    property FetchOptions {Flags(2), (1/0) CC:0, INV:2, DBG:6}: Smallint dispid 20;
    property ReadyState {Flags(2), (1/0) CC:0, INV:2, DBG:6}: Integer readonly dispid -525;
    property SortColumn {Flags(2), (1/0) CC:0, INV:2, DBG:6}: WideString dispid 11;
    property SortDirection {Flags(2), (1/0) CC:0, INV:2, DBG:6}: WordBool dispid 12;
    property FilterValue {Flags(2), (1/0) CC:0, INV:2, DBG:6}: WideString dispid 15;
    property FilterCriterion {Flags(2), (1/0) CC:0, INV:2, DBG:6}: WideString dispid 14;
    property FilterColumn {Flags(2), (1/0) CC:0, INV:2, DBG:6}: WideString dispid 13;
    procedure Refresh {Flags(1), (0/0) CC:0, INV:1, DBG:4}; dispid 6;
    procedure SubmitChanges {Flags(1), (0/0) CC:0, INV:1, DBG:4}; dispid 7;
    procedure CancelUpdate {Flags(1), (0/0) CC:0, INV:1, DBG:4}; dispid 8;
    function  CreateRecordSet {Flags(1), (2/1) CC:0, INV:1, DBG:4}(varColumnInfos: {VT_12:0}OleVariant): IDispatch; dispid 10;
    procedure Reset {Flags(1), (1/1) CC:0, INV:1, DBG:4}(fRefilter: {VT_3:0}Integer); dispid 16;
    procedure Cancel {Flags(1), (0/0) CC:0, INV:1, DBG:4}; dispid 17;
    property Handler {Flags(2), (1/0) CC:0, INV:2, DBG:6}: WideString dispid 21;
    property InternetTimeout {Flags(2), (1/0) CC:0, INV:2, DBG:6}: Integer dispid 22;
  end;

// *********************************************************************//
// Interface: IDataspace
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {BD96C556-65A3-11D0-983A-00C04FC29E34}
// *********************************************************************//
  IDataspace = interface(IDispatch)
    ['{BD96C556-65A3-11D0-983A-00C04FC29E34}']
    function  CreateObject {Flags(1), (3/2) CC:0, INV:1, DBG:6}(const bstrProgid: {VT_8:0}WideString; 
                                                                const bstrConnection: {VT_8:0}WideString): OleVariant; safecall;
    function  Get_InternetTimeout {Flags(1), (1/0) CC:0, INV:2, DBG:6}: Integer; safecall;
    procedure Set_InternetTimeout {Flags(1), (1/1) CC:0, INV:4, DBG:6}(plInetTimeout: {VT_3:0}Integer); safecall;
    property InternetTimeout: Integer read Get_InternetTimeout write Set_InternetTimeout;
  end;

// *********************************************************************//
// DispIntf:  IDataspaceDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {BD96C556-65A3-11D0-983A-00C04FC29E34}
// *********************************************************************//
  IDataspaceDisp = dispinterface
    ['{BD96C556-65A3-11D0-983A-00C04FC29E34}']
    function  CreateObject {Flags(1), (3/2) CC:0, INV:1, DBG:4}(const bstrProgid: {VT_8:0}WideString; 
                                                                const bstrConnection: {VT_8:0}WideString): OleVariant; dispid 1;
    property InternetTimeout {Flags(2), (1/0) CC:0, INV:2, DBG:6}: Integer dispid 222;
  end;

// *********************************************************************//
// The Class CoDataControl provides a Create and CreateRemote method to          
// create instances of the default interface IBindMgr exposed by              
// the CoClass DataControl. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoDataControl = class
    class function Create: IBindMgr;
    class function CreateRemote(const MachineName: string): IBindMgr;
  end;

// *********************************************************************//
// The Class CoDataSpace provides a Create and CreateRemote method to          
// create instances of the default interface IDataspace exposed by              
// the CoClass DataSpace. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoDataSpace = class
    class function Create: IDataspace;
    class function CreateRemote(const MachineName: string): IDataspace;
  end;

implementation

uses ComObj;

class function CoDataControl.Create: IBindMgr;
begin
  Result := CreateComObject(CLASS_DataControl) as IBindMgr;
end;

class function CoDataControl.CreateRemote(const MachineName: string): IBindMgr;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_DataControl) as IBindMgr;
end;

class function CoDataSpace.Create: IDataspace;
begin
  Result := CreateComObject(CLASS_DataSpace) as IDataspace;
end;

class function CoDataSpace.CreateRemote(const MachineName: string): IDataspace;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_DataSpace) as IDataspace;
end;

end.
