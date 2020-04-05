{*******************************************************}
{                                                       }
{             Delphi LiveBindings Framework             }
{                                                       }
{ Copyright(c) 2011 Embarcadero Technologies, Inc.      }
{                                                       }
{*******************************************************}

unit System.Bindings.ObjEval;

interface

uses
  System.SysUtils, System.Generics.Collections, System.TypInfo, System.Rtti, System.Bindings.Consts,
  System.Bindings.EvalProtocol;

                                                                               

/// <summary>Creates a wrapper for the given object.</summary>
/// <param name="AObject">The object for which the wrapper is created.</param>
/// <returns>A reference to the wrapper for the given object. The returned reference
/// points to the scope support of the object wrapper.</returns>
function WrapObject(AObject: TObject): IScope;

var
  IsProxyClassProc: function(ClassType: TClass): Boolean;

implementation

uses
  System.Bindings.EvalSys, System.Bindings.CustomScope, System.Bindings.CustomWrapper,
  System.Bindings.Factories, System.RTLConsts;

type
  { TObjectWrapper

    Wraps around a spcified object and stores an internal dictionary scope to
    which it delegates most of the functionality that must be implemented to
    suppport the scope interfaces. }

  TObjectWrapper = class(TInterfacedObject,
    IWrapper,
    IValue,
    ILocation,
    IPlaceholder,
    IWrapperBinding,
    IScope, IScopeEx, IScopeSelf, IScopeEnumerable, IScopeSymbols)
  private type
    TSymbols = TList<String>;
  private var
    FIsProxyClass: Boolean;
    FCtx: TRttiContext;
    FSkipCache: Boolean;
    FCache: TDictionaryScope; // stores pairs of property/method names and intf wrappers used in the script
    FCacheCounter: IInterface;
    FObject: TObject;
    FMetaClass: TClass;
    FSymbols: TSymbols;
    FEvalTimeOnly: Boolean;
    FCustomScope: ICustomScope;
    FBinding: Pointer; // weak reference to ICompiledBinding
    FExternalWrap: Boolean;

    // returns the metaclass that best fits the parent object; if the wrapper
    // is not attached, it returns the metaclass passed in at wrapper creation
    function GetAvailClassType: TClass;
  protected
    // the following methods look up for the name in the given RTTI type and
    // create the appropriate wrapper if name is found as a member of RttiType
    function LookupMethod(RttiType: TRttiType; const Name: String): IInterface;
    function LookupProperty(RttiType: TRttiType; const Name: String): IInterface;
    function LookupIndexedProperty(RttiType: TRttiType; const Name: String): IInterface;
    function LookupField(RttiType: TRttiType; const Name: String): IInterface;
    // lookups the RTTI information for the given Name and creates for that
    // name a wrapper appropriate with the type of the member denoted by Name
    // and returns the wrapper; if there is no object member with the given Name,
    // it returns nil
    function LookupRtti(const Name: String): IInterface;

    // returns a virtual wrapper for the symbol Name; if the wrapper doesn't
    // exist in the cache, but a custom wrapper is returned by a custom scope,
    // it creates a virtual wrapper that uses the custom wrapper and adds
    // the virtual wrapper to the internal cache
    function LookupVirtualWrapper(const Name: String): IInterface;
    // returns a default RTTI wrapper for the given name by checking the RTTI
    // for the current wrapped object type; if the wrapper doesn't exist, but
    // RTTI info exists, it creates a new wrapper for the symbol and adds it to
    // the internal cache
    function LookupDefault(const Name: String): IInterface;
    property IsProxyClass: Boolean read FIsProxyClass;
  public
    // creates an object wrapper around the AObject;
    // EvalTimeOnly indicates that the wrapper has a valid value only at evaluation time;
    // Binding refers to the compiled binding that created this wrapper during compilation
    constructor Create(AObject: TObject; MetaClass: TClass; AExternalWrap: Boolean = False;
      EvalTimeOnly: Boolean = False; const Binding: ICompiledBinding = nil);
    destructor Destroy; override;

    { IValue }
    function GetType: PTypeInfo; inline;
    function GetValue: TValue; inline;

    { ILocation }
    procedure SetValue(const AValue: TValue);

    { IPlaceholder }
    function GetAttachment: TObject; inline;
                                                                                                               
    // returns the metaclass passed in at wrapper creation; it doesn't return
    // the best fit metaclass for the attachment because as a placeholder,
    // it must always know which is the minimum requirement for the object class
    function GetMetaClass: TClass; inline;
    function GetAttached: Boolean; inline;
    function GetEvalTimeOnly: Boolean; inline;

    // intercept the calls to attach/detach to change the value of FValue accordingly
    procedure Attach(Obj: TObject);
    procedure Detach;

    { IWrapperBinding }
    function GetBinding: ICompiledBinding; inline;
    procedure SetBinding(const Binding: ICompiledBinding); inline;

    property Binding: ICompiledBinding read GetBinding write SetBinding;

    { IScopeSelf }
    function GetSelf: IInterface; inline;

    { IScope }
    function Lookup(const Name: string): IInterface; overload;

    { IScopeEx }
    // checks if Obj is wrapped by this wrapper; if not, it searches for a wrapper
    // in the internal cache that may wrap Obj; it returns the found wrapper or
    // nil if no wrapper wraps Obj
    function Lookup(Obj: TObject): IInterface; overload; inline;

    { IScopeEnumerable }
    function GetEnumerator: IScopeEnumerator;

    { IScopeSymbols }
    function GetSymbols(Index: Integer): String; inline;
    procedure SetSymbols(Index: Integer; const Value: String); inline;
    function GetSymbolCount: Integer; inline;

    procedure Add(const Symbol: String); inline;
    procedure Remove(const Symbol: String); inline;
    function Contains(const Symbol: String): Boolean; inline;
    procedure Clear; inline;

    property Symbols[Index: Integer]: String read GetSymbols write SetSymbols;
    property SymbolCount: Integer read GetSymbolCount;
  end;

  TAbstractObjectMemberGroup = class abstract(TInterfacedObject,
    IWrapper,
    IChild, IPlaceholder,
    IGroup,
    IWrapperBinding,
    IScopeEnumerable)
  private
    FCounter: IInterface;
    FCache: TObjectMemberGroupScope; // sustains links to all the result wrappers of the indexed property
    FEvalTimeOnly: Boolean;
    FBinding: Pointer; // weak reference to ICompiledBinding
  public
    constructor Create(EvalTimeOnly: Boolean; const Binding: ICompiledBinding);
    destructor Destroy; override;

    { IChild }
    function GetParent: TObject; virtual; abstract;
    function GetMemberName: String; virtual; abstract;

    { IPlaceholder }
    function GetAttachment: TObject; virtual; abstract;
    function GetMetaClass: TClass; virtual; abstract;
    function GetAttached: Boolean; inline;
    function GetEvalTimeOnly: Boolean; inline;

    procedure Attach(Obj: TObject); virtual; abstract;
    procedure Detach; virtual; abstract;

    { IGroup }
    function GetWrappers(Index: Integer): IInterface; inline;
    function GetWrapperCount: Integer; inline;

    function Add: Integer; overload; inline;
    function Add(out Wrapper: IInterface): Integer; overload; virtual; abstract;
    procedure Clear; inline;

    property Wrappers[Index: Integer]: IInterface read GetWrappers;
    property WrapperCount: Integer read GetWrapperCount;

    { IWrapperBinding }
    function GetBinding: ICompiledBinding; inline;
    procedure SetBinding(const Binding: ICompiledBinding); inline;

    { IScopeEnumerable }
    function GetEnumerator: IScopeEnumerator;
  end;

  TPhysicalObjectMemberGroup = class abstract(TAbstractObjectMemberGroup,
    IRttiChild)
  private
    FObject: TObject;
    FMetaClass: TClass;
    FMember: TRttiMember;
    FAttaching: Boolean;
  public
    constructor Create(AObject: TObject; AMember: TRttiMember; MetaClass: TClass;
      EvalTimeOnly: Boolean; const Binding: ICompiledBinding);

    // these methods attach/detach the group wrapper to/from the given object
    // and doesn't propagate this down to the member instance wrappers in its scope
    procedure AttachObjectOnly(Obj: TObject); inline;
    procedure DetachObjectOnly; inline;

    { IChild }
    function GetParent: TObject; override;
    function GetMemberName: String; override;

    { IRttiChild }
    function GetMember: TRttiMember; virtual;

    { IPlaceholder }
    function GetAttachment: TObject; override;
    function GetMetaClass: TClass; override;

    procedure Attach(Obj: TObject); override;
    procedure Detach; override;
  end;

  TObjectPropertyGroup = class(TPhysicalObjectMemberGroup)
  public
    constructor Create(AObject: TObject; AProperty: TRttiProperty; MetaClass: TClass;
      EvalTimeOnly: Boolean; const Binding: ICompiledBinding);

    { IGroup }
    function Add(out Wrapper: IInterface): Integer; override;
  end;

  TIndexedObjectPropertyGroup = class(TPhysicalObjectMemberGroup)
  public
    constructor Create(AObject: TObject; AIndexedProperty: TRttiIndexedProperty;
      MetaClass: TClass; const Binding: ICompiledBinding);

    { IGroup }
    function Add(out Wrapper: IInterface): Integer; override;
  end;

  TObjectFieldGroup = class(TPhysicalObjectMemberGroup)
  public
    constructor Create(AObject: TObject; AField: TRttiField; MetaClass: TClass;
      EvalTimeOnly: Boolean; const Binding: ICompiledBinding);

    { IGroup }
    function Add(out Wrapper: IInterface): Integer; override;
  end;

  TObjectMethodGroup = class(TPhysicalObjectMemberGroup)
  public
    constructor Create(AObject: TObject; AMethod: TRttiMethod; MetaClass: TClass;
      const Binding: ICompiledBinding);

    { IGroup }
    function Add(out Wrapper: IInterface): Integer; override;
  end;

  TDynamicObjectMemberGroup = class(TPhysicalObjectMemberGroup,
    IDynamicGroup)
  private
    FFixedGroup: IGroup;
    FMemberName: String;
  public
    constructor Create(AObject: TObject; AMemberName: String; MetaClass: TClass;
      const Binding: ICompiledBinding);

    { IChild }
    function GetMemberName: String; override;

    { IRttiChild }
    function GetMember: TRttiMember; override;

    { IGroup }
    function Add(out Wrapper: IInterface): Integer; override;

    { IDynamicGroup }
    function GetFixedGroup: IGroup; inline;
    procedure SetFixedGroup(const Group: IGroup);
  end;

  TVirtualObjectMemberGroup = class(TAbstractObjectMemberGroup)
  private
    FCustomWrapper: IInterface;
    FWrapperType: TCustomWrapperType;
    FAttaching: Boolean;

    // raises an exception if the given wrapper does not support the specified
    // interface; the name of the interface is necessary for the error message
    procedure CheckIntfSupport(const Wrapper: IInterface;
      const IID: TGUID; const IntfName: String);
    // verifies if the passed custom wrapper implements the needed interfaces
    procedure CheckCustomWrapper(const Wrapper: IInterface);
  public
    constructor Create(const CustomWrapper: IInterface; const Binding: ICompiledBinding);

    { IChild }
    function GetParent: TObject; override;
    function GetMemberName: String; override;

    { IPlaceholder }
    function GetAttachment: TObject; override;
    function GetMetaClass: TClass; override;

    procedure Attach(Obj: TObject); override;
    procedure Detach; override;

    { IGroup }
    function Add(out Wrapper: IInterface): Integer; override;
  end;

  TAbstractObjectMemberInstance = class abstract(TInterfacedObject, IInterface,
    IWrapper,
    IValue, ILocation,
    IChild, IPlaceholder,
    IWrapperBinding,
    IScope, IScopeEx, IScopeEnumerable, IScopeSymbols)
  private
    FGroup: TAbstractObjectMemberGroup;
    FCache: TObjectWrapper;
    FCacheCounter: IInterface;
  protected
    // permits lazy instantiation of the cache; the cache is used only when
    // the result type of the property is of an object type; otherwise it is nil
    function GetCache: TObjectWrapper;
    // returns True if the wrapper can have an internal cache instantiated
    function CanCache: Boolean; virtual;
    // returns True if the result type of the property is of an object type
    function IsObjectType: Boolean; inline;
  public
    constructor Create(Group: TAbstractObjectMemberGroup);
    destructor Destroy; override;

    { IInterface }
    // reimplement IInterface.QI to conditionally support IScope depending on value
    function QueryInterface(const IID: TGUID; out Obj): HRESULT; virtual; stdcall;

    { IValue }
    function GetType: PTypeInfo; virtual; abstract;
    function GetValue: TValue; virtual; abstract;

    { ILocation }
    procedure SetValue(const AValue: TValue); virtual; abstract;

    { IChild }
    function GetParent: TObject; inline;
    function GetMemberName: String; inline;

    { IPlaceholder }
    function GetAttachment: TObject; inline;
    function GetMetaClass: TClass; inline;
    function GetAttached: Boolean; inline;
    function GetEvalTimeOnly: Boolean; inline;

    // intercept the calls to attach/detach to change the value of FValue accordingly
    // and redirect to the internal cache storing the actual information
    procedure Attach(Obj: TObject); virtual; abstract;
    procedure Detach; virtual; abstract;

    { IWrapperBinding }
    function GetBinding: ICompiledBinding; inline;
    procedure SetBinding(const Binding: ICompiledBinding);

    // the scope support is restricted in QueryInterface, depending on the
    // result type of the property; if it's of an object type, the scope support
    // interfaces can be queried
    { IScope }
    function Lookup(const Name: string): IInterface; overload; inline;

    { IScopeEx }
    function Lookup(Obj: TObject): IInterface; overload; inline;

    { IScopeEnumerable }
    function GetEnumerator: IScopeEnumerator; inline;

    { IScopeSymbols }
    function GetSymbols(Index: Integer): String; inline;
    procedure SetSymbols(Index: Integer; const Value: String); inline;
    function GetSymbolCount: Integer; inline;

    procedure Add(const Symbol: String); inline;
    procedure Remove(const Symbol: String); inline;
    function Contains(const Symbol: String): Boolean; inline;
    procedure Clear; inline;
  end;

  TPhysicalObjectMemberInstance = class abstract(TAbstractObjectMemberInstance,
    IRttiChild)
  private
    FAttaching: Boolean;
  public
    constructor Create(Group: TPhysicalObjectMemberGroup);

    { IRttiChild }
    function GetMember: TRttiMember; inline;

    { IPlaceholder }
    // intercept the calls to attach/detach to change the value of FValue accordingly
    // and redirect to the internal cache storing the actual information
    procedure Attach(Obj: TObject); override;
    procedure Detach; override;
  end;

  TPhysicalParamedObjectMemberInstance = class(TPhysicalObjectMemberInstance,
    IArguments)
  private
    FArgs: TArray<TValue>;
  public
    { IArguments }
    procedure SetArgs(const Args: TArray<TValue>); virtual;
    function GetArgs: TArray<TValue>; virtual;
  end;

  TObjectPropertyInstance = class(TPhysicalObjectMemberInstance)
  public
    constructor Create(Group: TObjectPropertyGroup);

    { IValue }
    function GetType: PTypeInfo; override;
    function GetValue: TValue; override;

    { ILocation }
    procedure SetValue(const AValue: TValue); override;
  end;

  TIndexedObjectPropertyInstance = class(TPhysicalParamedObjectMemberInstance)
  public
    constructor Create(Group: TIndexedObjectPropertyGroup);

    { IValue }
    function GetType: PTypeInfo; override;
    function GetValue: TValue; override;

    { ILocation }
    procedure SetValue(const AValue: TValue); override;

    { IArguments }
    procedure SetArgs(const Args: TArray<TValue>); override;
  end;

  TObjectFieldInstance = class(TPhysicalObjectMemberInstance)
  public
    constructor Create(Group: TObjectFieldGroup);

    { IValue }
    function GetType: PTypeInfo; override;
    function GetValue: TValue; override;

    { ILocation }
    procedure SetValue(const AValue: TValue); override;
  end;

  TObjectMethodInstance = class(TPhysicalParamedObjectMemberInstance,
    IInvokable)
  private
    FValue: TValue;
  public
    constructor Create(Group: TObjectMethodGroup);

    { IValue }
    function GetType: PTypeInfo; override;
    function GetValue: TValue; override;

    { ILocation }
    procedure SetValue(const AValue: TValue); override;

    { IInvokable }
    function Invoke(const Args: TArray<IValue>): IValue;
  end;

  TDynamicObjectMemberInstance = class(TPhysicalParamedObjectMemberInstance,
    IInvokable,
    IDynamicInstance)
  private
    FFixedInstance: IInterface;
  public
    constructor Create(Group: TDynamicObjectMemberGroup);

                                                                                 
    { IValue }
    function GetType: PTypeInfo; override;
    function GetValue: TValue; override;

    { ILocation }
    procedure SetValue(const AValue: TValue); override;

    { IArguments }
    procedure SetArgs(const Args: TArray<TValue>); override;
    function GetArgs: TArray<TValue>; override;

    { IInvokable }
    function Invoke(const Args: TArray<IValue>): IValue;

    { IPlaceholder }
    // reattach the fixed instance when the dynamic instance is reattaching
    procedure Attach(Obj: TObject); override;
    procedure Detach; override;

    { IDynamicInstance }
    function GetFixedInstance: IInterface; inline;
    procedure SetFixedInstance(const Instance: IInterface); inline;
  end;

  TVirtualObjectMemberInstance = class(TAbstractObjectMemberInstance,
    IArguments, IInvokable)
  private
    FValue: TValue;
    FArgs: TArray<TValue>;
    FAttaching: Boolean;

    function GetCustomWrapper: IInterface; inline;
    function GetWrapperType: TCustomWrapperType;
  protected
    // virtual instances must have a cache because the type of the virtual
    // member may not be known at compile-time; if the expression considers
    // the wrapped member as an object and it won't be true at evaluation time,
    // evaluation errors will be risen
    function CanCache: Boolean; override;
  public
    constructor Create(Group: TVirtualObjectMemberGroup);

    { IInterface }
    function QueryInterface(const IID: TGUID; out Obj): HResult; override; stdcall;

    { IValue }
    function GetType: PTypeInfo; override;
    function GetValue: TValue; override;

    { ILocation }
    procedure SetValue(const AValue: TValue); override;

    { IArguments }
    function GetArgs: TArray<TValue>; inline;
    procedure SetArgs(const Args: TArray<TValue>);

    { IInvokable }
    function Invoke(const Args: TArray<IValue>): IValue;

    { IPlaceholder }
    procedure Attach(Obj: TObject); override;
    procedure Detach; override;
  end;

