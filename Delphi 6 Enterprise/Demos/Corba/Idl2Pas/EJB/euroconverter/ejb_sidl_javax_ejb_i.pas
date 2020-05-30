unit ejb_sidl_javax_ejb_i;

{This file was generated on 28 Feb 2001 10:06:55 GMT by version 03.03.03.C1.06}
{of the Inprise VisiBroker idl2pas CORBA IDL compiler.                        }

{Please do not edit the contents of this file. You should instead edit and    }
{recompile the original IDL which was located in the file sidl.idl.           }

{Delphi Pascal unit      : ejb_sidl_javax_ejb_i                               }
{derived from IDL module : ejb                                                }



interface

uses
  CORBA,
  ejb_sidl_java_lang_i;

type
  EJBMetaData = interface;
  EJBHome = interface;
  EJBObject = interface;

  EJBMetaData = interface
    ['{A741BF7B-007B-A116-AD07-55C0A48B6D77}']
    function  _get_home : ejb_sidl_javax_ejb_i.EJBHome;
    procedure _set_home (const home : ejb_sidl_javax_ejb_i.EJBHome);
    function  _get_homeInterfaceClass : ejb_sidl_java_lang_i._Class;
    procedure _set_homeInterfaceClass (const homeInterfaceClass : ejb_sidl_java_lang_i._Class);
    function  _get_primaryKeyClass : ejb_sidl_java_lang_i._Class;
    procedure _set_primaryKeyClass (const primaryKeyClass : ejb_sidl_java_lang_i._Class);
    function  _get_remoteInterfaceClass : ejb_sidl_java_lang_i._Class;
    procedure _set_remoteInterfaceClass (const remoteInterfaceClass : ejb_sidl_java_lang_i._Class);
    function  _get_session : Boolean;
    procedure _set_session (const session : Boolean);
    function  _get_statelessSession : Boolean;
    procedure _set_statelessSession (const statelessSession : Boolean);
    property  home : ejb_sidl_javax_ejb_i.EJBHome read _get_home write _set_home;
    property  homeInterfaceClass : ejb_sidl_java_lang_i._Class read _get_homeInterfaceClass write _set_homeInterfaceClass;
    property  primaryKeyClass : ejb_sidl_java_lang_i._Class read _get_primaryKeyClass write _set_primaryKeyClass;
    property  remoteInterfaceClass : ejb_sidl_java_lang_i._Class read _get_remoteInterfaceClass write _set_remoteInterfaceClass;
    property  session : Boolean read _get_session write _set_session;
    property  statelessSession : Boolean read _get_statelessSession write _set_statelessSession;
  end;

  EJBHome = interface
    ['{8690977F-AE06-9989-F244-F20E959FF785}']
    function  getEJBMetaData : ejb_sidl_javax_ejb_i.EJBMetaData;
    procedure remove (const primaryKey : ANY);
    function  getSimplifiedIDL : AnsiString;
  end;

  EJBObject = interface
    ['{746050E3-15AF-145A-77BC-31C2F22E6701}']
    function  getEJBHome : ejb_sidl_javax_ejb_i.EJBHome;
    function  getPrimaryKey : ANY;
    procedure remove ;
  end;


implementation


initialization


end.