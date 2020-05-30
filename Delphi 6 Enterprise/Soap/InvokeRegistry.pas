{*******************************************************}
{                                                       }
{ Borland Delphi Visual Component Library               }
{       SOAP           Support                          }
{                                                       }
{ Copyright (c) 2001 Borland Software Corporation       }
{                                                       }
{*******************************************************}

{
  Central registry for interfaces with RTTI and the classes that implement them.
  Classes that are used as parameter types in methods of interfaces are registered
  in a separate registry.

}
unit InvokeRegistry;

interface

uses SysUtils, TypInfo, IntfInfo, Classes, Windows, XMLSchema;

type

  InvString = WideString;

  TInvokableClass = class(TInterfacedObject)
  public
    constructor Create; virtual;
  end;
  TInvokableClassClass = class of TInvokableClass;

  TDataContext = class;

{$M+}
  TRemotable = class
  private
    FDataContext: TDataContext;
    procedure SetDataContext(Value: TDataContext);
  public
    constructor Create; virtual;
    destructor Destroy; override;
    property DataContext: TDataContext read FDataContext write SetDataContext;
  end;
{$M-}
  TRemotableXS = class(TRemotable)
  public
    function NativeToXS: WideString; virtual;
    procedure XSToNative(Data: WideString); virtual;
  end;
  PTRemotable = ^TRemotable;
  TRemotableClass = class of TRemotable;
  TRemotableXSClass = class of TRemotableXS;
{$M+}
   ERemotableException = class(Exception)
   public
     constructor CreateRem;  virtual;
   end;
{$M-}
  ERemotableExceptionClass = class of ERemotableException;


  // Used when registering a class factory
  TCreateInstanceProc = procedure(out obj: TObject);

  InvRegClassEntry = record
    ClassType: TClass;
    Proc: TCreateInstanceProc;
    URI: string;
  end;


  ExtNameMapItem = record
    Name: string;
    ExtName: WideString;
  end;

  MethParamNameMapItem = record
    MethName: string;
    ParamNameMap: array of ExtNameMapItem;
  end;

  InvRegIntfEntry = record
    Name: string;
    ExtName: Widestring;
    UnitName: string;
    GUID: TGUID;
    Info: PTypeInfo;
    DefImpl: TClass;
    Namespace: Widestring;
    WSDLEncoding: WideString;
    Documentation: string;
    MethNameMap: array of ExtNameMapItem;
    MethParamNameMap: array of MethParamNameMapItem;
  end;
  TInvRegIntfEntryArray = array of InvRegIntfEntry;

  TInvokableClassRegistry = class(TInterfacedObject)
  private
    FLock: TRTLCriticalSection;
    FRegClasses: array of InvRegClassEntry;
    FRegIntfs: array of InvRegIntfEntry;
    procedure DeleteFromReg(AClass: TClass; Info: PTypeInfo);
  public
    constructor Create;
    destructor Destroy; override;
    function GetNamespaceByGUID(const AGUID: TGUID): string;
    function GetInfoForURI(const PathURI, ActionURI: string; var ACLass : TClass;  var IntfInfo: PTypeInfo; var AMeth: string): Boolean;
    procedure GetInterfaceInfoFromName(const UnitName,  IntfName: string; var Info: PTypeInfo; var IID: TGUID);
    function GetInterfaceTypeInfo(const AGUID: TGUID): Pointer;
    function GetInvokableObjectFromClass(AClass: TClass): TObject;
    function GetInterface(Index: Integer): InvRegIntfEntry;
    procedure GetClassFromIntfInfo(Info: PTypeInfo; var AClass: TClass);
    function GetInterfaceCount: Integer;
    procedure Lock; virtual;
    procedure UnLock; virtual;
    procedure RegisterInterface(Info: PTypeInfo; const Namespace: InvString  = ''; const WSDLEncoding: InvString = ''; const Doc: string = ''; const ExtName: InvString = '');
    function  GetInterfaceExternalName(Info: PTypeInfo; Namespace: string  = ''; InternalIntfName: string = '' ): InvString;
    function  GetWSDLEncoding(Info: PTypeInfo; Namespace: string  = ''; InternalIntfName: string = '' ): InvString;
    procedure UnRegisterInterface(Info: PTypeInfo);
    procedure RegisterInvokableClass(AClass: TClass; CreateProc: TCreateInstanceProc = nil);
    procedure UnRegisterInvokableClass(AClass: TClass);
    procedure RegisterExternalMethName(Info: PTypeInfo; InternalName: string; const ExternalName: InvString);
    procedure RegisterExternalParamName(Info: PTypeInfo; MethodName, InternalName: string; const ExternalName: InvString);
    function GetParamExternalName(Info: PTypeInfo;  MethodName, InternalParamName: string): InvString;
    function GetParamInternalName(Info: PTypeInfo;  MethodName: string; ExternalParamName: InvString): string;
    function GetMethExternalName(Info: PTypeInfo;  MethodIntName: string): InvString;
    function GetMethInternalName(Info: PTypeInfo;  MethodExtName: InvString): string;
  end;

  { Classes used to register classes that map from pascal to/from XSD }

  TObjMultiOptions = (ocDefault, ocMultiRef, ocNoMultiRef);
  TRemRegEntry = record
    ClassType: TClass;
    Info: PTypeInfo;
    URI: WideString;
    Name: WideString;
    ExtName: WideString;
    IsScalar: Boolean;
    MultiRefOpt: TObjMultiOptions;
  end;


  ETypeRegistryException = class(Exception);

  TPascalRemotableTypeRegistry = class
  private
    FLock: TRTLCriticalSection;
    URIMap: array of TRemRegEntry;
    function GetEntry(Info: PTypeInfo; var Found: Boolean): Integer;
    procedure DeleteEntryFromURIMap(Info: PTypeInfo);
    function GetSimpleBuiltInXSDType(const URI, TypeName: WideString): PTypeInfo;
    function GetRegisteredClassForBuiltInXSD(const TypeName: WideString): TClass;
  public
    constructor Create;
    destructor Destroy; override;
    function  ClassToURI(AClass: TClass; var URI, Name: WideString; var IsScalar: Boolean): Boolean; overload;
    function  InfoToURI(Info: PTypeInfo; var URI, Name: WideString; var IsScalar: Boolean): Boolean;
    procedure RegisterXSClass(AClass: TClass; URI: WideString = ''; Name: WideString = ''; ExtName: WideString = ''; IsScalar: Boolean = False; MultiRefOpt: TObjMultiOptions = ocDefault);
    procedure RegisterXSInfo(Info: PTypeInfo; URI: WideString = ''; Name: WideString = ''; ExtName: WideString = '');
    function GetURICount: Integer;
    function GetURIMap(Index: Integer): TRemRegEntry;
    function  TypeInfoToXSD(Info: PTypeInfo; var URI, TypeName: WideString): Boolean;
    function URIToClass(URI, Name: WideString; var IsScalar: Boolean): TClass;
    procedure GetXSDInfoForClass(Info: PTypeInfo; var URI, TypeName: WideString);
    function XSDToTypeInfo(URI, TypeName: WideString): PTypeInfo;
    function IsClassScalar(AClass: TClass): Boolean;
    function ClassOptions(AClass: TClass): TObjMultiOptions;
    function URIToInfo(const URI, Name: WideString): PTypeInfo;
    function VariantToInfo(V: Variant; TryAllSchema: Boolean): PTypeInfo;
    function GetVarTypeFromXSD(URI, TypeName: InvString): TVarType;
    procedure Lock; virtual;
    procedure UnLock; virtual;
    procedure UnRegisterXSClass(AClass: TClass);
    procedure UnRegisterXSInfo(Info: PTypeInfo);
    procedure RegisterExternalPropName(Info: PTypeInfo; InternalName: string; const ExternalName: InvString);
    function GetExternalPropName(Info: PTypeInfo; InternalName: string): InvString;
    function GetInternalPropName(Info: PTypeInfo; ExternalName: InvString): string;
  end;

  TPascalRemotableClassRegistry = TPascalRemotableTypeRegistry;

  TDynToClear = record
    P: Pointer;
    Info: PTypeInfo;
  end;

  TDataContext = class
  protected
    FObjsToDestroy: array of TObject;
    DataOffset: Integer;
    Data: array of Byte;
    DataP: array of Pointer;
    VarToClear: array of Pointer;
    DynArrayToClear: array of TDynToClear;
    StrToClear: array of Pointer;
  public
    constructor Create;
    destructor Destroy; override;
    function AllocData(Size: Integer): Pointer;
    procedure SetDataPointer(Index: Integer; P: Pointer);
    function GetDataPointer(Index: Integer): Pointer;
    procedure AddObjectToDestroy(Obj: TObject);
    procedure RemoveObjectToDestroy(Obj: TObject);
    procedure AddDynArrayToClear(P: Pointer; Info: PTypeInfo);
    procedure AddVariantToClear(P: PVarData);
    procedure AddStrToClear(P: Pointer);
  end;

  TInvContext = class(TDataContext)
  private
    ResultP: Pointer;
  public
    procedure SetMethodInfo(const MD: TIntfMethEntry);
    procedure SetParamPointer(Param: Integer; P: Pointer);
    function GetParamPointer(Param: Integer): Pointer;
    function GetResultPointer: Pointer;
    procedure SetResultPointer(P: Pointer);
    procedure AllocServerData(const MD: TIntfMethEntry);
  end;

  function GetRemotableDataContext: Pointer;
  procedure SetRemotableDataContext(Value: Pointer);

  function InvRegistry:   TInvokableClassRegistry;
  function RemClassRegistry: TPascalRemotableClassRegistry;
  function RemTypeRegistry: TPascalRemotableTypeRegistry;