function WrapObject(AObject: TObject): IScope;
begin
  if AObject = nil then
    raise EWrapperError.Create(sScopeObjNull);
  Result := TObjectWrapper.Create(AObject, AObject.ClassType, True);
end;

{ TObjectWrapper }

procedure TObjectWrapper.Add(const Symbol: String);
begin
  FSymbols.Add(Symbol);
end;

procedure TObjectWrapper.Attach(Obj: TObject);
var
  LWrpr: IInterface;
  LWrprPlaceholder: IPlaceholder;
begin
  FObject := Obj;
                                                                           
// that is more specialized (on a deeper level of the hierarchy) is attached
// to the wrapper? Would it be appropriate for the system to query the
// custom scope factory for a better fitted custom scope and dispose of the
// current one?

  // assure that for the custom scope we have the new object assigned to it
  if Assigned(FCustomScope) then
    FCustomScope.MappedObject := FObject;

                                                                                      
// this is an object wrapper and wraps an object. What else could it wrap?
  for LWrpr in Self do
    if Supports(LWrpr, IPlaceholder, LWrprPlaceholder) then
      LWrprPlaceholder.Attach(GetValue.AsObject);
end;

procedure TObjectWrapper.Clear;
begin
  FSymbols.Clear;
end;

function TObjectWrapper.Contains(const Symbol: String): Boolean;
begin
  Result := FSymbols.Contains(Symbol);
