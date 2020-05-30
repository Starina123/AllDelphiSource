{*******************************************************}
{                                                       }
{     Borland Visibroker for Delphi Event Service       }
{                                                       }
{       Copyright (C) 2000 Inprise Corporation          }
{                                                       }
{*******************************************************}

unit CosEvent;

interface

uses
  Corba;

type
  PushConsumer = interface;
  PushSupplier = interface;
  PullSupplier = interface;
  PullConsumer = interface;

  ProxyPushConsumer = interface;
  ProxyPullSupplier = interface;
  ProxyPullConsumer = interface;
  ProxyPushSupplier = interface;

  ConsumerAdmin = interface;
  SupplierAdmin = interface;
  EventChannel = interface;
  EventChannelFactory = interface;

  TPushConsumerSkeleton = class;
  TPushSupplierSkeleton = class;
  TPullSupplierSkeleton = class;
  TPullConsumerSkeleton = class;

  EAlreadyConnected = class;
  ETypeError = class;

  TProxyPushConsumerHelper = class;
  TProxyPushConsumerStub = class;
  TProxyPullSupplierHelper = class;
  TProxyPullSupplierStub = class;

  TProxyPullConsumerHelper = class;
  TProxyPullConsumerStub = class;

  TProxyPushSupplierHelper = class;
  TProxyPushSupplierStub = class;

  TConsumerAdminHelper = class;
  TConsumerAdminStub = class;
  TSupplierAdminHelper = class;
  TSupplierAdminStub = class;

  TEventChannelHelper = class;
  TEventChannelStub = class;
  TEventChannelFactoryHelper = class;
  TEventChannelFactoryStub = class;
  EEventChannelFactory_AlreadyExists = class;
  EEventChannelFactory_ChannelsExist = class;

  TProxyPushConsumerSkeleton = class;
  TProxyPullSupplierSkeleton = class;
  TProxyPullConsumerSkeleton = class;
  TProxyPushSupplierSkeleton = class;


  {COSEventComm Interfaces}

  PushConsumer = interface
    ['{6BF99512-DD5E-B16E-7E11-723C85DC32D9}']
    procedure push (const data : Any);
    procedure disconnect_push_consumer;
  end;

  PushSupplier = interface
    ['{6207B4E6-12A1-702D-77AD-95FB70D0E2AB}']
    procedure disconnect_push_supplier;
  end;

  PullSupplier = interface
    ['{13EFEF33-68C3-3939-A0E9-49D1A2687D8C}']
    function  pull : Any;
    function  try_pull (out has_event : Boolean): Any;
    procedure disconnect_pull_supplier;
  end;

  PullConsumer = interface
    ['{C64110B3-75A4-1803-CE09-F156406AD6BE}']
    procedure disconnect_pull_consumer;
  end;


  {COSEventChannelAdmin Interfaces}

  ProxyPushConsumer = interface (PushConsumer)
    ['{1003DEE9-3169-1C82-FF89-CCCDB9CA5992}']
    procedure connect_push_supplier (const push_supplier : PushSupplier);
  end;

  ProxyPullSupplier = interface (PullSupplier)
    ['{60DE1777-06E5-2789-01B7-846ED7061922}']
    procedure connect_pull_consumer (const pull_consumer : PullConsumer);
  end;

  ProxyPullConsumer = interface (PullConsumer)
    ['{871B33F7-6040-022D-E696-18F860CCC809}']
    procedure connect_pull_supplier (const pull_supplier : PullSupplier);
  end;

  ProxyPushSupplier = interface (PushSupplier)
    ['{620EDFDB-4806-C8DF-D027-BA5809220D70}']
    procedure connect_push_consumer (const push_consumer : PushConsumer);
  end;

  ConsumerAdmin = interface
    ['{5DDC5BD7-B78E-3056-67A0-5F60F13E9770}']
    function  obtain_push_supplier : ProxyPushSupplier;
    function  obtain_pull_supplier : ProxyPullSupplier;
  end;

  SupplierAdmin = interface
    ['{552AD0E8-C9A7-B75A-180D-466A33ADBDE6}']
    function  obtain_push_consumer : ProxyPushConsumer;
    function  obtain_pull_consumer : ProxyPullConsumer;
  end;

  EventChannel = interface
    ['{1CA5E6E6-A808-BE7B-9397-A759BA091C3B}']
    function  for_consumers : ConsumerAdmin;
    function  for_suppliers : SupplierAdmin;
    procedure _destroy;
  end;

  EventChannelFactory = interface
    ['{9F6E0C29-8A31-629E-5D89-DC159AC045C8}']
    function  _create : EventChannel;
    function  create_by_name (const name : AnsiString): EventChannel;
    function  lookup_by_name (const name : AnsiString): EventChannel;
    procedure _destroy;
  end;


  EDisconnected = class;
  TPushConsumerHelper = class;
  TPushConsumerStub = class;
  TPushSupplierHelper = class;
  TPushSupplierStub = class;
  TPullSupplierHelper = class;
  TPullSupplierStub = class;
  TPullConsumerHelper = class;
  TPullConsumerStub = class;

  EDisconnected = class(UserException)
  public
    constructor Create; overload;
    procedure Copy(const _Input : InputStream); override;
    procedure WriteExceptionInfo(var _Output : OutputStream); override;
  end;

  {Stub and Helper Classes }

  TPushConsumerHelper = class
    class procedure Insert (var _A: CORBA.Any; const _Value : PushConsumer);
    class function  Extract(var _A: CORBA.Any) : PushConsumer;
    class function  TypeCode     : CORBA.TypeCode;
    class function  RepositoryId : string;
    class function  Read (const _Input  : CORBA.InputStream) : PushConsumer;
    class procedure Write(const _Output : CORBA.OutputStream; const _Value : PushConsumer);
    class function  Narrow(const _Obj   : CORBA.CORBAObject; _IsA : Boolean = False) : PushConsumer;
    class function  Bind(const _InstanceName : string = ''; _HostName : string = '') : PushConsumer; overload;
    class function  Bind(_Options : BindOptions; const _InstanceName : string = ''; _HostName: string = '') : PushConsumer; overload;
  end;

  TPushConsumerStub = class(CORBA.TCORBAObject, PushConsumer)
  public
    procedure push (const data : Any); virtual;
    procedure disconnect_push_consumer ; virtual;
  end;

  TPushSupplierHelper = class
    class procedure Insert (var _A: CORBA.Any; const _Value : PushSupplier);
    class function  Extract(var _A: CORBA.Any) : PushSupplier;
    class function  TypeCode     : CORBA.TypeCode;
    class function  RepositoryId : string;
    class function  Read (const _Input  : CORBA.InputStream) : PushSupplier;
    class procedure Write(const _Output : CORBA.OutputStream; const _Value : PushSupplier);
    class function  Narrow(const _Obj   : CORBA.CORBAObject; _IsA : Boolean = False) : PushSupplier;
    class function  Bind(const _InstanceName : string = ''; _HostName : string = '') : PushSupplier; overload;
    class function  Bind(_Options : BindOptions; const _InstanceName : string = ''; _HostName: string = '') : PushSupplier; overload;
  end;

  TPushSupplierStub = class(CORBA.TCORBAObject, PushSupplier)
  public
    procedure disconnect_push_supplier; virtual;
  end;

  TPullSupplierHelper = class
    class procedure Insert (var _A: CORBA.Any; const _Value : PullSupplier);
    class function  Extract(var _A: CORBA.Any) : PullSupplier;
    class function  TypeCode     : CORBA.TypeCode;
    class function  RepositoryId : string;
    class function  Read (const _Input  : CORBA.InputStream) : PullSupplier;
    class procedure Write(const _Output : CORBA.OutputStream; const _Value : PullSupplier);
    class function  Narrow(const _Obj   : CORBA.CORBAObject; _IsA : Boolean = False) : PullSupplier;
    class function  Bind(const _InstanceName : string = ''; _HostName : string = '') : PullSupplier; overload;
    class function  Bind(_Options : BindOptions; const _InstanceName : string = ''; _HostName: string = '') : PullSupplier; overload;
  end;

  TPullSupplierStub = class(CORBA.TCORBAObject, PullSupplier)
  public
    function  pull : Any; virtual;
    function  try_pull (out has_event : Boolean): Any; virtual;
    procedure disconnect_pull_supplier ; virtual;
  end;

  TPullConsumerHelper = class
    class procedure Insert (var _A: CORBA.Any; const _Value : PullConsumer);
    class function  Extract(var _A: CORBA.Any) : PullConsumer;
    class function  TypeCode     : CORBA.TypeCode;
    class function  RepositoryId : string;
    class function  Read (const _Input  : CORBA.InputStream) : PullConsumer;
    class procedure Write(const _Output : CORBA.OutputStream; const _Value : PullConsumer);
    class function  Narrow(const _Obj   : CORBA.CORBAObject; _IsA : Boolean = False) : PullConsumer;
    class function  Bind(const _InstanceName : string = ''; _HostName : string = '') : PullConsumer; overload;
    class function  Bind(_Options : BindOptions; const _InstanceName : string = ''; _HostName: string = '') : PullConsumer; overload;
  end;

  TPullConsumerStub = class(CORBA.TCORBAObject, PullConsumer)
  public
    procedure disconnect_pull_consumer; virtual;
  end;

  {Skeleton Classes}

  TPushConsumerSkeleton = class(CORBA.TCorbaObject, PushConsumer)
  private
    FImplementation : PushConsumer;
  public
    constructor Create(const InstanceName: string; const Impl: PushConsumer);
    destructor Destroy; override;
    function GetImplementation : PushConsumer;
    procedure push(const data : Any);
    procedure disconnect_push_consumer;
  published
    procedure _push(const _Input: CORBA.InputStream; _Cookie: Pointer);
    procedure _disconnect_push_consumer(const _Input: CORBA.InputStream; _Cookie: Pointer);
  end;

  TPushSupplierSkeleton = class(CORBA.TCorbaObject, PushSupplier)
  private
    FImplementation : PushSupplier;
  public
    constructor Create(const InstanceName: string; const Impl: PushSupplier);
    destructor Destroy; override;
    function GetImplementation : PushSupplier;
    procedure disconnect_push_supplier;
  published
    procedure _disconnect_push_supplier(const _Input: CORBA.InputStream; _Cookie: Pointer);
  end;

  TPullSupplierSkeleton = class(CORBA.TCorbaObject, PullSupplier)
  private
    FImplementation : PullSupplier;
  public
    constructor Create(const InstanceName: string; const Impl: PullSupplier);
    destructor Destroy; override;
    function GetImplementation : PullSupplier;
    function  pull : Any;
    function  try_pull(out has_event : Boolean): Any;
    procedure disconnect_pull_supplier;
  published
    procedure _pull(const _Input: CORBA.InputStream; _Cookie: Pointer);
    procedure _try_pull(const _Input: CORBA.InputStream; _Cookie: Pointer);
    procedure _disconnect_pull_supplier(const _Input: CORBA.InputStream; _Cookie: Pointer);
  end;

  TPullConsumerSkeleton = class(CORBA.TCorbaObject, PullConsumer)
  private
    FImplementation : PullConsumer;
  public
    constructor Create(const InstanceName: string; const Impl: PullConsumer);
    destructor Destroy; override;
    function GetImplementation : PullConsumer;
    procedure disconnect_pull_consumer;
  published
    procedure _disconnect_pull_consumer(const _Input: CORBA.InputStream; _Cookie: Pointer);
  end;

  EAlreadyConnected = class(UserException)
  public
    constructor Create; overload;
    procedure Copy(const _Input : InputStream); override;
    procedure WriteExceptionInfo(var _Output : OutputStream); override;
  end;

  {Admin classes}

  ETypeError = class(UserException)
  public
    constructor Create; overload;
    procedure Copy(const _Input : InputStream); override;
    procedure WriteExceptionInfo(var _Output : OutputStream); override;
  end;

  TProxyPushConsumerHelper = class
    class procedure Insert (var _A: CORBA.Any; const _Value : ProxyPushConsumer);
    class function  Extract(var _A: CORBA.Any) : ProxyPushConsumer;
    class function  TypeCode     : CORBA.TypeCode;
    class function  RepositoryId : string;
    class function  Read (const _Input  : CORBA.InputStream) : ProxyPushConsumer;
    class procedure Write(const _Output : CORBA.OutputStream; const _Value : ProxyPushConsumer);
    class function  Narrow(const _Obj   : CORBA.CORBAObject; _IsA : Boolean = False) : ProxyPushConsumer;
    class function  Bind(const _InstanceName : string = ''; _HostName : string = '') : ProxyPushConsumer; overload;
    class function  Bind(_Options : BindOptions; const _InstanceName : string = ''; _HostName: string = '') : ProxyPushConsumer; overload;
  end;

  TProxyPushConsumerStub = class(CORBA.TCORBAObject, ProxyPushConsumer)
  public
    procedure connect_push_supplier ( const push_supplier : PushSupplier); virtual;
    procedure push ( const data : Any); virtual;
    procedure disconnect_push_consumer ; virtual;
  end;

  TProxyPullSupplierHelper = class
    class procedure Insert (var _A: CORBA.Any; const _Value : ProxyPullSupplier);
    class function  Extract(var _A: CORBA.Any) : ProxyPullSupplier;
    class function  TypeCode     : CORBA.TypeCode;
    class function  RepositoryId : string;
    class function  Read (const _Input  : CORBA.InputStream) : ProxyPullSupplier;
    class procedure Write(const _Output : CORBA.OutputStream; const _Value : ProxyPullSupplier);
    class function  Narrow(const _Obj   : CORBA.CORBAObject; _IsA : Boolean = False) : ProxyPullSupplier;
    class function  Bind(const _InstanceName : string = ''; _HostName : string = '') : ProxyPullSupplier; overload;
    class function  Bind(_Options : BindOptions; const _InstanceName : string = ''; _HostName: string = '') : ProxyPullSupplier; overload;
  end;

  TProxyPullSupplierStub = class(CORBA.TCORBAObject, ProxyPullSupplier)
  public
    procedure connect_pull_consumer ( const pull_consumer : PullConsumer); virtual;
    function  pull : Any; virtual;
    function  try_pull ( out   has_event : Boolean): Any; virtual;
    procedure disconnect_pull_supplier ; virtual;
  end;

  TProxyPullConsumerHelper = class
    class procedure Insert (var _A: CORBA.Any; const _Value : ProxyPullConsumer);
    class function  Extract(var _A: CORBA.Any) : ProxyPullConsumer;
    class function  TypeCode     : CORBA.TypeCode;
    class function  RepositoryId : string;
    class function  Read (const _Input  : CORBA.InputStream) : ProxyPullConsumer;
    class procedure Write(const _Output : CORBA.OutputStream; const _Value : ProxyPullConsumer);
    class function  Narrow(const _Obj   : CORBA.CORBAObject; _IsA : Boolean = False) : ProxyPullConsumer;
    class function  Bind(const _InstanceName : string = ''; _HostName : string = '') : ProxyPullConsumer; overload;
    class function  Bind(_Options : BindOptions; const _InstanceName : string = ''; _HostName: string = '') : ProxyPullConsumer; overload;
  end;

  TProxyPullConsumerStub = class(CORBA.TCORBAObject, ProxyPullConsumer)
  public
    procedure connect_pull_supplier ( const pull_supplier : PullSupplier); virtual;
    procedure disconnect_pull_consumer ; virtual;
  end;

  TProxyPushSupplierHelper = class
    class procedure Insert (var _A: CORBA.Any; const _Value : ProxyPushSupplier);
    class function  Extract(var _A: CORBA.Any) : ProxyPushSupplier;
    class function  TypeCode     : CORBA.TypeCode;
    class function  RepositoryId : string;
    class function  Read (const _Input  : CORBA.InputStream) : ProxyPushSupplier;
    class procedure Write(const _Output : CORBA.OutputStream; const _Value : ProxyPushSupplier);
    class function  Narrow(const _Obj   : CORBA.CORBAObject; _IsA : Boolean = False) : ProxyPushSupplier;
    class function  Bind(const _InstanceName : string = ''; _HostName : string = '') : ProxyPushSupplier; overload;
    class function  Bind(_Options : BindOptions; const _InstanceName : string = ''; _HostName: string = '') : ProxyPushSupplier; overload;
  end;

  TProxyPushSupplierStub = class(CORBA.TCORBAObject, ProxyPushSupplier)
  public
    procedure connect_push_consumer ( const push_consumer : PushConsumer); virtual;
    procedure disconnect_push_supplier ; virtual;
  end;

  TConsumerAdminHelper = class
    class procedure Insert (var _A: CORBA.Any; const _Value : ConsumerAdmin);
    class function  Extract(var _A: CORBA.Any) : ConsumerAdmin;
    class function  TypeCode     : CORBA.TypeCode;
    class function  RepositoryId : string;
    class function  Read (const _Input  : CORBA.InputStream) : ConsumerAdmin;
    class procedure Write(const _Output : CORBA.OutputStream; const _Value : ConsumerAdmin);
    class function  Narrow(const _Obj   : CORBA.CORBAObject; _IsA : Boolean = False) : ConsumerAdmin;
    class function  Bind(const _InstanceName : string = ''; _HostName : string = '') : ConsumerAdmin; overload;
    class function  Bind(_Options : BindOptions; const _InstanceName : string = ''; _HostName: string = '') : ConsumerAdmin; overload;
  end;

  TConsumerAdminStub = class(CORBA.TCORBAObject, ConsumerAdmin)
  public
    function  obtain_push_supplier : ProxyPushSupplier; virtual;
    function  obtain_pull_supplier : ProxyPullSupplier; virtual;
  end;

  TSupplierAdminHelper = class
    class procedure Insert (var _A: CORBA.Any; const _Value : SupplierAdmin);
    class function  Extract(var _A: CORBA.Any) : SupplierAdmin;
    class function  TypeCode     : CORBA.TypeCode;
    class function  RepositoryId : string;
    class function  Read (const _Input  : CORBA.InputStream) : SupplierAdmin;
    class procedure Write(const _Output : CORBA.OutputStream; const _Value : SupplierAdmin);
    class function  Narrow(const _Obj   : CORBA.CORBAObject; _IsA : Boolean = False) : SupplierAdmin;
    class function  Bind(const _InstanceName : string = ''; _HostName : string = '') : SupplierAdmin; overload;
    class function  Bind(_Options : BindOptions; const _InstanceName : string = ''; _HostName: string = '') : SupplierAdmin; overload;
  end;

  TSupplierAdminStub = class(CORBA.TCORBAObject, SupplierAdmin)
  public
    function  obtain_push_consumer : ProxyPushConsumer; virtual;
    function  obtain_pull_consumer : ProxyPullConsumer; virtual;
  end;

  TEventChannelHelper = class
    class procedure Insert (var _A: CORBA.Any; const _Value : EventChannel);
    class function  Extract(var _A: CORBA.Any) : EventChannel;
    class function  TypeCode     : CORBA.TypeCode;
    class function  RepositoryId : string;
    class function  Read (const _Input  : CORBA.InputStream) : EventChannel;
    class procedure Write(const _Output : CORBA.OutputStream; const _Value : EventChannel);
    class function  Narrow(const _Obj   : CORBA.CORBAObject; _IsA : Boolean = False) : EventChannel;
    class function  Bind(const _InstanceName : string = ''; _HostName : string = '') : EventChannel; overload;
    class function  Bind(_Options : BindOptions; const _InstanceName : string = ''; _HostName: string = '') : EventChannel; overload;
  end;

  TEventChannelStub = class(CORBA.TCORBAObject, EventChannel)
  public
    function  for_consumers : ConsumerAdmin; virtual;
    function  for_suppliers : SupplierAdmin; virtual;
    procedure _destroy ; virtual;
  end;

  TEventChannelFactoryHelper = class
    class procedure Insert (var _A: CORBA.Any; const _Value : EventChannelFactory);
    class function  Extract(var _A: CORBA.Any) : EventChannelFactory;
    class function  TypeCode     : CORBA.TypeCode;
    class function  RepositoryId : string;
    class function  Read (const _Input  : CORBA.InputStream) : EventChannelFactory;
    class procedure Write(const _Output : CORBA.OutputStream; const _Value : EventChannelFactory);
    class function  Narrow(const _Obj   : CORBA.CORBAObject; _IsA : Boolean = False) : EventChannelFactory;
    class function  Bind(const _InstanceName : string = ''; _HostName : string = '') : EventChannelFactory; overload;
    class function  Bind(_Options : BindOptions; const _InstanceName : string = ''; _HostName: string = '') : EventChannelFactory; overload;
  end;

  TEventChannelFactoryStub = class(CORBA.TCORBAObject, EventChannelFactory)
  public
    function  _create : EventChannel; virtual;
    function  create_by_name ( const name : AnsiString): EventChannel; virtual;
    function  lookup_by_name ( const name : AnsiString): EventChannel; virtual;
    procedure _destroy ; virtual;
  end;

  EEventChannelFactory_AlreadyExists = class(UserException)
  public
    constructor Create; overload;
    procedure Copy(const _Input : InputStream); override;
    procedure WriteExceptionInfo(var _Output : OutputStream); override;
  end;

  EEventChannelFactory_ChannelsExist = class(UserException)
  public
    constructor Create; overload;
    procedure Copy(const _Input : InputStream); override;
    procedure WriteExceptionInfo(var _Output : OutputStream); override;
  end;

  TProxyPushConsumerSkeleton = class(CORBA.TCorbaObject)
  private
    FImplementation : ProxyPushConsumer;
  public
    constructor Create(const InstanceName: string; const Impl: ProxyPushConsumer);
    destructor Destroy; override;
    function GetImplementation : ProxyPushConsumer;
    procedure connect_push_supplier ( const push_supplier : PushSupplier);
    procedure push ( const data : Any);
    procedure disconnect_push_consumer ;
  published
    procedure _connect_push_supplier(const _Input: CORBA.InputStream; _Cookie: Pointer);
    procedure _push(const _Input: CORBA.InputStream; _Cookie: Pointer);
    procedure _disconnect_push_consumer(const _Input: CORBA.InputStream; _Cookie: Pointer);
  end;

  TProxyPullSupplierSkeleton = class(CORBA.TCorbaObject)
  private
    FImplementation : ProxyPullSupplier;
  public
    constructor Create(const InstanceName: string; const Impl: ProxyPullSupplier);
    destructor Destroy; override;
    function GetImplementation : ProxyPullSupplier;
    procedure connect_pull_consumer ( const pull_consumer : PullConsumer);
    function  pull : Any;
    function  try_pull ( out   has_event : Boolean): Any;
    procedure disconnect_pull_supplier ;
  published
    procedure _connect_pull_consumer(const _Input: CORBA.InputStream; _Cookie: Pointer);
    procedure _pull(const _Input: CORBA.InputStream; _Cookie: Pointer);
    procedure _try_pull(const _Input: CORBA.InputStream; _Cookie: Pointer);
    procedure _disconnect_pull_supplier(const _Input: CORBA.InputStream; _Cookie: Pointer);
  end;

  TProxyPullConsumerSkeleton = class(CORBA.TCorbaObject)
  private
    FImplementation : ProxyPullConsumer;
  public
    constructor Create(const InstanceName: string; const Impl: ProxyPullConsumer);
    destructor Destroy; override;
    function GetImplementation : ProxyPullConsumer;
    procedure connect_pull_supplier ( const pull_supplier : PullSupplier);
    procedure disconnect_pull_consumer ;
  published
    procedure _connect_pull_supplier(const _Input: CORBA.InputStream; _Cookie: Pointer);
    procedure _disconnect_pull_consumer(const _Input: CORBA.InputStream; _Cookie: Pointer);
  end;

  TProxyPushSupplierSkeleton = class(CORBA.TCorbaObject)
  private
    FImplementation : ProxyPushSupplier;
  public
    constructor Create(const InstanceName: string; const Impl: ProxyPushSupplier);
    destructor Destroy; override;
    function GetImplementation : ProxyPushSupplier;
    procedure connect_push_consumer ( const push_consumer : PushConsumer);
    procedure disconnect_push_supplier ;
  published
    procedure _connect_push_consumer(const _Input: CORBA.InputStream; _Cookie: Pointer);
    procedure _disconnect_push_supplier(const _Input: CORBA.InputStream; _Cookie: Pointer);
  end;

