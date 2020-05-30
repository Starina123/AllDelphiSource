unit Serv_TLB;

{ This file contains pascal declarations imported from a type library.
  This file will be written during each import or refresh of the type
  library editor.  Changes to this file will be discarded during the
  refresh process. }

{ SetParam Demo Server Library }
{ Version 1.0 }

interface

uses Windows, ActiveX, Classes, Graphics, OleCtrls, StdVCL;

const
  LIBID_Serv: TGUID = '{518F9D60-F90A-11D0-9FFC-00A0248E4B9A}';

const

{ Component class GUIDs }
  Class_SetParamDemo: TGUID = '{518F9D64-F90A-11D0-9FFC-00A0248E4B9A}';

type

{ Forward declarations: Interfaces }
  ISetParamDemo = interface;
  ISetParamDemoDisp = dispinterface;

{ Forward declarations: CoClasses }
  SetParamDemo = ISetParamDemo;

{ Dispatch interface for SetParamDemo Object }

  ISetParamDemo = interface(IDataBroker)
    ['{518F9D63-F90A-11D0-9FFC-00A0248E4B9A}']
    function Get_Events: IProvider; safecall;
    property Events: IProvider read Get_Events;
  end;

{ DispInterface declaration for Dual Interface ISetParamDemo }

  ISetParamDemoDisp = dispinterface
    ['{518F9D63-F90A-11D0-9FFC-00A0248E4B9A}']
    function GetProviderNames: OleVariant; dispid 22929905;
    property Events: IProvider readonly dispid 1;
  end;

{ SetParamDemoObject }

  CoSetParamDemo = class
    class function Create: ISetParamDemo;
    class function CreateRemote(const MachineName: string): ISetParamDemo;
  end;



implementation

uses ComObj;

class function CoSetParamDemo.Create: ISetParamDemo;
begin
  Result := CreateComObject(Class_SetParamDemo) as ISetParamDemo;
end;

class function CoSetParamDemo.CreateRemote(const MachineName: string): ISetParamDemo;
begin
  Result := CreateRemoteComObject(MachineName, Class_SetParamDemo) as ISetParamDemo;
end;


end.