var
  AppNameSpacePrefix: string;

const
  XMLSchemaInstNamepspaces: array[0..2] of InvString =
    (SXMLSchemaInstURI_1999, SXMLSchemaInstURI_2000_10, SXMLSchemaInstURI);

  XMLSchemaNamepspaces: array[0..2] of InvString =
    (SXMLSchemaURI_1999, SXMLSchemaURI_2000_10, SXMLSchemaURI_2001);

  XMLBase64Types: array[0..1] of InvString = ('base64Binary', 'bin.base64');

implementation

uses  Variants, InvRules, SoapConst, Types;

var
  InvRegistryV: TInvokableClassRegistry;
  RemClassRegistryV: TPascalRemotableClassRegistry;
  RemTypeRegistryV: TPascalRemotableTypeRegistry;


threadvar
  RemotableDataContext: Pointer;

function InvRegistry: TInvokableClassRegistry;
begin
  Result :=  InvRegistryV;
end;

function RemClassRegistry: TPascalRemotableClassRegistry;
begin
  Result := RemTypeRegistryV;
end;

function RemTypeRegistry: TPascalRemotableTypeRegistry;
begin
  Result := RemTypeRegistryV;
end;

function GetRemotableDataContext: Pointer;
begin
  Result := RemotableDataContext;
end;

procedure SetRemotableDataContext(Value: Pointer);
begin
  RemotableDataContext := Value;
end;

function TInvokableClassRegistry.GetInterfaceCount: Integer;
begin
  Result := 0;
  if FRegIntfs <> nil then
    Result := Length(FRegIntfs);
end;

function TInvokableClassRegistry.GetInterface(Index: Integer): InvRegIntfEntry;
begin
  if Index < Length(FRegIntfs) then
    Result := FRegIntfs[Index];
end;

constructor TInvokableClassRegistry.Create;
begin
  inherited Create;
  InitializeCriticalSection(FLock);
end;

destructor TInvokableClassRegistry.Destroy;
begin
  DeleteCriticalSection(FLock);
  inherited Destroy;
end;

procedure TInvokableClassRegistry.Lock;
begin
  EnterCriticalSection(FLock);
end;

procedure TInvokableClassRegistry.UnLock;
begin
  LeaveCriticalSection(FLock);
end;

procedure TInvokableClassRegistry.RegisterInvokableClass(AClass: TClass; CreateProc: TCreateInstanceProc);
var
  Index, I, J: Integer;
  Table: PInterfaceTable;
begin
  Lock;
  try
    Table := AClass.GetInterfaceTable;
    if Table = nil then
      raise ETypeRegistryException.CreateFmt(SNoInterfacesInClass, [AClass.ClassName]);
    Index := Length(FRegClasses);
    SetLength(FRegClasses, Index + 1);
    FRegClasses[Index].ClassType := AClass;
    FRegClasses[Index].Proc := CreateProc;
    for I := 0 to Table.EntryCount - 1 do
    begin
      for J := 0 to Length(FRegIntfs) - 1 do
        if IsEqualGUID(FRegIntfs[J].GUID, Table.Entries[I].IID) then
          FRegIntfs[J].DefImpl := AClass;
    end;
  finally
    UnLock;
  end;
end;

procedure TInvokableClassRegistry.DeleteFromReg(AClass: TClass; Info: PTypeInfo);
var
  I, Index, ArrayLen: Integer;
begin
  Lock;
  try
    Index := -1;
    if Assigned(Info) then
      ArrayLen := Length(FRegIntfs)
    else
      ArrayLen := Length(FRegClasses);
    for I := 0 to ArrayLen - 1 do
    begin
      if (Assigned(Info) and (FRegIntfs[I].Info = Info)) or
        (Assigned(AClass) and (FRegClasses[I].ClassType = AClass)) then
      begin
        Index := I;
        break;
      end;
    end;
    if Index <> -1 then
    begin
      if Assigned(Info) then
      begin
        for I := Index to ArrayLen - 2 do
          FRegIntfs[I] := FRegIntfs[I+1];
        SetLength(FRegIntfs, Length(FRegIntfs) -1);
      end else
      begin
        for I := Index to ArrayLen - 2 do
          FRegClasses[I] := FRegClasses[I+1];
        SetLength(FRegClasses, Length(FRegClasses) -1);
      end;
    end;
  finally
    UnLock;
  end;
end;