end;

constructor TObjectWrapper.Create(AObject: TObject; MetaClass: TClass;
  AExternalWrap, EvalTimeOnly: Boolean; const Binding: ICompiledBinding);
begin
  inherited Create;

  if not Assigned(MetaClass) then
    raise EWrapperError.CreateFmt(SParamIsNil, ['MetaClass']);

  FExternalWrap := AExternalWrap;
  FCtx := TRttiContext.Create;
  FObject := AObject;
  FCache := TDictionaryScope.Create;
  FCacheCounter := FCache;
  FSymbols := TSymbols.Create;
  FMetaClass := MetaClass;
  FEvalTimeOnly := EvalTimeOnly;
  FBinding := Pointer(Binding);
  FSkipCache := False;
  FIsProxyClass := False;
  if Assigned(AObject) and Assigned(IsProxyClassProc) then
    FIsProxyClass := IsProxyClassProc(AObject.ClassType);
end;

destructor TObjectWrapper.Destroy;
begin
  FCacheCounter := nil;
  FSymbols.Free;

  inherited;
end;

procedure TObjectWrapper.Detach;
var
  LWrpr: IInterface;
  LWrprPlaceholder: IPlaceholder;
begin
  FObject := nil;

  for LWrpr in Self do
    if Supports(LWrpr, IPlaceholder, LWrprPlaceholder) then
      LWrprPlaceholder.Detach;
end;

function TObjectWrapper.GetAvailClassType: TClass;
begin
  if Assigned(FObject) then
    Result := FObject.ClassType
  else
    Result := FMetaClass;
end;

function TObjectWrapper.GetBinding: ICompiledBinding;
begin
  Result := ICompiledBinding(FBinding);
end;

function TObjectWrapper.GetAttached: Boolean;
begin
  Result := Assigned(FObject);
end;

function TObjectWrapper.GetAttachment: TObject;
begin
  Result := FObject;
end;

function TObjectWrapper.GetEnumerator: IScopeEnumerator;
begin
  Result := FCache.GetEnumerator;
end;

function TObjectWrapper.GetEvalTimeOnly: Boolean;
begin
  Result := FEvalTimeOnly;
end;

function TObjectWrapper.GetMetaClass: TClass;
begin
  Result := FMetaClass;
end;

function TObjectWrapper.GetSelf: IInterface;
begin
  //Note: A Lookup on a TDictionaryScope with blank property name accomplishes the same
  //This is to provide the ability to specify 'Self' as the expression for all other scopes that implement
  // IScopeSelf.

  Result := Self;
end;

function TObjectWrapper.GetSymbolCount: Integer;
begin
  Result := FSymbols.Count;
end;

function TObjectWrapper.GetSymbols(Index: Integer): String;
begin
  Result := FSymbols[Index];
