unit Server_TLB;

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
// File generated on 5/16/99 4:59:30 PM from Type Library described below.

// ************************************************************************ //
// Type Lib: C:\VisibrokerPascal\Examples\Delphi 4 Factory\Factory\Delphi4ClientServer\Server.tlb
// IID\LCID: {94E39DD4-0BD0-11D3-A285-0080C7F6479A}\0
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
  LIBID_Server: TGUID = '{94E39DD4-0BD0-11D3-A285-0080C7F6479A}';
  IID_IMyTest: TGUID = '{94E39DD5-0BD0-11D3-A285-0080C7F6479A}';
  CLASS_MyTest: TGUID = '{94E39DD7-0BD0-11D3-A285-0080C7F6479A}';
type

// *********************************************************************//
// Forward declaration of interfaces defined in Type Library            //
// *********************************************************************//
  IMyTest = interface;
  IMyTestDisp = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                     //
// (NOTE: Here we map each CoClass to its Default Interface)            //
// *********************************************************************//
  MyTest = IMyTest;


// *********************************************************************//
// Interface: IMyTest
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {94E39DD5-0BD0-11D3-A285-0080C7F6479A}
// *********************************************************************//
  IMyTest = interface(IDispatch)
    ['{94E39DD5-0BD0-11D3-A285-0080C7F6479A}']
    function Get_X: Integer; safecall;
  end;

// *********************************************************************//
// DispIntf:  IMyTestDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {94E39DD5-0BD0-11D3-A285-0080C7F6479A}
// *********************************************************************//
  IMyTestDisp = dispinterface
    ['{94E39DD5-0BD0-11D3-A285-0080C7F6479A}']
    function Get_X: Integer; dispid 1;
  end;

  TMyTestStub = class(TCorbaDispatchStub, IMyTest)
  public
    function Get_X: Integer; safecall;
  end;

  TMyTestSkeleton = class(TCorbaSkeleton)
  private
    FIntf: IMyTest;
  public
    constructor Create(const InstanceName: string; const Impl: IUnknown); override;
    procedure GetImplementation(out Impl: IUnknown); override; stdcall;
  published
    procedure Get_X(const InBuf: IMarshalInBuffer; Cookie: Pointer);
  end;

  CoMyTest = class
    class function Create: IMyTest;
    class function CreateRemote(const MachineName: string): IMyTest;
  end;

  TMyTestCorbaFactory = class
    class function CreateInstance(const InstanceName: string): IMyTest;
  end;

implementation

uses ComObj;

{ TMyTestStub }

function TMyTestStub.Get_X: Integer;
var
  OutBuf: IMarshalOutBuffer;
  InBuf: IMarshalInBuffer;
begin
  FStub.CreateRequest('Get_X', True, OutBuf);
  FStub.Invoke(OutBuf, InBuf);
  Result := InBuf.GetLong;
end;

{ TMyTestSkeleton }

constructor TMyTestSkeleton.Create(const InstanceName: string; const Impl: IUnknown);
begin
  inherited;
  inherited InitSkeleton('MyTest', InstanceName, 'IDL:Server/IMyTest:1.0', tmMultiThreaded, True);
  FIntf := Impl as IMyTest;
end;

procedure TMyTestSkeleton.GetImplementation(out Impl: IUnknown);
begin
  Impl := FIntf;
end;

procedure TMyTestSkeleton.Get_X(const InBuf: IMarshalInBuffer; Cookie: Pointer);
var
  OutBuf: IMarshalOutBuffer;
  Retval: Integer;
begin
  Retval := FIntf.Get_X;
  FSkeleton.GetReplyBuffer(Cookie, OutBuf);
  OutBuf.PutLong(Retval);
end;

class function CoMyTest.Create: IMyTest;
begin
  Result := CreateComObject(CLASS_MyTest) as IMyTest;
end;

class function CoMyTest.CreateRemote(const MachineName: string): IMyTest;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_MyTest) as IMyTest;
end;

class function TMyTestCorbaFactory.CreateInstance(const InstanceName: string): IMyTest;
begin
  Result := CorbaFactoryCreateStub('IDL:Server/MyTestFactory:1.0', 'MyTest',
    InstanceName, '', IMyTest) as IMyTest;
end;

initialization
  CorbaStubManager.RegisterStub(IMyTest, TMyTestStub);
  CorbaInterfaceIDManager.RegisterInterface(IMyTest, 'IDL:Server/IMyTest:1.0');
  CorbaSkeletonManager.RegisterSkeleton(IMyTest, TMyTestSkeleton);

end.
