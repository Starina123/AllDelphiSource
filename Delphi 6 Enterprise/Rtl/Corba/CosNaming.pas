{*******************************************************}
{                                                       }
{     Borland Visibroker for Delphi Naming Service      }
{                                                       }
{       Copyright (C) 2000 Inprise Corporation          }
{                                                       }
{*******************************************************}

unit CosNaming;

interface

uses
  Corba;

type

  BindingType = (nobject, ncontext);

  NamingContext_NotFoundReason = (missing_node, not_context, not_object);

  {Interfaces Defined}

  NameComponent = interface;
  Binding = interface;
  BindingIterator = interface;
  NamingContext = interface;
  NamingContextFactory = interface;
  ExtendedNamingContextFactory = interface;
  LNameComponent = interface;
  LName = interface;
  LNameFactory = interface;
  LogRecord = interface;
  Log = interface;

  Istring = AnsiString;

  Name = array of CosNaming.NameComponent;

  BindingList = array of CosNaming.Binding;

  NameComponent = interface
    ['{1F97A052-327B-946B-DDC7-8546E892923D}']
    function  _get_id : CosNaming.Istring;
    procedure _set_id(const id : CosNaming.Istring);
    function  _get_kind : CosNaming.Istring;
    procedure _set_kind(const kind : CosNaming.Istring);
    property  id : CosNaming.Istring read _get_id write _set_id;
    property  kind : CosNaming.Istring read _get_kind write _set_kind;
  end;

  Binding = interface
    ['{D5179672-5716-C953-DE66-A7EB2E831A5C}']
    function  _get_binding_name : CosNaming.Name;
    procedure _set_binding_name(const binding_name : CosNaming.Name);
    function  _get_binding_type : CosNaming.BindingType;
    procedure _set_binding_type(const binding_type : CosNaming.BindingType);
    property  binding_name : CosNaming.Name read _get_binding_name write _set_binding_name;
    property  binding_type : CosNaming.BindingType read _get_binding_type write _set_binding_type;
  end;

  BindingIterator = interface
    ['{D33A454D-62FB-2BF8-7C70-AB76C61BD0AE}']
    function  next_one(out b : CosNaming.Binding): Boolean;
    function  next_n(const how_many : Cardinal; out b : CosNaming.BindingList): Boolean;
    procedure _destroy;
  end;

  NamingContext = interface
    ['{7DFA1D2B-16FD-AFBF-C509-0FFF155A2060}']
    procedure bind(const n : CosNaming.Name; const obj : CORBAObject);
    procedure rebind(const n : CosNaming.Name; const obj : CORBAObject);
    procedure bind_context(const n : CosNaming.Name; const nc : CosNaming.NamingContext);
    procedure rebind_context(const n : CosNaming.Name; const nc : CosNaming.NamingContext);
    function  resolve(const n : CosNaming.Name): CORBAObject;
    procedure unbind(const n : CosNaming.Name);
    function  new_context : CosNaming.NamingContext;
    function  bind_new_context(const n : CosNaming.Name): CosNaming.NamingContext;
    procedure _destroy;
    procedure list (const how_many : Cardinal;
                    out   bl : CosNaming.BindingList;
                    out   bi : CosNaming.BindingIterator);
  end;

  NamingContextFactory = interface
    ['{30E560EF-F2EC-9ABC-93BD-4321F386D4B3}']
    function  create_context : CosNaming.NamingContext;
    procedure shutdown;
  end;

  ExtendedNamingContextFactory = interface (CosNaming.NamingContextFactory)
    ['{D2B9CC00-9B01-8924-355D-56DE44A0DE9E}']
    function  root_context : CosNaming.NamingContext;
  end;

  LNameComponent = interface
    ['{02653203-62A5-477A-D8B5-A13FBE308CDC}']
    function  get_id : AnsiString;
    procedure set_id (const id : AnsiString);
    function  get_kind : AnsiString;
    procedure set_kind (const kind : AnsiString);
    procedure _destroy;
  end;

  LName = interface
    ['{DCB614BC-ACE3-BDD2-5771-48D03E51CF58}']
    function  insert_component(const index : Cardinal;
                               const nameComponent : CosNaming.LNameComponent): CosNaming.LName;
    function  get_component(const index : Cardinal): CosNaming.LNameComponent;
    function  delete_component(const index : Cardinal): CosNaming.LNameComponent;
    function  num_components : Cardinal;
    function  equal(const name : CosNaming.LName): Boolean;
    function  less_than(const name : CosNaming.LName): Boolean;
    function  to_idl_form : CosNaming.Name;
    procedure from_idl_form(const name : CosNaming.Name);
    procedure _destroy;
  end;

  LNameFactory = interface
    ['{DF081B46-1C07-FD26-CAF3-E4740EC8AD45}']
    function  create_lname : CosNaming.LName;
    function  create_lname_component : CosNaming.LNameComponent;
  end;

  LogRecord = interface
    ['{5445F096-9F0D-C147-F5F9-55645F3EC4D5}']
    function  _get_operation_key : Char;
    procedure _set_operation_key(const operation_key : Char);
    function  _get_context_index : Integer;
    procedure _set_context_index(const context_index : Integer);
    function  _get_name : CosNaming.Name;
    procedure _set_name(const name : CosNaming.Name);
    function  _get_target_object : CORBAObject;
    procedure _set_target_object(const target_object : CORBAObject);
    function  _get_target_context : CosNaming.NamingContext;
    procedure _set_target_context(const target_context : CosNaming.NamingContext);
    function  _get_target_context_index : Integer;
    procedure _set_target_context_index(const target_context_index : Integer);
    property  operation_key : Char read _get_operation_key write _set_operation_key;
    property  context_index : Integer read _get_context_index write _set_context_index;
    property  name : CosNaming.Name read _get_name write _set_name;
    property  target_object : CORBAObject read _get_target_object write _set_target_object;
    property  target_context : CosNaming.NamingContext read _get_target_context write _set_target_context;
    property  target_context_index : Integer read _get_target_context_index write _set_target_context_index;
  end;

  Log = interface
    ['{48C8F8E9-F0E6-63A7-1EA0-A185B4871ADD}']
    procedure bind(const ctx : CosNaming.NamingContext;
                   const n : CosNaming.Name;
                   const obj : CORBAObject);
    procedure bind_context(const ctx : CosNaming.NamingContext;
                           const n : CosNaming.Name;
                           const nc : CosNaming.NamingContext);
    procedure unbind(const ctx : CosNaming.NamingContext;
                     const n : CosNaming.Name);
    procedure new_context(const ctx : CosNaming.NamingContext);
    procedure _destroy(const ctx : CosNaming.NamingContext);
  end;

  {Classes Defined}

  TIstringHelper = class;
  TNameComponentHelper = class;
  TNameComponent = class;
  TNameHelper = class;
  TBindingTypeHelper = class;
  TBindingHelper = class;
  TBinding = class;
  TBindingListHelper = class;
  TBindingIteratorHelper = class;
  TBindingIteratorStub = class;
  TNamingContextHelper = class;
  TNamingContextStub = class;
  TNamingContext_NotFoundReasonHelper = class;
  ENamingContext_NotFound = class;
  ENamingContext_CannotProceed = class;
  ENamingContext_InvalidName = class;
  ENamingContext_AlreadyBound = class;
  ENamingContext_NotEmpty = class;
  TNamingContextFactoryHelper = class;
  TNamingContextFactoryStub = class;
  TExtendedNamingContextFactoryHelper = class;
  TExtendedNamingContextFactoryStub = class;
  TLNameComponentHelper = class;
  TLNameComponentStub = class;
  ELNameComponent_NotSet = class;
  TLNameHelper = class;
  TLNameStub = class;
  ELName_NoComponent = class;
  ELName_OverFlow = class;
  ELName_InvalidName = class;
  TLNameFactoryHelper = class;
  TLNameFactoryStub = class;
  TLogRecordHelper = class;
  TLogRecord = class;
  TLogHelper = class;
  TLogStub = class;

  TIstringHelper = class
    class procedure Insert(var _A: CORBA.Any; const _Value : CosNaming.Istring);
    class function  Extract(const _A: CORBA.Any): CosNaming.Istring;
    class function  TypeCode : CORBA.TypeCode;
    class function  RepositoryId: string;
    class function  Read(const _Input  : CORBA.InputStream) : CosNaming.Istring;
    class procedure Write(const _Output : CORBA.OutputStream; const _Value : CosNaming.Istring);
  end;

  TNameComponentHelper = class
    class procedure Insert (var _A: CORBA.Any; const _Value : CosNaming.NameComponent);
    class function  Extract(const _A: CORBA.Any): CosNaming.NameComponent;
    class function  TypeCode : CORBA.TypeCode;
    class function  RepositoryId: string;
    class function  Read(const _Input : CORBA.InputStream) : CosNaming.NameComponent;
    class procedure Write(const _Output : CORBA.OutputStream; const _Value : CosNaming.NameComponent);
  end;

  TNameComponent = class (TInterfacedObject, CosNaming.NameComponent)
  private
    id : CosNaming.Istring;
    kind : CosNaming.Istring;
    constructor Create; overload;
  public
    function  _get_id : CosNaming.Istring; virtual;
    procedure _set_id(const _value : CosNaming.Istring ); virtual;
    function  _get_kind : CosNaming.Istring; virtual;
    procedure _set_kind(const _value : CosNaming.Istring ); virtual;
    constructor Create (const id : CosNaming.Istring; const kind : CosNaming.Istring ); overload;
  end;

  TNameHelper = class
    class procedure Insert(var _A: CORBA.Any; const _Value : CosNaming.Name);
    class function  Extract(const _A: CORBA.Any): CosNaming.Name;
    class function  TypeCode : CORBA.TypeCode;
    class function  RepositoryId: string;
    class function  Read(const _Input : CORBA.InputStream) : CosNaming.Name;
    class procedure Write(const _Output : CORBA.OutputStream; const _Value : CosNaming.Name);
  end;

  TBindingTypeHelper = class
    class procedure Insert(var _A: CORBA.Any; const _Value : CosNaming.BindingType);
    class function  Extract(const _A: CORBA.Any): CosNaming.BindingType;
    class function  TypeCode : CORBA.TypeCode;
    class function  RepositoryId: string;
    class function  Read(const _Input : CORBA.InputStream) : CosNaming.BindingType;
    class procedure Write(const _Output : CORBA.OutputStream; const _Value : CosNaming.BindingType);
  end;

  TBindingHelper = class
    class procedure Insert(var _A: CORBA.Any; const _Value : CosNaming.Binding);
    class function  Extract(const _A: CORBA.Any): CosNaming.Binding;
    class function  TypeCode : CORBA.TypeCode;
    class function  RepositoryId: string;
    class function  Read(const _Input : CORBA.InputStream) : CosNaming.Binding;
    class procedure Write(const _Output : CORBA.OutputStream; const _Value : CosNaming.Binding);
  end;

  TBinding = class (TInterfacedObject, CosNaming.Binding)
  private
    binding_name : CosNaming.Name;
    binding_type : CosNaming.BindingType;
    constructor Create; overload;
  public
    function  _get_binding_name : CosNaming.Name; virtual;
    procedure _set_binding_name(const _value : CosNaming.Name ); virtual;
    function  _get_binding_type : CosNaming.BindingType; virtual;
    procedure _set_binding_type(const _value : CosNaming.BindingType ); virtual;
    constructor Create(const binding_name : CosNaming.Name; const binding_type : CosNaming.BindingType); overload;
  end;

  TBindingListHelper = class
    class procedure Insert(var _A: CORBA.Any; const _Value : CosNaming.BindingList);
    class function  Extract(const _A: CORBA.Any): CosNaming.BindingList;
    class function  TypeCode : CORBA.TypeCode;
    class function  RepositoryId: string;
    class function  Read(const _Input : CORBA.InputStream) : CosNaming.BindingList;
    class procedure Write(const _Output : CORBA.OutputStream; const _Value : CosNaming.BindingList);
  end;

  TBindingIteratorHelper = class
    class procedure Insert(var _A: CORBA.Any; const _Value : CosNaming.BindingIterator);
    class function  Extract(var _A: CORBA.Any) : CosNaming.BindingIterator;
    class function  TypeCode : CORBA.TypeCode;
    class function  RepositoryId : string;
    class function  Read(const _Input : CORBA.InputStream) : CosNaming.BindingIterator;
    class procedure Write(const _Output : CORBA.OutputStream; const _Value : CosNaming.BindingIterator);
    class function  Narrow(const _Obj : CORBA.CORBAObject; _IsA : Boolean = False) : CosNaming.BindingIterator;
    class function  Bind(const _InstanceName : string = ''; _HostName : string = '') : CosNaming.BindingIterator; overload;
    class function  Bind(_Options : BindOptions; const _InstanceName : string = ''; _HostName: string = '') : CosNaming.BindingIterator; overload;
  end;

  TBindingIteratorStub = class(CORBA.TCORBAObject, CosNaming.BindingIterator)
  public
    function  next_one(out b : CosNaming.Binding): Boolean; virtual;
    function  next_n(const how_many : Cardinal; out b : CosNaming.BindingList): Boolean; virtual;
    procedure _destroy; virtual;
  end;

  TNamingContextHelper = class
    class procedure Insert(var _A: CORBA.Any; const _Value : CosNaming.NamingContext);
    class function  Extract(var _A: CORBA.Any) : CosNaming.NamingContext;
    class function  TypeCode : CORBA.TypeCode;
    class function  RepositoryId : string;
    class function  Read(const _Input : CORBA.InputStream) : CosNaming.NamingContext;
    class procedure Write(const _Output : CORBA.OutputStream; const _Value : CosNaming.NamingContext);
    class function  Narrow(const _Obj : CORBA.CORBAObject; _IsA : Boolean = False) : CosNaming.NamingContext;
    class function  Bind(const _InstanceName : string = ''; _HostName : string = '') : CosNaming.NamingContext; overload;
    class function  Bind(_Options : BindOptions; const _InstanceName : string = ''; _HostName: string = '') : CosNaming.NamingContext; overload;
  end;

  TNamingContextStub = class(CORBA.TCORBAObject, CosNaming.NamingContext)
  public
    procedure bind(const n : CosNaming.Name; const obj : CORBAObject); virtual;
    procedure rebind(const n : CosNaming.Name; const obj : CORBAObject); virtual;
    procedure bind_context(const n : CosNaming.Name; const nc : CosNaming.NamingContext); virtual;
    procedure rebind_context(const n : CosNaming.Name; const nc : CosNaming.NamingContext); virtual;
    function  resolve(const n : CosNaming.Name): CORBAObject; virtual;
    procedure unbind(const n : CosNaming.Name); virtual;
    function  new_context : CosNaming.NamingContext; virtual;
    function  bind_new_context(const n : CosNaming.Name): CosNaming.NamingContext; virtual;
    procedure _destroy; virtual;
    procedure list(const how_many : Cardinal;
                   out   bl : CosNaming.BindingList;
                   out   bi : CosNaming.BindingIterator); virtual;
  end;

  TNamingContext_NotFoundReasonHelper = class
    class procedure Insert(var _A: CORBA.Any; const _Value : CosNaming.NamingContext_NotFoundReason);
    class function  Extract(const _A: CORBA.Any): CosNaming.NamingContext_NotFoundReason;
    class function  TypeCode : CORBA.TypeCode;
    class function  RepositoryId: string;
    class function  Read(const _Input  : CORBA.InputStream) : CosNaming.NamingContext_NotFoundReason;
    class procedure Write(const _Output : CORBA.OutputStream; const _Value : CosNaming.NamingContext_NotFoundReason);
  end;

  ENamingContext_NotFound = class(UserException)
  private
    Fwhy : CosNaming.NamingContext_NotFoundReason;
    Frest_of_name : CosNaming.Name;
  protected
    function  _get_why : CosNaming.NamingContext_NotFoundReason; virtual;
    function  _get_rest_of_name : CosNaming.Name; virtual;
  public
    property  why : CosNaming.NamingContext_NotFoundReason read _get_why;
    property  rest_of_name : CosNaming.Name read _get_rest_of_name;
    constructor Create; overload;
    constructor Create(const why : CosNaming.NamingContext_NotFoundReason;
                       const rest_of_name : CosNaming.Name); overload;
    procedure Copy(const _Input : InputStream); override;
    procedure WriteExceptionInfo(var _Output : OutputStream); override;
  end;

  ENamingContext_CannotProceed = class(UserException)
  private
    Fcxt : CosNaming.NamingContext;
    Frest_of_name : CosNaming.Name;
  protected
    function  _get_cxt : CosNaming.NamingContext; virtual;
    function  _get_rest_of_name : CosNaming.Name; virtual;
  public
    property  cxt : CosNaming.NamingContext read _get_cxt;
    property  rest_of_name : CosNaming.Name read _get_rest_of_name;
    constructor Create; overload;
    constructor Create(const cxt : CosNaming.NamingContext;
                       const rest_of_name : CosNaming.Name); overload;
    procedure Copy(const _Input : InputStream); override;
    procedure WriteExceptionInfo(var _Output : OutputStream); override;
  end;

  ENamingContext_InvalidName = class(UserException)
  public
    constructor Create; overload;
    procedure Copy(const _Input : InputStream); override;
    procedure WriteExceptionInfo(var _Output : OutputStream); override;
  end;

  ENamingContext_AlreadyBound = class(UserException)
  public
    constructor Create; overload;
    procedure Copy(const _Input : InputStream); override;
    procedure WriteExceptionInfo(var _Output : OutputStream); override;
  end;

  ENamingContext_NotEmpty = class(UserException)
  public
    constructor Create; overload;
    procedure Copy(const _Input : InputStream); override;
    procedure WriteExceptionInfo(var _Output : OutputStream); override;
  end;

  TNamingContextFactoryHelper = class
    class procedure Insert(var _A: CORBA.Any; const _Value : CosNaming.NamingContextFactory);
    class function  Extract(var _A: CORBA.Any) : CosNaming.NamingContextFactory;
    class function  TypeCode : CORBA.TypeCode;
    class function  RepositoryId : string;
    class function  Read(const _Input : CORBA.InputStream) : CosNaming.NamingContextFactory;
    class procedure Write(const _Output : CORBA.OutputStream; const _Value : CosNaming.NamingContextFactory);
    class function  Narrow(const _Obj : CORBA.CORBAObject; _IsA : Boolean = False) : CosNaming.NamingContextFactory;
    class function  Bind(const _InstanceName : string = ''; _HostName : string = '') : CosNaming.NamingContextFactory; overload;
    class function  Bind(_Options : BindOptions; const _InstanceName : string = ''; _HostName: string = '') : CosNaming.NamingContextFactory; overload;
  end;

  TNamingContextFactoryStub = class(CORBA.TCORBAObject, CosNaming.NamingContextFactory)
  public
    function  create_context : CosNaming.NamingContext; virtual;
    procedure shutdown; virtual;
  end;

  TExtendedNamingContextFactoryHelper = class
    class procedure Insert(var _A: CORBA.Any; const _Value : CosNaming.ExtendedNamingContextFactory);
    class function  Extract(var _A: CORBA.Any) : CosNaming.ExtendedNamingContextFactory;
    class function  TypeCode : CORBA.TypeCode;
    class function  RepositoryId : string;
    class function  Read(const _Input : CORBA.InputStream) : CosNaming.ExtendedNamingContextFactory;
    class procedure Write(const _Output : CORBA.OutputStream; const _Value : CosNaming.ExtendedNamingContextFactory);
    class function  Narrow(const _Obj : CORBA.CORBAObject; _IsA : Boolean = False) : CosNaming.ExtendedNamingContextFactory;
    class function  Bind(const _InstanceName : string = ''; _HostName : string = '') : CosNaming.ExtendedNamingContextFactory; overload;
    class function  Bind(_Options : BindOptions; const _InstanceName : string = ''; _HostName: string = '') : CosNaming.ExtendedNamingContextFactory; overload;
  end;

  TExtendedNamingContextFactoryStub = class(CORBA.TCORBAObject, CosNaming.ExtendedNamingContextFactory)
  public
    function  root_context : CosNaming.NamingContext; virtual;
    function  create_context : CosNaming.NamingContext; virtual;
    procedure shutdown ; virtual;
  end;

  TLNameComponentHelper = class
    class procedure Insert(var _A: CORBA.Any; const _Value : CosNaming.LNameComponent);
    class function  Extract(var _A: CORBA.Any) : CosNaming.LNameComponent;
    class function  TypeCode : CORBA.TypeCode;
    class function  RepositoryId : string;
    class function  Read (const _Input : CORBA.InputStream) : CosNaming.LNameComponent;
    class procedure Write(const _Output : CORBA.OutputStream; const _Value : CosNaming.LNameComponent);
    class function  Narrow(const _Obj : CORBA.CORBAObject; _IsA : Boolean = False) : CosNaming.LNameComponent;
    class function  Bind(const _InstanceName : string = ''; _HostName : string = '') : CosNaming.LNameComponent; overload;
    class function  Bind(_Options : BindOptions; const _InstanceName : string = ''; _HostName: string = '') : CosNaming.LNameComponent; overload;
  end;

  TLNameComponentStub = class(CORBA.TCORBAObject, CosNaming.LNameComponent)
  public
    function  get_id : AnsiString; virtual;
    procedure set_id(const id : AnsiString); virtual;
    function  get_kind : AnsiString; virtual;
    procedure set_kind(const kind : AnsiString); virtual;
    procedure _destroy; virtual;
  end;

  ELNameComponent_NotSet = class(UserException)
  public
    constructor Create; overload;
    procedure Copy(const _Input : InputStream); override;
    procedure WriteExceptionInfo(var _Output : OutputStream); override;
  end;

  TLNameHelper = class
    class procedure Insert(var _A: CORBA.Any; const _Value : CosNaming.LName);
    class function  Extract(var _A: CORBA.Any) : CosNaming.LName;
    class function  TypeCode : CORBA.TypeCode;
    class function  RepositoryId : string;
    class function  Read(const _Input : CORBA.InputStream) : CosNaming.LName;
    class procedure Write(const _Output : CORBA.OutputStream; const _Value : CosNaming.LName);
    class function  Narrow(const _Obj : CORBA.CORBAObject; _IsA : Boolean = False) : CosNaming.LName;
    class function  Bind(const _InstanceName : string = ''; _HostName : string = '') : CosNaming.LName; overload;
    class function  Bind(_Options : BindOptions; const _InstanceName : string = ''; _HostName: string = '') : CosNaming.LName; overload;
  end;

  TLNameStub = class(CORBA.TCORBAObject, CosNaming.LName)
  public
    function  insert_component( const index : Cardinal;
                                const nameComponent : CosNaming.LNameComponent): CosNaming.LName; virtual;
    function  get_component(const index : Cardinal): CosNaming.LNameComponent; virtual;
    function  delete_component( const index : Cardinal): CosNaming.LNameComponent; virtual;
    function  num_components : Cardinal; virtual;
    function  equal(const name : CosNaming.LName): Boolean; virtual;
    function  less_than(const name : CosNaming.LName): Boolean; virtual;
    function  to_idl_form : CosNaming.Name; virtual;
    procedure from_idl_form(const name : CosNaming.Name); virtual;
    procedure _destroy; virtual;
  end;

  ELName_NoComponent = class(UserException)
  public
    constructor Create; overload;
    procedure Copy(const _Input : InputStream); override;
    procedure WriteExceptionInfo(var _Output : OutputStream); override;
  end;

  ELName_OverFlow = class(UserException)
  public
    constructor Create; overload;
    procedure Copy(const _Input : InputStream); override;
    procedure WriteExceptionInfo(var _Output : OutputStream); override;
  end;

  ELName_InvalidName = class(UserException)
  public
    constructor Create; overload;
    procedure Copy(const _Input : InputStream); override;
    procedure WriteExceptionInfo(var _Output : OutputStream); override;
  end;

  TLNameFactoryHelper = class
    class procedure Insert(var _A: CORBA.Any; const _Value : CosNaming.LNameFactory);
    class function  Extract(var _A: CORBA.Any) : CosNaming.LNameFactory;
    class function  TypeCode : CORBA.TypeCode;
    class function  RepositoryId : string;
    class function  Read(const _Input : CORBA.InputStream) : CosNaming.LNameFactory;
    class procedure Write(const _Output : CORBA.OutputStream; const _Value : CosNaming.LNameFactory);
    class function  Narrow(const _Obj : CORBA.CORBAObject; _IsA : Boolean = False) : CosNaming.LNameFactory;
    class function  Bind(const _InstanceName : string = ''; _HostName : string = '') : CosNaming.LNameFactory; overload;
    class function  Bind(_Options : BindOptions; const _InstanceName : string = ''; _HostName: string = '') : CosNaming.LNameFactory; overload;
  end;

  TLNameFactoryStub = class(CORBA.TCORBAObject, CosNaming.LNameFactory)
  public
    function  create_lname : CosNaming.LName; virtual;
    function  create_lname_component : CosNaming.LNameComponent; virtual;
  end;

  TLogRecordHelper = class
    class procedure Insert(var _A: CORBA.Any; const _Value : CosNaming.LogRecord);
    class function  Extract(const _A: CORBA.Any): CosNaming.LogRecord;
    class function  TypeCode : CORBA.TypeCode;
    class function  RepositoryId: string;
    class function  Read(const _Input : CORBA.InputStream) : CosNaming.LogRecord;
    class procedure Write(const _Output : CORBA.OutputStream; const _Value : CosNaming.LogRecord);
  end;

  TLogRecord = class (TInterfacedObject, CosNaming.LogRecord)
  private
    operation_key : Char;
    context_index : Integer;
    name : CosNaming.Name;
    target_object : CORBAObject;
    target_context : CosNaming.NamingContext;
    target_context_index : Integer;
    constructor Create; overload;
  public
    function  _get_operation_key : Char; virtual;
    procedure _set_operation_key(const _value : Char); virtual;
    function  _get_context_index : Integer; virtual;
    procedure _set_context_index(const _value : Integer); virtual;
    function  _get_name : CosNaming.Name; virtual;
    procedure _set_name(const _value : CosNaming.Name); virtual;
    function  _get_target_object : CORBAObject; virtual;
    procedure _set_target_object(const _value : CORBAObject); virtual;
    function  _get_target_context : CosNaming.NamingContext; virtual;
    procedure _set_target_context(const _value : CosNaming.NamingContext); virtual;
    function  _get_target_context_index : Integer; virtual;
    procedure _set_target_context_index(const _value : Integer); virtual;
    constructor Create (const operation_key : Char;
                        const context_index : Integer;
                        const name : CosNaming.Name;
                        const target_object : CORBAObject;
                        const target_context : CosNaming.NamingContext;
                        const target_context_index : Integer); overload;
  end;

  TLogHelper = class
    class procedure Insert (var _A: CORBA.Any; const _Value : CosNaming.Log);
    class function  Extract(var _A: CORBA.Any) : CosNaming.Log;
    class function  TypeCode : CORBA.TypeCode;
    class function  RepositoryId : string;
    class function  Read(const _Input : CORBA.InputStream) : CosNaming.Log;
    class procedure Write(const _Output : CORBA.OutputStream; const _Value : CosNaming.Log);
    class function  Narrow(const _Obj : CORBA.CORBAObject; _IsA : Boolean = False) : CosNaming.Log;
    class function  Bind(const _InstanceName : string = ''; _HostName : string = '') : CosNaming.Log; overload;
    class function  Bind(_Options : BindOptions; const _InstanceName : string = ''; _HostName: string = '') : CosNaming.Log; overload;
  end;

  TLogStub = class(CORBA.TCORBAObject, CosNaming.Log)
  public
    procedure bind(const ctx : CosNaming.NamingContext;
                   const n : CosNaming.Name;
                   const obj : CORBAObject); virtual;
    procedure bind_context(const ctx : CosNaming.NamingContext;
                           const n : CosNaming.Name;
                           const nc : CosNaming.NamingContext); virtual;
    procedure unbind(const ctx : CosNaming.NamingContext; const n : CosNaming.Name); virtual;
    procedure new_context ( const ctx : CosNaming.NamingContext); virtual;
    procedure _destroy(const ctx : CosNaming.NamingContext); virtual;
  end;


