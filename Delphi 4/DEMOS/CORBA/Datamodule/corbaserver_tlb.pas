unit CORBAServer_TLB;

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

// PASTLWTR : $Revision:   1.11.1.63  $
// File generated on 6/17/98 5:00:26 PM from Type Library described below.

// ************************************************************************ //
// Type Lib: C:\Borland\Delphi4\Demos\Corba\Datamodule\CORBAServer.tlb
// IID\LCID: {16076F24-0184-11D2-AAA3-00C04FA368D1}\0
// Helpfile: 
// HelpString: CORBA Server Type Library
// Version:    1.0
// ************************************************************************ //

interface

uses Windows, ActiveX, Classes, Graphics, OleCtrls, StdVCL, SysUtils, CORBAObj, OrbPas, CorbaStd;

// *********************************************************************//
// GUIDS declared in the TypeLibrary. Following prefixes are used:      //
//   Type Libraries     : LIBID_xxxx                                    //
//   CoClasses          : CLASS_xxxx                                    //
//   DISPInterfaces     : DIID_xxxx                                     //
//   Non-DISP interfaces: IID_xxxx                                      //
// *********************************************************************//
const
  LIBID_CORBAServer: TGUID = '{16076F24-0184-11D2-AAA3-00C04FA368D1}';
  IID_IDemoCORBA: TGUID = '{16076F25-0184-11D2-AAA3-00C04FA368D1}';
  CLASS_DemoCORBA: TGUID = '{16076F27-0184-11D2-AAA3-00C04FA368D1}';
type

// *********************************************************************//
// Forward declaration of interfaces defined in Type Library            //
// *********************************************************************//
  IDemoCORBA = interface;
  IDemoCORBADisp = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                     //
// (NOTE: Here we map each CoClass to its Default Interface)            //
// *********************************************************************//
  DemoCORBA = IDemoCORBA;


// *********************************************************************//
// Interface: IDemoCORBA
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {16076F25-0184-11D2-AAA3-00C04FA368D1}
// *********************************************************************//
  IDemoCORBA = interface(IDataBroker)
    ['{16076F25-0184-11D2-AAA3-00C04FA368D1}']
    function Get_CustomerTable: IProvider; safecall;
    property CustomerTable: IProvider read Get_CustomerTable;
  end;

// *********************************************************************//
// DispIntf:  IDemoCORBADisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {16076F25-0184-11D2-AAA3-00C04FA368D1}
// *********************************************************************//
  IDemoCORBADisp = dispinterface
    ['{16076F25-0184-11D2-AAA3-00C04FA368D1}']
    property CustomerTable: IProvider readonly dispid 3;
    function GetProviderNames: OleVariant; dispid 22929905;
  end;

  TDemoCORBAStub = class(TDataBrokerStub, IDemoCORBA)
  public
    function Get_CustomerTable: IProvider; safecall;
  end;

  TDemoCORBASkeleton = class(TDataBrokerSkeleton)
  private
    FIntf: IDemoCORBA;
  public
    constructor Create(const InstanceName: string; const Impl: IUnknown); override;
    procedure GetImplementation(out Impl: IUnknown); override; stdcall;
  published
    procedure Get_CustomerTable(const InBuf: IMarshalInBuffer; Cookie: Pointer);
  end;

  CoDemoCORBA = class
    class function Create: IDemoCORBA;
    class function CreateRemote(const MachineName: string): IDemoCORBA;
  end;

  TDemoCORBACorbaFactory = class
    class function CreateInstance(const InstanceName: string): IDemoCORBA;
  end;

implementation

uses ComObj;

{ TDemoCORBAStub }

function TDemoCORBAStub.Get_CustomerTable: IProvider;
var
  OutBuf: IMarshalOutBuffer;
  InBuf: IMarshalInBuffer;
begin
  FStub.CreateRequest('Get_CustomerTable', True, OutBuf);
  FStub.Invoke(OutBuf, InBuf);
  Result := UnmarshalObject(InBuf, IProvider) as IProvider;
end;

{ TDemoCORBASkeleton }

constructor TDemoCORBASkeleton.Create(const InstanceName: string; const Impl: IUnknown);
begin
  inherited;
  inherited InitSkeleton('DemoCORBA', InstanceName, 'IDL:CORBAServer/IDemoCORBA:1.0', tmMultiThreaded, True);
  FIntf := Impl as IDemoCORBA;
end;

procedure TDemoCORBASkeleton.GetImplementation(out Impl: IUnknown);
begin
  Impl := FIntf;
end;

procedure TDemoCORBASkeleton.Get_CustomerTable(const InBuf: IMarshalInBuffer; Cookie: Pointer);
var
  OutBuf: IMarshalOutBuffer;
  Retval: IProvider;
begin
  Retval := FIntf.Get_CustomerTable;
  FSkeleton.GetReplyBuffer(Cookie, OutBuf);
  MarshalObject(OutBuf, IProvider, Retval);
end;

class function CoDemoCORBA.Create: IDemoCORBA;
begin
  Result := CreateComObject(CLASS_DemoCORBA) as IDemoCORBA;
end;

class function CoDemoCORBA.CreateRemote(const MachineName: string): IDemoCORBA;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_DemoCORBA) as IDemoCORBA;
end;

class function TDemoCORBACorbaFactory.CreateInstance(const InstanceName: string): IDemoCORBA;
begin
  Result := CorbaFactoryCreateStub('IDL:CORBAServer/DemoCORBAFactory:1.0', 'DemoCORBA',
    InstanceName, '', IDemoCORBA) as IDemoCORBA;
end;

initialization
  CorbaStubManager.RegisterStub(IDemoCORBA, TDemoCORBAStub);
  CorbaInterfaceIDManager.RegisterInterface(IDemoCORBA, 'IDL:CORBAServer/IDemoCORBA:1.0');
  CorbaSkeletonManager.RegisterSkeleton(IDemoCORBA, TDemoCORBASkeleton);

end.