implementation

var
  DisconnectedDesc : PExceptionDescription;
  AlreadyConnectedDesc : PExceptionDescription;
  TypeErrorDesc : PExceptionDescription;
  EventChannelFactory_AlreadyExistsDesc : PExceptionDescription;
  EventChannelFactory_ChannelsExistDesc : PExceptionDescription;

constructor EDisconnected.Create;
begin
  inherited Create;
end;

procedure EDisconnected.Copy(const _Input: InputStream);
begin
end;

procedure EDisconnected.WriteExceptionInfo(var _Output : OutputStream);
begin
  _Output.WriteString('IDL:omg.org/CosEventComm/Disconnected:1.0');
end;

function  Disconnected_Factory: PExceptionProxy; cdecl;
begin
  with EDisconnected.Create() do Result := Proxy;
end;

class procedure TPushConsumerHelper.Insert(var _A : CORBA.Any; const _Value : PushConsumer);
begin
  _A := Orb.MakeObjectRef( TPushConsumerHelper.TypeCode, _Value as CORBA.CORBAObject);
end;

class function TPushConsumerHelper.Extract(var _A : CORBA.Any): PushConsumer;
var
  _obj : Corba.CorbaObject;
begin
  _obj := Orb.GetObjectRef(_A);
  Result := TPushConsumerHelper.Narrow(_obj, True);
