unit ejb_sidl_javax_ejb_c;

{This file was generated on 28 Feb 2001 10:06:55 GMT by version 03.03.03.C1.06}
{of the Inprise VisiBroker idl2pas CORBA IDL compiler.                        }

{Please do not edit the contents of this file. You should instead edit and    }
{recompile the original IDL which was located in the file sidl.idl.           }

{Delphi Pascal unit      : ejb_sidl_javax_ejb_c                               }
{derived from IDL module : ejb                                                }



interface

uses
  CORBA,
  ejb_sidl_javax_ejb_i,
  ejb_sidl_java_lang_i;

type
  ERemoveException = class;
  TEJBMetaDataHelper = class;
  TEJBMetaData = class;
  TEJBHomeHelper = class;
  TEJBHomeStub = class;
  TEJBObjectHelper = class;
  TEJBObjectStub = class;
  ECreateException = class;
  EFinderException = class;

  ERemoveException = class(UserException)
  private
    Fmessage : AnsiString;
  protected
    function  _get_message : AnsiString; virtual;
  public
    property  message : AnsiString read _get_message;
    constructor Create; overload;
    constructor Create(const message : AnsiString); overload;
    procedure Copy(const _Input : InputStream); override;
    procedure WriteExceptionInfo(var _Output : OutputStream); override;
  end;

  TEJBMetaDataHelper = class
    class procedure Insert (var   _A: CORBA.Any; const _Value : ejb_sidl_javax_ejb_i.EJBMetaData);
    class function  Extract(const _A: CORBA.Any): ejb_sidl_javax_ejb_i.EJBMetaData;
    class function  TypeCode    : CORBA.TypeCode;
    class function  RepositoryId: string;
    class function  Read (const _Input  : CORBA.InputStream) : ejb_sidl_javax_ejb_i.EJBMetaData;
    class procedure Write(const _Output : CORBA.OutputStream; const _Value : ejb_sidl_javax_ejb_i.EJBMetaData);
  end;

  TEJBMetaData = class (TInterfacedObject, ejb_sidl_javax_ejb_i.EJBMetaData)
  private
    home : ejb_sidl_javax_ejb_i.EJBHome;
    homeInterfaceClass : ejb_sidl_java_lang_i._Class;
    primaryKeyClass : ejb_sidl_java_lang_i._Class;
    remoteInterfaceClass : ejb_sidl_java_lang_i._Class;
    session : Boolean;
    statelessSession : Boolean;
    constructor Create; overload;
  public
    function  _get_home : ejb_sidl_javax_ejb_i.EJBHome; virtual;
    procedure _set_home ( const _value : ejb_sidl_javax_ejb_i.EJBHome ); virtual;
    function  _get_homeInterfaceClass : ejb_sidl_java_lang_i._Class; virtual;
    procedure _set_homeInterfaceClass ( const _value : ejb_sidl_java_lang_i._Class ); virtual;
    function  _get_primaryKeyClass : ejb_sidl_java_lang_i._Class; virtual;
    procedure _set_primaryKeyClass ( const _value : ejb_sidl_java_lang_i._Class ); virtual;
    function  _get_remoteInterfaceClass : ejb_sidl_java_lang_i._Class; virtual;
    procedure _set_remoteInterfaceClass ( const _value : ejb_sidl_java_lang_i._Class ); virtual;
    function  _get_session : Boolean; virtual;
    procedure _set_session ( const _value : Boolean ); virtual;
    function  _get_statelessSession : Boolean; virtual;
    procedure _set_statelessSession ( const _value : Boolean ); virtual;
    constructor Create (const home : ejb_sidl_javax_ejb_i.EJBHome;
                            const homeInterfaceClass : ejb_sidl_java_lang_i._Class;
                            const primaryKeyClass : ejb_sidl_java_lang_i._Class;
                            const remoteInterfaceClass : ejb_sidl_java_lang_i._Class;
                            const session : Boolean;
                            const statelessSession : Boolean
                       ); overload;
  end;

  TEJBHomeHelper = class
    class procedure Insert (var _A: CORBA.Any; const _Value : ejb_sidl_javax_ejb_i.EJBHome);
    class function  Extract(var _A: CORBA.Any) : ejb_sidl_javax_ejb_i.EJBHome;
    class function  TypeCode     : CORBA.TypeCode;
    class function  RepositoryId : string;
    class function  Read (const _Input  : CORBA.InputStream) : ejb_sidl_javax_ejb_i.EJBHome;
    class procedure Write(const _Output : CORBA.OutputStream; const _Value : ejb_sidl_javax_ejb_i.EJBHome);
    class function  Narrow(const _Obj   : CORBA.CORBAObject; _IsA : Boolean = False) : ejb_sidl_javax_ejb_i.EJBHome;
    class function  Bind(const _InstanceName : string = ''; _HostName : string = '') : ejb_sidl_javax_ejb_i.EJBHome; overload;
    class function  Bind(_Options : BindOptions; const _InstanceName : string = ''; _HostName: string = '') : ejb_sidl_javax_ejb_i.EJBHome; overload;
  end;

  TEJBHomeStub = class(CORBA.TCORBAObject, ejb_sidl_javax_ejb_i.EJBHome)
  public
    function  getEJBMetaData : ejb_sidl_javax_ejb_i.EJBMetaData; virtual;
    procedure remove ( const primaryKey : ANY); virtual;
    function  getSimplifiedIDL : AnsiString; virtual;
  end;

  TEJBObjectHelper = class
    class procedure Insert (var _A: CORBA.Any; const _Value : ejb_sidl_javax_ejb_i.EJBObject);
    class function  Extract(var _A: CORBA.Any) : ejb_sidl_javax_ejb_i.EJBObject;
    class function  TypeCode     : CORBA.TypeCode;
    class function  RepositoryId : string;
    class function  Read (const _Input  : CORBA.InputStream) : ejb_sidl_javax_ejb_i.EJBObject;
    class procedure Write(const _Output : CORBA.OutputStream; const _Value : ejb_sidl_javax_ejb_i.EJBObject);
    class function  Narrow(const _Obj   : CORBA.CORBAObject; _IsA : Boolean = False) : ejb_sidl_javax_ejb_i.EJBObject;
    class function  Bind(const _InstanceName : string = ''; _HostName : string = '') : ejb_sidl_javax_ejb_i.EJBObject; overload;
    class function  Bind(_Options : BindOptions; const _InstanceName : string = ''; _HostName: string = '') : ejb_sidl_javax_ejb_i.EJBObject; overload;
  end;

  TEJBObjectStub = class(CORBA.TCORBAObject, ejb_sidl_javax_ejb_i.EJBObject)
  public
    function  getEJBHome : ejb_sidl_javax_ejb_i.EJBHome; virtual;
    function  getPrimaryKey : ANY; virtual;
    procedure remove ; virtual;
  end;

  ECreateException = class(UserException)
  private
    Fmessage : AnsiString;
  protected
    function  _get_message : AnsiString; virtual;
  public
    property  message : AnsiString read _get_message;
    constructor Create; overload;
    constructor Create(const message : AnsiString); overload;
    procedure Copy(const _Input : InputStream); override;
    procedure WriteExceptionInfo(var _Output : OutputStream); override;
  end;

  EFinderException = class(UserException)
  private
    Fmessage : AnsiString;
  protected
    function  _get_message : AnsiString; virtual;
  public
    property  message : AnsiString read _get_message;
    constructor Create; overload;
    constructor Create(const message : AnsiString); overload;
    procedure Copy(const _Input : InputStream); override;
    procedure WriteExceptionInfo(var _Output : OutputStream); override;
  end;