implementation

var
  NamingContext_NotFoundDesc : PExceptionDescription;
  NamingContext_CannotProceedDesc : PExceptionDescription;
  NamingContext_InvalidNameDesc : PExceptionDescription;
  NamingContext_AlreadyBoundDesc : PExceptionDescription;
  NamingContext_NotEmptyDesc : PExceptionDescription;
  LNameComponent_NotSetDesc : PExceptionDescription;
  LName_NoComponentDesc : PExceptionDescription;
  LName_OverFlowDesc : PExceptionDescription;
  LName_InvalidNameDesc : PExceptionDescription;


class procedure TIstringHelper.Insert(var _A : CORBA.Any; const _Value : CosNaming.Istring);
begin
  _A := _Value;
end;

class function TIstringHelper.Extract(const _A : CORBA.Any) : CosNaming.Istring;
var
  _Input : InputStream;
  _Temp  : AnsiString;
begin
  Orb.GetAny(_A, _Input);
  _Input.ReadString(_Temp);
  Result := CosNaming.Istring(_Temp);
end;

class function  TIstringHelper.TypeCode : CORBA.TypeCode;
begin
  Result := ORB.CreateAliasTC(RepositoryId, 'Istring', ORB.CreateTC(Integer(0)));
end;

class function  TIstringHelper.RepositoryId : string;
begin
  Result := 'IDL:omg.org/CosNaming/Istring:1.0';