end;

function TObjectWrapper.GetType: PTypeInfo;
begin
  Result := GetAvailClassType.ClassInfo;
end;

function TObjectWrapper.GetValue: TValue;
begin
  Result := FObject;
end;

function TObjectWrapper.Lookup(Obj: TObject): IInterface;
begin
  Result := nil;
  if Assigned(FObject) then
    if FObject = Obj then
      Result := Self
    else
      Result := FCache.Lookup(Obj);
end;

function TObjectWrapper.LookupVirtualWrapper(const Name: String): IInterface;
var
  LClassType: TClass;
  LCustomWrapper: IInterface;
begin
  Result := nil;

  // grab the custom scope that the user might have registered in the custom scope factory;
  // check if the custom scope can create a wrapper for the given name;
  // if we have a custom wrapper, then we create a virtual wrapper and return it
  LClassType := GetAvailClassType;
  with TBindingScopeFactory do
    if IsObjectTypeRegistered(LClassType, True) then
    begin
      // try to create and cache the custom scope assigned to this object
      if not Assigned(FCustomScope) then
        FCustomScope := CreateScope(FObject, GetMetaClass);

      // grab the custom wrapper from the custom scope
      LCustomWrapper := nil;
      if Assigned(FCustomScope) then
        LCustomWrapper := FCustomScope.Lookup(Name);

      // having a custom wrapper means that we must also have a virtual wrapper
      if Assigned(LCustomWrapper) then
      begin
        // search for the virtual member group associated with the member name
        Result := FCache.Lookup(Name);

        // create a virtual member group for the member
        if not Assigned(Result) then
        begin
          if Supports(LCustomWrapper, ICustomWrapper) then
            Result := TVirtualObjectMemberGroup.Create(LCustomWrapper, GetBinding)
          else
            Result := LCustomWrapper;

          FCache.Map.Add(Name, Result);
        end;
      end;
    end;
end;

procedure TObjectWrapper.Remove(const Symbol: String);
begin
  FSymbols.Remove(Symbol);
end;

procedure TObjectWrapper.SetBinding(const Binding: ICompiledBinding);
begin
  FBinding := Pointer(Binding);
end;

procedure TObjectWrapper.SetSymbols(Index: Integer; const Value: String);
begin
  FSymbols[Index] := Value;
end;

procedure TObjectWrapper.SetValue(const AValue: TValue);
begin
  FObject := AValue.AsObject;
end;

function TObjectWrapper.LookupDefault(const Name: String): IInterface;
var
  DynamicGroup: IDynamicGroup;
  FixedGroup: IGroup;
  Wrapper: IInterface;
  CacheFound: Boolean; // the wrapper was found in the cache
  RttiFound: Boolean; // wrapper found in RTTI
begin
  Result := nil;
  RttiFound := False;
  CacheFound := False;

  // search the cache first to see if there's a wrapper stored for Name
  if not FSkipCache then
  begin
    Result := FCache.Lookup(Name);
    CacheFound := Assigned(Result);
  end;

  // search for Name among the object members because no wrapper was in the
  // internal cache for the Name symbol
  if not CacheFound then
  begin
    Result := LookupRtti(Name);
    RttiFound := Assigned(Result);
  end;

  // we have information on the interpreter phase, so depending on the phase,
  // there can be done additional processing such as creating dynamic wrappers
  // or linking dynamic wrappers to fixed wrappers
  if Assigned(Binding) then
    case Binding.Phase of
      cbpCompiling: // compile-time lookup
          // no wrapper in cache and no RTTI info for Name were found;
          // generate a dynamic group wrapper because at evaluation-time there
          // may be an RTTI object member for the given Name, due to the yet unknown,
          // but possible dynamic type of the parent object
          if not CacheFound and not RttiFound and not FExternalWrap then
          begin
            Result := TDynamicObjectMemberGroup.Create(FObject, Name, GetMetaClass, GetBinding);

            // we must add the wrapper to the cache and this permits us to do so;
            // it's like supposing that the true fixed wrapper will be found
            // at some point during the evaluation and therefore we must store
            // in the cache a this surrogate wrapper until we find the real one
            RttiFound := True;
          end;
      cbpEvaluating: // evaluation-time lookup
        // the wrapper for Name was found in the cache; being an unlinked dynamic
        // wrapper, we have to search the RTTI to provide a concrete fixed wrapper
        // for the dynamic wrapper in order to provide concrete values; if this fails,
        // it means that Name is really an inexistent object member
        if CacheFound and // wrapper was found in cache
           Supports(Result, IDynamicGroup, DynamicGroup) and // it's a dynamic wrapper
           not Assigned(DynamicGroup.FixedGroup) then // it's not linked
        begin
          // force a new search for Name in the current RTTI information in order
          // to generate a concrete RTTI wrapper
          Wrapper := LookupRtti(Name);

          // link the dynamic group to the fixed group
          if Supports(Wrapper, IGroup, FixedGroup) then
            DynamicGroup.SetFixedGroup(FixedGroup)
          else // the Name symbol actually doesn't exist
                                                                  
            // to make "nil" work
            //raise EEvaluatorError.CreateFmt(sLookupError, [Name]);
        end;
    end;

  // add the wrapper to the internal cache only if it hasn't been found
  // already in the internal cache
  if (not CacheFound) and RttiFound and (not FSkipCache) then
    FCache.Map.Add(Name, Result);
end;

function TObjectWrapper.LookupField(RttiType: TRttiType;
  const Name: String): IInterface;
var
  LField: TRttiField;
begin
  if IsProxyClass then
    Exit(nil);
  LField := RttiType.GetField(Name);
  if Assigned(LField) then
    Result := TObjectFieldGroup.Create(FObject, LField, GetMetaClass, GetEvalTimeOnly, GetBinding);
end;

function TObjectWrapper.LookupIndexedProperty(RttiType: TRttiType;
  const Name: String): IInterface;
var
  LIndexedProperty: TRttiIndexedProperty;
begin
  if IsProxyClass then
    Exit(nil);
  LIndexedProperty := RttiType.GetIndexedProperty(Name);
  if Assigned(LIndexedProperty) then
    Result := TIndexedObjectPropertyGroup.Create(FObject, LIndexedProperty, GetMetaClass, GetBinding)
  else
    Result := nil;
end;

function TObjectWrapper.LookupMethod(RttiType: TRttiType;
  const Name: String): IInterface;
var
  LMethod: TRttiMethod;
begin
  if IsProxyClass then
    Exit(nil);
  LMethod := RttiType.GetMethod(Name);
  if Assigned(LMethod) then
    Result := TObjectMethodGroup.Create(FObject, LMethod, GetMetaClass, GetBinding)
  else
    Result := nil;
end;

function TObjectWrapper.LookupProperty(RttiType: TRttiType;
  const Name: String): IInterface;
var
  LProperty: TRttiProperty;
begin
  if IsProxyClass then
    Exit(nil);
  if Name <> '' then
    LProperty := RttiType.GetProperty(Name)
  else
    LProperty := nil;
  if Assigned(LProperty) then
    Result := TObjectPropertyGroup.Create(FObject, LProperty, GetMetaClass, GetEvalTimeOnly, GetBinding)
  else
    Result := nil;
end;

function TObjectWrapper.LookupRtti(const Name: String): IInterface;
var
  RttiType: TRttiType;
begin
  if IsProxyClass then
    Exit(nil);
  RttiType := FCtx.GetType(GetAvailClassType);

  // verify if it is a method name
  Result := LookupMethod(RttiType, Name);
  // verify if it is a property name
  if not Assigned(Result) then
    Result := LookupProperty(RttiType, Name);
  // verify if it is an indexed property
  if not Assigned(Result) then
    Result := LookupIndexedProperty(RttiType, Name);
  // verify if it is a field name
  if not Assigned(Result) then
    Result := LookupField(RttiType, Name);