implementation

uses
  ejb_sidl_java_lang_c;


var

  RemoveExceptionDesc : PExceptionDescription;

  CreateExceptionDesc : PExceptionDescription;

  FinderExceptionDesc : PExceptionDescription;


function  ERemoveException._get_message : AnsiString;
begin
  Result := Fmessage;
end;


constructor ERemoveException.Create;
begin
  inherited Create;
end;

constructor ERemoveException.Create(const message : AnsiString);
begin
  inherited Create;
  Fmessage := message;
end;

procedure ERemoveException.Copy(const _Input: InputStream);
begin
  _Input.ReadString(Fmessage);
end;

procedure ERemoveException.WriteExceptionInfo(var _Output : OutputStream);
begin
  _Output.WriteString('IDL:borland.com/sidl/javax/ejb/RemoveException:1.0');
  _Output.WriteString(Fmessage);
end;
function  RemoveException_Factory: PExceptionProxy; cdecl;
begin
  with ejb_sidl_javax_ejb_c.ERemoveException.Create() do Result := Proxy;
end;

class procedure TEJBMetaDataHelper.Insert(var _A : CORBA.Any; const _Value : ejb_sidl_javax_ejb_i.EJBMetaData);
var
  _Output : CORBA.OutputStream;
begin
  _Output := ORB.CreateOutputStream;
  TEJBMetaDataHelper.Write(_Output, _Value);
  ORB.PutAny(_A, TEJBMetaDataHelper.TypeCode, _Output);