end;

class function  TIstringHelper.Read(const _Input: CORBA.InputStream) : CosNaming.Istring;
begin
  _Input.ReadString(Result);
end;

class procedure TIstringHelper.Write(const _Output : CORBA.OutputStream; const _Value :CosNaming.Istring);
begin
  _Output.WriteString(_Value);
end;

class procedure TNameComponentHelper.Insert(var _A : CORBA.Any; const _Value : CosNaming.NameComponent);
var
  _Output : CORBA.OutputStream;
begin
  _Output := ORB.CreateOutputStream;
  TNameComponentHelper.Write(_Output, _Value);
  ORB.PutAny(_A, TNameComponentHelper.TypeCode, _Output);
end;

class function TNameComponentHelper.Extract(const _A : CORBA.Any) : CosNaming.NameComponent;
var
  _Input : CORBA.InputStream;
begin
  Orb.GetAny(_A, _Input);
  Result := TNameComponentHelper.Read(_Input);
end;

class function TNameComponentHelper.TypeCode : CORBA.TypeCode;
var
  _Seq: StructMemberSeq;
begin
  SetLength(_Seq, 2);
  _Seq[0].Name := 'id';
  _Seq[0].TC   := CosNaming.TIstringHelper.TypeCode;
  _Seq[1].Name := 'kind';
  _Seq[1].TC   := CosNaming.TIstringHelper.TypeCode;
  Result := ORB.MakeStructureTypecode(RepositoryID, 'NameComponent', _Seq);
end;

class function TNameComponentHelper.RepositoryId : string;
begin
  Result := 'IDL:omg.org/CosNaming/NameComponent:1.0';
end;

class function TNameComponentHelper.Read(const _Input : CORBA.InputStream) : CosNaming.NameComponent;
var
  _Value : CosNaming.TNameComponent;
begin
  _Value := CosNaming.TNameComponent.Create;
  _Value.id := CosNaming.TIstringHelper.Read(_Input);
  _Value.kind := CosNaming.TIstringHelper.Read(_Input);
  Result := _Value;
end;

class procedure TNameComponentHelper.Write(const _Output : CORBA.OutputStream; const _Value : CosNaming.NameComponent);
begin
  CosNaming.TIstringHelper.Write(_Output, _Value.id);
  CosNaming.TIstringHelper.Write(_Output, _Value.kind);
end;

constructor TNameComponent.Create;
begin
  inherited Create;
end;

constructor TNameComponent.Create(const id: CosNaming.Istring;
                                  const kind: CosNaming.Istring);
begin
  Self.id := id;
  Self.kind := kind;
end;

function  TNameComponent._get_id: CosNaming.Istring;
begin
  Result := id;
end;

procedure TNameComponent._set_id(const _Value : CosNaming.Istring);
begin
  id := _Value;
end;

function  TNameComponent._get_kind: CosNaming.Istring;
begin
  Result := kind;
end;

procedure TNameComponent._set_kind(const _Value : CosNaming.Istring);
begin
  kind := _Value;
end;

class procedure TNameHelper.Insert(var _A : CORBA.Any; const _Value : CosNaming.Name);
var
  _Output : CORBA.OutputStream;
begin
  _Output := ORB.CreateOutputStream;
  TNameHelper.Write(_Output, _Value);
  ORB.PutAny(_A, TNameHelper.TypeCode, _Output);
end;

class function TNameHelper.Extract(const _A : CORBA.Any): CosNaming.Name;
var
  _Input : InputStream;
begin
  Orb.GetAny(_A, _Input);
  Result := TNameHelper.Read(_Input);
end;

class function  TNameHelper.TypeCode: CORBA.TypeCode;
begin
  Result := ORB.CreateSequenceTC(0, CosNaming.TNameComponentHelper.TypeCode());
end;

class function  TNameHelper.RepositoryId: string;
begin
  Result := 'IDL:omg.org/CosNaming/Name:1.0';
end;

class function  TNameHelper.Read(const _Input : CORBA.InputStream) : CosNaming.Name;
var
  L0 : Cardinal;
  I0 : Cardinal;
begin
  _Input.ReadULong(L0);
  SetLength(Result, L0);
  if (L0 > 0) then
  begin
    for I0 := 0 to High(Result) do
    begin
      Result[I0] := CosNaming.TNameComponentHelper.Read(_Input);
    end;
  end;