procedure TInvokableClassRegistry.UnRegisterInvokableClass(AClass: TClass);
begin
  DeleteFromReg(AClass, Nil);
end;

procedure TInvokableClassRegistry.RegisterInterface(Info: PTypeInfo; const Namespace: InvString = '';
  const WSDLEncoding: InvString = ''; const Doc: string = ''; const ExtName: InvString = '');
var
  Index: Integer;
  IntfMD: TIntfMetaData;
  I, J: Integer;
  Table: PInterfaceTable;
  URIApp: string;
begin
  Lock;
  try
    for I := 0 to Length(FRegIntfs) - 1 do
      if FRegIntfs[I].Info = Info then
        Exit;
    Index := Length(FRegIntfs);
    SetLength(FRegIntfs, Index + 1);
    GetIntfMetaData(Info, IntfMD, True);
    FRegIntfs[Index].GUID := IntfMD.IID;
    FRegIntfs[Index].Info := Info;
    FRegIntfs[Index].Name := IntfMD.Name;
    FRegIntfs[Index].UnitName := IntfMD.UnitName;
    FRegIntfs[Index].Documentation := Doc;
    FRegIntfs[Index].ExtName := ExtName;
    FRegIntfs[Index].WSDLEncoding := WSDLEncoding;

    if AppNameSpacePrefix <> '' then
      URIApp :=  AppNameSpacePrefix +  '-';

    if Namespace = '' then
      FRegIntfs[Index].Namespace :=  'urn:' + URIApp + IntfMD.UnitName + '-' + IntfMD.Name
    else
      FRegIntfs[Index].Namespace := Namespace;

    if FRegIntfs[Index].DefImpl = nil then
    begin
      for I := 0 to Length(FRegClasses) - 1 do
      begin
        Table :=  FRegClasses[I].ClassType.GetInterfaceTable;
        for J := 0 to Table.EntryCount - 1 do
        begin
          if IsEqualGUID(IntfMD.IID, Table.Entries[J].IID) then
          begin
            FRegIntfs[Index].DefImpl := FRegClasses[I].ClassType;
            Exit;
          end;
        end;
      end;
    end;
  finally
    Unlock;
  end;
end;


function TInvokableClassRegistry.GetInterfaceExternalName(Info: PTypeInfo; Namespace: string  = ''; InternalIntfName: string = '' ): InvString;
var
  Index: Integer;
begin

  Result := InternalIntfName;
  Lock;
  try
    for Index := 0 to Length(FRegIntfs) - 1 do
    begin
      if FRegIntfs[Index].Info = Info then
        if FRegIntfs[Index].Name = InternalIntfName then
        begin
          if FRegIntfs[Index].ExtName <> '' then
            Result := FRegIntfs[Index].ExtName;
          break;
        end;
    end; //for all interfaces registered
  finally
    Unlock;
  end;

end;


function TInvokableClassRegistry.GetWSDLEncoding(Info: PTypeInfo; Namespace: string  = ''; InternalIntfName: string = '' ): InvString;
var
  Index: Integer;
begin

  Result := '';
  Lock;
  try
    for Index := 0 to Length(FRegIntfs) - 1 do
    begin
      if FRegIntfs[Index].Info = Info then
        if FRegIntfs[Index].Name = InternalIntfName then
        begin
          Result := FRegIntfs[Index].WSDLEncoding;
          break;
        end;
    end; //for all interfaces registered
  finally
    Unlock;
  end;

end;


procedure TInvokableClassRegistry.UnRegisterInterface(Info: PTypeInfo);
begin
  DeleteFromReg(Nil, Info);
end;


procedure TInvokableClassRegistry.RegisterExternalMethName(Info: PTypeInfo; InternalName: string; const ExternalName: InvString);
var
  I, J: Integer;
begin

  Lock;
  try
    for I := 0 to Length(FRegIntfs) - 1 do
      if FRegIntfs[I].Info = Info then
      begin
        J := Length(FRegIntfs[I].MethNameMap);
        SetLength(FRegIntfs[I].MethNameMap, J + 1);
        FRegIntfs[I].MethNameMap[J].Name := InternalName;
        FRegIntfs[I].MethNameMap[J].ExtName := ExternalName;
      end;
  finally
    Unlock;
  end;

end;


procedure TInvokableClassRegistry.RegisterExternalParamName(Info: PTypeInfo; MethodName, InternalName: string; const ExternalName: InvString);
var
  I, J, K: Integer;
begin

  Lock;
  try
    for I := 0 to Length(FRegIntfs) - 1 do
      if FRegIntfs[I].Info = Info then
      begin
        J := 0;
        while J <= Length(FRegIntfs[I].MethParamNameMap) -1 do
        begin
          if SameText(FRegIntfs[I].MethParamNameMap[J].MethName, MethodName) then
            break;
          J := J + 1;
        end;

        if J = Length(FRegIntfs[I].MethParamNameMap) then
        begin
          SetLength(FRegIntfs[I].MethParamNameMap, J + 1);
          FRegIntfs[I].MethParamNameMap[J].MethName := MethodName;
        end;
        K := Length(FRegIntfs[I].MethParamNameMap[J].ParamNameMap);
        SetLength(FRegIntfs[I].MethParamNameMap[J].ParamNameMap, K + 1);
        FRegIntfs[I].MethParamNameMap[J].ParamNameMap[K].Name := InternalName;
        FRegIntfs[I].MethParamNameMap[J].ParamNameMap[K].ExtName := ExternalName;
        break;
      end;
  finally
    Unlock;
  end;

end;


function TInvokableClassRegistry.GetParamExternalName(Info: PTypeInfo;  MethodName, InternalParamName: string): InvString;
var
  I, J, K: Integer;
begin

  Result := InternalParamName;
  Lock;
  try
    for I := 0 to Length(FRegIntfs) - 1 do
      if FRegIntfs[I].Info = Info then
      begin
        for J := 0 to Length(FRegIntfs[I].MethParamNameMap) -1 do
          if SameText(FRegIntfs[I].MethParamNameMap[J].MethName, MethodName) then
          begin
            for K := 0 to Length(FRegIntfs[I].MethParamNameMap[J].ParamNameMap) -1 do
              if SameText(FRegIntfs[I].MethParamNameMap[J].ParamNameMap[K].Name, InternalParamName) then
              begin
                if FRegIntfs[I].MethParamNameMap[J].ParamNameMap[K].ExtName <> '' then
                  Result := FRegIntfs[I].MethParamNameMap[J].ParamNameMap[K].ExtName;
                Exit;
              end;
          end;
      end;
  finally
    Unlock;
  end;

end;


function TInvokableClassRegistry.GetParamInternalName(Info: PTypeInfo;  MethodName: string; ExternalParamName: InvString): string;
var
  I, J, K: Integer;