end;

function TObjectWrapper.Lookup(const Name: string): IInterface;
begin
  Result := nil;

  // it can create a wrapper for name only if name is used in the expression
  // The following lines causes expressions that have an scope of TObjectWrapper to fail.
  // For example, an expression of "Text" fails when scope is WrapObject(MyEdit)

                                                                                               
// the TopScope and ScopeSymbols in the Evaluator, at compile-time. The TopScope can be a TNestedScope
// and when queried for IScopeSymbols, it returns a reference to the IScopeSymbols of the inner/outer
// scope and this may be incorrect in some cases. Must test this to check the problem out.

//  if Contains(Name) or (Binding.Phase = cbpCompiling) then
  begin
    // grab a virtual wrapper for the given symbol
    Result := LookupVirtualWrapper(Name);

    // no virtual wrapper was found to handle the symbol Name;
    // check for a default RTTI wrapper that may do it
    if not Assigned(Result) then
      Result := LookupDefault(Name);
  end;
end;

{ TObjectProperty }

constructor TObjectPropertyInstance.Create(Group: TObjectPropertyGroup);
begin
  inherited Create(Group);
end;

function TObjectPropertyInstance.GetType: PTypeInfo;
var
  LMember: TRttiMember;
begin
               
  LMember := GetMember;
  if Assigned(LMember) then
    Result := TRttiProperty(LMember).PropertyType.Handle
  else
                                                                          
    Result := GetParent.ClassInfo;
end;

function TObjectPropertyInstance.GetValue: TValue;
var
  LParent: TObject;
  LMember: TRttiMember;
begin
  LParent := GetParent;
  if Assigned(LParent) then
  begin
    LMember := GetMember;
    if Assigned(LMember) then
      Result := TRttiProperty(LMember).GetValue(LParent)
    else
      Result := TValue.From<TObject>(LParent);
  end
  else
    Result := TValue.Empty;
end;

procedure TObjectPropertyInstance.SetValue(const AValue: TValue);
var
  LParent: TObject;
  LMember: TRttiMember;
begin
  LParent := GetParent;
  LMember := GetMember;
  if Assigned(LParent) and Assigned(LMember) then
    TRttiProperty(LMember).SetValue(LParent, AValue);
end;
{ TIndexedObjectProperty }

procedure TPhysicalObjectMemberGroup.Attach(Obj: TObject);
var
  LResultWrapper: IInterface;
  LPlaceholder: IPlaceholder;
begin
  if not FAttaching then
  begin
    FAttaching := True;

    AttachObjectOnly(Obj);
    for LResultWrapper in Self do
      if Supports(LResultWrapper, IPlaceholder, LPlaceholder) then
        LPlaceholder.Attach(Obj);

    FAttaching := False;
  end;
end;

procedure TPhysicalObjectMemberGroup.AttachObjectOnly(Obj: TObject);
begin
  FObject := Obj;
end;

constructor TPhysicalObjectMemberGroup.Create(AObject: TObject;
  AMember: TRttiMember; MetaClass: TClass; EvalTimeOnly: Boolean;
  const Binding: ICompiledBinding);
begin
  inherited Create(EvalTimeOnly, Binding);

  if not Assigned(MetaClass) then
    raise EWrapperError.CreateFmt(SParamIsNil, ['MetaClass']);

  FObject := AObject;
  FMember := AMember;
  FMetaClass := MetaClass;
end;

procedure TPhysicalObjectMemberGroup.Detach;
var
  LResultWrapper: IInterface;
  LPlaceholder: IPlaceholder;
begin
  if not FAttaching then
  begin
    FAttaching := True;

    DetachObjectOnly;
    for LResultWrapper in Self do
      if Supports(LResultWrapper, IPlaceholder, LPlaceholder) then
        LPlaceholder.Detach;

    FAttaching := False;
  end;
end;

procedure TPhysicalObjectMemberGroup.DetachObjectOnly;
begin
  FObject := nil;
end;

function TPhysicalObjectMemberGroup.GetAttachment: TObject;
begin
  Result := FObject;
end;

function TPhysicalObjectMemberGroup.GetMember: TRttiMember;
begin
  Result := FMember;
end;

function TPhysicalObjectMemberGroup.GetMemberName: String;
begin
  Result := '';
  if Assigned(FMember) then
    Result := FMember.Name;
end;

function TPhysicalObjectMemberGroup.GetMetaClass: TClass;
begin
  Result := FMetaClass;
end;

function TPhysicalObjectMemberGroup.GetParent: TObject;
begin
  Result := FObject;
end;

{ TIndexedObjectPropertyResult }

constructor TIndexedObjectPropertyInstance.Create(
  Group: TIndexedObjectPropertyGroup);
begin
  inherited Create(Group);
end;

function TIndexedObjectPropertyInstance.GetType: PTypeInfo;
begin
  Result := TRttiIndexedProperty(GetMember).PropertyType.Handle;
end;

function TIndexedObjectPropertyInstance.GetValue: TValue;
var
  LParent: TObject;
begin
  Result := TValue.Empty;
  LParent := GetParent;

  // the arguments cannot be set at compile-time and we cannot return values
  // for an indexed property; plus that an indexed property must have at least
  // one parameter which means that its value can be determined only at
  // evaluation-time
  if Assigned(LParent) and Assigned(FArgs) then
    Result := TRttiIndexedProperty(GetMember).GetValue(LParent, FArgs);
end;

procedure TIndexedObjectPropertyInstance.SetArgs(const Args: TArray<TValue>);
begin
  inherited;

  // setting new arguments
  Attach(GetParent);
end;

procedure TIndexedObjectPropertyInstance.SetValue(const AValue: TValue);
var
  LParent: TObject;
begin
  LParent := GetParent;
  if Assigned(LParent) then
    TRttiIndexedProperty(GetMember).SetValue(LParent, FArgs, AValue);
end;

{ TIndexedObjectPropertyGroup }

function TIndexedObjectPropertyGroup.Add(out Wrapper: IInterface): Integer;
begin
  Wrapper := TIndexedObjectPropertyInstance.Create(Self);
  Result := FCache.Wrappers.Add(Wrapper);
end;

constructor TIndexedObjectPropertyGroup.Create(AObject: TObject;
  AIndexedProperty: TRttiIndexedProperty; MetaClass: TClass;
  const Binding: ICompiledBinding);
begin
  inherited Create(AObject, AIndexedProperty, MetaClass, True, Binding);
end;

{ TObjectPropertyGroup }

function TObjectPropertyGroup.Add(out Wrapper: IInterface): Integer;
begin
  Wrapper := TObjectPropertyInstance.Create(Self);
  Result := FCache.Wrappers.Add(Wrapper);
end;

constructor TObjectPropertyGroup.Create(AObject: TObject;
  AProperty: TRttiProperty; MetaClass: TClass; EvalTimeOnly: Boolean;
  const Binding: ICompiledBinding);
begin
  inherited Create(AObject, AProperty, MetaClass, EvalTimeOnly, Binding);
end;

{ TAbstractObjectPropertyInstance }

procedure TPhysicalObjectMemberInstance.Attach(Obj: TObject);
begin
  if not FAttaching then
  begin
    FAttaching := True;

    // attach only the object of the group to have a proper value for the
    // result of the property and attach all other wrappers contained in the
    // scope of this property instance wrapper
    TPhysicalObjectMemberGroup(FGroup).AttachObjectOnly(Obj);
    if CanCache then
      GetCache.Attach(GetValue.AsObject);

    // now attach-notify the group to reattach the other property instance wrappers
    // that it contains
    FGroup.Attach(Obj);

    FAttaching := False;
  end;