end;

class procedure TNameHelper.Write(const _Output: CORBA.OutputStream; const _Value: CosNaming.Name);
var
  L0 : Cardinal;
  I0 : Cardinal;
begin
  L0 := Length(_Value);
  _Output.WriteULong(L0);
  if (L0 > 0) then
  begin
    for I0 := 0 to High(_Value) do
    begin
      CosNaming.TNameComponentHelper.Write(_Output, _Value[I0]);
    end;
  end;
end;

class procedure TBindingTypeHelper.Insert(var _A : CORBA.Any; const _Value : CosNaming.BindingType);
begin
  _A := _Value;
end;

class function TBindingTypeHelper.Extract(const _A : CORBA.Any) : CosNaming.BindingType;
begin
  Result := CosNaming.BindingType(_A);
end;

class function TBindingTypeHelper.TypeCode : CORBA.TypeCode;
begin
  Result := ORB.CreateEnumTC(RepositoryId, 'BindingType', ['nobject', 'ncontext']);
end;

class function TBindingTypeHelper.RepositoryId: string;
begin
  Result := 'IDL:omg.org/CosNaming/BindingType:1.0';
end;

class function TBindingTypeHelper.Read(const _Input : CORBA.InputStream) : CosNaming.BindingType;
var
  _Temp: Cardinal;
begin
  _Input.ReadULong(_Temp);
  Result := CosNaming.BindingType(_Temp);
end;

class procedure TBindingTypeHelper.Write(const _Output : CORBA.OutputStream; const _Value  : CosNaming.BindingType);
begin
  _Output.WriteULong(Cardinal(_Value));
end;

class procedure TBindingHelper.Insert(var _A : CORBA.Any; const _Value : CosNaming.Binding);
var
  _Output : CORBA.OutputStream;
begin
  _Output := ORB.CreateOutputStream;
  TBindingHelper.Write(_Output, _Value);
  ORB.PutAny(_A, TBindingHelper.TypeCode, _Output);
end;

class function TBindingHelper.Extract(const _A : CORBA.Any) : CosNaming.Binding;
var
  _Input : CORBA.InputStream;
begin
  Orb.GetAny(_A, _Input);
  Result := TBindingHelper.Read(_Input);
end;

class function TBindingHelper.TypeCode : CORBA.TypeCode;
var
  _Seq: StructMemberSeq;
begin
  SetLength(_Seq, 2);
  _Seq[0].Name := 'binding_name';
  _Seq[0].TC   := CosNaming.TNameHelper.TypeCode;
  _Seq[1].Name := 'binding_type';
  _Seq[1].TC   := CosNaming.TBindingTypeHelper.TypeCode;
  Result := ORB.MakeStructureTypecode(RepositoryID, 'Binding', _Seq);
end;

class function TBindingHelper.RepositoryId : string;
begin
  Result := 'IDL:omg.org/CosNaming/Binding:1.0';
end;

class function TBindingHelper.Read(const _Input : CORBA.InputStream) : CosNaming.Binding;
var
  _Value : CosNaming.TBinding;
begin
  _Value := CosNaming.TBinding.Create;
  _Value.binding_name := CosNaming.TNameHelper.Read(_Input);
  _Value.binding_type := CosNaming.TBindingTypeHelper.Read(_Input);
  Result := _Value;
end;

class procedure TBindingHelper.Write(const _Output : CORBA.OutputStream; const _Value : CosNaming.Binding);
begin
  CosNaming.TNameHelper.Write(_Output, _Value.binding_name);
  CosNaming.TBindingTypeHelper.Write(_Output, _Value.binding_type);
end;

constructor TBinding.Create;
begin
  inherited Create;
end;

constructor TBinding.Create(const binding_name: CosNaming.Name;
                            const binding_type: CosNaming.BindingType);
begin
  Self.binding_name := binding_name;
  Self.binding_type := binding_type;
end;

function  TBinding._get_binding_name: CosNaming.Name;
begin
  Result := binding_name;
end;

procedure TBinding._set_binding_name(const _Value : CosNaming.Name);
begin
  binding_name := _Value;
end;

function  TBinding._get_binding_type: CosNaming.BindingType;
begin
  Result := binding_type;
end;

procedure TBinding._set_binding_type(const _Value : CosNaming.BindingType);
begin
  binding_type := _Value;
end;

class procedure TBindingListHelper.Insert(var _A : CORBA.Any; const _Value : CosNaming.BindingList);
var
  _Output : CORBA.OutputStream;
begin
  _Output := ORB.CreateOutputStream;
  TBindingListHelper.Write(_Output, _Value);
  ORB.PutAny(_A, TBindingListHelper.TypeCode, _Output);
end;

class function TBindingListHelper.Extract(const _A : CORBA.Any): CosNaming.BindingList;
var
  _Input : InputStream;
begin
  Orb.GetAny(_A, _Input);
  Result := TBindingListHelper.Read(_Input);
end;

class function  TBindingListHelper.TypeCode: CORBA.TypeCode;
begin
  Result := ORB.CreateSequenceTC(0, CosNaming.TBindingHelper.TypeCode());
end;

class function  TBindingListHelper.RepositoryId: string;
begin
  Result := 'IDL:omg.org/CosNaming/BindingList:1.0';
end;

class function  TBindingListHelper.Read(const _Input : CORBA.InputStream) : CosNaming.BindingList;
var
  L0 : Cardinal;
  I0 : Cardinal;
begin
  _Input.ReadULong(L0);
  SetLength(Result, L0);
  if (L0 > 0) then
  begin
    for I0 := 0 to High(Result) do
    begin
      Result[I0] := CosNaming.TBindingHelper.Read(_Input);
    end;
  end;
end;

class procedure TBindingListHelper.Write(const _Output: CORBA.OutputStream; const _Value: CosNaming.BindingList);
var
  L0 : Cardinal;
  I0 : Cardinal;
begin
  L0 := Length(_Value);
  _Output.WriteULong(L0);
  if (L0 > 0) then
  begin
    for I0 := 0 to High(_Value) do
    begin
      CosNaming.TBindingHelper.Write(_Output, _Value[I0]);
    end;
  end;
end;

class procedure TBindingIteratorHelper.Insert(var _A : CORBA.Any; const _Value : CosNaming.BindingIterator);
begin
  _A := Orb.MakeObjectRef( TBindingIteratorHelper.TypeCode, _Value as CORBA.CORBAObject);
end;

class function TBindingIteratorHelper.Extract(var _A : CORBA.Any): CosNaming.BindingIterator;
var
  _obj : Corba.CorbaObject;
begin
  _obj := Orb.GetObjectRef(_A);
  Result := TBindingIteratorHelper.Narrow(_obj, True);
end;

class function TBindingIteratorHelper.TypeCode : CORBA.TypeCode;
begin
  Result := ORB.CreateInterfaceTC(RepositoryId, 'BindingIterator');
end;

class function TBindingIteratorHelper.RepositoryId : string;
begin
  Result := 'IDL:omg.org/CosNaming/BindingIterator:1.0';
end;

class function TBindingIteratorHelper.Read(const _Input : CORBA.InputStream) : CosNaming.BindingIterator;
var
  _Obj : CORBA.CORBAObject;
begin
  _Input.ReadObject(_Obj);
  Result := Narrow(_Obj, True)
end;

class procedure TBindingIteratorHelper.Write(const _Output : CORBA.OutputStream; const _Value : CosNaming.BindingIterator);
begin
  _Output.WriteObject(_Value as CORBA.CORBAObject);
end;

class function TBindingIteratorHelper.Narrow(const _Obj : CORBA.CORBAObject; _IsA : Boolean) : CosNaming.BindingIterator;
begin
  Result := nil;
  if (_Obj = nil) or (_Obj.QueryInterface(CosNaming.BindingIterator, Result) = 0)
    then Exit;
  if _IsA and _Obj._IsA(RepositoryId) then
    Result := TBindingIteratorStub.Create(_Obj);
end;

class function TBindingIteratorHelper.Bind(const _InstanceName : string = ''; _HostName: string = '') : CosNaming.BindingIterator;
begin
  Result := Narrow(ORB.bind(RepositoryId, _InstanceName, _HostName), True);
end;

class function TBindingIteratorHelper.Bind(_Options : BindOptions; const _InstanceName : string = ''; _HostName : string = '') : CosNaming.BindingIterator;
begin
  Result := Narrow(ORB.bind(RepositoryId, _Options, _InstanceName, _HostName), True);
end;

function  TBindingIteratorStub.next_one(out b : CosNaming.Binding): Boolean;
var
  _Output: CORBA.OutputStream;
  _Input : CORBA.InputStream;
begin
  inherited _CreateRequest('next_one',True, _Output);
  inherited _Invoke(_Output, _Input);
  _Input.ReadBoolean(Result);
  b := CosNaming.TBindingHelper.Read(_Input);
end;

function  TBindingIteratorStub.next_n(const how_many : Cardinal;
                                      out b : CosNaming.BindingList): Boolean;
var
  _Output: CORBA.OutputStream;
  _Input : CORBA.InputStream;
begin
  inherited _CreateRequest('next_n',True, _Output);
  _Output.WriteULong(how_many);
  inherited _Invoke(_Output, _Input);
  _Input.ReadBoolean(Result);
  b := CosNaming.TBindingListHelper.Read(_Input);
end;

procedure TBindingIteratorStub._destroy;
var
  _Output: CORBA.OutputStream;
  _Input : CORBA.InputStream;
begin
  inherited _CreateRequest('destroy',True, _Output);
  inherited _Invoke(_Output, _Input);
end;

class procedure TNamingContextHelper.Insert(var _A : CORBA.Any; const _Value : CosNaming.NamingContext);
begin
  _A := Orb.MakeObjectRef( TNamingContextHelper.TypeCode, _Value as CORBA.CORBAObject);
end;

class function TNamingContextHelper.Extract(var _A : CORBA.Any): CosNaming.NamingContext;
var
  _obj : Corba.CorbaObject;
begin
  _obj := Orb.GetObjectRef(_A);
  Result := TNamingContextHelper.Narrow(_obj, True);
end;

class function TNamingContextHelper.TypeCode : CORBA.TypeCode;
begin
  Result := ORB.CreateInterfaceTC(RepositoryId, 'NamingContext');
end;

class function TNamingContextHelper.RepositoryId : string;
begin
  Result := 'IDL:omg.org/CosNaming/NamingContext:1.0';
end;

class function TNamingContextHelper.Read(const _Input : CORBA.InputStream) : CosNaming.NamingContext;
var
  _Obj : CORBA.CORBAObject;
begin
  _Input.ReadObject(_Obj);
  Result := Narrow(_Obj, True)
end;

class procedure TNamingContextHelper.Write(const _Output : CORBA.OutputStream; const _Value : CosNaming.NamingContext);
begin
  _Output.WriteObject(_Value as CORBA.CORBAObject);
end;

class function TNamingContextHelper.Narrow(const _Obj : CORBA.CORBAObject; _IsA : Boolean) : CosNaming.NamingContext;
begin
  Result := nil;
  if (_Obj = nil) or (_Obj.QueryInterface(CosNaming.NamingContext, Result) = 0)
    then Exit;
  if _IsA and _Obj._IsA(RepositoryId) then
    Result := TNamingContextStub.Create(_Obj);