begin

  Result := ExternalParamName;
  Lock;
  try
    for I := 0 to Length(FRegIntfs) - 1 do
      if FRegIntfs[I].Info = Info then
      begin
        for J := 0 to Length(FRegIntfs[I].MethParamNameMap) -1 do
          if SameText(FRegIntfs[I].MethParamNameMap[J].MethName, MethodName) then
          begin
            for K := 0 to Length(FRegIntfs[I].MethParamNameMap[J].ParamNameMap) -1 do
              if SameText(FRegIntfs[I].MethParamNameMap[J].ParamNameMap[K].ExtName, ExternalParamName) then
              begin
                if FRegIntfs[I].MethParamNameMap[J].ParamNameMap[K].Name <> '' then
                  Result := FRegIntfs[I].MethParamNameMap[J].ParamNameMap[K].Name;
                Exit;
              end;
          end;
      end;
  finally
    Unlock;
  end;

end;


function TInvokableClassRegistry.GetMethExternalName(Info: PTypeInfo;  MethodIntName: string): InvString;
var
  I, J: Integer;
begin

  Result := MethodIntName;
  Lock;
  try
    for I := 0 to Length(FRegIntfs) - 1 do
    begin
      if FRegIntfs[I].Info = Info then
      begin
        for J := 0 to Length(FRegIntfs[I].MethNameMap) -1 do
          if SameText(FRegIntfs[I].MethNameMap[J].Name, MethodIntName) then
          begin
            if FRegIntfs[I].MethNameMap[J].ExtName <> '' then
              Result := FRegIntfs[I].MethNameMap[J].ExtName;
            Exit;
          end;
      end;
    end;
  finally
    Unlock;
  end;

end;


function TInvokableClassRegistry.GetMethInternalName(Info: PTypeInfo;  MethodExtName: InvString): string;
var
  I, J: Integer;
begin

  Result := MethodExtName;
  Lock;
  try
    for I := 0 to Length(FRegIntfs) - 1 do
    begin
      if FRegIntfs[I].Info = Info then
      begin
        for J := 0 to Length(FRegIntfs[I].MethNameMap) -1 do
          if SameText(FRegIntfs[I].MethNameMap[J].ExtName, MethodExtName) then
          begin
            if FRegIntfs[I].MethNameMap[J].Name <> '' then
              Result := FRegIntfs[I].MethNameMap[J].Name;
            Exit;
          end;
      end;
    end;
  finally
    Unlock;
  end;

end;


function TInvokableClassRegistry.GetInterfaceTypeInfo(
  const AGUID: TGUID): Pointer;
var
  I: Integer;
begin
  Result := nil;
  Lock;
  try
    for I := 0 to Length(FRegIntfs) - 1 do
    begin
      if IsEqualGUID(AGUID, FRegIntfs[I].GUID) then
        Result := FRegIntfs[I].Info;
    end;
  finally
    UnLock;
  end;
end;

procedure TInvokableClassRegistry.GetInterfaceInfoFromName(
  const UnitName, IntfName: string; var Info: PTypeInfo; var IID: TGUID);
var
  I: Integer;
begin
  Info := nil;
  Lock;
  try
    for I := 0 to Length(FRegIntfs) - 1 do
    begin
      if  (CompareText(IntfName, FRegIntfs[I].Name) = 0)
          and ( (UnitName = '') or (CompareText(UnitName, FRegIntfs[I].UnitName) = 0))
      then
      begin
        Info := FRegIntfs[I].Info;
        IID := FRegIntfs[I].GUID;
      end;
    end;
  finally
    UnLock;
  end;
end;

function TInvokableClassRegistry.GetInfoForURI(const PathURI, ActionURI: string; var AClass: TClass; var IntfInfo: PTypeInfo; var AMeth: string): Boolean;
var
  I: Integer;
begin
  Result := False;
  Lock;
  Try
    if ActionURI <> '' then
    begin
    // presumes that an action is of the form
    // <namespace>#<method>
    // or simply <namespace><some other stuff that can be ignored>
    // and that an interface is registered with a <namespace>
    // so we simply find the first registered interface with a namespace that
    // is an initial substring of the action
      for I := 0 to Length(FRegIntfs) - 1 do
      begin
        if (ActionURI <> '') and (ActionURI[1] = '"') and (Pos(FRegIntfs[I].Namespace, ActionURI) = 2) then
        begin
          IntfInfo := FRegIntfs[I].Info;
          AClass := FRegIntfs[I].DefImpl;
          Result := True;
          break;
        end;
       end;
      if not Result then
      begin
        for I := 0 to Length(FRegIntfs) - 1 do
        begin
          if Pos(FRegIntfs[I].Namespace, ActionURI) = 1 then
          begin
            IntfInfo := FRegIntfs[I].Info;
            AClass := FRegIntfs[I].DefImpl;
            Result := True;
            break;
          end;
         end;
       end;
    end
    else if PathURI <> '' then
    begin
      // if a URL is used for defining which interface to use
      // then find the first interface whose name is a terminal substring of the
      // path, doesn't consider interfaces with the same name but in different units
      for I := 0 to Length(FRegIntfs) - 1 do
      begin
        if  CompareText(Copy(PathURI, LastDelimiter('/', PathURI) + 1, High(Integer)),FRegIntfs[I].Name) = 0  then
        begin
          IntfInfo := FRegIntfs[I].Info;
          AClass := FRegIntfs[I].DefImpl;
          Result := True;
          break;
        end;
      end
    end;
  finally
    UnLock;
  end;
end;

function TInvokableClassRegistry.GetNamespaceByGUID(const AGUID: TGUID): string;
var
  I: Integer;
begin
  Result := '';
  Lock;
  try
    for I := 0 to Length(FRegIntfs) - 1 do
    begin
      if IsEqualGUID(FRegIntfs[I].GUID, AGUID) then
      begin
        Result := FRegIntfs[I].Namespace;
        break;
      end;
    end;
  finally
    UnLock;
  end;
end;

function TInvokableClassRegistry.GetInvokableObjectFromClass(
  AClass: TClass): TObject;
var
  I: Integer;
  Found: Boolean;
begin
  Result := nil;
  Lock;
  Found := False;
  Try
    for I := 0 to Length(FRegClasses) - 1 do
      if FRegClasses[I].ClassType = AClass then
        if Assigned(FRegClasses[I].Proc) then
        begin
          FRegClasses[I].Proc(Result);
          Found := True;
        end;
    if not Found and  AClass.InheritsFrom(TInvokableClass) then
      Result := TInvokableClassClass(AClass).Create;
  finally
    UnLock;
  end;
end;


procedure TInvokableClassRegistry.GetClassFromIntfInfo(Info: PTypeInfo;
  var AClass: TClass);
var
  I: Integer;
begin
  AClass := nil;
  Lock;
  Try
    for I := 0 to Length(FRegIntfs) - 1 do
      if FRegIntfs[I].Info = Info then
      begin
        AClass := FRegIntfs[I].DefImpl;
        break;
      end;
  finally
    UnLock;
  end;
end;

{ TInvokableClass }

constructor TInvokableClass.Create;
begin
  inherited Create;
end;

{ TRemotable }

constructor TRemotable.Create;
begin
  inherited;
  if RemotableDataContext <> nil then
  begin
    TDataContext(RemotableDataContext).AddObjectToDestroy(Self);
    Self.DataContext := TDataContext(RemotableDataContext);
  end;
end;