end;

constructor TPhysicalObjectMemberInstance.Create(
  Group: TPhysicalObjectMemberGroup);
begin
  inherited Create(Group);
end;

procedure TPhysicalObjectMemberInstance.Detach;
begin
  if not FAttaching then
  begin
    FAttaching := True;

    TPhysicalObjectMemberGroup(FGroup).DetachObjectOnly;
    if CanCache then
      GetCache.Detach;
    FGroup.Detach;

    FAttaching := False;
  end;
end;

constructor TAbstractObjectMemberInstance.Create(
  Group: TAbstractObjectMemberGroup);
begin
  inherited Create;

  if not Assigned(Group) then
    raise EWrapperError.CreateFmt(SParamIsNil, ['Group']);
  // Causes a memory leak because of circular reference
  //FCounter := Group;  // so object will not be freed until we release
  FGroup := Group;
end;

destructor TAbstractObjectMemberInstance.Destroy;
begin
  FCacheCounter := nil;
  inherited;
end;

function TPhysicalObjectMemberInstance.GetMember: TRttiMember;
begin
  Result := TPhysicalObjectMemberGroup(FGroup).GetMember;
end;

{ TObjectMethodGroup }

function TObjectMethodGroup.Add(out Wrapper: IInterface): Integer;
begin
                                                                               
  Wrapper := TObjectMethodInstance.Create(Self);
  Result := FCache.Wrappers.Add(Wrapper);
end;

constructor TObjectMethodGroup.Create(AObject: TObject; AMethod: TRttiMethod;
  MetaClass: TClass; const Binding: ICompiledBinding);
begin
  inherited Create(AObject, AMethod, MetaClass, True, Binding);
end;

{ TAbstractParamedObjectMemberInstance }

function TPhysicalParamedObjectMemberInstance.GetArgs: TArray<TValue>;
begin
  Result := FArgs;
end;

procedure TPhysicalParamedObjectMemberInstance.SetArgs(
  const Args: TArray<TValue>);
begin
  FArgs := Args;
end;

{ TObjectMethodInstance }

constructor TObjectMethodInstance.Create(Group: TObjectMethodGroup);
begin
  inherited Create(Group);
end;

function TObjectMethodInstance.GetType: PTypeInfo;
var
  LReturnType: TRttiType;
begin
  LReturnType  := TRttiMethod(TObjectMethodGroup(FGroup).GetMember).ReturnType;
  // it is a function and has a result type
  if Assigned(LReturnType) then
    Result := TRttiMethod(TObjectMethodGroup(FGroup).GetMember).ReturnType.Handle
  else // it is a procedure without any result type
    Result := nil;
end;

function TObjectMethodInstance.GetValue: TValue;
begin
  Result := FValue;
end;

function TObjectMethodInstance.Invoke(const Args: TArray<IValue>): IValue;
var
  LParent: TObject;
  LClassType: TClass;
  LMethod: TRttiMethod;
  LMethodResult: TValue;
  LObjectResult: Boolean;
begin
  LParent := GetParent;
  LMethod := TRttiMethod(GetMember);
  FArgs := AdaptArguments(Args);

  if LMethod.IsClassMethod then
  begin
    // determine the RTTI to use based on the existence of the object to which
    // the method wrapper is attached
    if Assigned(LParent) then
      LClassType := LParent.ClassType
    else
      LClassType := GetMetaClass;

                                                                    
    LMethodResult := LMethod.Invoke(LClassType, FArgs)
  end
  else
    if LMethod.IsStatic then
      LMethodResult := LMethod.Invoke(nil, FArgs)
    else
      if Assigned(LParent) then
        LMethodResult := LMethod.Invoke(LParent, FArgs)
      else
        LMethodResult := TValue.Empty;

  LObjectResult := LMethodResult.IsObject;
  if LObjectResult then
    // the implementation of IValue is done by the method wrapper instead;
    // it is done like this to avoid querying the cache for interface references
    Result := Self
  else
    Result := TValueWrapper.Create(LMethodResult);

  // the return value is set to whatever result we have: object or other types of results;
  // store the actual value of the result internally and reattach this wrapper
  // to trigger a chain of reattachments for the contained wrappers
  FValue := LMethodResult;
  if LObjectResult then
    Attach(LParent);
end;

procedure TObjectMethodInstance.SetValue(const AValue: TValue);
begin
  FValue := AValue;
end;

{ TObjectFieldGroup }

function TObjectFieldGroup.Add(out Wrapper: IInterface): Integer;
begin
  Wrapper := TObjectFieldInstance.Create(Self);
  Result := FCache.Wrappers.Add(Wrapper);
end;

constructor TObjectFieldGroup.Create(AObject: TObject; AField: TRttiField;
  MetaClass: TClass; EvalTimeOnly: Boolean; const Binding: ICompiledBinding);
begin
  inherited Create(AObject, AField, MetaClass, EvalTimeOnly, Binding);
end;

{ TObjectFieldInstance }

constructor TObjectFieldInstance.Create(Group: TObjectFieldGroup);
begin
  inherited Create(Group);
end;

function TObjectFieldInstance.GetType: PTypeInfo;
begin
  Result := TRttiField(GetMember).FieldType.Handle;
end;

function TObjectFieldInstance.GetValue: TValue;
var
  LParent: TObject;
begin
  Result := TValue.Empty;
  LParent := GetParent;
  if Assigned(LParent) then
    Result := TRttiField(GetMember).GetValue(LParent)
end;

procedure TObjectFieldInstance.SetValue(const AValue: TValue);
var
  LParent: TObject;
begin
  LParent := GetParent;
  if Assigned(LParent) then
    TRttiField(GetMember).SetValue(LParent, AValue);
end;

{ TVirtualMemberInstance }

procedure TVirtualObjectMemberInstance.Attach(Obj: TObject);
begin
  if not FAttaching then
  begin
    FAttaching := True;

    // reattach the contained wrappers
    if CanCache then
      GetCache.Attach(GetValue.AsObject);

    // reattach the group, the custom wrapper and the other virtual instance
    // siblings to the same object
    FGroup.Attach(Obj);

    FAttaching := False;
  end;
end;

function TVirtualObjectMemberInstance.CanCache: Boolean;
begin
  Result := True;
end;

constructor TVirtualObjectMemberInstance.Create(Group: TVirtualObjectMemberGroup);
begin
  inherited Create(Group);
end;

procedure TVirtualObjectMemberInstance.Detach;
begin
  if not FAttaching then
  begin
    FAttaching := True;

    if CanCache then
      GetCache.Detach;
    FGroup.Detach;

    FAttaching := False;
  end;
end;

function TVirtualObjectMemberInstance.GetArgs: TArray<TValue>;
begin
  Result := FArgs;
end;

function TVirtualObjectMemberInstance.GetCustomWrapper: IInterface;
begin
  Result := TVirtualObjectMemberGroup(FGroup).FCustomWrapper;
end;

function TVirtualObjectMemberInstance.GetType: PTypeInfo;
begin
  Result := FValue.TypeInfo;
end;

function TVirtualObjectMemberInstance.GetValue: TValue;
begin
  // the value can be updated using GetValue only for properties; for methods,
  // it will return the last result, if any
  if GetWrapperType in [cwtProperty, cwtIndexedProperty] then
    FValue := (GetCustomWrapper as IValue).GetValue;

  Result := FValue;
end;

function TVirtualObjectMemberInstance.GetWrapperType: TCustomWrapperType;
begin
  Result := (GetCustomWrapper as ICustomWrapper).WrapperType;
end;