end;

class function TPushConsumerHelper.TypeCode : CORBA.TypeCode;
begin
  Result := ORB.CreateInterfaceTC(RepositoryId, 'PushConsumer');
end;

class function TPushConsumerHelper.RepositoryId : string;
begin
  Result := 'IDL:omg.org/CosEventComm/PushConsumer:1.0';
end;

class function TPushConsumerHelper.Read(const _Input : CORBA.InputStream) : PushConsumer;
var
  _Obj : CORBA.CORBAObject;
begin
  _Input.ReadObject(_Obj);
  Result := Narrow(_Obj, True);
end;

class procedure TPushConsumerHelper.Write(const _Output : CORBA.OutputStream; const _Value : PushConsumer);
begin
  _Output.WriteObject(_Value as CORBA.CORBAObject);
end;

class function TPushConsumerHelper.Narrow(const _Obj : CORBA.CORBAObject; _IsA : Boolean) : PushConsumer;
begin
  Result := nil;
  if (_Obj = nil) or (_Obj.QueryInterface(PushConsumer, Result) = 0) then
    exit;
  if _IsA and _Obj._IsA(RepositoryId) then
    Result := TPushConsumerStub.Create(_Obj);
end;

class function TPushConsumerHelper.Bind(const _InstanceName : string = ''; _HostName: string = '') : PushConsumer;
begin
  Result := Narrow(ORB.bind(RepositoryId, _InstanceName, _HostName), True);
end;

class function TPushConsumerHelper.Bind(_Options : BindOptions; const _InstanceName : string = ''; _HostName : string = '') : PushConsumer;
begin
  Result := Narrow(ORB.bind(RepositoryId, _Options, _InstanceName, _HostName), True);
end;

procedure TPushConsumerStub.push(const data : Any);
var
  _Output: CORBA.OutputStream;
  _Input : CORBA.InputStream;
begin
  inherited _CreateRequest('push',True, _Output);
  _Output.WriteAny(data);
  inherited _Invoke(_Output, _Input);
end;

procedure TPushConsumerStub.disconnect_push_consumer;
var
  _Output: CORBA.OutputStream;
  _Input : CORBA.InputStream;
begin
  inherited _CreateRequest('disconnect_push_consumer',True, _Output);
  inherited _Invoke(_Output, _Input);
end;

class procedure TPushSupplierHelper.Insert(var _A : CORBA.Any; const _Value : PushSupplier);
begin
  _A := Orb.MakeObjectRef( TPushSupplierHelper.TypeCode, _Value as CORBA.CORBAObject);
end;

class function TPushSupplierHelper.Extract(var _A : CORBA.Any): PushSupplier;
var
  _obj : Corba.CorbaObject;
begin
  _obj := Orb.GetObjectRef(_A);
  Result := TPushSupplierHelper.Narrow(_obj, True);
end;

class function TPushSupplierHelper.TypeCode : CORBA.TypeCode;
begin
  Result := ORB.CreateInterfaceTC(RepositoryId, 'PushSupplier');
end;

class function TPushSupplierHelper.RepositoryId : string;
begin
  Result := 'IDL:omg.org/CosEventComm/PushSupplier:1.0';
end;

class function TPushSupplierHelper.Read(const _Input : CORBA.InputStream) : PushSupplier;
var
  _Obj : CORBA.CORBAObject;
begin
  _Input.ReadObject(_Obj);
  Result := Narrow(_Obj, True);
end;

class procedure TPushSupplierHelper.Write(const _Output : CORBA.OutputStream; const _Value : PushSupplier);
begin
  _Output.WriteObject(_Value as CORBA.CORBAObject);
end;

class function TPushSupplierHelper.Narrow(const _Obj : CORBA.CORBAObject; _IsA : Boolean) : PushSupplier;
begin
  Result := nil;
  if (_Obj = nil) or (_Obj.QueryInterface(PushSupplier, Result) = 0) then
    exit;
  if _IsA and _Obj._IsA(RepositoryId) then
    Result := TPushSupplierStub.Create(_Obj);
end;

class function TPushSupplierHelper.Bind(const _InstanceName : string = ''; _HostName: string = '') : PushSupplier;
begin
  Result := Narrow(ORB.bind(RepositoryId, _InstanceName, _HostName), True);
end;

class function TPushSupplierHelper.Bind(_Options : BindOptions; const _InstanceName : string = ''; _HostName : string = '') : PushSupplier;
begin
  Result := Narrow(ORB.bind(RepositoryId, _Options, _InstanceName, _HostName), True);
end;

procedure TPushSupplierStub.disconnect_push_supplier;
var
  _Output: CORBA.OutputStream;
  _Input : CORBA.InputStream;
begin
  inherited _CreateRequest('disconnect_push_supplier',True, _Output);
  inherited _Invoke(_Output, _Input);
end;

class procedure TPullSupplierHelper.Insert(var _A : CORBA.Any; const _Value : PullSupplier);
begin
  _A := Orb.MakeObjectRef( TPullSupplierHelper.TypeCode, _Value as CORBA.CORBAObject);