destructor TRemotable.Destroy;
begin
  if RemotableDataContext <> nil then
  begin
    TDataContext(RemotableDataContext).RemoveObjectToDestroy(Self);
    Self.DataContext := nil;
  end;
  inherited Destroy;
end;

procedure TRemotable.SetDataContext(Value: TDataContext);
begin
  if (RemotableDataContext <> nil) and (RemotableDataContext = Self.DataContext) then
  begin
    TDataContext(RemotableDataContext).RemoveObjectToDestroy(Self);
  end;
  FDataContext := Value;
end;


{ TRemotableXS }

function TRemotableXS.NativeToXS: WideString;
begin

end;

procedure TRemotableXS.XSToNative(Data: WideString);
begin

end;

constructor TPascalRemotableTypeRegistry.Create;
begin
  inherited Create;
  InitializeCriticalSection(FLock);
end;

destructor TPascalRemotableTypeRegistry.Destroy;
begin
  inherited Destroy;
  DeleteCriticalSection(FLock);
end;

procedure TPascalRemotableTypeRegistry.Lock;
begin
  EnterCriticalSection(FLock);
end;

procedure TPascalRemotableTypeRegistry.UnLock;
begin
  LeaveCriticalSection(FLock);
end;

function TPascalRemotableTypeRegistry.GetURICount: Integer;
begin
  Lock;
  try
    Result := Length(URIMap);
  finally
    UnLock;
  end;
end;

function TPascalRemotableTypeRegistry.GetURIMap(Index: Integer): TRemRegEntry;
begin
  Lock;
  Try
  if Index < Length(URIMap) then
    Result := URIMap[Index];
  finally
    UnLock;
  end;
end;

function TPascalRemotableTypeRegistry.ClassToURI(AClass: TClass; var URI,
  Name: WideString; var IsScalar: Boolean): Boolean;
var
  I: Integer;
begin
  Result := False;
  Lock;
  try
    for I := 0 to Length(URIMap)- 1 do
      if URIMap[I].ClassType = AClass  then
      begin
        URI := URIMap[I].URI;
        Name := URIMap[I].Name;
        IsScalar := URIMap[I].IsScalar;
        Result := True;
        break;
      end;
  finally
    UnLock;
  end;
end;


procedure TPascalRemotableTypeRegistry.RegisterXSClass(AClass: TClass; URI: WideString = ''; Name: WideString = ''; ExtName: WideString = ''; IsScalar: Boolean = False; MultiRefOpt: TObjMultiOptions = ocDefault);
var
  Index: Integer;
  Found: Boolean;
  AppURI: WideString;
begin
  Lock;
  Try
    Index := GetEntry(AClass.ClassInfo, Found);
    if not Found then
    begin
      if AppNameSpacePrefix <> '' then
        AppURI := AppNameSpacePrefix + '-';
      if URI = '' then
        URIMap[Index].URI := 'urn:' + AppURI + GetTypeData(AClass.ClassInfo).UnitName { do not localize }
      else
        URIMap[Index].URI := URI;
      if Name <> '' then
        URIMap[Index].Name := Name
      else
      begin
        URIMap[Index].Name := AClass.ClassName;
      end;
      URIMap[Index].ExtName := ExtName;
      URIMap[Index].ClassType := AClass;
      URIMap[Index].Info := AClass.ClassInfo;
      URIMap[Index].IsScalar := IsScalar;
      URIMap[Index].MultiRefOpt := MultiRefOpt;
    end;
  finally
    UnLock;
  end;
end;

procedure TPascalRemotableTypeRegistry.RegisterXSInfo(Info: PTypeInfo;
  URI: WideString = ''; Name: WideString = ''; ExtName: WideString = '');
var
  Index: Integer;
  Found: Boolean;
  AppURI: WideString;
  UnitName: string;

  function GetEnumUnitName(Info: PTypeInfo): string;
  var
    P: ^ShortString;
    T: PTypeData;
    Size: Integer;
  begin
    T := GetTypeData(GetTypeData(Info)^.BaseType^);
    P := @T^.NameList;
    Size := T.MaxValue - T.MinValue;
    while Size >= 0  do
    begin
      Inc(Integer(P), Length(P^) + 1);
      Dec(Size);
    end;
    Result := P^;
  end;

begin
  Lock;
  Try
    Index := GetEntry(Info, Found);
    if Found then
      Exit;
    if AppNameSpacePrefix <> '' then
      AppURI := AppNameSpacePrefix + '-';
    if URI = '' then
    begin
      if Info.Kind = tkDynArray then
      begin
        UnitName := GetTypeData(Info).DynUnitName;
        URIMap[Index].URI := 'urn:' + AppURI +  UnitName;
      end
      else if Info.Kind = tkEnumeration then
      begin
        UnitName := GetEnumUnitName(Info);
        URIMap[Index].URI := 'urn:' + AppURI +  UnitName;
      end
      else if Info.Kind = tkClass then
        URIMap[Index].URI := 'urn:' + AppURI + GetTypeData(Info).UnitName
      else
        URIMap[Index].URI := 'urn:' + AppURI;
    end
    else
      URIMap[Index].URI := URI;
    if Name <> '' then
      URIMap[Index].Name := Name
    else
    begin
      URIMap[Index].Name := Info.Name;
    end;
    URIMap[Index].ExtName := ExtName;
    URIMap[Index].Info := Info;
    if Info.Kind = tkClass then
      URIMap[Index].ClassType := GetTypeData(Info).ClassType;
  finally
    UnLock;
  end;
end;

procedure TPascalRemotableTypeRegistry.DeleteEntryFromURIMap(Info: PTypeInfo);
var
  I, Index: Integer;
  Found: Boolean;
begin
  Lock;
  try
    Index := GetEntry(Info, Found);
    if Found then
    begin
      for I := Index to Length(URIMap) -2 do
        URIMap[I] := URIMap[I+1];
    end;
    SetLength(URIMap, Length(URIMap) -1);
  finally
    UnLock;
  end;
end;

procedure TPascalRemotableTypeRegistry.UnRegisterXSClass(AClass: TClass);
begin
  DeleteEntryFromURIMap(AClass.ClassInfo);
end;

procedure TPascalRemotableTypeRegistry.UnRegisterXSInfo(Info: PTypeInfo);
begin
  DeleteEntryFromURIMap(Info);
end;

function TPascalRemotableTypeRegistry.IsClassScalar(AClass: TClass): Boolean;
var
  I: Integer;
begin
  Result := False;
  Lock;
  Try
    for I := 0 to Length(URIMap) - 1 do
    begin
      if URIMap[I].ClassType = AClass then
      begin
        Result := URIMap[I].IsScalar;
        break;
      end;
    end;
  finally
    UnLock;
  end;
end;

function TPascalRemotableTypeRegistry.ClassOptions(AClass: TClass): TObjMultiOptions;
var
  I: Integer;
begin
  Result := ocDefault;
  Lock;
  Try
    for I := 0 to Length(URIMap) - 1 do
    begin
      if URIMap[I].ClassType = AClass then
      begin
        Result := URIMap[I].MultiRefOpt;
        break;
      end;
    end;
  finally
    UnLock;
  end;
