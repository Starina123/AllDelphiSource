{*******************************************************}
{                                                       }
{               Delphi DBX Framework                    }
{                                                       }
{ Copyright(c) 1995-2011 Embarcadero Technologies, Inc. }
{                                                       }
{*******************************************************}

unit Data.DBXClassRegistry;

interface

uses
  System.Classes,
  System.SysUtils
;

type
  TAssemblyType = TObject;

  // TObject constructor is not virtual, so allow for virtual constructor
  // for registered Objects.
  //
  TClassRegistryObject = class
  public
    constructor Create; virtual;
  end;

  TRegistryClass = class of TClassRegistryObject;

  EClassRegistryError = class(Exception);

  TInstanceCreator = packed record
  private
    FClassName: UnicodeString;
    FObjectClass: TClass;
    FRegistryClass: TRegistryClass;
    function CreateInstance: TObject;
  end;

  TClassRegistryPackageItem = class
  private
    FUseCount: Integer;
    FPackageName: UnicodeString;
    FPackageHandle: HMODULE;
    constructor Create(PackageName: UnicodeString);
  public
    destructor Destroy; override;
  end;

  TClassRegistryItem = class
  private
    FClassName: UnicodeString;
    FObjectClass: TClass;
    FRegistryClass: TRegistryClass;
    FPackageItem: TClassRegistryPackageItem;
    procedure InitializeInstanceCreator(var InstanceCreator: TInstanceCreator);
  end;

  TClassRegistry = class
  private
    FLock: TThreadList;
    FClasses: TStringList;
    FPackages: TStringList;
    FCanDestroy: Boolean;
    class var ClassRegistry: TClassRegistry;
    function FindClass(ClassName: UnicodeString): TClassRegistryItem;
    function FindPackage(PackageName: UnicodeString): TClassRegistryPackageItem;
  public
    constructor Create;
    destructor Destroy; override;
    class function GetClassRegistry: TClassRegistry;
    procedure RegisterPackageClass(ClassName: UnicodeString;
      PackageName: UnicodeString);
    procedure RegisterClass(ClassName: UnicodeString; ObjectClass: TClass);
      overload;
    procedure RegisterClass(ClassName: UnicodeString; ObjectClass: TClass;
      AssemblyType: TAssemblyType); overload;
    procedure RegisterRegistryClass(ClassName: UnicodeString;
      RegistryClass: TRegistryClass);
    procedure UnregisterClass(ClassName: UnicodeString);
    function HasClass(ClassName: UnicodeString): Boolean;
    function CreateInstance(ClassName: UnicodeString): TObject;
  end;

implementation

uses
  Data.DBXCommonResStrs;

{ TClassRegistry }

constructor TClassRegistry.Create;
begin
  inherited Create;
  FLock       := TThreadList.Create;
  FClasses    := TStringList.Create;
  FClasses.Sorted := true;
  FPackages   := TStringList.Create;
  FPackages.Sorted := true;
  FCanDestroy := true;
end;

destructor TClassRegistry.Destroy;
var
  Index: Integer;
begin
  if not FCanDestroy then
    raise EClassRegistryError.Create(SCannotFreeClassRegistry);
  FreeAndNil(FLock);
  if FClasses <> nil then
    for Index := 0 to FClasses.Count - 1 do
      FClasses.Objects[Index].Free;
  FreeAndNil(FClasses);
  if FPackages <> nil then
    for Index := 0 to FPackages.Count - 1 do
      FPackages.Objects[Index].Free;
  FreeAndNil(FPackages);
end;

function TClassRegistry.CreateInstance(ClassName: UnicodeString): TObject;
var
  Item: TClassRegistryItem;
  InstanceCreator: TInstanceCreator;
begin
  FLock.LockList;
  try
    Item := FindClass(ClassName);
    if Item = nil then
      raise EClassRegistryError.Create(Format(SNotRegistered, [ClassName]))
    else
      Item.InitializeInstanceCreator(InstanceCreator);
  finally
    FLock.UnlockList;
  end;
  // To improve performance, create the instance out of the critical section.
  //
  Result := InstanceCreator.CreateInstance;