end;

class function TEJBMetaDataHelper.Extract(const _A : CORBA.Any) : ejb_sidl_javax_ejb_i.EJBMetaData;
var
  _Input : CORBA.InputStream;
begin
  Orb.GetAny(_A, _Input);
  Result := TEJBMetaDataHelper.Read(_Input);
end;

class function TEJBMetaDataHelper.TypeCode : CORBA.TypeCode;
var
  _Seq: StructMemberSeq;
begin
  SetLength(_Seq, 6);
  _Seq[0].Name := 'home';
  _Seq[0].TC   := ejb_sidl_javax_ejb_c.TEJBHomeHelper.TypeCode;
  _Seq[1].Name := 'homeInterfaceClass';
  _Seq[1].TC   := ejb_sidl_java_lang_c.TClassHelper.TypeCode;
  _Seq[2].Name := 'primaryKeyClass';
  _Seq[2].TC   := ejb_sidl_java_lang_c.TClassHelper.TypeCode;
  _Seq[3].Name := 'remoteInterfaceClass';
  _Seq[3].TC   := ejb_sidl_java_lang_c.TClassHelper.TypeCode;
  _Seq[4].Name := 'session';
  _Seq[4].TC   := ORB.CreateTC(Integer(tk_boolean));
  _Seq[5].Name := 'statelessSession';
  _Seq[5].TC   := ORB.CreateTC(Integer(tk_boolean));
  Result := ORB.MakeStructureTypecode(RepositoryID, 'EJBMetaData', _Seq);
end;

class function TEJBMetaDataHelper.RepositoryId : string;
begin
  Result := 'IDL:borland.com/sidl/javax/ejb/EJBMetaData:1.0';
end;

class function TEJBMetaDataHelper.Read(const _Input : CORBA.InputStream) : ejb_sidl_javax_ejb_i.EJBMetaData;
var
  _Value : ejb_sidl_javax_ejb_c.TEJBMetaData;
begin
  _Value := ejb_sidl_javax_ejb_c.TEJBMetaData.Create;
  _Value.home := ejb_sidl_javax_ejb_c.TEJBHomeHelper.Read(_Input);
  _Value.homeInterfaceClass := ejb_sidl_java_lang_c.TClassHelper.Read(_Input);
  _Value.primaryKeyClass := ejb_sidl_java_lang_c.TClassHelper.Read(_Input);
  _Value.remoteInterfaceClass := ejb_sidl_java_lang_c.TClassHelper.Read(_Input);
  _Input.ReadBoolean(_Value.session);
  _Input.ReadBoolean(_Value.statelessSession);
  Result := _Value;
end;

class procedure TEJBMetaDataHelper.Write(const _Output : CORBA.OutputStream; const _Value : ejb_sidl_javax_ejb_i.EJBMetaData);
begin
  ejb_sidl_javax_ejb_c.TEJBHomeHelper.Write(_Output, _Value.home);
  ejb_sidl_java_lang_c.TClassHelper.Write(_Output, _Value.homeInterfaceClass);
  ejb_sidl_java_lang_c.TClassHelper.Write(_Output, _Value.primaryKeyClass);
  ejb_sidl_java_lang_c.TClassHelper.Write(_Output, _Value.remoteInterfaceClass);
  _Output.WriteBoolean(_Value.session);
  _Output.WriteBoolean(_Value.statelessSession);