end;

class function TPullSupplierHelper.Extract(var _A : CORBA.Any): PullSupplier;
var
  _obj : Corba.CorbaObject;
begin
  _obj := Orb.GetObjectRef(_A);
  Result := TPullSupplierHelper.Narrow(_obj, True);
end;

class function TPullSupplierHelper.TypeCode : CORBA.TypeCode;
begin
  Result := ORB.CreateInterfaceTC(RepositoryId, 'PullSupplier');
end;

class function TPullSupplierHelper.RepositoryId : string;
begin
  Result := 'IDL:omg.org/CosEventComm/PullSupplier:1.0';
end;

class function TPullSupplierHelper.Read(const _Input : CORBA.InputStream) : PullSupplier;
var
  _Obj : CORBA.CORBAObject;
begin
  _Input.ReadObject(_Obj);
  Result := Narrow(_Obj, True);
end;

class procedure TPullSupplierHelper.Write(const _Output : CORBA.OutputStream; const _Value : PullSupplier);
begin
  _Output.WriteObject(_Value as CORBA.CORBAObject);
end;

class function TPullSupplierHelper.Narrow(const _Obj : CORBA.CORBAObject; _IsA : Boolean) : PullSupplier;
begin
  Result := nil;
  if (_Obj = nil) or (_Obj.QueryInterface(PullSupplier, Result) = 0) then
    exit;
  if _IsA and _Obj._IsA(RepositoryId) then
    Result := TPullSupplierStub.Create(_Obj);
end;

class function TPullSupplierHelper.Bind(const _InstanceName : string = ''; _HostName: string = '') : PullSupplier;
begin
  Result := Narrow(ORB.bind(RepositoryId, _InstanceName, _HostName), True);
end;

class function TPullSupplierHelper.Bind(_Options : BindOptions; const _InstanceName : string = ''; _HostName : string = '') : PullSupplier;
begin
  Result := Narrow(ORB.bind(RepositoryId, _Options, _InstanceName, _HostName), True);
end;

function  TPullSupplierStub.pull : Any;
var
  _Output: CORBA.OutputStream;
  _Input : CORBA.InputStream;
begin
  inherited _CreateRequest('pull',True, _Output);
  inherited _Invoke(_Output, _Input);
  _Input.ReadAny(Result);
end;

function  TPullSupplierStub.try_pull(out has_event : Boolean): Any;
var
  _Output: CORBA.OutputStream;
  _Input : CORBA.InputStream;
begin
  inherited _CreateRequest('try_pull',True, _Output);
  inherited _Invoke(_Output, _Input);
  _Input.ReadAny(Result);
  _Input.ReadBoolean(has_event);
end;

procedure TPullSupplierStub.disconnect_pull_supplier;
var
  _Output: CORBA.OutputStream;
  _Input : CORBA.InputStream;
begin
  inherited _CreateRequest('disconnect_pull_supplier',True, _Output);
  inherited _Invoke(_Output, _Input);
end;

class procedure TPullConsumerHelper.Insert(var _A : CORBA.Any; const _Value : PullConsumer);
begin
  _A := Orb.MakeObjectRef(TPullConsumerHelper.TypeCode, _Value as CORBA.CORBAObject);
end;

class function TPullConsumerHelper.Extract(var _A : CORBA.Any): PullConsumer;
var
  _obj : Corba.CorbaObject;
begin
  _obj := Orb.GetObjectRef(_A);
  Result := TPullConsumerHelper.Narrow(_obj, True);
end;

class function TPullConsumerHelper.TypeCode : CORBA.TypeCode;
begin
  Result := ORB.CreateInterfaceTC(RepositoryId, 'PullConsumer');
end;

class function TPullConsumerHelper.RepositoryId : string;
begin
  Result := 'IDL:omg.org/CosEventComm/PullConsumer:1.0';
end;

class function TPullConsumerHelper.Read(const _Input : CORBA.InputStream) : PullConsumer;
var
  _Obj : CORBA.CORBAObject;
begin
  _Input.ReadObject(_Obj);
  Result := Narrow(_Obj, True);
end;

class procedure TPullConsumerHelper.Write(const _Output : CORBA.OutputStream; const _Value : PullConsumer);
begin
  _Output.WriteObject(_Value as CORBA.CORBAObject);
end;

class function TPullConsumerHelper.Narrow(const _Obj : CORBA.CORBAObject; _IsA : Boolean) : PullConsumer;
begin
  Result := nil;
  if (_Obj = nil) or (_Obj.QueryInterface(PullConsumer, Result) = 0) then
    exit;
  if _IsA and _Obj._IsA(RepositoryId) then
    Result := TPullConsumerStub.Create(_Obj);
end;

class function TPullConsumerHelper.Bind(const _InstanceName : string = ''; _HostName: string = '') : PullConsumer;
begin
  Result := Narrow(ORB.bind(RepositoryId, _InstanceName, _HostName), True);
end;

class function TPullConsumerHelper.Bind(_Options : BindOptions; const _InstanceName : string = ''; _HostName : string = '') : PullConsumer;
begin
  Result := Narrow(ORB.bind(RepositoryId, _Options, _InstanceName, _HostName), True);
end;

procedure TPullConsumerStub.disconnect_pull_consumer ;
var
  _Output: CORBA.OutputStream;
  _Input : CORBA.InputStream;
begin
  inherited _CreateRequest('disconnect_pull_consumer',True, _Output);
  inherited _Invoke(_Output, _Input);
end;

{Skeleton Implementations}

constructor TPushConsumerSkeleton.Create(const InstanceName : string; const Impl : PushConsumer);
begin
  inherited CreateSkeleton(InstanceName, 'PushConsumer', 'IDL:omg.org/CosEventComm/PushConsumer:1.0');
  FImplementation := Impl;
end;

destructor TPushConsumerSkeleton.Destroy;
begin
  FImplementation := nil;
end;

function TPushConsumerSkeleton.GetImplementation : PushConsumer;
begin
  result := FImplementation as PushConsumer;
end;

procedure TPushConsumerSkeleton.push(const data : Any);
begin
  FImplementation.push(data);
end;

procedure TPushConsumerSkeleton.disconnect_push_consumer;
begin
  FImplementation.disconnect_push_consumer;
end;

procedure TPushConsumerSkeleton._push(const _Input: CORBA.InputStream; _Cookie: Pointer);
var
  _Output : CORBA.OutputStream;
  _data : Any;
begin
  _Input.ReadAny(_data);
  try
    push(_data);
  except on E: UserException do
    begin
      GetExceptionReplyBuffer(_Cookie, _Output);
      E.WriteExceptionInfo(_Output);
      exit;
    end;
  end;
  GetReplyBuffer(_Cookie, _Output);
end;

procedure TPushConsumerSkeleton._disconnect_push_consumer(const _Input: CORBA.InputStream; _Cookie: Pointer);
var
  _Output : CORBA.OutputStream;
begin
  disconnect_push_consumer;
  GetReplyBuffer(_Cookie, _Output);
end;

constructor TPushSupplierSkeleton.Create(const InstanceName : string; const Impl : PushSupplier);
begin
  inherited CreateSkeleton(InstanceName, 'PushSupplier', 'IDL:omg.org/CosEventComm/PushSupplier:1.0');
  FImplementation := Impl;
end;

destructor TPushSupplierSkeleton.Destroy;
begin
  FImplementation := nil;
end;

function TPushSupplierSkeleton.GetImplementation : PushSupplier;
begin
  result := FImplementation as PushSupplier;
end;

procedure TPushSupplierSkeleton.disconnect_push_supplier ;
begin
  FImplementation.disconnect_push_supplier;
end;

procedure TPushSupplierSkeleton._disconnect_push_supplier(const _Input: CORBA.InputStream; _Cookie: Pointer);
var
  _Output : CORBA.OutputStream;
begin
  disconnect_push_supplier;
  GetReplyBuffer(_Cookie, _Output);
end;

constructor TPullSupplierSkeleton.Create(const InstanceName : string; const Impl : PullSupplier);
begin
  inherited CreateSkeleton(InstanceName, 'PullSupplier', 'IDL:omg.org/CosEventComm/PullSupplier:1.0');
  FImplementation := Impl;
end;

destructor TPullSupplierSkeleton.Destroy;
begin
  FImplementation := nil;
end;

function TPullSupplierSkeleton.GetImplementation : PullSupplier;
begin
  result := FImplementation as PullSupplier;
end;

function  TPullSupplierSkeleton.pull : Any;
begin
  Result := FImplementation.pull;
end;

function  TPullSupplierSkeleton.try_pull ( out   has_event : Boolean): Any;
begin
  Result := FImplementation.try_pull( has_event);
end;

procedure TPullSupplierSkeleton.disconnect_pull_supplier ;
begin
  FImplementation.disconnect_pull_supplier;
end;

procedure TPullSupplierSkeleton._pull(const _Input: CORBA.InputStream; _Cookie: Pointer);
var
  _Output : CORBA.OutputStream;
  _Result : Any;
begin
  try
    _Result := pull;
  except on E: UserException do
    begin
      GetExceptionReplyBuffer(_Cookie, _Output);
      E.WriteExceptionInfo(_Output);
      exit;
    end;
  end;
  GetReplyBuffer(_Cookie, _Output);
  _Output.WriteAny(_Result);
end;

procedure TPullSupplierSkeleton._try_pull(const _Input: CORBA.InputStream; _Cookie: Pointer);
var
  _Output : CORBA.OutputStream;
  _has_event : Boolean;
  _Result : Any;
begin
  try
    _Result := try_pull( _has_event);
  except on E: UserException do
    begin
      GetExceptionReplyBuffer(_Cookie, _Output);
      E.WriteExceptionInfo(_Output);
      exit;
    end;
  end;
  GetReplyBuffer(_Cookie, _Output);
  _Output.WriteAny(_Result);
  _Output.WriteBoolean(_has_event);
end;

procedure TPullSupplierSkeleton._disconnect_pull_supplier(const _Input: CORBA.InputStream; _Cookie: Pointer);
var
  _Output : CORBA.OutputStream;
begin
  disconnect_pull_supplier;
  GetReplyBuffer(_Cookie, _Output);
end;

