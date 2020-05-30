unit Serv_TLB;

{ This file contains pascal declarations imported from a type library.
  This file will be written during each import or refresh of the type
  library editor.  Changes to this file will be discarded during the
  refresh process. }

{ AdHoc Query Demo Server Library }
{ Version 1.0 }

interface

uses Windows, ActiveX, Classes, Graphics, OleCtrls, StdVCL;

const
  LIBID_Serv: TGUID = '{85C677A0-F92F-11D0-9FFC-00A0248E4B9A}';

const

{ Component class GUIDs }
  Class_AdHocQueryDemo: TGUID = '{85C677A2-F92F-11D0-9FFC-00A0248E4B9A}';

type

{ Forward declarations: Interfaces }
  IAdHocQueryDemo = interface;
  IAdHocQueryDemoDisp = dispinterface;

{ Forward declarations: CoClasses }
  AdHocQueryDemo = IAdHocQueryDemo;

{ Dispatch interface for AdHocQueryDemo Object }

  IAdHocQueryDemo = interface(IDataBroker)
    ['{85C677A1-F92F-11D0-9FFC-00A0248E4B9A}']
    function Get_AdHocQuery: IProvider; safecall;
    function GetDatabaseNames: OleVariant; safecall;
    procedure SetDatabaseName(const DBName, Password: WideString); safecall;
    property AdHocQuery: IProvider read Get_AdHocQuery;
  end;

{ DispInterface declaration for Dual Interface IAdHocQueryDemo }

  IAdHocQueryDemoDisp = dispinterface
    ['{85C677A1-F92F-11D0-9FFC-00A0248E4B9A}']
    function GetProviderNames: OleVariant; dispid 22929905;
    property AdHocQuery: IProvider readonly dispid 1;
    function GetDatabaseNames: OleVariant; dispid 2;
    procedure SetDatabaseName(const DBName, Password: WideString); dispid 3;
  end;

{ AdHocQueryDemoObject }

  CoAdHocQueryDemo = class
    class function Create: IAdHocQueryDemo;
    class function CreateRemote(const MachineName: string): IAdHocQueryDemo;
  end;



implementation

uses ComObj;

class function CoAdHocQueryDemo.Create: IAdHocQueryDemo;
begin
  Result := CreateComObject(Class_AdHocQueryDemo) as IAdHocQueryDemo;
end;

class function CoAdHocQueryDemo.CreateRemote(const MachineName: string): IAdHocQueryDemo;
begin
  Result := CreateRemoteComObject(MachineName, Class_AdHocQueryDemo) as IAdHocQueryDemo;
end;


end.