end;

class function TNamingContextHelper.Bind(const _InstanceName : string = ''; _HostName: string = '') : CosNaming.NamingContext;
begin
  Result := Narrow(ORB.bind(RepositoryId, _InstanceName, _HostName), True);
end;

class function TNamingContextHelper.Bind(_Options : BindOptions; const _InstanceName : string = ''; _HostName : string = '') : CosNaming.NamingContext;
begin
  Result := Narrow(ORB.bind(RepositoryId, _Options, _InstanceName, _HostName), True);
end;

procedure TNamingContextStub.bind(const n : CosNaming.Name; const obj : CORBAObject);
var
  _Output: CORBA.OutputStream;
  _Input : CORBA.InputStream;
begin
  inherited _CreateRequest('bind',True, _Output);
  CosNaming.TNameHelper.Write(_Output, n);
  _Output.WriteObject(obj);
  inherited _Invoke(_Output, _Input);
end;

procedure TNamingContextStub.rebind(const n : CosNaming.Name; const obj : CORBAObject);
var
  _Output: CORBA.OutputStream;
  _Input : CORBA.InputStream;
begin
  inherited _CreateRequest('rebind',True, _Output);
  CosNaming.TNameHelper.Write(_Output, n);
  _Output.WriteObject(obj);
  inherited _Invoke(_Output, _Input);
end;

procedure TNamingContextStub.bind_context(const n : CosNaming.Name; const nc : CosNaming.NamingContext);
var
  _Output: CORBA.OutputStream;
  _Input : CORBA.InputStream;
begin
  inherited _CreateRequest('bind_context',True, _Output);
  CosNaming.TNameHelper.Write(_Output, n);
  CosNaming.TNamingContextHelper.Write(_Output, nc);
  inherited _Invoke(_Output, _Input);
end;

procedure TNamingContextStub.rebind_context(const n : CosNaming.Name; const nc : CosNaming.NamingContext);
var
  _Output: CORBA.OutputStream;
  _Input : CORBA.InputStream;
begin
  inherited _CreateRequest('rebind_context',True, _Output);
  CosNaming.TNameHelper.Write(_Output, n);
  CosNaming.TNamingContextHelper.Write(_Output, nc);
  inherited _Invoke(_Output, _Input);
end;

function  TNamingContextStub.resolve(const n : CosNaming.Name): CORBAObject;
var
  _Output: CORBA.OutputStream;
  _Input : CORBA.InputStream;
begin
  inherited _CreateRequest('resolve',True, _Output);
  CosNaming.TNameHelper.Write(_Output, n);
  inherited _Invoke(_Output, _Input);
  _Input.ReadObject(Result);
end;

procedure TNamingContextStub.unbind(const n : CosNaming.Name);
var
  _Output: CORBA.OutputStream;
  _Input : CORBA.InputStream;
begin
  inherited _CreateRequest('unbind',True, _Output);
  CosNaming.TNameHelper.Write(_Output, n);
  inherited _Invoke(_Output, _Input);
end;

function  TNamingContextStub.new_context : CosNaming.NamingContext;
var
  _Output: CORBA.OutputStream;
  _Input : CORBA.InputStream;
begin
  inherited _CreateRequest('new_context',True, _Output);
  inherited _Invoke(_Output, _Input);
  Result := CosNaming.TNamingContextHelper.Read(_Input);
end;

function  TNamingContextStub.bind_new_context(const n : CosNaming.Name): CosNaming.NamingContext;
var
  _Output: CORBA.OutputStream;
  _Input : CORBA.InputStream;
begin
  inherited _CreateRequest('bind_new_context',True, _Output);
  CosNaming.TNameHelper.Write(_Output, n);
  inherited _Invoke(_Output, _Input);
  Result := CosNaming.TNamingContextHelper.Read(_Input);
end;

procedure TNamingContextStub._destroy;
var
  _Output: CORBA.OutputStream;
  _Input : CORBA.InputStream;
begin
  inherited _CreateRequest('destroy',True, _Output);
  inherited _Invoke(_Output, _Input);
end;

procedure TNamingContextStub.list(const how_many : Cardinal;
                                  out   bl : CosNaming.BindingList;
                                  out   bi : CosNaming.BindingIterator);
var
  _Output: CORBA.OutputStream;
  _Input : CORBA.InputStream;
begin
  inherited _CreateRequest('list',True, _Output);
  _Output.WriteULong(how_many);
  inherited _Invoke(_Output, _Input);
  bl := CosNaming.TBindingListHelper.Read(_Input);
  bi := CosNaming.TBindingIteratorHelper.Read(_Input);
end;

class procedure TNamingContext_NotFoundReasonHelper.Insert(var _A : CORBA.Any; const _Value : CosNaming.NamingContext_NotFoundReason);
begin
  _A := _Value;
end;

class function TNamingContext_NotFoundReasonHelper.Extract(const _A : CORBA.Any) : CosNaming.NamingContext_NotFoundReason;
begin
  Result := CosNaming.NamingContext_NotFoundReason(_A);
end;

class function TNamingContext_NotFoundReasonHelper.TypeCode : CORBA.TypeCode;
begin
  Result := ORB.CreateEnumTC(RepositoryId, 'NamingContext_NotFoundReason', ['missing_node', 'not_context', 'not_object']);
end;

class function TNamingContext_NotFoundReasonHelper.RepositoryId: string;
begin
  Result := 'IDL:omg.org/CosNaming/NamingContext/NotFoundReason:1.0';
end;

class function TNamingContext_NotFoundReasonHelper.Read(const _Input : CORBA.InputStream) : CosNaming.NamingContext_NotFoundReason;
var
  _Temp: Cardinal;
begin
  _Input.ReadULong(_Temp);
  Result := CosNaming.NamingContext_NotFoundReason(_Temp);
end;

class procedure TNamingContext_NotFoundReasonHelper.Write(const _Output : CORBA.OutputStream; const _Value  : CosNaming.NamingContext_NotFoundReason);
begin
  _Output.WriteULong(Cardinal(_Value));
end;

{Not Found Exception}

function  ENamingContext_NotFound._get_why : CosNaming.NamingContext_NotFoundReason;
begin
  Result := Fwhy;
end;

function  ENamingContext_NotFound._get_rest_of_name : CosNaming.Name;
begin
  Result := Frest_of_name;
end;

constructor ENamingContext_NotFound.Create;
begin
  inherited Create;
end;

constructor ENamingContext_NotFound.Create(const why : CosNaming.NamingContext_NotFoundReason;
                                           const rest_of_name : CosNaming.Name);
begin
  inherited Create;
  Fwhy := why;
  Frest_of_name := rest_of_name;
end;

procedure ENamingContext_NotFound.Copy(const _Input: InputStream);
begin
  Fwhy := CosNaming.TNamingContext_NotFoundReasonHelper.Read(_Input);
  Frest_of_name := CosNaming.TNameHelper.Read(_Input);
end;

procedure ENamingContext_NotFound.WriteExceptionInfo(var _Output : OutputStream);
begin
  _Output.WriteString('IDL:omg.org/CosNaming/NamingContext/NotFound:1.0');
  CosNaming.TNamingContext_NotFoundReasonHelper.Write(_Output, Fwhy);
  CosNaming.TNameHelper.Write(_Output, Frest_of_name);
end;

function  NamingContext_NotFound_Factory: PExceptionProxy; cdecl;
begin
  with CosNaming.ENamingContext_NotFound.Create() do Result := Proxy;
end;

{Cannot Proceed Exception}

function  ENamingContext_CannotProceed._get_cxt : CosNaming.NamingContext;
begin
  Result := Fcxt;
end;

function  ENamingContext_CannotProceed._get_rest_of_name : CosNaming.Name;
begin
  Result := Frest_of_name;
end;

constructor ENamingContext_CannotProceed.Create;
begin
  inherited Create;
end;

constructor ENamingContext_CannotProceed.Create(const cxt : CosNaming.NamingContext;
                                                const rest_of_name : CosNaming.Name);
begin
  inherited Create;
  Fcxt := cxt;
  Frest_of_name := rest_of_name;
end;

procedure ENamingContext_CannotProceed.Copy(const _Input: InputStream);
begin
  Fcxt := CosNaming.TNamingContextHelper.Read(_Input);
  Frest_of_name := CosNaming.TNameHelper.Read(_Input);
end;

procedure ENamingContext_CannotProceed.WriteExceptionInfo(var _Output : OutputStream);
begin
  _Output.WriteString('IDL:omg.org/CosNaming/NamingContext/CannotProceed:1.0');
  CosNaming.TNamingContextHelper.Write(_Output, Fcxt);
  CosNaming.TNameHelper.Write(_Output, Frest_of_name);
end;

function  NamingContext_CannotProceed_Factory: PExceptionProxy; cdecl;
begin
  with CosNaming.ENamingContext_CannotProceed.Create() do Result := Proxy;
end;

{Invalid Name Exception}

constructor ENamingContext_InvalidName.Create;
begin
  inherited Create;
end;

procedure ENamingContext_InvalidName.Copy(const _Input: InputStream);
begin
end;

procedure ENamingContext_InvalidName.WriteExceptionInfo(var _Output : OutputStream);
begin
  _Output.WriteString('IDL:omg.org/CosNaming/NamingContext/InvalidName:1.0');
end;
function  NamingContext_InvalidName_Factory: PExceptionProxy; cdecl;
begin
  with CosNaming.ENamingContext_InvalidName.Create() do Result := Proxy;
end;

{Already Bound Exception}

constructor ENamingContext_AlreadyBound.Create;
begin
  inherited Create;
end;

procedure ENamingContext_AlreadyBound.Copy(const _Input: InputStream);
begin
end;

procedure ENamingContext_AlreadyBound.WriteExceptionInfo(var _Output : OutputStream);
begin
  _Output.WriteString('IDL:omg.org/CosNaming/NamingContext/AlreadyBound:1.0');
end;

function  NamingContext_AlreadyBound_Factory: PExceptionProxy; cdecl;
begin
  with CosNaming.ENamingContext_AlreadyBound.Create() do Result := Proxy;
end;

{Not Empty Exception}

constructor ENamingContext_NotEmpty.Create;
begin
  inherited Create;
end;

procedure ENamingContext_NotEmpty.Copy(const _Input: InputStream);
begin
end;

procedure ENamingContext_NotEmpty.WriteExceptionInfo(var _Output : OutputStream);
begin
  _Output.WriteString('IDL:omg.org/CosNaming/NamingContext/NotEmpty:1.0');
end;

function  NamingContext_NotEmpty_Factory: PExceptionProxy; cdecl;
begin
  with CosNaming.ENamingContext_NotEmpty.Create() do Result := Proxy;
end;

{Naming Context Factory Helper}

class procedure TNamingContextFactoryHelper.Insert(var _A : CORBA.Any; const _Value : CosNaming.NamingContextFactory);
begin
  _A := Orb.MakeObjectRef( TNamingContextFactoryHelper.TypeCode, _Value as CORBA.CORBAObject);
end;

class function TNamingContextFactoryHelper.Extract(var _A : CORBA.Any): CosNaming.NamingContextFactory;
var
  _obj : Corba.CorbaObject;
begin
  _obj := Orb.GetObjectRef(_A);
  Result := TNamingContextFactoryHelper.Narrow(_obj, True);
end;

