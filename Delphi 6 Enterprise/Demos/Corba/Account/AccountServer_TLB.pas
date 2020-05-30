unit AccountServer_TLB;

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

// PASTLWTR : $Revision:   1.0  $
// File generated on 6/17/98 3:55:15 PM from Type Library described below.

// ************************************************************************ //
// Type Lib: C:\Borland\Delphi4\Demos\Corba\Account\AccountServer.tlb
// IID\LCID: {CE4F24E4-FD8A-11D1-AA9F-00C04FA368D1}\0
// Helpfile: 
// HelpString: Project1 Library
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
  LIBID_AccountServer: TGUID = '{CE4F24E4-FD8A-11D1-AA9F-00C04FA368D1}';
  IID_IAccount: TGUID = '{CE4F24E5-FD8A-11D1-AA9F-00C04FA368D1}';
  CLASS_Account: TGUID = '{CE4F24E7-FD8A-11D1-AA9F-00C04FA368D1}';
type

// *********************************************************************//
// Forward declaration of interfaces defined in Type Library            //
// *********************************************************************//
  IAccount = interface;
  IAccountDisp = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                     //
// (NOTE: Here we map each CoClass to its Default Interface)            //
// *********************************************************************//
  Account = IAccount;


// *********************************************************************//
// Interface: IAccount
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {CE4F24E5-FD8A-11D1-AA9F-00C04FA368D1}
// *********************************************************************//
  IAccount = interface(IDispatch)
    ['{CE4F24E5-FD8A-11D1-AA9F-00C04FA368D1}']
    function Balance: Double; safecall;
  end;

// *********************************************************************//
// DispIntf:  IAccountDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {CE4F24E5-FD8A-11D1-AA9F-00C04FA368D1}
// *********************************************************************//
  IAccountDisp = dispinterface
    ['{CE4F24E5-FD8A-11D1-AA9F-00C04FA368D1}']
    function Balance: Double; dispid 1;
  end;

  TAccountStub = class(TCorbaDispatchStub, IAccount)
  public
    function Balance: Double; safecall;
  end;

  TAccountSkeleton = class(TCorbaSkeleton)
  private
    FIntf: IAccount;
  public
    constructor Create(const InstanceName: string; const Impl: IUnknown); override;
    procedure GetImplementation(out Impl: IUnknown); override; stdcall;
  published
    procedure Balance(const InBuf: IMarshalInBuffer; Cookie: Pointer);
  end;

  CoAccount = class
    class function Create: IAccount;
    class function CreateRemote(const MachineName: string): IAccount;
  end;

  TAccountCorbaFactory = class
    class function CreateInstance(const InstanceName: string): IAccount;
  end;

implementation

uses ComObj;

{ TAccountStub }

function TAccountStub.Balance: Double;
var
  OutBuf: IMarshalOutBuffer;
  InBuf: IMarshalInBuffer;
begin
  FStub.CreateRequest('Balance', True, OutBuf);
  FStub.Invoke(OutBuf, InBuf);
  Result := InBuf.GetDouble;
end;

{ TAccountSkeleton }

constructor TAccountSkeleton.Create(const InstanceName: string; const Impl: IUnknown);
begin
  inherited;
  inherited InitSkeleton('Account', InstanceName, 'IDL:AccountServer/IAccount:1.0', tmMultiThreaded, True);
  FIntf := Impl as IAccount;
end;

procedure TAccountSkeleton.GetImplementation(out Impl: IUnknown);
begin
  Impl := FIntf;
end;

procedure TAccountSkeleton.Balance(const InBuf: IMarshalInBuffer; Cookie: Pointer);
var
  OutBuf: IMarshalOutBuffer;
  Retval: Double;
begin
  Retval := FIntf.Balance;
  FSkeleton.GetReplyBuffer(Cookie, OutBuf);
  OutBuf.PutDouble(Retval);
end;

class function CoAccount.Create: IAccount;
begin
  Result := CreateComObject(CLASS_Account) as IAccount;
end;

class function CoAccount.CreateRemote(const MachineName: string): IAccount;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_Account) as IAccount;
end;

class function TAccountCorbaFactory.CreateInstance(const InstanceName: string): IAccount;
begin
  Result := CorbaFactoryCreateStub('IDL:AccountServer/AccountFactory:1.0', 'Account',
    InstanceName, '', IAccount) as IAccount;
end;

initialization
  CorbaStubManager.RegisterStub(IAccount, TAccountStub);
  CorbaInterfaceIDManager.RegisterInterface(IAccount, 'IDL:AccountServer/IAccount:1.0');
  CorbaSkeletonManager.RegisterSkeleton(IAccount, TAccountSkeleton);

end.