constructor TPullConsumerSkeleton.Create(const InstanceName : string; const Impl : PullConsumer);
begin
  inherited CreateSkeleton(InstanceName, 'PullConsumer', 'IDL:omg.org/CosEventComm/PullConsumer:1.0');
  FImplementation := Impl;
end;

destructor TPullConsumerSkeleton.Destroy;
begin
  FImplementation := nil;
end;

function TPullConsumerSkeleton.GetImplementation : PullConsumer;
begin
  result := FImplementation as PullConsumer;
end;

procedure TPullConsumerSkeleton.disconnect_pull_consumer ;
begin
  FImplementation.disconnect_pull_consumer;
end;

procedure TPullConsumerSkeleton._disconnect_pull_consumer(const _Input: CORBA.InputStream; _Cookie: Pointer);
var
  _Output : CORBA.OutputStream;
begin
  disconnect_pull_consumer;
  GetReplyBuffer(_Cookie, _Output);
end;

constructor EAlreadyConnected.Create;
begin
  inherited Create;
end;

procedure EAlreadyConnected.Copy(const _Input: InputStream);
begin
end;

procedure EAlreadyConnected.WriteExceptionInfo(var _Output : OutputStream);
begin
  _Output.WriteString('IDL:omg.org/CosEventChannelAdmin/AlreadyConnected:1.0');
end;
function  AlreadyConnected_Factory: PExceptionProxy; cdecl;
begin
  with EAlreadyConnected.Create() do Result := Proxy;
end;

constructor ETypeError.Create;
begin
  inherited Create;
end;

procedure ETypeError.Copy(const _Input: InputStream);
begin
end;

procedure ETypeError.WriteExceptionInfo(var _Output : OutputStream);
begin
  _Output.WriteString('IDL:omg.org/CosEventChannelAdmin/TypeError:1.0');
end;
function  TypeError_Factory: PExceptionProxy; cdecl;
begin
  with ETypeError.Create() do Result := Proxy;
end;

class procedure TProxyPushConsumerHelper.Insert(var _A : CORBA.Any; const _Value : ProxyPushConsumer);
begin
  _A := Orb.MakeObjectRef( TProxyPushConsumerHelper.TypeCode, _Value as CORBA.CORBAObject);
end;

class function TProxyPushConsumerHelper.Extract(var _A : CORBA.Any): ProxyPushConsumer;
var
  _obj : Corba.CorbaObject;
begin
  _obj := Orb.GetObjectRef(_A);
  Result := TProxyPushConsumerHelper.Narrow(_obj, True);
end;

class function TProxyPushConsumerHelper.TypeCode : CORBA.TypeCode;
begin
  Result := ORB.CreateInterfaceTC(RepositoryId, 'ProxyPushConsumer');
end;

class function TProxyPushConsumerHelper.RepositoryId : string;
begin
  Result := 'IDL:omg.org/CosEventChannelAdmin/ProxyPushConsumer:1.0';
end;

class function TProxyPushConsumerHelper.Read(const _Input : CORBA.InputStream) : ProxyPushConsumer;
var
  _Obj : CORBA.CORBAObject;
begin
  _Input.ReadObject(_Obj);
  Result := Narrow(_Obj, True);
end;

class procedure TProxyPushConsumerHelper.Write(const _Output : CORBA.OutputStream; const _Value : ProxyPushConsumer);
begin
  _Output.WriteObject(_Value as CORBA.CORBAObject);
end;

class function TProxyPushConsumerHelper.Narrow(const _Obj : CORBA.CORBAObject; _IsA : Boolean) : ProxyPushConsumer;
begin
  Result := nil;
  if (_Obj = nil) or (_Obj.QueryInterface(ProxyPushConsumer, Result) = 0) then
    exit;
  if _IsA and _Obj._IsA(RepositoryId) then
    Result := TProxyPushConsumerStub.Create(_Obj);
end;

class function TProxyPushConsumerHelper.Bind(const _InstanceName : string = ''; _HostName: string = '') : ProxyPushConsumer;
begin
  Result := Narrow(ORB.bind(RepositoryId, _InstanceName, _HostName), True);
end;

class function TProxyPushConsumerHelper.Bind(_Options : BindOptions; const _InstanceName : string = ''; _HostName : string = '') : ProxyPushConsumer;
begin
  Result := Narrow(ORB.bind(RepositoryId, _Options, _InstanceName, _HostName), True);
end;

procedure TProxyPushConsumerStub.connect_push_supplier ( const push_supplier : PushSupplier);
var
  _Output: CORBA.OutputStream;
  _Input : CORBA.InputStream;
begin
  inherited _CreateRequest('connect_push_supplier',True, _Output);
  TPushSupplierHelper.Write(_Output, push_supplier);
  inherited _Invoke(_Output, _Input);
end;

procedure TProxyPushConsumerStub.push ( const data : Any);
var
  _Output: CORBA.OutputStream;
  _Input : CORBA.InputStream;
begin
  inherited _CreateRequest('push',True, _Output);
  _Output.WriteAny(data);
  inherited _Invoke(_Output, _Input);
end;

procedure TProxyPushConsumerStub.disconnect_push_consumer ;
var
  _Output: CORBA.OutputStream;
  _Input : CORBA.InputStream;
begin
  inherited _CreateRequest('disconnect_push_consumer',True, _Output);
  inherited _Invoke(_Output, _Input);
end;

class procedure TProxyPullSupplierHelper.Insert(var _A : CORBA.Any; const _Value : ProxyPullSupplier);
begin
  _A := Orb.MakeObjectRef( TProxyPullSupplierHelper.TypeCode, _Value as CORBA.CORBAObject);
end;

class function TProxyPullSupplierHelper.Extract(var _A : CORBA.Any): ProxyPullSupplier;
var
  _obj : Corba.CorbaObject;
begin
  _obj := Orb.GetObjectRef(_A);
  Result := TProxyPullSupplierHelper.Narrow(_obj, True);
end;

class function TProxyPullSupplierHelper.TypeCode : CORBA.TypeCode;
begin
  Result := ORB.CreateInterfaceTC(RepositoryId, 'ProxyPullSupplier');
end;

class function TProxyPullSupplierHelper.RepositoryId : string;
begin
  Result := 'IDL:omg.org/CosEventChannelAdmin/ProxyPullSupplier:1.0';
end;

class function TProxyPullSupplierHelper.Read(const _Input : CORBA.InputStream) : ProxyPullSupplier;
var
  _Obj : CORBA.CORBAObject;
begin
  _Input.ReadObject(_Obj);
  Result := Narrow(_Obj, True);
end;

class procedure TProxyPullSupplierHelper.Write(const _Output : CORBA.OutputStream; const _Value : ProxyPullSupplier);
begin
  _Output.WriteObject(_Value as CORBA.CORBAObject);
end;

class function TProxyPullSupplierHelper.Narrow(const _Obj : CORBA.CORBAObject; _IsA : Boolean) : ProxyPullSupplier;
begin
  Result := nil;
  if (_Obj = nil) or (_Obj.QueryInterface(ProxyPullSupplier, Result) = 0) then
    exit;
  if _IsA and _Obj._IsA(RepositoryId) then
    Result := TProxyPullSupplierStub.Create(_Obj);
end;

class function TProxyPullSupplierHelper.Bind(const _InstanceName : string = ''; _HostName: string = '') : ProxyPullSupplier;
begin
  Result := Narrow(ORB.bind(RepositoryId, _InstanceName, _HostName), True);
end;

class function TProxyPullSupplierHelper.Bind(_Options : BindOptions; const _InstanceName : string = ''; _HostName : string = '') : ProxyPullSupplier;
begin
  Result := Narrow(ORB.bind(RepositoryId, _Options, _InstanceName, _HostName), True);
end;

procedure TProxyPullSupplierStub.connect_pull_consumer ( const pull_consumer : PullConsumer);
var
  _Output: CORBA.OutputStream;
  _Input : CORBA.InputStream;
begin
  inherited _CreateRequest('connect_pull_consumer',True, _Output);
  TPullConsumerHelper.Write(_Output, pull_consumer);
  inherited _Invoke(_Output, _Input);
end;

function  TProxyPullSupplierStub.pull : Any;
var
  _Output: CORBA.OutputStream;
  _Input : CORBA.InputStream;
begin
  inherited _CreateRequest('pull',True, _Output);
  inherited _Invoke(_Output, _Input);
  _Input.ReadAny(Result);
end;

function  TProxyPullSupplierStub.try_pull ( out   has_event : Boolean): Any;
var
  _Output: CORBA.OutputStream;
  _Input : CORBA.InputStream;
begin
  inherited _CreateRequest('try_pull',True, _Output);
  inherited _Invoke(_Output, _Input);
  _Input.ReadAny(Result);
  _Input.ReadBoolean(has_event);
end;

procedure TProxyPullSupplierStub.disconnect_pull_supplier ;
var
  _Output: CORBA.OutputStream;
  _Input : CORBA.InputStream;
begin
  inherited _CreateRequest('disconnect_pull_supplier',True, _Output);
  inherited _Invoke(_Output, _Input);
end;

class procedure TProxyPullConsumerHelper.Insert(var _A : CORBA.Any; const _Value : ProxyPullConsumer);
begin
  _A := Orb.MakeObjectRef( TProxyPullConsumerHelper.TypeCode, _Value as CORBA.CORBAObject);
end;

class function TProxyPullConsumerHelper.Extract(var _A : CORBA.Any): ProxyPullConsumer;
var
  _obj : Corba.CorbaObject;
begin
  _obj := Orb.GetObjectRef(_A);
  Result := TProxyPullConsumerHelper.Narrow(_obj, True);
end;

class function TProxyPullConsumerHelper.TypeCode : CORBA.TypeCode;
begin
  Result := ORB.CreateInterfaceTC(RepositoryId, 'ProxyPullConsumer');
end;

class function TProxyPullConsumerHelper.RepositoryId : string;
begin
  Result := 'IDL:omg.org/CosEventChannelAdmin/ProxyPullConsumer:1.0';
end;

class function TProxyPullConsumerHelper.Read(const _Input : CORBA.InputStream) : ProxyPullConsumer;
var
  _Obj : CORBA.CORBAObject;
begin
  _Input.ReadObject(_Obj);
  Result := Narrow(_Obj, True);