end;

procedure TPascalRemotableTypeRegistry.RegisterExternalPropName(Info: PTypeInfo; InternalName: string; const ExternalName: InvString);
begin

end;

function TPascalRemotableTypeRegistry.GetExternalPropName(Info: PTypeInfo; InternalName: string): InvString;
begin
  Result := InternalName;
end;

function TPascalRemotableTypeRegistry.GetInternalPropName(Info: PTypeInfo; ExternalName: InvString): string;
begin
  Result := ExternalName;
end;

function TPascalRemotableTypeRegistry.URIToInfo(const URI,
  Name: WideString): PTypeInfo;
var
  I: Integer;
begin
  Result := nil;
  Lock;
  Try
    for I := 0 to Length(URIMap) - 1 do
    begin
      if (URIMap[I].URI = URI) and (URIMap[I].Name = Name) then
      begin
        Result := URIMap[I].Info;
        break;
      end;
    end;
  finally
    UnLock;
  end;
end;

procedure TPascalRemotableTypeRegistry.GetXSDInfoForClass(Info: PTypeInfo; var URI, TypeName: WideString);
var
  AClass: TClass;
  IsScalar: Boolean;
begin
  AClass := GetTypeData(Info).ClassType;
  ClassToURI(AClass, URI, TypeName, IsScalar);
end;

function TPascalRemotableTypeRegistry.GetRegisteredClassForBuiltInXSD(const TypeName: WideString): TClass;
var
  IsScalar: BOolean;
begin
  Result := RemClassRegistry.URIToClass(XMLSchemaNameSpace, TypeName, IsScalar);
end;

function  TPascalRemotableTypeRegistry.GetSimpleBuiltInXSDType(const URI, TypeName: WideString): PTypeInfo;
var
  I: Integer;
begin
  Result := nil;
  Lock;
  Try
    for I := 0 to Length(URIMap) -1 do
    begin
      if (URIMap[I].URI = URI) and (URIMap[I].Name = TypeName) then
      begin
        Result := URIMap[I].Info;
        break;
      end;
    end;
  finally
    UnLock;
  end;
end;

function TPascalRemotableTypeRegistry.XSDToTypeInfo(URI, TypeName: WideString): PTypeInfo;
var
  AClass, BuiltinClass: TClass;
  IsScalar: Boolean;
  I: Integer;

  function IsBase64TypeName(TypeName: InvString): Boolean;
  var
    J: Integer;
  begin
    Result := False;
    for J := Low(XMLBase64Types) to High(XMLBase64Types) do
      if TypeName = XMLBase64Types[J] then
      begin
        Result := True;
        break;
      end;
  end;
begin
  Result := nil;
  if URI = XMLSchemaNameSpace then
  begin
    // First check if a registered class overrides default mapping
    BuiltinClass := GetRegisteredClassForBuiltInXSD(TypeName);
    if BuiltinClass <> nil then
      Result := BuiltinClass.ClassInfo;
    if Result = nil then // if not, check default mapping
      Result := GetSimpleBuiltInXSDType(URI, TypeName);
      if (Result = nil) and IsBase64TypeName(TypeName) then
        for I := Low(XMLBase64Types) to High(XMLBase64Types) do
        begin
          Result := GetSimpleBuiltInXSDType(URI, XMLBase64Types[I]);
          if Result <> nil then
            break;
        end;
  end else
  begin
    AClass := RemClassRegistry.URIToClass(URI, TypeName, IsScalar);
    if AClass <> nil then
    begin
      Result := AClass.ClassInfo;
      Exit;
    end;
    if AClass = nil then
    begin
      Result := RemClassRegistry.URIToInfo(URI, TypeName);
    end;
  end;
end;

function TPascalRemotableTypeRegistry.VariantToInfo(V: Variant; TryAllSchema: Boolean): PTypeInfo;
var
 I: Integer;
begin
  Result := nil;
  case VarType(V) and VarTypeMask of
    varEmpty,
    varNull:
      raise ETypeRegistryException.Create(SUnsupportedVariant);
    varSmallint:
      Result := TypeInfo(System.SmallInt);
    varInteger:
      Result := TypeInfo(System.Integer);
    varSingle:
      Result := TypeInfo(System.Single);
    varDouble,
    varCurrency:
      Result := TypeInfo(System.Double);
    varDate:
      begin
        Result := RemClassRegistry.URIToInfo(XMLSchemaNameSpace, 'dateTime'); { do not localize }
        if Result = nil then
        begin
          for I := Low(XMLSchemaNamepspaces) to High(XMLSchemaNamepspaces) do
          begin
            Result := RemClassRegistry.URIToInfo(XMLSchemaNamepspaces[I], 'dateTime');
            if Result <> nil then
              break;
          end;
        end;
      end;
    varOleStr:
      Result := TypeInfo(System.WideString);
    varDispatch:
      raise ETypeRegistryException.Create(SNoVarDispatch);
    varError:
      raise ETypeRegistryException.Create(SNoErrorDispatch);
    varBoolean:
      Result := TypeInfo(System.Boolean);
    varVariant:
      Result := TypeInfo(System.Variant);
    varUnknown:
      raise ETypeRegistryException.Create(SUnsupportedVariant);
    varShortInt:
      Result := TypeInfo(System.ShortInt);
    varByte:
      Result := TypeInfo(System.Byte);
    varWord:
      Result := TypeInfo(System.Word);
    varLongWord:
      Result := TypeInfo(System.LongWord);
    varInt64:
      Result := TypeInfo(System.Int64);
    varString:
      Result := TypeInfo(System.WideString);
  end;

end;

function TPascalRemotableTypeRegistry.GetVarTypeFromXSD(URI,
  TypeName: InvString): TVarType;
var
  Info: PTypeInfo;
begin
  Result := varUnknown;
  Info := XSDToTypeInfo(URI, TypeName);
  case Info.Kind of
    tkInteger:
      Result := varInteger;
    tkFloat:
      Result := varDouble;
    tkInt64:
      Result := varInt64;
    tkChar,
    tkWChar,
    tkWString,
    tkString,
    tkLString:
      Result := varOleStr;
  end;
end;

function TPascalRemotableClassRegistry.GetEntry(Info: PTypeInfo; var Found: Boolean): Integer;
begin
  Result := 0;
  Found := False;
  while Result < Length(URIMap) do
  begin
    if (Info <> nil) and (URIMap[Result].Info = Info) then
    begin
      Found := True;
      Exit;
    end;
    Inc(Result);
  end;
  SetLength(URIMap, Result + 1);
end;

function TPascalRemotableTypeRegistry.URIToClass(URI, Name: WideString; var IsScalar: Boolean): TClass;
var
  I: Integer;
begin
  Result := nil;
  Lock;
  Try
    for I := 0 to Length(URIMap) - 1 do
    begin
      if (URIMap[I].URI = URI) and (URIMap[I].Name = Name) then
      begin
        Result := URIMap[I].ClassType;
        IsScalar := URIMap[I].IsScalar;
        break;
      end;
    end;
  finally
    UnLock;
  end;