end;

constructor TEJBMetaData.Create;
begin
  inherited Create;
end;

constructor TEJBMetaData.Create(const home: ejb_sidl_javax_ejb_i.EJBHome;
                                const homeInterfaceClass: ejb_sidl_java_lang_i._Class;
                                const primaryKeyClass: ejb_sidl_java_lang_i._Class;
                                const remoteInterfaceClass: ejb_sidl_java_lang_i._Class;
                                const session: Boolean;
                                const statelessSession: Boolean);
begin
  Self.home := home;
  Self.homeInterfaceClass := homeInterfaceClass;
  Self.primaryKeyClass := primaryKeyClass;
  Self.remoteInterfaceClass := remoteInterfaceClass;
  Self.session := session;
  Self.statelessSession := statelessSession;
end;

function  TEJBMetaData._get_home: ejb_sidl_javax_ejb_i.EJBHome;
begin
  Result := home;
end;

procedure TEJBMetaData._set_home(const _Value : ejb_sidl_javax_ejb_i.EJBHome);
begin
  home := _Value;
end;

function  TEJBMetaData._get_homeInterfaceClass: ejb_sidl_java_lang_i._Class;
begin
  Result := homeInterfaceClass;
end;

procedure TEJBMetaData._set_homeInterfaceClass(const _Value : ejb_sidl_java_lang_i._Class);
begin
  homeInterfaceClass := _Value;
end;

function  TEJBMetaData._get_primaryKeyClass: ejb_sidl_java_lang_i._Class;
begin
  Result := primaryKeyClass;
end;

procedure TEJBMetaData._set_primaryKeyClass(const _Value : ejb_sidl_java_lang_i._Class);
begin
  primaryKeyClass := _Value;
end;

function  TEJBMetaData._get_remoteInterfaceClass: ejb_sidl_java_lang_i._Class;
begin
  Result := remoteInterfaceClass;
end;

procedure TEJBMetaData._set_remoteInterfaceClass(const _Value : ejb_sidl_java_lang_i._Class);
begin
  remoteInterfaceClass := _Value;
end;

function  TEJBMetaData._get_session: Boolean;
begin
  Result := session;
end;

procedure TEJBMetaData._set_session(const _Value : Boolean);
begin
  session := _Value;
end;

function  TEJBMetaData._get_statelessSession: Boolean;
begin
  Result := statelessSession;
end;

procedure TEJBMetaData._set_statelessSession(const _Value : Boolean);
begin
  statelessSession := _Value;
end;

class procedure TEJBHomeHelper.Insert(var _A : CORBA.Any; const _Value : ejb_sidl_javax_ejb_i.EJBHome);
begin
  _A := Orb.MakeObjectRef( TEJBHomeHelper.TypeCode, _Value as CORBA.CORBAObject);
end;

class function TEJBHomeHelper.Extract(var _A : CORBA.Any): ejb_sidl_javax_ejb_i.EJBHome;
var
  _obj : Corba.CorbaObject;
begin
  _obj := Orb.GetObjectRef(_A);
  Result := TEJBHomeHelper.Narrow(_obj, True);
end;

class function TEJBHomeHelper.TypeCode : CORBA.TypeCode;
begin
  Result := ORB.CreateInterfaceTC(RepositoryId, 'EJBHome');
end;

class function TEJBHomeHelper.RepositoryId : string;
begin
  Result := 'IDL:borland.com/sidl/javax/ejb/EJBHome:1.0';
end;

class function TEJBHomeHelper.Read(const _Input : CORBA.InputStream) : ejb_sidl_javax_ejb_i.EJBHome;
var
  _Obj : CORBA.CORBAObject;
begin
  _Input.ReadObject(_Obj);
  Result := Narrow(_Obj, True)
end;

class procedure TEJBHomeHelper.Write(const _Output : CORBA.OutputStream; const _Value : ejb_sidl_javax_ejb_i.EJBHome);
begin
  _Output.WriteObject(_Value as CORBA.CORBAObject);
end;