end;

class procedure TProxyPullConsumerHelper.Write(const _Output : CORBA.OutputStream; const _Value : ProxyPullConsumer);
begin
  _Output.WriteObject(_Value as CORBA.CORBAObject);
end;

class function TProxyPullConsumerHelper.Narrow(const _Obj : CORBA.CORBAObject; _IsA : Boolean) : ProxyPullConsumer;
begin
  Result := nil;
  if (_Obj = nil) or (_Obj.QueryInterface(ProxyPullConsumer, Result) = 0) then
    exit;
  if _IsA and _Obj._IsA(RepositoryId) then
    Result := TProxyPullConsumerStub.Create(_Obj);
end;

class function TProxyPullConsumerHelper.Bind(const _InstanceName : string = ''; _HostName: string = '') : ProxyPullConsumer;
begin
  Result := Narrow(ORB.bind(RepositoryId, _InstanceName, _HostName), True);
end;

class function TProxyPullConsumerHelper.Bind(_Options : BindOptions; const _InstanceName : string = ''; _HostName : string = '') : ProxyPullConsumer;
begin
  Result := Narrow(ORB.bind(RepositoryId, _Options, _InstanceName, _HostName), True);
end;

procedure TProxyPullConsumerStub.connect_pull_supplier ( const pull_supplier : PullSupplier);
var
  _Output: CORBA.OutputStream;
  _Input : CORBA.InputStream;
begin
  inherited _CreateRequest('connect_pull_supplier',True, _Output);
  TPullSupplierHelper.Write(_Output, pull_supplier);
  inherited _Invoke(_Output, _Input);
end;

procedure TProxyPullConsumerStub.disconnect_pull_consumer ;
var
  _Output: CORBA.OutputStream;
  _Input : CORBA.InputStream;
begin
  inherited _CreateRequest('disconnect_pull_consumer',True, _Output);
  inherited _Invoke(_Output, _Input);
end;

class procedure TProxyPushSupplierHelper.Insert(var _A : CORBA.Any; const _Value : ProxyPushSupplier);
begin
  _A := Orb.MakeObjectRef( TProxyPushSupplierHelper.TypeCode, _Value as CORBA.CORBAObject);
end;

class function TProxyPushSupplierHelper.Extract(var _A : CORBA.Any): ProxyPushSupplier;
var
  _obj : Corba.CorbaObject;
begin
  _obj := Orb.GetObjectRef(_A);
  Result := TProxyPushSupplierHelper.Narrow(_obj, True);
end;

class function TProxyPushSupplierHelper.TypeCode : CORBA.TypeCode;
begin
  Result := ORB.CreateInterfaceTC(RepositoryId, 'ProxyPushSupplier');
end;

class function TProxyPushSupplierHelper.RepositoryId : string;
begin
  Result := 'IDL:omg.org/CosEventChannelAdmin/ProxyPushSupplier:1.0';
end;

class function TProxyPushSupplierHelper.Read(const _Input : CORBA.InputStream) : ProxyPushSupplier;
var
  _Obj : CORBA.CORBAObject;
begin
  _Input.ReadObject(_Obj);
  Result := Narrow(_Obj, True);
end;

class procedure TProxyPushSupplierHelper.Write(const _Output : CORBA.OutputStream; const _Value : ProxyPushSupplier);
begin
  _Output.WriteObject(_Value as CORBA.CORBAObject);
end;

class function TProxyPushSupplierHelper.Narrow(const _Obj : CORBA.CORBAObject; _IsA : Boolean) : ProxyPushSupplier;
begin
  Result := nil;
  if (_Obj = nil) or (_Obj.QueryInterface(ProxyPushSupplier, Result) = 0) then
    exit;
  if _IsA and _Obj._IsA(RepositoryId) then
    Result := TProxyPushSupplierStub.Create(_Obj);
end;

class function TProxyPushSupplierHelper.Bind(const _InstanceName : string = ''; _HostName: string = '') : ProxyPushSupplier;
begin
  Result := Narrow(ORB.bind(RepositoryId, _InstanceName, _HostName), True);
end;

class function TProxyPushSupplierHelper.Bind(_Options : BindOptions; const _InstanceName : string = ''; _HostName : string = '') : ProxyPushSupplier;
begin
  Result := Narrow(ORB.bind(RepositoryId, _Options, _InstanceName, _HostName), True);
end;

procedure TProxyPushSupplierStub.connect_push_consumer ( const push_consumer : PushConsumer);
var
  _Output: CORBA.OutputStream;
  _Input : CORBA.InputStream;
begin
  inherited _CreateRequest('connect_push_consumer',True, _Output);
  TPushConsumerHelper.Write(_Output, push_consumer);
  inherited _Invoke(_Output, _Input);
end;

procedure TProxyPushSupplierStub.disconnect_push_supplier ;
var
  _Output: CORBA.OutputStream;
  _Input : CORBA.InputStream;
begin
  inherited _CreateRequest('disconnect_push_supplier',True, _Output);
  inherited _Invoke(_Output, _Input);
end;

class procedure TConsumerAdminHelper.Insert(var _A : CORBA.Any; const _Value : ConsumerAdmin);
begin
  _A := Orb.MakeObjectRef( TConsumerAdminHelper.TypeCode, _Value as CORBA.CORBAObject);
end;

class function TConsumerAdminHelper.Extract(var _A : CORBA.Any): ConsumerAdmin;
var
  _obj : Corba.CorbaObject;
begin
  _obj := Orb.GetObjectRef(_A);
  Result := TConsumerAdminHelper.Narrow(_obj, True);
end;

class function TConsumerAdminHelper.TypeCode : CORBA.TypeCode;
begin
  Result := ORB.CreateInterfaceTC(RepositoryId, 'ConsumerAdmin');
end;

class function TConsumerAdminHelper.RepositoryId : string;
begin
  Result := 'IDL:omg.org/CosEventChannelAdmin/ConsumerAdmin:1.0';
end;

class function TConsumerAdminHelper.Read(const _Input : CORBA.InputStream) : ConsumerAdmin;
var
  _Obj : CORBA.CORBAObject;
begin
  _Input.ReadObject(_Obj);
  Result := Narrow(_Obj, True);
end;

class procedure TConsumerAdminHelper.Write(const _Output : CORBA.OutputStream; const _Value : ConsumerAdmin);
begin
  _Output.WriteObject(_Value as CORBA.CORBAObject);
end;

class function TConsumerAdminHelper.Narrow(const _Obj : CORBA.CORBAObject; _IsA : Boolean) : ConsumerAdmin;
begin
  Result := nil;
  if (_Obj = nil) or (_Obj.QueryInterface(ConsumerAdmin, Result) = 0) then
    exit;
  if _IsA and _Obj._IsA(RepositoryId) then
    Result := TConsumerAdminStub.Create(_Obj);
end;

class function TConsumerAdminHelper.Bind(const _InstanceName : string = ''; _HostName: string = '') : ConsumerAdmin;
begin
  Result := Narrow(ORB.bind(RepositoryId, _InstanceName, _HostName), True);
end;

class function TConsumerAdminHelper.Bind(_Options : BindOptions; const _InstanceName : string = ''; _HostName : string = '') : ConsumerAdmin;
begin
  Result := Narrow(ORB.bind(RepositoryId, _Options, _InstanceName, _HostName), True);
end;

function  TConsumerAdminStub.obtain_push_supplier : ProxyPushSupplier;
var
  _Output: CORBA.OutputStream;
  _Input : CORBA.InputStream;
begin
  inherited _CreateRequest('obtain_push_supplier',True, _Output);
  inherited _Invoke(_Output, _Input);
  Result := TProxyPushSupplierHelper.Read(_Input);
end;

function  TConsumerAdminStub.obtain_pull_supplier : ProxyPullSupplier;
var
  _Output: CORBA.OutputStream;
  _Input : CORBA.InputStream;
begin
  inherited _CreateRequest('obtain_pull_supplier',True, _Output);
  inherited _Invoke(_Output, _Input);
  Result := TProxyPullSupplierHelper.Read(_Input);
end;

class procedure TSupplierAdminHelper.Insert(var _A : CORBA.Any; const _Value : SupplierAdmin);
begin
  _A := Orb.MakeObjectRef( TSupplierAdminHelper.TypeCode, _Value as CORBA.CORBAObject);
end;

class function TSupplierAdminHelper.Extract(var _A : CORBA.Any): SupplierAdmin;
var
  _obj : Corba.CorbaObject;
begin
  _obj := Orb.GetObjectRef(_A);
  Result := TSupplierAdminHelper.Narrow(_obj, True);
end;

class function TSupplierAdminHelper.TypeCode : CORBA.TypeCode;
begin
  Result := ORB.CreateInterfaceTC(RepositoryId, 'SupplierAdmin');
end;

class function TSupplierAdminHelper.RepositoryId : string;
begin
  Result := 'IDL:omg.org/CosEventChannelAdmin/SupplierAdmin:1.0';
end;

class function TSupplierAdminHelper.Read(const _Input : CORBA.InputStream) : SupplierAdmin;
var
  _Obj : CORBA.CORBAObject;
begin
  _Input.ReadObject(_Obj);
  Result := Narrow(_Obj, True);
end;

class procedure TSupplierAdminHelper.Write(const _Output : CORBA.OutputStream; const _Value : SupplierAdmin);
begin
  _Output.WriteObject(_Value as CORBA.CORBAObject);
end;

class function TSupplierAdminHelper.Narrow(const _Obj : CORBA.CORBAObject; _IsA : Boolean) : SupplierAdmin;
begin
  Result := nil;
  if (_Obj = nil) or (_Obj.QueryInterface(SupplierAdmin, Result) = 0) then
    exit;
  if _IsA and _Obj._IsA(RepositoryId) then
    Result := TSupplierAdminStub.Create(_Obj);
end;

class function TSupplierAdminHelper.Bind(const _InstanceName : string = ''; _HostName: string = '') : SupplierAdmin;
begin
  Result := Narrow(ORB.bind(RepositoryId, _InstanceName, _HostName), True);
end;

class function TSupplierAdminHelper.Bind(_Options : BindOptions; const _InstanceName : string = ''; _HostName : string = '') : SupplierAdmin;
begin
  Result := Narrow(ORB.bind(RepositoryId, _Options, _InstanceName, _HostName), True);