end;

function TPascalRemotableClassRegistry.InfoToURI(Info: PTypeInfo; var URI,
  Name: WideString; var IsScalar: Boolean): Boolean;
var
  I: Integer;
begin
  Result := False;
  Lock;
  Try
    if Info <> nil then
    begin
      for I := 0 to Length(URIMap) - 1 do
      begin
        if URIMap[I].Info = Info then
        begin
          URI := URIMap[I].URI;
          Name :=  URIMap[I].Name;
          IsScalar := URIMap[I].IsScalar;
          Result := True;
          break;
        end;
      end;
    end;
  finally
    UnLock;
  end;
end;

function TPascalRemotableClassRegistry.TypeInfoToXSD(Info: PTypeInfo; var URI,
  TypeName: WideString): Boolean;
var
  IsScalar: Boolean;
begin
  if Info.Kind = tkClass then
    Result := ClassToURI(GetTypeData(Info).ClassType, URI, TypeName, IsScalar)
  else
    Result := InfoToURI(Info, URI, TypeName, IsScalar);
end;

{ ERemotableException }

constructor ERemotableException.CreateRem;
begin

end;

{ TDataContext }

procedure TDataContext.SetDataPointer(Index: Integer; P: Pointer);
begin
  DataP[Index] := P;
end;

function TDataContext.GetDataPointer(Index: Integer): Pointer;
begin
  Result := DataP[Index];
end;

procedure TDataContext.AddVariantToClear(P: PVarData);
var
  I: Integer;
begin
  for I := 0 to Length(VarToClear) -1 do
    if VarToClear[I] = P then
      Exit;
  I := Length(VarToClear);
  SetLength(VarToClear, I + 1);
  VarToClear[I] := P;
end;

procedure TDataContext.AddStrToClear(P: Pointer);
var
  I: Integer;
begin
   for I := 0 to Length(StrToClear) -1 do
    if StrToClear[I] = P then
      Exit;
  I := Length(StrToClear);
  SetLength(StrToClear, I + 1);
  StrToClear[I] := P;
end;

constructor TDataContext.Create;
begin
  inherited;
end;

destructor TDataContext.Destroy;
var
  I: Integer;
  P: Pointer;
begin
  for I := 0 to Length(FObjsToDestroy) - 1 do
  begin
     if (FObjsToDestroy[I] <> nil) and (FObjsToDestroy[I].InheritsFrom(TRemotable)) then
     begin
       TRemotable(FObjsToDestroy[I]).Free;
     end;
  end;
  SetLength(FObjsToDestroy, 0);
  for I := 0 to Length(VarToClear) - 1 do
  begin
    if Assigned(VarToClear[I]) then
      Variant( PVarData(VarToClear[I])^) := NULL;
  end;
  for I := 0 to Length(DynArrayToClear) - 1 do
  begin
    if Assigned(DynArrayToClear[I].P) then
    begin
      P := Pointer( PInteger(DynArrayToClear[I].P)^);
      DynArrayClear(P, DynArrayToClear[I].Info)
    end;
  end;
  for I := 0 to Length(StrToClear) - 1 do
  begin
    if Assigned(StrToClear[I]) then
      PString(StrToClear[I])^ := '';
  end;
  inherited;
end;

procedure TDataContext.AddDynArrayToClear(P: Pointer; Info: PTypeInfo);
var
  I: Integer;
begin
  for I := 0 to Length(DynArrayToClear) -1 do
    if DynArrayToClear[I].P = P then
      Exit;
  I := Length(DynArrayToClear);
  SetLength(DynArrayToClear, I + 1);
  DynArrayToClear[I].P := P;
  DynArrayToClear[I].Info := Info;
end;

procedure TDataContext.AddObjectToDestroy(Obj: TObject);
var
  Index, EmptySlot: Integer;
begin
  EmptySlot := -1;
  for Index := 0 to Length(FObjsToDestroy) -1 do
  begin
    if FObjsToDestroy[Index] = Obj then
      Exit;
    if FObjsToDestroy[Index] = nil then
      EmptySlot := Index;
  end;
  if EmptySlot <> -1 then
  begin
    FObjsToDestroy[EmptySlot] := Obj;
    Exit;
  end;
  Index := Length(FObjsToDestroy);
  SetLength(FObjsToDestroy, Index + 1 );
  FObjsToDestroy[Index] := Obj;
end;

procedure TDataContext.RemoveObjectToDestroy(Obj: TObject);
var
  I: Integer;
begin
  I := 0;
  while I < Length(FObjsToDestroy) do
  begin
    if FObjsToDestroy[I] = Obj then
    begin
      FObjsToDestroy[I] := nil;
      break;
    end;
    Inc(I);
  end;
end;

function TDataContext.AllocData(Size: Integer): Pointer;
begin
  Result := @Data[DataOffset];
  Inc(DataOffset, Size);
end;

{ TInvContext }

const
  MAXINLINESIZE = sizeof(TVarData) + 4;

procedure TInvContext.SetMethodInfo(const MD: TIntfMethEntry);
begin
  SetLength(DataP, MD.ParamCount + 1);
  SetLength(Data, (MD.ParamCount + 1) * MAXINLINESIZE);
end;

procedure TInvContext.SetParamPointer(Param: Integer; P: Pointer);
begin
   SetDataPointer(Param,  P);
end;

function TInvContext.GetParamPointer(Param: Integer): Pointer;
begin
  Result := GetDataPointer(Param);
end;

function TInvContext.GetResultPointer: Pointer;
begin
  Result := ResultP;
end;

procedure TInvContext.SetResultPointer(P: Pointer);
begin
  ResultP := P;
end;

procedure TInvContext.AllocServerData(const MD: TIntfMethEntry);
var
  I: Integer;
  Info: PTypeInfo;
  P: Pointer;
begin
  for I := 0 to MD.ParamCount - 1 do
  begin
    P := AllocData(GetTypeSize(MD.Params[I].Info));
    SetParamPointer(I, P);
    if MD.Params[I].Info.Kind = tkVariant then
    begin
      Variant(PVarData(P)^) := NULL;
      AddVariantToClear(PVarData(P));
    end else if MD.Params[I].Info.Kind = tkDynArray then
    begin
      AddDynArrayToClear(P, MD.Params[I].Info);
    end;
  end;
  if MD.ResultInfo <> nil then
  begin
    Info := MD.ResultInfo;
    case Info^.Kind of
      tkLString:
        begin
           P := AllocData(sizeof(PString));
           PString(P)^ := '';
           AddStrToClear(P);
        end;
      tkInt64:
        P := AllocData(sizeof(Int64));
      tkVariant:
        begin
          P := AllocData(sizeof(TVarData));
          Variant( PVarData(P)^ ) := NULL;
          AddVariantToClear(PVarData(P));
        end;
      tkDynArray:
        begin
          P := AllocData(GetTypeSize(Info));
          AddDynArrayToClear(P, MD.ResultInfo);
        end;
      else
        P := AllocData(GetTypeSize(Info));
    end;
    SetResultPointer(P);
  end;
end;