class function TNamingContextFactoryHelper.TypeCode : CORBA.TypeCode;
begin
  Result := ORB.CreateInterfaceTC(RepositoryId, 'NamingContextFactory');
end;

class function TNamingContextFactoryHelper.RepositoryId : string;
begin
  Result := 'IDL:omg.org/CosNaming/NamingContextFactory:1.0';
end;

class function TNamingContextFactoryHelper.Read(const _Input : CORBA.InputStream) : CosNaming.NamingContextFactory;
var
  _Obj : CORBA.CORBAObject;
begin
  _Input.ReadObject(_Obj);
  Result := Narrow(_Obj, True)
end;

class procedure TNamingContextFactoryHelper.Write(const _Output : CORBA.OutputStream; const _Value : CosNaming.NamingContextFactory);
begin
  _Output.WriteObject(_Value as CORBA.CORBAObject);
end;

class function TNamingContextFactoryHelper.Narrow(const _Obj : CORBA.CORBAObject; _IsA : Boolean) : CosNaming.NamingContextFactory;
begin
  Result := nil;
  if (_Obj = nil) or (_Obj.QueryInterface(CosNaming.NamingContextFactory, Result) = 0)
    then Exit;
  if _IsA and _Obj._IsA(RepositoryId) then
    Result := TNamingContextFactoryStub.Create(_Obj);
end;

class function TNamingContextFactoryHelper.Bind(const _InstanceName : string = ''; _HostName: string = '') : CosNaming.NamingContextFactory;
begin
  Result := Narrow(ORB.bind(RepositoryId, _InstanceName, _HostName), True);
end;

class function TNamingContextFactoryHelper.Bind(_Options : BindOptions; const _InstanceName : string = ''; _HostName : string = '') : CosNaming.NamingContextFactory;
begin
  Result := Narrow(ORB.bind(RepositoryId, _Options, _InstanceName, _HostName), True);
end;

{Naming Context Factory Stub}

function  TNamingContextFactoryStub.create_context : CosNaming.NamingContext;
var
  _Output: CORBA.OutputStream;
  _Input : CORBA.InputStream;
begin
  inherited _CreateRequest('create_context',True, _Output);
  inherited _Invoke(_Output, _Input);
  Result := CosNaming.TNamingContextHelper.Read(_Input);
end;

procedure TNamingContextFactoryStub.shutdown ;
var
  _Output: CORBA.OutputStream;
  _Input : CORBA.InputStream;
begin
  inherited _CreateRequest('shutdown',False, _Output);
  inherited _Invoke(_Output, _Input);
end;

{Extended Naming  Context Factory Helper}

class procedure TExtendedNamingContextFactoryHelper.Insert(var _A : CORBA.Any; const _Value : CosNaming.ExtendedNamingContextFactory);
begin
  _A := Orb.MakeObjectRef( TExtendedNamingContextFactoryHelper.TypeCode, _Value as CORBA.CORBAObject);
end;

class function TExtendedNamingContextFactoryHelper.Extract(var _A : CORBA.Any): CosNaming.ExtendedNamingContextFactory;
var
  _obj : Corba.CorbaObject;
begin
  _obj := Orb.GetObjectRef(_A);
  Result := TExtendedNamingContextFactoryHelper.Narrow(_obj, True);
end;

class function TExtendedNamingContextFactoryHelper.TypeCode : CORBA.TypeCode;
begin
  Result := ORB.CreateInterfaceTC(RepositoryId, 'ExtendedNamingContextFactory');
end;

class function TExtendedNamingContextFactoryHelper.RepositoryId : string;
begin
  Result := 'IDL:omg.org/CosNaming/ExtendedNamingContextFactory:1.0';
end;

class function TExtendedNamingContextFactoryHelper.Read(const _Input : CORBA.InputStream) : CosNaming.ExtendedNamingContextFactory;
var
  _Obj : CORBA.CORBAObject;
begin
  _Input.ReadObject(_Obj);
  Result := Narrow(_Obj, True)
end;

class procedure TExtendedNamingContextFactoryHelper.Write(const _Output : CORBA.OutputStream; const _Value : CosNaming.ExtendedNamingContextFactory);
begin
  _Output.WriteObject(_Value as CORBA.CORBAObject);
end;

class function TExtendedNamingContextFactoryHelper.Narrow(const _Obj : CORBA.CORBAObject; _IsA : Boolean) : CosNaming.ExtendedNamingContextFactory;
begin
  Result := nil;
  if (_Obj = nil) or (_Obj.QueryInterface(CosNaming.ExtendedNamingContextFactory, Result) = 0)
    then Exit;
  if _IsA and _Obj._IsA(RepositoryId) then
    Result := TExtendedNamingContextFactoryStub.Create(_Obj);
end;

class function TExtendedNamingContextFactoryHelper.Bind(const _InstanceName : string = ''; _HostName: string = '') : CosNaming.ExtendedNamingContextFactory;
begin
  Result := Narrow(ORB.bind(RepositoryId, _InstanceName, _HostName), True);
end;

class function TExtendedNamingContextFactoryHelper.Bind(_Options : BindOptions; const _InstanceName : string = ''; _HostName : string = '') : CosNaming.ExtendedNamingContextFactory;
begin
  Result := Narrow(ORB.bind(RepositoryId, _Options, _InstanceName, _HostName), True);
end;

{Extended Naming Context Factory Stub}

function  TExtendedNamingContextFactoryStub.root_context : CosNaming.NamingContext;
var
  _Output: CORBA.OutputStream;
  _Input : CORBA.InputStream;
begin
  inherited _CreateRequest('root_context',True, _Output);
  inherited _Invoke(_Output, _Input);
  Result := CosNaming.TNamingContextHelper.Read(_Input);
end;

function  TExtendedNamingContextFactoryStub.create_context : CosNaming.NamingContext;
var
  _Output: CORBA.OutputStream;
  _Input : CORBA.InputStream;
begin
  inherited _CreateRequest('create_context',True, _Output);
  inherited _Invoke(_Output, _Input);
  Result := CosNaming.TNamingContextHelper.Read(_Input);
end;

procedure TExtendedNamingContextFactoryStub.shutdown ;
var
  _Output: CORBA.OutputStream;
  _Input : CORBA.InputStream;
begin
  inherited _CreateRequest('shutdown',False, _Output);
  inherited _Invoke(_Output, _Input);
end;

{LName Component Helper}

class procedure TLNameComponentHelper.Insert(var _A : CORBA.Any; const _Value : CosNaming.LNameComponent);
begin
  _A := Orb.MakeObjectRef( TLNameComponentHelper.TypeCode, _Value as CORBA.CORBAObject);
end;

class function TLNameComponentHelper.Extract(var _A : CORBA.Any): CosNaming.LNameComponent;
var
  _obj : Corba.CorbaObject;
begin
  _obj := Orb.GetObjectRef(_A);
  Result := TLNameComponentHelper.Narrow(_obj, True);
end;

class function TLNameComponentHelper.TypeCode : CORBA.TypeCode;
begin
  Result := ORB.CreateInterfaceTC(RepositoryId, 'LNameComponent');
end;

class function TLNameComponentHelper.RepositoryId : string;
begin
  Result := 'IDL:omg.org/CosNaming/LNameComponent:1.0';
end;

class function TLNameComponentHelper.Read(const _Input : CORBA.InputStream) : CosNaming.LNameComponent;
var
  _Obj : CORBA.CORBAObject;
begin
  _Input.ReadObject(_Obj);
  Result := Narrow(_Obj, True)
end;

class procedure TLNameComponentHelper.Write(const _Output : CORBA.OutputStream; const _Value : CosNaming.LNameComponent);
begin
  _Output.WriteObject(_Value as CORBA.CORBAObject);
end;

class function TLNameComponentHelper.Narrow(const _Obj : CORBA.CORBAObject; _IsA : Boolean) : CosNaming.LNameComponent;
begin
  Result := nil;
  if (_Obj = nil) or (_Obj.QueryInterface(CosNaming.LNameComponent, Result) = 0)
    then Exit;
  if _IsA and _Obj._IsA(RepositoryId) then
    Result := TLNameComponentStub.Create(_Obj);
end;

class function TLNameComponentHelper.Bind(const _InstanceName : string = ''; _HostName: string = '') : CosNaming.LNameComponent;
begin
  Result := Narrow(ORB.bind(RepositoryId, _InstanceName, _HostName), True);
end;

class function TLNameComponentHelper.Bind(_Options : BindOptions; const _InstanceName : string = ''; _HostName : string = '') : CosNaming.LNameComponent;
begin
  Result := Narrow(ORB.bind(RepositoryId, _Options, _InstanceName, _HostName), True);
end;

{LName Component Stub}

function  TLNameComponentStub.get_id : AnsiString;
var
  _Output: CORBA.OutputStream;
  _Input : CORBA.InputStream;
begin
  inherited _CreateRequest('get_id',True, _Output);
  inherited _Invoke(_Output, _Input);
  _Input.ReadString(Result);
end;

procedure TLNameComponentStub.set_id ( const id : AnsiString);
var
  _Output: CORBA.OutputStream;
  _Input : CORBA.InputStream;
begin
  inherited _CreateRequest('set_id',True, _Output);
  _Output.WriteString(id);
  inherited _Invoke(_Output, _Input);
end;

function  TLNameComponentStub.get_kind : AnsiString;
var
  _Output: CORBA.OutputStream;
  _Input : CORBA.InputStream;
begin
  inherited _CreateRequest('get_kind',True, _Output);
  inherited _Invoke(_Output, _Input);
  _Input.ReadString(Result);
end;

procedure TLNameComponentStub.set_kind ( const kind : AnsiString);
var
  _Output: CORBA.OutputStream;
  _Input : CORBA.InputStream;
begin
  inherited _CreateRequest('set_kind',True, _Output);
  _Output.WriteString(kind);
  inherited _Invoke(_Output, _Input);
end;

procedure TLNameComponentStub._destroy ;
var
  _Output: CORBA.OutputStream;
  _Input : CORBA.InputStream;
begin
  inherited _CreateRequest('destroy',True, _Output);
  inherited _Invoke(_Output, _Input);
end;

{LName Component Not Set Exception}

constructor ELNameComponent_NotSet.Create;
begin
  inherited Create;
end;

procedure ELNameComponent_NotSet.Copy(const _Input: InputStream);
begin
end;

procedure ELNameComponent_NotSet.WriteExceptionInfo(var _Output : OutputStream);
begin
  _Output.WriteString('IDL:omg.org/CosNaming/LNameComponent/NotSet:1.0');
end;

function  LNameComponent_NotSet_Factory: PExceptionProxy; cdecl;
begin
  with CosNaming.ELNameComponent_NotSet.Create() do Result := Proxy;
end;

{LName Helper}

class procedure TLNameHelper.Insert(var _A : CORBA.Any; const _Value : CosNaming.LName);
begin
  _A := Orb.MakeObjectRef( TLNameHelper.TypeCode, _Value as CORBA.CORBAObject);
end;

class function TLNameHelper.Extract(var _A : CORBA.Any): CosNaming.LName;
var
  _obj : Corba.CorbaObject;
begin
  _obj := Orb.GetObjectRef(_A);
  Result := TLNameHelper.Narrow(_obj, True);
end;

class function TLNameHelper.TypeCode : CORBA.TypeCode;
begin
  Result := ORB.CreateInterfaceTC(RepositoryId, 'LName');