function TVirtualObjectMemberInstance.Invoke(const Args: TArray<IValue>): IValue;
begin
                                                                                                                              
  Result := (GetCustomWrapper as IInvokable).Invoke(Args);

                                                                                               
// It needs an TObjectWrapper which must be provided internally by TVirtualWrapper
// because from here we can't reach TObjectWrapper, but only by using WrapObject
// TVirtualWrapper must reattach the internal Cache based on the result type!

  // we are dealing with an object result and we can't use TValueWrapper returned
  // by the custom wrapper because it doesn't have support for all the necessary
  // interfaces that a wrapped object needs;
  // we must re-attach the resulting object to the cache and return the
  // virtual wrapper instance as an IValue
  if Result.GetValue.IsObject then
  begin
    GetCache.Attach(Result.GetValue.AsObject);
    Result := Self;
  end;
end;

function TVirtualObjectMemberInstance.QueryInterface(const IID: TGUID;
  out Obj): HResult;
begin
  // depending on the custom wrapper type, it returns the appropriate interfaces
  // that the virtual wrapper is supposed to support
  if ((IID = IValue) or (IID = IInvokable) or (IID = IArguments)) and
     (not Supports(GetCustomWrapper, IID)) then
    Result := E_NOINTERFACE
  else
    Result := inherited QueryInterface(IID, Obj);
end;

procedure TVirtualObjectMemberInstance.SetArgs(const Args: TArray<TValue>);
begin
  FArgs := Args;
  (GetCustomWrapper as IArguments).SetArgs(FArgs);
end;

procedure TVirtualObjectMemberInstance.SetValue(const AValue: TValue);
begin
                                                                            
  raise EWrapperError.Create(sVirtualMemberReadOnly);
end;

{ TAbstractObjectMemberGroup }

function TAbstractObjectMemberGroup.Add: Integer;
var
  LWrapper: IInterface;
begin
  Result := Add(LWrapper);
end;

procedure TAbstractObjectMemberGroup.Clear;
begin
  FCache.Wrappers.Clear;
end;

constructor TAbstractObjectMemberGroup.Create(EvalTimeOnly: Boolean;
  const Binding: ICompiledBinding);
begin
  inherited Create;

  FCache := TObjectMemberGroupScope.Create;
  FCounter := FCache;
  FEvalTimeOnly := EvalTimeOnly;
  FBinding := Pointer(Binding);
end;

destructor TAbstractObjectMemberGroup.Destroy;
begin
  //FCache.Free;
  FCounter := nil;

  inherited;
end;

function TAbstractObjectMemberGroup.GetAttached: Boolean;
begin
  Result := GetAttachment <> nil;
end;

function TAbstractObjectMemberGroup.GetBinding: ICompiledBinding;
begin
  Result := ICompiledBinding(FBinding);
end;

function TAbstractObjectMemberGroup.GetEnumerator: IScopeEnumerator;
begin
  Result := FCache.GetEnumerator;
end;

function TAbstractObjectMemberGroup.GetEvalTimeOnly: Boolean;
begin
  Result := FEvalTimeOnly;
end;

function TAbstractObjectMemberGroup.GetWrapperCount: Integer;
begin
  Result := FCache.Wrappers.Count;
end;

function TAbstractObjectMemberGroup.GetWrappers(Index: Integer): IInterface;
begin
  Result := FCache.Wrappers[Index];
end;

procedure TAbstractObjectMemberGroup.SetBinding(
  const Binding: ICompiledBinding);
begin
  FBinding := Pointer(Binding);
end;

{ TVirtualObjectMemberGroup }

function TVirtualObjectMemberGroup.Add(out Wrapper: IInterface): Integer;
begin
  Wrapper := TVirtualObjectMemberInstance.Create(Self);
  Result := FCache.Wrappers.Add(Wrapper)
end;

procedure TVirtualObjectMemberGroup.Attach(Obj: TObject);
var
  LWrapperInstance: IInterface;
  LPlaceholder: IPlaceholder;
begin
  if not FAttaching then
  begin
    FAttaching := True;

    // attach the custom wrapper to the new object
    (FCustomWrapper as IPlaceholder).Attach(Obj);

    // make all the virtual instances attach themselves to the new object
    for LWrapperInstance in Self do
      if Supports(LWrapperInstance, IPlaceholder, LPlaceholder) then
        LPlaceholder.Attach(Obj);

    FAttaching := False;
  end;
end;

procedure TVirtualObjectMemberGroup.CheckCustomWrapper(
  const Wrapper: IInterface);
begin
  CheckIntfSupport(Wrapper, ICustomWrapper, 'ICustomWrapper');
  case (Wrapper as ICustomWrapper).WrapperType of
    cwtProperty:
        CheckIntfSupport(Wrapper, IValue, 'IValue');
    cwtMethod:
        CheckIntfSupport(Wrapper, IInvokable, 'IInvokable');
    cwtIndexedProperty:
      begin
        CheckIntfSupport(Wrapper, IValue, 'IValue');
        CheckIntfSupport(Wrapper, IArguments, 'IArguments');
      end;
  end;
end;

procedure TVirtualObjectMemberGroup.CheckIntfSupport(const Wrapper: IInterface;
  const IID: TGUID; const IntfName: String);
begin
  if not Supports(Wrapper, ICustomWrapper) then
    raise EWrapperError.CreateFmt(sInvalidCustomWrapper, [IntfName]);
end;

constructor TVirtualObjectMemberGroup.Create(const CustomWrapper: IInterface;
  const Binding: ICompiledBinding);
begin
  inherited Create(True, Binding);

  CheckCustomWrapper(CustomWrapper);
  FCustomWrapper := CustomWrapper;
  FWrapperType := (FCustomWrapper as ICustomWrapper).WrapperType;
end;

procedure TVirtualObjectMemberGroup.Detach;
var
  LWrapperInstance: IInterface;
  LPlaceholder: IPlaceholder;
begin
  if not FAttaching then
  begin
    FAttaching := True;

    // detach the custom wrapper from the object
    (FCustomWrapper as IPlaceholder).Detach;

    // detach all the virtual member instances from the parent object
    for LWrapperInstance in Self do
      if Supports(LWrapperInstance, IPlaceholder, LPlaceholder) then
        LPlaceholder.Detach;

    FAttaching := False;
  end;
end;

function TVirtualObjectMemberGroup.GetAttachment: TObject;
begin
  Result := (FCustomWrapper as IPlaceholder).GetAttachment;
end;

function TVirtualObjectMemberGroup.GetMemberName: String;
begin
  Result := (FCustomWrapper as IChild).GetMemberName;
end;

function TVirtualObjectMemberGroup.GetMetaClass: TClass;
begin
  Result := (FCustomWrapper as IPlaceholder).GetMetaClass;
end;

function TVirtualObjectMemberGroup.GetParent: TObject;
begin
  Result := (FCustomWrapper as IChild).GetParent;
end;

{ TAbstractObjectMemberInstance }

procedure TAbstractObjectMemberInstance.Add(const Symbol: String);
begin
  GetCache.Add(Symbol);
end;

function TAbstractObjectMemberInstance.CanCache: Boolean;
begin
  Result := IsObjectType;
end;

procedure TAbstractObjectMemberInstance.Clear;
begin
  GetCache.Clear;
end;

function TAbstractObjectMemberInstance.Contains(const Symbol: String): Boolean;
begin
  Result := GetCache.Contains(Symbol);
end;

function TAbstractObjectMemberInstance.GetAttached: Boolean;
begin
  Result := FGroup.GetAttached;
end;

function TAbstractObjectMemberInstance.GetAttachment: TObject;
begin
  Result := FGroup.GetAttachment;
end;

function TAbstractObjectMemberInstance.GetBinding: ICompiledBinding;
begin
  Result := FGroup.GetBinding;