procedure InitBuiltIns;
begin
  { DO NOT LOCALIZE }
  RemClassRegistry.RegisterXSInfo(TypeInfo(System.Boolean), XMLSchemaNameSpace, 'boolean');

  RemClassRegistry.RegisterXSInfo(TypeInfo(System.ShortInt), XMLSchemaNameSpace, 'byte');
  RemClassRegistry.RegisterXSInfo(TypeInfo(System.Byte), XMLSchemaNameSpace, 'unsignedByte');

  RemClassRegistry.RegisterXSInfo(TypeInfo(System.SmallInt), XMLSchemaNameSpace, 'short');
  RemClassRegistry.RegisterXSInfo(TypeInfo(System.Word), XMLSchemaNameSpace, 'unsignedShort');

  RemClassRegistry.RegisterXSInfo(TypeInfo(System.LongWord), XMLSchemaNameSpace, 'unsignedInt');
  RemClassRegistry.RegisterXSInfo(TypeInfo(System.Cardinal), XMLSchemaNameSpace, 'unsignedInt');

  RemClassRegistry.RegisterXSInfo(TypeInfo(System.Integer), XMLSchemaNameSpace, 'int');
  RemClassRegistry.RegisterXSInfo(TypeInfo(System.LongInt), XMLSchemaNameSpace, 'int');

  RemClassRegistry.RegisterXSInfo(TypeInfo(System.Int64), XMLSchemaNameSpace, 'long');

  RemClassRegistry.RegisterXSInfo(TypeInfo(System.Single), XMLSchemaNameSpace, 'float');
  RemClassRegistry.RegisterXSInfo(TypeInfo(System.Double), XMLSchemaNameSpace, 'double');
  RemClassRegistry.RegisterXSInfo(TypeInfo(System.Extended), XMLSchemaNameSpace, 'double');
  RemClassRegistry.RegisterXSInfo(TypeInfo(System.Currency), XMLSchemaNameSpace, 'double');
  RemClassRegistry.RegisterXSInfo(TypeInfo(System.Comp), XMLSchemaNameSpace, 'double');
  RemClassRegistry.RegisterXSInfo(TypeInfo(System.Real), XMLSchemaNameSpace, 'double');

  RemClassRegistry.RegisterXSInfo(TypeInfo(System.AnsiString), XMLSchemaNameSpace, 'string');
  RemClassRegistry.RegisterXSInfo(TypeInfo(System.WideString), XMLSchemaNameSpace, 'string');
  RemClassRegistry.RegisterXSInfo(TypeInfo(System.ShortString), XMLSchemaNameSpace, 'string');
  RemClassRegistry.RegisterXSInfo(TypeInfo(System.AnsiChar), XMLSchemaNameSpace, 'string');
  RemClassRegistry.RegisterXSInfo(TypeInfo(System.WideChar), XMLSchemaNameSpace, 'string');
  RemClassRegistry.RegisterXSInfo(TypeInfo(System.Char), XMLSchemaNameSpace, 'string');
  RemClassRegistry.RegisterXSInfo(TypeInfo(System.WideChar), XMLSchemaNameSpace, 'string');

  RemClassRegistry.RegisterXSInfo(TypeInfo(Types.TByteDynArray), XMLSchemaNameSpace, 'base64Binary');
  RemClassRegistry.RegisterXSInfo(TypeInfo(System.Variant), XMLSchemaNameSpace, 'anySimpleType');

  RemClassRegistry.RegisterXSInfo(TypeInfo(TIntegerDynArray));
  RemClassRegistry.RegisterXSInfo(TypeInfo(TCardinalDynArray));
  RemClassRegistry.RegisterXSInfo(TypeInfo(TWordDynArray));
  RemClassRegistry.RegisterXSInfo(TypeInfo(TSmallIntDynArray));
  RemClassRegistry.RegisterXSInfo(TypeInfo(TByteDynArray));
  RemClassRegistry.RegisterXSInfo(TypeInfo(TShortIntDynArray));
  RemClassRegistry.RegisterXSInfo(TypeInfo(TInt64DynArray));
  RemClassRegistry.RegisterXSInfo(TypeInfo(TLongWordDynArray));
  RemClassRegistry.RegisterXSInfo(TypeInfo(TSingleDynArray));
  RemClassRegistry.RegisterXSInfo(TypeInfo(TDoubleDynArray));
  RemClassRegistry.RegisterXSInfo(TypeInfo(TBooleanDynArray));
  RemClassRegistry.RegisterXSInfo(TypeInfo(TStringDynArray));
  RemClassRegistry.RegisterXSInfo(TypeInfo(TWideStringDynArray));


end;

procedure UnInitBuiltIns;
begin
  RemClassRegistry.UnRegisterXSInfo(TypeInfo(System.Boolean));
  RemClassRegistry.UnRegisterXSInfo(TypeInfo(System.Integer));
  RemClassRegistry.UnRegisterXSInfo(TypeInfo(System.ShortInt));
  RemClassRegistry.UnRegisterXSInfo(TypeInfo(System.Single));
  RemClassRegistry.UnRegisterXSInfo(TypeInfo(System.Int64));
  RemClassRegistry.UnRegisterXSInfo(TypeInfo(System.Double));
  RemClassRegistry.UnRegisterXSInfo(TypeInfo(System.Extended));
  RemClassRegistry.UnRegisterXSInfo(TypeInfo(System.Currency));
  RemClassRegistry.UnRegisterXSInfo(TypeInfo(System.AnsiString));
  RemClassRegistry.UnRegisterXSInfo(TypeInfo(System.WideString));
  RemClassRegistry.UnRegisterXSInfo(TypeInfo(System.ShortString));
  RemClassRegistry.UnRegisterXSInfo(TypeInfo(System.AnsiChar));
  RemClassRegistry.UnRegisterXSInfo(TypeInfo(System.WideChar));
  RemClassRegistry.UnRegisterXSInfo(TypeInfo(System.Byte));
  RemClassRegistry.UnRegisterXSInfo(TypeInfo(System.SmallInt));
  RemClassRegistry.UnRegisterXSInfo(TypeInfo(System.LongInt));
  RemClassRegistry.UnRegisterXSInfo(TypeInfo(System.Cardinal));
  RemClassRegistry.UnRegisterXSInfo(TypeInfo(System.Char));
  RemClassRegistry.UnRegisterXSInfo(TypeInfo(System.WideChar));
  RemClassRegistry.UnRegisterXSInfo(TypeInfo(System.Word));
  RemClassRegistry.UnRegisterXSInfo(TypeInfo(System.LongWord));
  RemClassRegistry.UnRegisterXSInfo(TypeInfo(System.Comp));
  RemClassRegistry.UnRegisterXSInfo(TypeInfo(Types.TByteDynArray));

end;

initialization
  InvRegistryV := TInvokableClassRegistry.Create;
  RemTypeRegistryV := TPascalRemotableClassRegistry.Create;
  RemClassRegistryV:= RemTypeRegistry;
  InitBuiltIns;
finalization
  InvRegistryV.Free;
  RemClassRegistryV.Free;
end.

