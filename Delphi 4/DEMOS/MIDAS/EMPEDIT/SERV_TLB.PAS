unit Serv_TLB;

{ This file contains pascal declarations imported from a type library.
  This file will be written during each import or refresh of the type
  library editor.  Changes to this file will be discarded during the
  refresh process. }

{ EmpservLib Library }
{ Version 1.0 }

interface

uses Windows, ActiveX, Classes, Graphics, OleCtrls, StdVCL;

const
  LIBID_Serv: TGUID = '{53BC6560-5B3E-11D0-9FFC-00A0248E4B9A}';

const

{ Component class GUIDs }
  Class_EmpServer: TGUID = '{53BC6562-5B3E-11D0-9FFC-00A0248E4B9A}';

type

{ Forward declarations }
{ Forward declarations: Interfaces }
  IEmpServer = interface;
  IEmpServerDisp = dispinterface;

{ Forward declarations: CoClasses }
  EmpServer = IEmpServer;

{ Dispatch interface for EmpServer Object }

  IEmpServer = interface(IDataBroker)
    ['{53BC6561-5B3E-11D0-9FFC-00A0248E4B9A}']
    function Get_EmpQuery: IProvider; safecall;
    property EmpQuery: IProvider read Get_EmpQuery;
  end;

{ DispInterface declaration for Dual Interface IEmpServer }

  IEmpServerDisp = dispinterface
    ['{53BC6561-5B3E-11D0-9FFC-00A0248E4B9A}']
    function GetProviderNames: OleVariant; dispid 22929905;
    property EmpQuery: IProvider readonly dispid 1;
  end;

{ EmpServerObject }

  CoEmpServer = class
    class function Create: IEmpServer;
    class function CreateRemote(const MachineName: string): IEmpServer;
  end;



implementation

uses ComObj;

class function CoEmpServer.Create: IEmpServer;
begin
  Result := CreateComObject(Class_EmpServer) as IEmpServer;
end;

class function CoEmpServer.CreateRemote(const MachineName: string): IEmpServer;
begin
  Result := CreateRemoteComObject(MachineName, Class_EmpServer) as IEmpServer;
end;


end.
