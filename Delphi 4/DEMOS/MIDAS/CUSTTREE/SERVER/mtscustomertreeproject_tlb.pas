unit MtsCustomerTreeProject_TLB;

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

// PASTLWTR : $Revision:   1.11.1.60  $
// File generated on 6/10/98 1:44:15 PM from Type Library described below.

// ************************************************************************ //
// Type Lib: T:\DEMOS\MIDAS\CUSTTREE\SERVER\MtsCustomerTreeProject.tlb
// IID\LCID: {9616A2C2-FC58-11D1-A97F-00A024C11562}\0
// Helpfile: 
// HelpString: MtsCustomerTreeP Library
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
  LIBID_MtsCustomerTreeProject: TGUID = '{9616A2C2-FC58-11D1-A97F-00A024C11562}';
  IID_IMtsCustomerTree: TGUID = '{9616A2C3-FC58-11D1-A97F-00A024C11562}';
  CLASS_MtsCustomerTree: TGUID = '{9616A2C5-FC58-11D1-A97F-00A024C11562}';
type

// *********************************************************************//
// Forward declaration of interfaces defined in Type Library            //
// *********************************************************************//
  IMtsCustomerTree = interface;
  IMtsCustomerTreeDisp = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                     //
// (NOTE: Here we map each CoClass to its Default Interface)            //
// *********************************************************************//
  MtsCustomerTree = IMtsCustomerTree;


// *********************************************************************//
// Interface: IMtsCustomerTree
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {9616A2C3-FC58-11D1-A97F-00A024C11562}
// *********************************************************************//
  IMtsCustomerTree = interface(IDataBroker)
    ['{9616A2C3-FC58-11D1-A97F-00A024C11562}']
    function GetCustomerTree(CustNo: Integer; MetaData: WordBool): OleVariant; safecall;
    function GetCustomersList: OleVariant; safecall;
    procedure SetEmpNo(EmpNo: Integer); safecall;
    procedure SetMTSOptions(const RoleCanEdit: WideString); safecall;
    function ApplyCustomerTree(Delta: OleVariant; out ErrorCount: Integer): OleVariant; safecall;
    function GetPartsList: OleVariant; safecall;
  end;

// *********************************************************************//
// DispIntf:  IMtsCustomerTreeDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {9616A2C3-FC58-11D1-A97F-00A024C11562}
// *********************************************************************//
  IMtsCustomerTreeDisp = dispinterface
    ['{9616A2C3-FC58-11D1-A97F-00A024C11562}']
    function GetCustomerTree(CustNo: Integer; MetaData: WordBool): OleVariant; dispid 1;
    function GetCustomersList: OleVariant; dispid 2;
    procedure SetEmpNo(EmpNo: Integer); dispid 5;
    procedure SetMTSOptions(const RoleCanEdit: WideString); dispid 6;
    function ApplyCustomerTree(Delta: OleVariant; out ErrorCount: Integer): OleVariant; dispid 9;
    function GetPartsList: OleVariant; dispid 14;
    function GetProviderNames: OleVariant; dispid 22929905;
  end;

implementation

uses ComObj;

end.