end;

function  TSupplierAdminStub.obtain_push_consumer : ProxyPushConsumer;
var
  _Output: CORBA.OutputStream;
  _Input : CORBA.InputStream;
begin
  inherited _CreateRequest('obtain_push_consumer',True, _Output);
  inherited _Invoke(_Output, _Input);
  Result := TProxyPushConsumerHelper.Read(_Input);
end;

function  TSupplierAdminStub.obtain_pull_consumer : ProxyPullConsumer;
var
  _Output: CORBA.OutputStream;
  _Input : CORBA.InputStream;
begin
  inherited _CreateRequest('obtain_pull_consumer',True, _Output);
  inherited _Invoke(_Output, _Input);
  Result := TProxyPullConsumerHelper.Read(_Input);
end;

class procedure TEventChannelHelper.Insert(var _A : CORBA.Any; const _Value : EventChannel);
begin
  _A := Orb.MakeObjectRef( TEventChannelHelper.TypeCode, _Value as CORBA.CORBAObject);
end;

class function TEventChannelHelper.Extract(var _A : CORBA.Any): EventChannel;
var
  _obj : Corba.CorbaObject;
begin
  _obj := Orb.GetObjectRef(_A);
  Result := TEventChannelHelper.Narrow(_obj, True);
end;

class function TEventChannelHelper.TypeCode : CORBA.TypeCode;
begin
  Result := ORB.CreateInterfaceTC(RepositoryId, 'EventChannel');
end;

class function TEventChannelHelper.RepositoryId : string;
begin
  Result := 'IDL:omg.org/CosEventChannelAdmin/EventChannel:1.0';
end;

class function TEventChannelHelper.Read(const _Input : CORBA.InputStream) : EventChannel;
var
  _Obj : CORBA.CORBAObject;
begin
  _Input.ReadObject(_Obj);
  Result := Narrow(_Obj, True);
end;

class procedure TEventChannelHelper.Write(const _Output : CORBA.OutputStream; const _Value : EventChannel);
begin
  _Output.WriteObject(_Value as CORBA.CORBAObject);
end;

class function TEventChannelHelper.Narrow(const _Obj : CORBA.CORBAObject; _IsA : Boolean) : EventChannel;
begin
  Result := nil;
  if (_Obj = nil) or (_Obj.QueryInterface(EventChannel, Result) = 0) then
    exit;
  if _IsA and _Obj._IsA(RepositoryId) then
    Result := TEventChannelStub.Create(_Obj);
end;

class function TEventChannelHelper.Bind(const _InstanceName : string = ''; _HostName: string = '') : EventChannel;
begin
  Result := Narrow(ORB.bind(RepositoryId, _InstanceName, _HostName), True);
end;

class function TEventChannelHelper.Bind(_Options : BindOptions; const _InstanceName : string = ''; _HostName : string = '') : EventChannel;
begin
  Result := Narrow(ORB.bind(RepositoryId, _Options, _InstanceName, _HostName), True);
end;

function  TEventChannelStub.for_consumers : ConsumerAdmin;
var
  _Output: CORBA.OutputStream;
  _Input : CORBA.InputStream;
begin
  inherited _CreateRequest('for_consumers',True, _Output);
  inherited _Invoke(_Output, _Input);
  Result := TConsumerAdminHelper.Read(_Input);
end;

function  TEventChannelStub.for_suppliers : SupplierAdmin;
var
  _Output: CORBA.OutputStream;
  _Input : CORBA.InputStream;
begin
  inherited _CreateRequest('for_suppliers',True, _Output);
  inherited _Invoke(_Output, _Input);
  Result := TSupplierAdminHelper.Read(_Input);
end;

procedure TEventChannelStub._destroy ;
var
  _Output: CORBA.OutputStream;
  _Input : CORBA.InputStream;
begin
  inherited _CreateRequest('destroy',True, _Output);
  inherited _Invoke(_Output, _Input);
end;

class procedure TEventChannelFactoryHelper.Insert(var _A : CORBA.Any; const _Value : EventChannelFactory);
begin
  _A := Orb.MakeObjectRef( TEventChannelFactoryHelper.TypeCode, _Value as CORBA.CORBAObject);
end;

class function TEventChannelFactoryHelper.Extract(var _A : CORBA.Any): EventChannelFactory;
var
  _obj : Corba.CorbaObject;
begin
  _obj := Orb.GetObjectRef(_A);
  Result := TEventChannelFactoryHelper.Narrow(_obj, True);
end;

class function TEventChannelFactoryHelper.TypeCode : CORBA.TypeCode;
begin
  Result := ORB.CreateInterfaceTC(RepositoryId, 'EventChannelFactory');
end;

class function TEventChannelFactoryHelper.RepositoryId : string;
begin
  Result := 'IDL:omg.org/CosEventChannelAdmin/EventChannelFactory:1.0';
end;

class function TEventChannelFactoryHelper.Read(const _Input : CORBA.InputStream) : EventChannelFactory;
var
  _Obj : CORBA.CORBAObject;
begin
  _Input.ReadObject(_Obj);
  Result := Narrow(_Obj, True);
end;

class procedure TEventChannelFactoryHelper.Write(const _Output : CORBA.OutputStream; const _Value : EventChannelFactory);
begin
  _Output.WriteObject(_Value as CORBA.CORBAObject);
end;

class function TEventChannelFactoryHelper.Narrow(const _Obj : CORBA.CORBAObject; _IsA : Boolean) : EventChannelFactory;
begin
  Result := nil;
  if (_Obj = nil) or (_Obj.QueryInterface(EventChannelFactory, Result) = 0) then
    exit;
  if _IsA and _Obj._IsA(RepositoryId) then
    Result := TEventChannelFactoryStub.Create(_Obj);
end;

class function TEventChannelFactoryHelper.Bind(const _InstanceName : string = ''; _HostName: string = '') : EventChannelFactory;
begin
  Result := Narrow(ORB.bind(RepositoryId, _InstanceName, _HostName), True);
end;

class function TEventChannelFactoryHelper.Bind(_Options : BindOptions; const _InstanceName : string = ''; _HostName : string = '') : EventChannelFactory;
begin
  Result := Narrow(ORB.bind(RepositoryId, _Options, _InstanceName, _HostName), True);
end;

function  TEventChannelFactoryStub._create : EventChannel;
var
  _Output: CORBA.OutputStream;
  _Input : CORBA.InputStream;
begin
  inherited _CreateRequest('create',True, _Output);
  inherited _Invoke(_Output, _Input);
  Result := TEventChannelHelper.Read(_Input);
end;

function  TEventChannelFactoryStub.create_by_name ( const name : AnsiString): EventChannel;
var
  _Output: CORBA.OutputStream;
  _Input : CORBA.InputStream;
begin
  inherited _CreateRequest('create_by_name',True, _Output);
  _Output.WriteString(name);
  inherited _Invoke(_Output, _Input);
  Result := TEventChannelHelper.Read(_Input);
end;

function  TEventChannelFactoryStub.lookup_by_name ( const name : AnsiString): EventChannel;
var
  _Output: CORBA.OutputStream;
  _Input : CORBA.InputStream;
begin
  inherited _CreateRequest('lookup_by_name',True, _Output);
  _Output.WriteString(name);
  inherited _Invoke(_Output, _Input);
  Result := TEventChannelHelper.Read(_Input);
end;

procedure TEventChannelFactoryStub._destroy ;
var
  _Output: CORBA.OutputStream;
  _Input : CORBA.InputStream;
begin
  inherited _CreateRequest('destroy',True, _Output);
  inherited _Invoke(_Output, _Input);
end;

constructor EEventChannelFactory_AlreadyExists.Create;
begin
  inherited Create;
end;

procedure EEventChannelFactory_AlreadyExists.Copy(const _Input: InputStream);
begin
end;

procedure EEventChannelFactory_AlreadyExists.WriteExceptionInfo(var _Output : OutputStream);
begin
  _Output.WriteString('IDL:omg.org/CosEventChannelAdmin/EventChannelFactory/AlreadyExists:1.0');
end;
function  EventChannelFactory_AlreadyExists_Factory: PExceptionProxy; cdecl;
begin
  with EEventChannelFactory_AlreadyExists.Create() do Result := Proxy;
end;

constructor EEventChannelFactory_ChannelsExist.Create;
begin
  inherited Create;
end;

procedure EEventChannelFactory_ChannelsExist.Copy(const _Input: InputStream);
begin
end;

procedure EEventChannelFactory_ChannelsExist.WriteExceptionInfo(var _Output : OutputStream);
begin
  _Output.WriteString('IDL:omg.org/CosEventChannelAdmin/EventChannelFactory/ChannelsExist:1.0');
end;
function  EventChannelFactory_ChannelsExist_Factory: PExceptionProxy; cdecl;
begin
  with EEventChannelFactory_ChannelsExist.Create() do Result := Proxy;
end;

constructor TProxyPushConsumerSkeleton.Create(const InstanceName : string; const Impl : ProxyPushConsumer);
begin
  inherited CreateSkeleton(InstanceName, 'ProxyPushConsumer', 'IDL:omg.org/CosEventChannelAdmin/ProxyPushConsumer:1.0');
  FImplementation := Impl;
end;

destructor TProxyPushConsumerSkeleton.Destroy;
begin
  FImplementation := nil;
end;

function TProxyPushConsumerSkeleton.GetImplementation : ProxyPushConsumer;
begin
  result := FImplementation as ProxyPushConsumer;
end;

procedure TProxyPushConsumerSkeleton.connect_push_supplier ( const push_supplier : PushSupplier);
begin
  FImplementation.connect_push_supplier( push_supplier);
end;

procedure TProxyPushConsumerSkeleton.push ( const data : Any);
begin
  FImplementation.push( data);
end;

procedure TProxyPushConsumerSkeleton.disconnect_push_consumer ;
begin
  FImplementation.disconnect_push_consumer;
end;

procedure TProxyPushConsumerSkeleton._connect_push_supplier(const _Input: CORBA.InputStream; _Cookie: Pointer);
var
  _Output : CORBA.OutputStream;
  _push_supplier : PushSupplier;