end;

function TClassRegistry.FindClass(ClassName: UnicodeString): TClassRegistryItem;
var
  Index: Integer;
begin
  if FClasses.Find(ClassName, Index) then
    Result := TClassRegistryItem(FClasses.Objects[Index])
  else
    Result := nil;
end;

function TClassRegistry.FindPackage(
  PackageName: UnicodeString): TClassRegistryPackageItem;
var
  Index: Integer;
begin
  if FPackages.Find(PackageName, Index) then
    Result := TClassRegistryPackageItem(FPackages.Objects[Index])
  else
    Result := nil;
end;

class function TClassRegistry.GetClassRegistry: TClassRegistry;
begin
  if TClassRegistry.ClassRegistry = nil then
  begin
    TClassRegistry.ClassRegistry := TClassRegistry.Create;
      TClassRegistry.ClassRegistry.FCanDestroy := false;
  end;
  Result := ClassRegistry;
end;

function TClassRegistry.HasClass(ClassName: UnicodeString): Boolean;
var
  Index: Integer;
begin
  Result := FClasses.Find(ClassName, Index);
end;



procedure TClassRegistry.RegisterClass(ClassName: UnicodeString;
  ObjectClass: TClass);
begin
  if ObjectClass = nil then
    raise EClassRegistryError.Create(Format(SInvalidClassRegister, [ClassName]));
  RegisterClass(ClassName, ObjectClass, nil);
end;

procedure TClassRegistry.RegisterClass(ClassName: UnicodeString; ObjectClass: TClass; AssemblyType: TAssemblyType);
var
  ClassItem: TClassRegistryItem;
begin
  FLock.LockList;

  ClassItem := FindClass(ClassName);
  try
    if ClassItem <> nil then begin
      // Subtle.  Get here on .net if RegisterPackageClass was called first
      // and then the initialization section is consequently invoked
      // and calls RegisterClass.  The initial RegisterPackageClass did
      // not have the class reference, so it is nil.  Corner case resulting
      // from a general system for static and dynamic linkage across native
      // and managed code.
      //
      if ClassItem.FObjectClass <> nil then
        raise EClassRegistryError.Create(Format(SAlreadyRegistered, [ClassName]));
      ClassItem.FObjectClass := ObjectClass;
    end else begin
      ClassItem := TClassRegistryItem.Create;
      try
        ClassItem.FClassName      := ClassName;
        ClassItem.FObjectClass    := ObjectClass;
        ClassItem.FRegistryClass  := nil;
        FClasses.AddObject(ClassName, ClassItem);
        ClassItem := nil;
      finally
        ClassItem.Free;
      end;
    end;
  finally
    FLock.UnlockList;
  end;
end;

procedure TClassRegistry.RegisterRegistryClass(ClassName: UnicodeString;
  RegistryClass: TRegistryClass);
var
  ClassItem: TClassRegistryItem;
begin
  if RegistryClass = nil then
    raise EClassRegistryError.Create(Format(SInvalidClassRegister, [ClassName]));
  FLock.LockList;
  try
    ClassItem := FindClass(ClassName);
    if ClassItem <> nil then begin
      // Subtle.  Get here on .net if RegisterPackageClass was called first
      // and then the initialization section is consequently invoked
      // and calls RegisterClass.  The initial RegisterPackageClass did
      // not have the class reference, so it is nil.  Corner case resulting
      // from a general system for static and dynamic linkage across native
      // and managed code.
      //
      if ClassItem.FObjectClass <> nil then
        raise EClassRegistryError.Create(Format(SAlreadyRegistered, [ClassName]));
      ClassItem.FObjectClass := nil;
    end else begin
        ClassItem := TClassRegistryItem.Create;
        try
          ClassItem.FClassName      := ClassName;
          ClassItem.FObjectClass    := nil;
          ClassItem.FRegistryClass  := RegistryClass;
          FClasses.AddObject(ClassName, ClassItem);
          ClassItem := nil;
        finally
          ClassItem.Free;
        end;
    end;
  finally
    FLock.UnlockList;
  end;