end;

class function TLNameHelper.RepositoryId : string;
begin
  Result := 'IDL:omg.org/CosNaming/LName:1.0';
end;

class function TLNameHelper.Read(const _Input : CORBA.InputStream) : CosNaming.LName;
var
  _Obj : CORBA.CORBAObject;
begin
  _Input.ReadObject(_Obj);
  Result := Narrow(_Obj, True)
end;

class procedure TLNameHelper.Write(const _Output : CORBA.OutputStream; const _Value : CosNaming.LName);
begin
  _Output.WriteObject(_Value as CORBA.CORBAObject);
end;

class function TLNameHelper.Narrow(const _Obj : CORBA.CORBAObject; _IsA : Boolean) : CosNaming.LName;
begin
  Result := nil;
  if (_Obj = nil) or (_Obj.QueryInterface(CosNaming.LName, Result) = 0)
    then Exit;
  if _IsA and _Obj._IsA(RepositoryId) then
    Result := TLNameStub.Create(_Obj);
end;

class function TLNameHelper.Bind(const _InstanceName : string = ''; _HostName: string = '') : CosNaming.LName;
begin
  Result := Narrow(ORB.bind(RepositoryId, _InstanceName, _HostName), True);
end;

class function TLNameHelper.Bind(_Options : BindOptions; const _InstanceName : string = ''; _HostName : string = '') : CosNaming.LName;
begin
  Result := Narrow(ORB.bind(RepositoryId, _Options, _InstanceName, _HostName), True);
end;

{LName Stub}

function  TLNameStub.insert_component(const index : Cardinal;
                                      const nameComponent : CosNaming.LNameComponent): CosNaming.LName;
var
  _Output: CORBA.OutputStream;
  _Input : CORBA.InputStream;
begin
  inherited _CreateRequest('insert_component',True, _Output);
  _Output.WriteULong(index);
  CosNaming.TLNameComponentHelper.Write(_Output, nameComponent);
  inherited _Invoke(_Output, _Input);
  Result := CosNaming.TLNameHelper.Read(_Input);
end;

function  TLNameStub.get_component(const index : Cardinal): CosNaming.LNameComponent;
var
  _Output: CORBA.OutputStream;
  _Input : CORBA.InputStream;
begin
  inherited _CreateRequest('get_component',True, _Output);
  _Output.WriteULong(index);
  inherited _Invoke(_Output, _Input);
  Result := CosNaming.TLNameComponentHelper.Read(_Input);
end;

function  TLNameStub.delete_component(const index : Cardinal): CosNaming.LNameComponent;
var
  _Output: CORBA.OutputStream;
  _Input : CORBA.InputStream;
begin
  inherited _CreateRequest('delete_component',True, _Output);
  _Output.WriteULong(index);
  inherited _Invoke(_Output, _Input);
  Result := CosNaming.TLNameComponentHelper.Read(_Input);
end;

function  TLNameStub.num_components : Cardinal;
var
  _Output: CORBA.OutputStream;
  _Input : CORBA.InputStream;
begin
  inherited _CreateRequest('num_components',True, _Output);
  inherited _Invoke(_Output, _Input);
  _Input.ReadULong(Result);
end;

function  TLNameStub.equal(const name : CosNaming.LName): Boolean;
var
  _Output: CORBA.OutputStream;
  _Input : CORBA.InputStream;
begin
  inherited _CreateRequest('equal',True, _Output);
  CosNaming.TLNameHelper.Write(_Output, name);
  inherited _Invoke(_Output, _Input);
  _Input.ReadBoolean(Result);
end;

function  TLNameStub.less_than(const name : CosNaming.LName): Boolean;
var
  _Output: CORBA.OutputStream;
  _Input : CORBA.InputStream;
begin
  inherited _CreateRequest('less_than',True, _Output);
  CosNaming.TLNameHelper.Write(_Output, name);
  inherited _Invoke(_Output, _Input);
  _Input.ReadBoolean(Result);
end;

function  TLNameStub.to_idl_form : CosNaming.Name;
var
  _Output: CORBA.OutputStream;
  _Input : CORBA.InputStream;
begin
  inherited _CreateRequest('to_idl_form',True, _Output);
  inherited _Invoke(_Output, _Input);
  Result := CosNaming.TNameHelper.Read(_Input);
end;

procedure TLNameStub.from_idl_form(const name : CosNaming.Name);
var
  _Output: CORBA.OutputStream;
  _Input : CORBA.InputStream;
begin
  inherited _CreateRequest('from_idl_form',True, _Output);
  CosNaming.TNameHelper.Write(_Output, name);
  inherited _Invoke(_Output, _Input);
end;

procedure TLNameStub._destroy;
var
  _Output: CORBA.OutputStream;
  _Input : CORBA.InputStream;
begin
  inherited _CreateRequest('destroy',True, _Output);
  inherited _Invoke(_Output, _Input);
end;

{LName Exception No Component}

constructor ELName_NoComponent.Create;
begin
  inherited Create;
end;

procedure ELName_NoComponent.Copy(const _Input: InputStream);
begin
end;

procedure ELName_NoComponent.WriteExceptionInfo(var _Output : OutputStream);
begin
  _Output.WriteString('IDL:omg.org/CosNaming/LName/NoComponent:1.0');
end;

function  LName_NoComponent_Factory: PExceptionProxy; cdecl;
begin
  with CosNaming.ELName_NoComponent.Create() do Result := Proxy;
end;

{LName Exception OverFlow}

constructor ELName_OverFlow.Create;
begin
  inherited Create;
end;

procedure ELName_OverFlow.Copy(const _Input: InputStream);
begin
end;

procedure ELName_OverFlow.WriteExceptionInfo(var _Output : OutputStream);
begin
  _Output.WriteString('IDL:omg.org/CosNaming/LName/OverFlow:1.0');
end;

function  LName_OverFlow_Factory: PExceptionProxy; cdecl;
begin
  with CosNaming.ELName_OverFlow.Create() do Result := Proxy;
end;

{LName Exception Invalid Name}

constructor ELName_InvalidName.Create;
begin
  inherited Create;
end;

procedure ELName_InvalidName.Copy(const _Input: InputStream);
begin
end;

procedure ELName_InvalidName.WriteExceptionInfo(var _Output : OutputStream);
begin
  _Output.WriteString('IDL:omg.org/CosNaming/LName/InvalidName:1.0');
end;

function  LName_InvalidName_Factory: PExceptionProxy; cdecl;
begin
  with CosNaming.ELName_InvalidName.Create() do Result := Proxy;
end;

{LName Factory Helper}

class procedure TLNameFactoryHelper.Insert(var _A : CORBA.Any; const _Value : CosNaming.LNameFactory);
begin
  _A := Orb.MakeObjectRef( TLNameFactoryHelper.TypeCode, _Value as CORBA.CORBAObject);
end;

class function TLNameFactoryHelper.Extract(var _A : CORBA.Any): CosNaming.LNameFactory;
var
  _obj : Corba.CorbaObject;
begin
  _obj := Orb.GetObjectRef(_A);
  Result := TLNameFactoryHelper.Narrow(_obj, True);
end;

class function TLNameFactoryHelper.TypeCode : CORBA.TypeCode;
begin
  Result := ORB.CreateInterfaceTC(RepositoryId, 'LNameFactory');
end;

class function TLNameFactoryHelper.RepositoryId : string;
begin
  Result := 'IDL:omg.org/CosNaming/LNameFactory:1.0';
end;

class function TLNameFactoryHelper.Read(const _Input : CORBA.InputStream) : CosNaming.LNameFactory;
var
  _Obj : CORBA.CORBAObject;
begin
  _Input.ReadObject(_Obj);
  Result := Narrow(_Obj, True)
end;

class procedure TLNameFactoryHelper.Write(const _Output : CORBA.OutputStream; const _Value : CosNaming.LNameFactory);
begin
  _Output.WriteObject(_Value as CORBA.CORBAObject);
end;

class function TLNameFactoryHelper.Narrow(const _Obj : CORBA.CORBAObject; _IsA : Boolean) : CosNaming.LNameFactory;
begin
  Result := nil;
  if (_Obj = nil) or (_Obj.QueryInterface(CosNaming.LNameFactory, Result) = 0)
    then Exit;
  if _IsA and _Obj._IsA(RepositoryId) then
    Result := TLNameFactoryStub.Create(_Obj);
end;

class function TLNameFactoryHelper.Bind(const _InstanceName : string = ''; _HostName: string = '') : CosNaming.LNameFactory;
begin
  Result := Narrow(ORB.bind(RepositoryId, _InstanceName, _HostName), True);
end;

class function TLNameFactoryHelper.Bind(_Options : BindOptions; const _InstanceName : string = ''; _HostName : string = '') : CosNaming.LNameFactory;
begin
  Result := Narrow(ORB.bind(RepositoryId, _Options, _InstanceName, _HostName), True);
end;

function  TLNameFactoryStub.create_lname : CosNaming.LName;
var
  _Output: CORBA.OutputStream;
  _Input : CORBA.InputStream;
begin
  inherited _CreateRequest('create_lname',True, _Output);
  inherited _Invoke(_Output, _Input);
  Result := CosNaming.TLNameHelper.Read(_Input);
end;

function  TLNameFactoryStub.create_lname_component : CosNaming.LNameComponent;
var
  _Output: CORBA.OutputStream;
  _Input : CORBA.InputStream;
begin
  inherited _CreateRequest('create_lname_component',True, _Output);
  inherited _Invoke(_Output, _Input);
  Result := CosNaming.TLNameComponentHelper.Read(_Input);
end;

{Log Record Helper}

class procedure TLogRecordHelper.Insert(var _A : CORBA.Any; const _Value : CosNaming.LogRecord);
var
  _Output : CORBA.OutputStream;
begin
  _Output := ORB.CreateOutputStream;
  TLogRecordHelper.Write(_Output, _Value);
  ORB.PutAny(_A, TLogRecordHelper.TypeCode, _Output);
end;

class function TLogRecordHelper.Extract(const _A : CORBA.Any) : CosNaming.LogRecord;
var
  _Input : CORBA.InputStream;
begin
  Orb.GetAny(_A, _Input);
  Result := TLogRecordHelper.Read(_Input);
end;

class function TLogRecordHelper.TypeCode : CORBA.TypeCode;
var
  _Seq: StructMemberSeq;
begin
  SetLength(_Seq, 6);
  _Seq[0].Name := 'operation_key';
  _Seq[0].TC   := ORB.CreateTC(Integer(tk_char));
  _Seq[1].Name := 'context_index';
  _Seq[1].TC   := ORB.CreateTC(Integer(tk_long));
  _Seq[2].Name := 'name';
  _Seq[2].TC   := CosNaming.TNameHelper.TypeCode;
  _Seq[3].Name := 'target_object';
  _Seq[3].TC   := ORB.CreateTC(Integer(tk_objref));
  _Seq[4].Name := 'target_context';
  _Seq[4].TC   := CosNaming.TNamingContextHelper.TypeCode;
  _Seq[5].Name := 'target_context_index';
  _Seq[5].TC   := ORB.CreateTC(Integer(tk_long));
  Result := ORB.MakeStructureTypecode(RepositoryID, 'LogRecord', _Seq);
end;

class function TLogRecordHelper.RepositoryId : string;
begin
  Result := 'IDL:omg.org/CosNaming/LogRecord:1.0';