begin
  _push_supplier := TPushSupplierHelper.Read(_Input);
  try
    connect_push_supplier( _push_supplier);
  except on E: UserException do
    begin
      GetExceptionReplyBuffer(_Cookie, _Output);
      E.WriteExceptionInfo(_Output);
      exit;
    end;
  end;
  GetReplyBuffer(_Cookie, _Output);
end;

procedure TProxyPushConsumerSkeleton._push(const _Input: CORBA.InputStream; _Cookie: Pointer);
var
  _Output : CORBA.OutputStream;
  _data : Any;
begin
  _Input.ReadAny(_data);
  push( _data);
  GetReplyBuffer(_Cookie, _Output);
end;

procedure TProxyPushConsumerSkeleton._disconnect_push_consumer(const _Input: CORBA.InputStream; _Cookie: Pointer);
var
  _Output : CORBA.OutputStream;
begin
  disconnect_push_consumer;
  GetReplyBuffer(_Cookie, _Output);
end;

constructor TProxyPullSupplierSkeleton.Create(const InstanceName : string; const Impl : ProxyPullSupplier);
begin
  inherited CreateSkeleton(InstanceName, 'ProxyPullSupplier', 'IDL:omg.org/CosEventChannelAdmin/ProxyPullSupplier:1.0');
  FImplementation := Impl;
end;

destructor TProxyPullSupplierSkeleton.Destroy;
begin
  FImplementation := nil;
end;

function TProxyPullSupplierSkeleton.GetImplementation : ProxyPullSupplier;
begin
  result := FImplementation as ProxyPullSupplier;
end;

procedure TProxyPullSupplierSkeleton.connect_pull_consumer ( const pull_consumer : PullConsumer);
begin
  FImplementation.connect_pull_consumer( pull_consumer);
end;

function  TProxyPullSupplierSkeleton.pull : Any;
begin
  Result := FImplementation.pull;
end;

function  TProxyPullSupplierSkeleton.try_pull ( out   has_event : Boolean): Any;
begin
  Result := FImplementation.try_pull( has_event);
end;

procedure TProxyPullSupplierSkeleton.disconnect_pull_supplier ;
begin
  FImplementation.disconnect_pull_supplier;
end;

procedure TProxyPullSupplierSkeleton._connect_pull_consumer(const _Input: CORBA.InputStream; _Cookie: Pointer);
var
  _Output : CORBA.OutputStream;
  _pull_consumer : PullConsumer;
begin
  _pull_consumer := TPullConsumerHelper.Read(_Input);
  try
    connect_pull_consumer( _pull_consumer);
  except on E: UserException do
    begin
      GetExceptionReplyBuffer(_Cookie, _Output);
      E.WriteExceptionInfo(_Output);
      exit;
    end;
  end;
  GetReplyBuffer(_Cookie, _Output);
end;

procedure TProxyPullSupplierSkeleton._pull(const _Input: CORBA.InputStream; _Cookie: Pointer);
var
  _Output : CORBA.OutputStream;
  _Result : Any;
begin
  _Result := pull;
  GetReplyBuffer(_Cookie, _Output);
  _Output.WriteAny(_Result);
end;

procedure TProxyPullSupplierSkeleton._try_pull(const _Input: CORBA.InputStream; _Cookie: Pointer);
var
  _Output : CORBA.OutputStream;
  _has_event : Boolean;
  _Result : Any;
begin
  _Result := try_pull( _has_event);
  GetReplyBuffer(_Cookie, _Output);
  _Output.WriteAny(_Result);
  _Output.WriteBoolean(_has_event);
end;

procedure TProxyPullSupplierSkeleton._disconnect_pull_supplier(const _Input: CORBA.InputStream; _Cookie: Pointer);
var
  _Output : CORBA.OutputStream;
begin
  disconnect_pull_supplier;
  GetReplyBuffer(_Cookie, _Output);
end;

constructor TProxyPullConsumerSkeleton.Create(const InstanceName : string; const Impl : ProxyPullConsumer);
begin
  inherited CreateSkeleton(InstanceName, 'ProxyPullConsumer', 'IDL:omg.org/CosEventChannelAdmin/ProxyPullConsumer:1.0');
  FImplementation := Impl;
end;

destructor TProxyPullConsumerSkeleton.Destroy;
begin
  FImplementation := nil;
end;

function TProxyPullConsumerSkeleton.GetImplementation : ProxyPullConsumer;
begin
  result := FImplementation as ProxyPullConsumer;
end;

procedure TProxyPullConsumerSkeleton.connect_pull_supplier ( const pull_supplier : PullSupplier);
begin
  FImplementation.connect_pull_supplier( pull_supplier);
end;

procedure TProxyPullConsumerSkeleton.disconnect_pull_consumer ;
begin
  FImplementation.disconnect_pull_consumer;
end;

procedure TProxyPullConsumerSkeleton._connect_pull_supplier(const _Input: CORBA.InputStream; _Cookie: Pointer);
var
  _Output : CORBA.OutputStream;
  _pull_supplier : PullSupplier;
begin
  _pull_supplier := TPullSupplierHelper.Read(_Input);
  try
    connect_pull_supplier( _pull_supplier);
  except on E: UserException do
    begin
      GetExceptionReplyBuffer(_Cookie, _Output);
      E.WriteExceptionInfo(_Output);
      exit;
    end;
  end;
  GetReplyBuffer(_Cookie, _Output);
end;

procedure TProxyPullConsumerSkeleton._disconnect_pull_consumer(const _Input: CORBA.InputStream; _Cookie: Pointer);
var
  _Output : CORBA.OutputStream;
begin
  disconnect_pull_consumer;
  GetReplyBuffer(_Cookie, _Output);
end;

constructor TProxyPushSupplierSkeleton.Create(const InstanceName : string; const Impl : ProxyPushSupplier);
begin
  inherited CreateSkeleton(InstanceName, 'ProxyPushSupplier', 'IDL:omg.org/CosEventChannelAdmin/ProxyPushSupplier:1.0');
  FImplementation := Impl;
end;

destructor TProxyPushSupplierSkeleton.Destroy;
begin
  FImplementation := nil;
end;

function TProxyPushSupplierSkeleton.GetImplementation : ProxyPushSupplier;
begin
  result := FImplementation as ProxyPushSupplier;
end;

procedure TProxyPushSupplierSkeleton.connect_push_consumer ( const push_consumer : PushConsumer);
begin
  FImplementation.connect_push_consumer( push_consumer);
end;

procedure TProxyPushSupplierSkeleton.disconnect_push_supplier ;
begin
  FImplementation.disconnect_push_supplier;
end;

procedure TProxyPushSupplierSkeleton._connect_push_consumer(const _Input: CORBA.InputStream; _Cookie: Pointer);
var
  _Output : CORBA.OutputStream;
  _push_consumer : PushConsumer;
begin
  _push_consumer := TPushConsumerHelper.Read(_Input);
  try
    connect_push_consumer( _push_consumer);
  except on E: UserException do
    begin
      GetExceptionReplyBuffer(_Cookie, _Output);
      E.WriteExceptionInfo(_Output);
      exit;
    end;
  end;
  GetReplyBuffer(_Cookie, _Output);
end;

procedure TProxyPushSupplierSkeleton._disconnect_push_supplier(const _Input: CORBA.InputStream; _Cookie: Pointer);
var
  _Output : CORBA.OutputStream;
begin
  disconnect_push_supplier;
  GetReplyBuffer(_Cookie, _Output);
end;



initialization
  CORBA.InterfaceIDManager.RegisterInterface(PushConsumer, TPushConsumerHelper.RepositoryId);
  CORBA.InterfaceIDManager.RegisterInterface(PushSupplier, TPushSupplierHelper.RepositoryId);
  CORBA.InterfaceIDManager.RegisterInterface(PullSupplier, TPullSupplierHelper.RepositoryId);
  CORBA.InterfaceIDManager.RegisterInterface(PullConsumer, TPullConsumerHelper.RepositoryId);
  CORBA.InterfaceIDManager.RegisterInterface(ProxyPushConsumer, TProxyPushConsumerHelper.RepositoryId);
  CORBA.InterfaceIDManager.RegisterInterface(ProxyPullSupplier, TProxyPullSupplierHelper.RepositoryId);
  CORBA.InterfaceIDManager.RegisterInterface(ProxyPullConsumer, TProxyPullConsumerHelper.RepositoryId);
  CORBA.InterfaceIDManager.RegisterInterface(ProxyPushSupplier, TProxyPushSupplierHelper.RepositoryId);
  CORBA.InterfaceIDManager.RegisterInterface(ConsumerAdmin, TConsumerAdminHelper.RepositoryId);
  CORBA.InterfaceIDManager.RegisterInterface(SupplierAdmin, TSupplierAdminHelper.RepositoryId);
  CORBA.InterfaceIDManager.RegisterInterface(EventChannel, TEventChannelHelper.RepositoryId);
  CORBA.InterfaceIDManager.RegisterInterface(EventChannelFactory, TEventChannelFactoryHelper.RepositoryId);


  DisconnectedDesc := RegisterUserException('Disconnected', 'IDL:omg.org/CosEventComm/Disconnected:1.0', @Disconnected_Factory);
  AlreadyConnectedDesc := RegisterUserException('AlreadyConnected', 'IDL:omg.org/CosEventChannelAdmin/AlreadyConnected:1.0', @AlreadyConnected_Factory);
  TypeErrorDesc := RegisterUserException('TypeError', 'IDL:omg.org/CosEventChannelAdmin/TypeError:1.0', @TypeError_Factory);
  EventChannelFactory_AlreadyExistsDesc := RegisterUserException('AlreadyExists', 'IDL:omg.org/CosEventChannelAdmin/EventChannelFactory/AlreadyExists:1.0', @EventChannelFactory_AlreadyExists_Factory);
  EventChannelFactory_ChannelsExistDesc := RegisterUserException('ChannelsExist', 'IDL:omg.org/CosEventChannelAdmin/EventChannelFactory/ChannelsExist:1.0', @EventChannelFactory_ChannelsExist_Factory);

finalization
  UnRegisterUserException(DisconnectedDesc);
  UnRegisterUserException(AlreadyConnectedDesc);
  UnRegisterUserException(TypeErrorDesc);
  UnRegisterUserException(EventChannelFactory_AlreadyExistsDesc);
  UnRegisterUserException(EventChannelFactory_ChannelsExistDesc);

end.