end;

procedure TClassRegistry.RegisterPackageClass(ClassName,
  PackageName: UnicodeString);
var
  ClassItem: TClassRegistryItem;
  PackageItem: TClassRegistryPackageItem;
  ClassItemCreated: Boolean;
  PackageItemCreated: Boolean;
begin
  ClassItem := nil;
  PackageItem := nil;
  PackageItemCreated := False;
  ClassItemCreated := False;
  FLock.LockList;
  try
    ClassItem := FindClass(ClassName);
    if ClassItem <> nil then
      raise EClassRegistryError.Create(Format(SAlreadyRegistered, [ClassName]));
    PackageItem := FindPackage(PackageName);
    if PackageItem = nil then
      begin
        PackageItem := TClassRegistryPackageItem.Create(PackageName);
        PackageItemCreated := true;
      end
    else
      PackageItemCreated := false;
    ClassItem := FindClass(ClassName);
    ClassItemCreated := false;
    // native unit initialization section is invoked when the package was loaded.
    //
    if ClassItem = nil then
    begin
      ClassItem := TClassRegistryItem.Create;
      ClassItem.FClassName := ClassName;
      ClassItemCreated := true;
    end;
    ClassItem.FPackageItem := PackageItem;
    if PackageItemCreated then
      FPackages.AddObject(PackageName, PackageItem);
    inc(PackageItem.FUseCount);
    if ClassItemCreated then
      FClasses.AddObject(ClassName, ClassItem);
    ClassItem := nil;
    PackageItem := nil;
  finally
    if PackageItemCreated then
      PackageItem.Free;
    if ClassItemCreated then
      ClassItem.Free;
    FLock.UnlockList;
  end;
end;

procedure TClassRegistry.UnregisterClass(ClassName: UnicodeString);
var
  ClassItem: TClassRegistryItem;
  Index: Integer;
begin
  FLock.LockList;
  try
    if FClasses.Find(ClassName, Index) then
    begin
      ClassItem := FClasses.Objects[Index] as TClassRegistryItem;
      ClassItem.Free;
      FClasses.Delete(Index);
    end;
  finally
    FLock.UnlockList;
  end;
end;

{ TInstanceCreator }

function TInstanceCreator.CreateInstance: TObject;
begin
  Result := nil;
  if FObjectClass <> nil then
    Result := FObjectClass.Create
  else if FRegistryClass <> nil then
    Result := FRegistryClass.Create;

  if Result = nil then
    raise EClassRegistryError.Create(Format(SInvalidClassRegister, [FClassName]));
end;

{ TClassRegistryPackageItem }

constructor TClassRegistryPackageItem.Create(PackageName: UnicodeString);
begin
  inherited Create;
  FPackageName := PackageName;
  FPackageHandle := LoadPackage(PackageName);
end;

destructor TClassRegistryPackageItem.Destroy;
begin
  UnloadPackage(FPackageHandle);
  inherited;
end;

{ TClassRegistryItem }

procedure TClassRegistryItem.InitializeInstanceCreator(
  var InstanceCreator: TInstanceCreator);
begin
  InstanceCreator.FClassName      := FClassName;
  InstanceCreator.FObjectClass    := FObjectClass;
  InstanceCreator.FRegistryClass  := FRegistryClass;
end;

{ TClassRegistryObject }

constructor TClassRegistryObject.Create;
begin
  inherited Create;
end;

initialization
finalization
  if TClassRegistry.ClassRegistry <> nil then
  begin
    TClassRegistry.ClassRegistry.FCanDestroy := true;
    FreeAndNil(TClassRegistry.ClassRegistry);
  end;
end.