end;

class function TLogRecordHelper.Read(const _Input : CORBA.InputStream) : CosNaming.LogRecord;
var
  _Value : CosNaming.TLogRecord;
begin
  _Value := CosNaming.TLogRecord.Create;
  _Input.ReadChar(_Value.operation_key);
  _Input.ReadLong(_Value.context_index);
  _Value.name := CosNaming.TNameHelper.Read(_Input);
  _Input.ReadObject(_Value.target_object);
  _Value.target_context := CosNaming.TNamingContextHelper.Read(_Input);
  _Input.ReadLong(_Value.target_context_index);
  Result := _Value;
end;

class procedure TLogRecordHelper.Write(const _Output : CORBA.OutputStream; const _Value : CosNaming.LogRecord);
begin
  _Output.WriteChar(_Value.operation_key);
  _Output.WriteLong(_Value.context_index);
  CosNaming.TNameHelper.Write(_Output, _Value.name);
  _Output.WriteObject(_Value.target_object);
  CosNaming.TNamingContextHelper.Write(_Output, _Value.target_context);
  _Output.WriteLong(_Value.target_context_index);
end;

{TLogRecord}

constructor TLogRecord.Create;
begin
  inherited Create;
end;

constructor TLogRecord.Create(const operation_key: Char;
                              const context_index: Integer;
                              const name: CosNaming.Name;
                              const target_object: CORBAObject;
                              const target_context: CosNaming.NamingContext;
                              const target_context_index: Integer);
begin
  Self.operation_key := operation_key;
  Self.context_index := context_index;
  Self.name := name;
  Self.target_object := target_object;
  Self.target_context := target_context;
  Self.target_context_index := target_context_index;
end;

function  TLogRecord._get_operation_key: Char;
begin
  Result := operation_key;
end;

procedure TLogRecord._set_operation_key(const _Value : Char);
begin
  operation_key := _Value;
end;

function  TLogRecord._get_context_index: Integer;
begin
  Result := context_index;
end;

procedure TLogRecord._set_context_index(const _Value : Integer);
begin
  context_index := _Value;
end;

function  TLogRecord._get_name: CosNaming.Name;
begin
  Result := name;
end;

procedure TLogRecord._set_name(const _Value : CosNaming.Name);
begin
  name := _Value;
end;

function  TLogRecord._get_target_object: CORBAObject;
begin
  Result := target_object;
end;

procedure TLogRecord._set_target_object(const _Value : CORBAObject);
begin
  target_object := _Value;
end;

function  TLogRecord._get_target_context: CosNaming.NamingContext;
begin
  Result := target_context;
end;

procedure TLogRecord._set_target_context(const _Value : CosNaming.NamingContext);
begin
  target_context := _Value;
end;

function  TLogRecord._get_target_context_index: Integer;
begin
  Result := target_context_index;
end;

procedure TLogRecord._set_target_context_index(const _Value : Integer);
begin
  target_context_index := _Value;
end;

{TLogHelper}

class procedure TLogHelper.Insert(var _A : CORBA.Any; const _Value : CosNaming.Log);
begin
  _A := Orb.MakeObjectRef( TLogHelper.TypeCode, _Value as CORBA.CORBAObject);
end;

class function TLogHelper.Extract(var _A : CORBA.Any): CosNaming.Log;
var
  _obj : Corba.CorbaObject;
begin
  _obj := Orb.GetObjectRef(_A);
  Result := TLogHelper.Narrow(_obj, True);
end;

class function TLogHelper.TypeCode : CORBA.TypeCode;
begin
  Result := ORB.CreateInterfaceTC(RepositoryId, 'Log');
end;

class function TLogHelper.RepositoryId : string;
begin
  Result := 'IDL:omg.org/CosNaming/Log:1.0';
end;

class function TLogHelper.Read(const _Input : CORBA.InputStream) : CosNaming.Log;
var
  _Obj : CORBA.CORBAObject;
begin
  _Input.ReadObject(_Obj);
  Result := Narrow(_Obj, True)
end;

class procedure TLogHelper.Write(const _Output : CORBA.OutputStream; const _Value : CosNaming.Log);
begin
  _Output.WriteObject(_Value as CORBA.CORBAObject);
end;

class function TLogHelper.Narrow(const _Obj : CORBA.CORBAObject; _IsA : Boolean) : CosNaming.Log;
begin
  Result := nil;
  if (_Obj = nil) or (_Obj.QueryInterface(CosNaming.Log, Result) = 0)
    then Exit;
  if _IsA and _Obj._IsA(RepositoryId) then
    Result := TLogStub.Create(_Obj);
end;

class function TLogHelper.Bind(const _InstanceName : string = ''; _HostName: string = '') : CosNaming.Log;
begin
  Result := Narrow(ORB.bind(RepositoryId, _InstanceName, _HostName), True);
end;

class function TLogHelper.Bind(_Options : BindOptions; const _InstanceName : string = ''; _HostName : string = '') : CosNaming.Log;
begin
  Result := Narrow(ORB.bind(RepositoryId, _Options, _InstanceName, _HostName), True);
end;

{TLogStub}

procedure TLogStub.bind(const ctx : CosNaming.NamingContext;
                        const n : CosNaming.Name;
                        const obj : CORBAObject);
var
  _Output: CORBA.OutputStream;
  _Input : CORBA.InputStream;
begin
  inherited _CreateRequest('bind',True, _Output);
  CosNaming.TNamingContextHelper.Write(_Output, ctx);
  CosNaming.TNameHelper.Write(_Output, n);
  _Output.WriteObject(obj);
  inherited _Invoke(_Output, _Input);
end;

procedure TLogStub.bind_context(const ctx : CosNaming.NamingContext;
                                const n : CosNaming.Name;
                                const nc : CosNaming.NamingContext);
var
  _Output: CORBA.OutputStream;
  _Input : CORBA.InputStream;
begin
  inherited _CreateRequest('bind_context',True, _Output);
  CosNaming.TNamingContextHelper.Write(_Output, ctx);
  CosNaming.TNameHelper.Write(_Output, n);
  CosNaming.TNamingContextHelper.Write(_Output, nc);
  inherited _Invoke(_Output, _Input);
end;

procedure TLogStub.unbind(const ctx : CosNaming.NamingContext;
                          const n : CosNaming.Name);
var
  _Output: CORBA.OutputStream;
  _Input : CORBA.InputStream;
begin
  inherited _CreateRequest('unbind',True, _Output);
  CosNaming.TNamingContextHelper.Write(_Output, ctx);
  CosNaming.TNameHelper.Write(_Output, n);
  inherited _Invoke(_Output, _Input);
end;

procedure TLogStub.new_context(const ctx : CosNaming.NamingContext);
var
  _Output: CORBA.OutputStream;
  _Input : CORBA.InputStream;
begin
  inherited _CreateRequest('new_context',True, _Output);
  CosNaming.TNamingContextHelper.Write(_Output, ctx);
  inherited _Invoke(_Output, _Input);
end;

procedure TLogStub._destroy(const ctx : CosNaming.NamingContext);
var
  _Output: CORBA.OutputStream;
  _Input : CORBA.InputStream;
begin
  inherited _CreateRequest('destroy',True, _Output);
  CosNaming.TNamingContextHelper.Write(_Output, ctx);
  inherited _Invoke(_Output, _Input);
end;


initialization

  CORBA.InterfaceIDManager.RegisterInterface(CosNaming.BindingIterator, CosNaming.TBindingIteratorHelper.RepositoryId);
  CORBA.InterfaceIDManager.RegisterInterface(CosNaming.NamingContext, CosNaming.TNamingContextHelper.RepositoryId);
  CORBA.InterfaceIDManager.RegisterInterface(CosNaming.NamingContextFactory, CosNaming.TNamingContextFactoryHelper.RepositoryId);
  CORBA.InterfaceIDManager.RegisterInterface(CosNaming.ExtendedNamingContextFactory, CosNaming.TExtendedNamingContextFactoryHelper.RepositoryId);
  CORBA.InterfaceIDManager.RegisterInterface(CosNaming.LNameComponent, CosNaming.TLNameComponentHelper.RepositoryId);
  CORBA.InterfaceIDManager.RegisterInterface(CosNaming.LName, CosNaming.TLNameHelper.RepositoryId);
  CORBA.InterfaceIDManager.RegisterInterface(CosNaming.LNameFactory, CosNaming.TLNameFactoryHelper.RepositoryId);
  CORBA.InterfaceIDManager.RegisterInterface(CosNaming.Log, CosNaming.TLogHelper.RepositoryId);

  CosNaming.NamingContext_NotFoundDesc := RegisterUserException('NotFound', 'IDL:omg.org/CosNaming/NamingContext/NotFound:1.0', @CosNaming.NamingContext_NotFound_Factory);
  CosNaming.NamingContext_CannotProceedDesc := RegisterUserException('CannotProceed', 'IDL:omg.org/CosNaming/NamingContext/CannotProceed:1.0', @CosNaming.NamingContext_CannotProceed_Factory);
  CosNaming.NamingContext_InvalidNameDesc := RegisterUserException('InvalidName', 'IDL:omg.org/CosNaming/NamingContext/InvalidName:1.0', @CosNaming.NamingContext_InvalidName_Factory);
  CosNaming.NamingContext_AlreadyBoundDesc := RegisterUserException('AlreadyBound', 'IDL:omg.org/CosNaming/NamingContext/AlreadyBound:1.0', @CosNaming.NamingContext_AlreadyBound_Factory);
  CosNaming.NamingContext_NotEmptyDesc := RegisterUserException('NotEmpty', 'IDL:omg.org/CosNaming/NamingContext/NotEmpty:1.0', @CosNaming.NamingContext_NotEmpty_Factory);
  CosNaming.LNameComponent_NotSetDesc := RegisterUserException('NotSet', 'IDL:omg.org/CosNaming/LNameComponent/NotSet:1.0', @CosNaming.LNameComponent_NotSet_Factory);
  CosNaming.LName_NoComponentDesc := RegisterUserException('NoComponent', 'IDL:omg.org/CosNaming/LName/NoComponent:1.0', @CosNaming.LName_NoComponent_Factory);
  CosNaming.LName_OverFlowDesc := RegisterUserException('OverFlow', 'IDL:omg.org/CosNaming/LName/OverFlow:1.0', @CosNaming.LName_OverFlow_Factory);
  CosNaming.LName_InvalidNameDesc := RegisterUserException('InvalidName', 'IDL:omg.org/CosNaming/LName/InvalidName:1.0', @CosNaming.LName_InvalidName_Factory);


finalization

  UnRegisterUserException(CosNaming.NamingContext_NotFoundDesc);
  UnRegisterUserException(CosNaming.NamingContext_CannotProceedDesc);
  UnRegisterUserException(CosNaming.NamingContext_InvalidNameDesc);
  UnRegisterUserException(CosNaming.NamingContext_AlreadyBoundDesc);
  UnRegisterUserException(CosNaming.NamingContext_NotEmptyDesc);
  UnRegisterUserException(CosNaming.LNameComponent_NotSetDesc);
  UnRegisterUserException(CosNaming.LName_NoComponentDesc);
  UnRegisterUserException(CosNaming.LName_OverFlowDesc);
  UnRegisterUserException(CosNaming.LName_InvalidNameDesc);

end.