class function TEJBHomeHelper.Narrow(const _Obj : CORBA.CORBAObject; _IsA : Boolean) : ejb_sidl_javax_ejb_i.EJBHome;
begin
  Result := nil;
  if (_Obj = nil) or (_Obj.QueryInterface(ejb_sidl_javax_ejb_i.EJBHome, Result) = 0) then
    exit;
  if _IsA and _Obj._IsA(RepositoryId) then
    Result := TEJBHomeStub.Create(_Obj);
end;

class function TEJBHomeHelper.Bind(const _InstanceName : string = ''; _HostName: string = '') : ejb_sidl_javax_ejb_i.EJBHome;
begin
  Result := Narrow(ORB.bind(RepositoryId, _InstanceName, _HostName), True);
end;

class function TEJBHomeHelper.Bind(_Options : BindOptions; const _InstanceName : string = ''; _HostName : string = '') : ejb_sidl_javax_ejb_i.EJBHome;
begin
  Result := Narrow(ORB.bind(RepositoryId, _Options, _InstanceName, _HostName), True);
end;

function  TEJBHomeStub.getEJBMetaData : ejb_sidl_javax_ejb_i.EJBMetaData;
var
  _Output: CORBA.OutputStream;
  _Input : CORBA.InputStream;
begin
  inherited _CreateRequest('getEJBMetaData',True, _Output);
  inherited _Invoke(_Output, _Input);
  Result := ejb_sidl_javax_ejb_c.TEJBMetaDataHelper.Read(_Input);
end;

procedure TEJBHomeStub.remove ( const primaryKey : ANY);
var
  _Output: CORBA.OutputStream;
  _Input : CORBA.InputStream;
begin
  inherited _CreateRequest('remove',True, _Output);
  _Output.WriteAny(primaryKey);
  inherited _Invoke(_Output, _Input);
end;

function  TEJBHomeStub.getSimplifiedIDL : AnsiString;
var
  _Output: CORBA.OutputStream;
  _Input : CORBA.InputStream;
begin
  inherited _CreateRequest('getSimplifiedIDL',True, _Output);
  inherited _Invoke(_Output, _Input);
  _Input.ReadString(Result);
end;

class procedure TEJBObjectHelper.Insert(var _A : CORBA.Any; const _Value : ejb_sidl_javax_ejb_i.EJBObject);
begin
  _A := Orb.MakeObjectRef( TEJBObjectHelper.TypeCode, _Value as CORBA.CORBAObject);
end;

class function TEJBObjectHelper.Extract(var _A : CORBA.Any): ejb_sidl_javax_ejb_i.EJBObject;
var
  _obj : Corba.CorbaObject;
begin
  _obj := Orb.GetObjectRef(_A);
  Result := TEJBObjectHelper.Narrow(_obj, True);
end;

class function TEJBObjectHelper.TypeCode : CORBA.TypeCode;
begin
  Result := ORB.CreateInterfaceTC(RepositoryId, 'EJBObject');
end;

class function TEJBObjectHelper.RepositoryId : string;
begin
  Result := 'IDL:borland.com/sidl/javax/ejb/EJBObject:1.0';
end;

class function TEJBObjectHelper.Read(const _Input : CORBA.InputStream) : ejb_sidl_javax_ejb_i.EJBObject;
var
  _Obj : CORBA.CORBAObject;
begin
  _Input.ReadObject(_Obj);
  Result := Narrow(_Obj, True)
end;

class procedure TEJBObjectHelper.Write(const _Output : CORBA.OutputStream; const _Value : ejb_sidl_javax_ejb_i.EJBObject);
begin
  _Output.WriteObject(_Value as CORBA.CORBAObject);
end;

class function TEJBObjectHelper.Narrow(const _Obj : CORBA.CORBAObject; _IsA : Boolean) : ejb_sidl_javax_ejb_i.EJBObject;
begin
  Result := nil;
  if (_Obj = nil) or (_Obj.QueryInterface(ejb_sidl_javax_ejb_i.EJBObject, Result) = 0) then
    exit;
  if _IsA and _Obj._IsA(RepositoryId) then
    Result := TEJBObjectStub.Create(_Obj);
end;