end;

function TAbstractObjectMemberInstance.GetCache: TObjectWrapper;
var
  LCtx: TRttiContext;
  LValue: TObject;
  LValueClass: TClass;
begin
  // create the internal object wrapper only if the property points to an object
  if CanCache and not Assigned(FCache) then
  begin
                                                                                                                  
    LCtx := TRttiContext.Create;
    LValue := GetValue.AsObject;
    LValueClass := (LCtx.GetType(GetType) as TRttiInstanceType).MetaclassType;

    FCache := TObjectWrapper.Create(LValue, LValueClass, False, GetEvalTimeOnly, GetBinding);
    FCacheCounter := FCache;
  end;

  Result := FCache;
end;

function TAbstractObjectMemberInstance.GetEnumerator: IScopeEnumerator;
begin
  Result := GetCache.GetEnumerator;
end;

function TAbstractObjectMemberInstance.GetEvalTimeOnly: Boolean;
begin
  Result := FGroup.GetEvalTimeOnly;
end;

function TAbstractObjectMemberInstance.GetMemberName: String;
begin
  Result := FGroup.GetMemberName;
end;

function TAbstractObjectMemberInstance.GetMetaClass: TClass;
begin
  Result := FGroup.GetMetaClass;
end;

function TAbstractObjectMemberInstance.GetParent: TObject;
begin
  Result := FGroup.GetParent;
end;

function TAbstractObjectMemberInstance.GetSymbolCount: Integer;
begin
  Result := GetCache.GetSymbolCount;
end;

function TAbstractObjectMemberInstance.GetSymbols(Index: Integer): String;
begin
  Result := GetCache.GetSymbols(Index);
end;

function TAbstractObjectMemberInstance.IsObjectType: Boolean;
var
  LTypInf: PTypeInfo;
begin
  LTypInf := GetType;
  Result := Assigned(LTypInf) and (LTypInf^.Kind = tkClass);
end;

function TAbstractObjectMemberInstance.Lookup(Obj: TObject): IInterface;
begin
  Result := GetCache.Lookup(Obj);
end;

function TAbstractObjectMemberInstance.Lookup(const Name: string): IInterface;
begin
  Result := GetCache.Lookup(Name);
end;

function TAbstractObjectMemberInstance.QueryInterface(const IID: TGUID;
  out Obj): HRESULT;
begin
  // the property wrapper is not an object; don't permit querying for scope interfaces
  if (not CanCache) and
     ((IID = IScope) or
      (IID = IScopeEx) or
      (IID = IScopeEnumerable) or
      (IID = IScopeSymbols)) then
      Result := E_NOINTERFACE
  else
    Result := inherited QueryInterface(IID, Obj);
end;

procedure TAbstractObjectMemberInstance.Remove(const Symbol: String);
begin
  GetCache.Remove(Symbol);
end;

procedure TAbstractObjectMemberInstance.SetBinding(
  const Binding: ICompiledBinding);
begin
  FGroup.SetBinding(Binding);
  if GetCache <> nil then
    GetCache.SetBinding(Binding);
end;

procedure TAbstractObjectMemberInstance.SetSymbols(Index: Integer;
  const Value: String);
begin
  GetCache.SetSymbols(Index, Value);
end;

{ TDynamicObjectMemberInstance }

procedure TDynamicObjectMemberInstance.Attach(Obj: TObject);
var
  LPlaceholder: IPlaceholder;
begin
  inherited;

  if Supports(FFixedInstance, IPlaceholder, LPlaceholder) then
    LPlaceholder.Attach(Obj);
end;

constructor TDynamicObjectMemberInstance.Create(
  Group: TDynamicObjectMemberGroup);
begin
  inherited Create(Group);
end;

procedure TDynamicObjectMemberInstance.Detach;
var
  LPlaceholder: IPlaceholder;
begin
  inherited;

  if Supports(FFixedInstance, IPlaceholder, LPlaceholder) then
    LPlaceholder.Detach;
end;

function TDynamicObjectMemberInstance.GetArgs: TArray<TValue>;
var
  LArguments: IArguments;
begin
  if Supports(FFixedInstance, IArguments, LArguments) then
    Result := LArguments.GetArgs
  else
    Result := nil;
end;

function TDynamicObjectMemberInstance.GetFixedInstance: IInterface;
begin
  Result := FFixedInstance;
end;

function TDynamicObjectMemberInstance.GetType: PTypeInfo;
var
  LValue: IValue;
begin
  // the type is given by the actual type of stored by the fixed instance wrapper;
  // if there is not fixed instance wrapper specified yet, the type of the
  // dynamic instance is considered to be an object
  if Supports(FFixedInstance, IValue, LValue) then
    Result := LValue.GetType
  else
    Result := TObject.ClassInfo;
end;

function TDynamicObjectMemberInstance.GetValue: TValue;
var
  LValue: IValue;
begin
  if Supports(FFixedInstance, IValue, LValue) then
    Result := LValue.GetValue
  else
    Result := TValue.Empty;
end;

function TDynamicObjectMemberInstance.Invoke(
  const Args: TArray<IValue>): IValue;
var
  LInvokable: IInvokable;
begin
  if Supports(FFixedInstance, IInvokable, LInvokable) then
    Result := LInvokable.Invoke(Args)
  else
                                                               
    Result := Self;
end;

procedure TDynamicObjectMemberInstance.SetArgs(const Args: TArray<TValue>);
var
  LArguments: IArguments;
begin
  if Supports(FFixedInstance, IArguments, LArguments) then
    LArguments.SetArgs(Args);
end;

procedure TDynamicObjectMemberInstance.SetFixedInstance(
  const Instance: IInterface);
begin
  FFixedInstance := Instance;
end;

procedure TDynamicObjectMemberInstance.SetValue(const AValue: TValue);
var
  LLocation: ILocation;
begin
  if Supports(FFixedInstance, ILocation, LLocation) then
    LLocation.SetValue(AValue);
end;

{ TDynamicObjectMemberGroup }

function TDynamicObjectMemberGroup.Add(out Wrapper: IInterface): Integer;
begin
  Wrapper := TDynamicObjectMemberInstance.Create(Self);
  Result := FCache.Wrappers.Add(Wrapper);
end;

constructor TDynamicObjectMemberGroup.Create(AObject: TObject;
  AMemberName: String; MetaClass: TClass; const Binding: ICompiledBinding);
begin
  inherited Create(AObject, nil, MetaClass, True, Binding);

  FMemberName := AMemberName;
end;

function TDynamicObjectMemberGroup.GetFixedGroup: IGroup;
begin
  Result := FFixedGroup;
end;

function TDynamicObjectMemberGroup.GetMember: TRttiMember;
begin
  if Assigned(FFixedGroup) then
    Result := (FFixedGroup as IRttiChild).GetMember
  else
    Result := nil;
end;

function TDynamicObjectMemberGroup.GetMemberName: String;
begin
  Result := FMemberName;
end;

procedure TDynamicObjectMemberGroup.SetFixedGroup(const Group: IGroup);
var
  Instance: IDynamicInstance;
  i: Integer;
begin
  FFixedGroup := Group;

  if Assigned(Group) then
  begin
    // the fixed group must have the same number of group member instances
    // as this dynamic group; the dynamic group is the driver and the fixed
    // group is the storage
    for i := 1 to WrapperCount - Group.WrapperCount do
      Group.Add;

    // link the dynamic instances to the fixed instances in the two groups
    // based on their indexed positions
    for i := 0 to WrapperCount - 1 do
      if Supports(Wrappers[i], IDynamicInstance, Instance) then
        Instance.FixedInstance := Group.Wrappers[i];
  end;
end;

end.