class function TEJBObjectHelper.Bind(const _InstanceName : string = ''; _HostName: string = '') : ejb_sidl_javax_ejb_i.EJBObject;
begin
  Result := Narrow(ORB.bind(RepositoryId, _InstanceName, _HostName), True);
end;

class function TEJBObjectHelper.Bind(_Options : BindOptions; const _InstanceName : string = ''; _HostName : string = '') : ejb_sidl_javax_ejb_i.EJBObject;
begin
  Result := Narrow(ORB.bind(RepositoryId, _Options, _InstanceName, _HostName), True);
end;

function  TEJBObjectStub.getEJBHome : ejb_sidl_javax_ejb_i.EJBHome;
var
  _Output: CORBA.OutputStream;
  _Input : CORBA.InputStream;
begin
  inherited _CreateRequest('getEJBHome',True, _Output);
  inherited _Invoke(_Output, _Input);
  Result := ejb_sidl_javax_ejb_c.TEJBHomeHelper.Read(_Input);
end;

function  TEJBObjectStub.getPrimaryKey : ANY;
var
  _Output: CORBA.OutputStream;
  _Input : CORBA.InputStream;
begin
  inherited _CreateRequest('getPrimaryKey',True, _Output);
  inherited _Invoke(_Output, _Input);
  _Input.ReadAny(Result);
end;

procedure TEJBObjectStub.remove ;
var
  _Output: CORBA.OutputStream;
  _Input : CORBA.InputStream;
begin
  inherited _CreateRequest('remove',True, _Output);
  inherited _Invoke(_Output, _Input);
end;


function  ECreateException._get_message : AnsiString;
begin
  Result := Fmessage;
end;


constructor ECreateException.Create;
begin
  inherited Create;
end;

constructor ECreateException.Create(const message : AnsiString);
begin
  inherited Create;
  Fmessage := message;
end;

procedure ECreateException.Copy(const _Input: InputStream);
begin
  _Input.ReadString(Fmessage);
end;

procedure ECreateException.WriteExceptionInfo(var _Output : OutputStream);
begin
  _Output.WriteString('IDL:borland.com/sidl/javax/ejb/CreateException:1.0');
  _Output.WriteString(Fmessage);
end;
function  CreateException_Factory: PExceptionProxy; cdecl;
begin
  with ejb_sidl_javax_ejb_c.ECreateException.Create() do Result := Proxy;
end;


function  EFinderException._get_message : AnsiString;
begin
  Result := Fmessage;
end;


constructor EFinderException.Create;
begin
  inherited Create;
end;

constructor EFinderException.Create(const message : AnsiString);
begin
  inherited Create;
  Fmessage := message;
end;

procedure EFinderException.Copy(const _Input: InputStream);
begin
  _Input.ReadString(Fmessage);
end;

procedure EFinderException.WriteExceptionInfo(var _Output : OutputStream);
begin
  _Output.WriteString('IDL:borland.com/sidl/javax/ejb/FinderException:1.0');
  _Output.WriteString(Fmessage);
end;
function  FinderException_Factory: PExceptionProxy; cdecl;
begin
  with ejb_sidl_javax_ejb_c.EFinderException.Create() do Result := Proxy;
end;


initialization
ejb_sidl_javax_ejb_c.RemoveExceptionDesc := RegisterUserException('RemoveException', 'IDL:borland.com/sidl/javax/ejb/RemoveException:1.0', @ejb_sidl_javax_ejb_c.RemoveException_Factory);
ejb_sidl_javax_ejb_c.CreateExceptionDesc := RegisterUserException('CreateException', 'IDL:borland.com/sidl/javax/ejb/CreateException:1.0', @ejb_sidl_javax_ejb_c.CreateException_Factory);
ejb_sidl_javax_ejb_c.FinderExceptionDesc := RegisterUserException('FinderException', 'IDL:borland.com/sidl/javax/ejb/FinderException:1.0', @ejb_sidl_javax_ejb_c.FinderException_Factory);


finalization
UnRegisterUserException(ejb_sidl_javax_ejb_c.RemoveExceptionDesc);
UnRegisterUserException(ejb_sidl_javax_ejb_c.CreateExceptionDesc);
UnRegisterUserException(ejb_sidl_javax_ejb_c.FinderExceptionDesc);


end.