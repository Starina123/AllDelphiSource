
{*******************************************************}
{                                                       }
{       Borland Delphi Visual Component Library         }
{                                                       }
{       Copyright (c) 1997,98 Inprise Corporation       }
{                                                       }
{*******************************************************}

unit VCLCom;

interface

uses ActiveX, ComObj, Classes;

type

{ Component object factory }

  TComponentFactory = class(TAutoObjectFactory)
  public
    constructor Create(ComServer: TComServerObject;
      ComponentClass: TComponentClass; const ClassID: TGUID;
      Instancing: TClassInstancing; ThreadingModel: TThreadingModel = tmSingle);
    function CreateComObject(const Controller: IUnknown): TComObject; override;
    procedure UpdateRegistry(Register: Boolean); override;
  end;

implementation

type

{ VCL OLE Automation object }

  TVCLAutoObject = class(TAutoObject, IVCLComObject)
  private
    FComponent: TComponent;
    FOwnsComponent: Boolean;
  protected
    procedure FreeOnRelease;
    function Invoke(DispID: Integer; const IID: TGUID;
      LocaleID: Integer; Flags: Word; var Params;
      VarResult, ExcepInfo, ArgErr: Pointer): HResult; override;
  public
    constructor Create(Factory: TComObjectFactory; Component: TComponent);
    destructor Destroy; override;
    procedure Initialize; override;
    function ObjQueryInterface(const IID: TGUID; out Obj): HResult; override;
  end;

{ TVCLAutoObject }

constructor TVCLAutoObject.Create(Factory: TComObjectFactory;
  Component: TComponent);
begin
  FComponent := Component;
  CreateFromFactory(Factory, nil);
end;

destructor TVCLAutoObject.Destroy;
begin
  if FComponent <> nil then
  begin
    FComponent.VCLComObject := nil;
    if FOwnsComponent then FComponent.Free;
  end;
  inherited Destroy;
end;

procedure TVCLAutoObject.FreeOnRelease;
begin
  FOwnsComponent := True;
end;

procedure TVCLAutoObject.Initialize;
begin
  inherited Initialize;
  if FComponent = nil then
  begin
    FComponent := TComponentClass(Factory.ComClass).Create(nil);
    FOwnsComponent := True;
  end;
  FComponent.VCLComObject := Pointer(IVCLComObject(Self));
end;

function TVCLAutoObject.Invoke(DispID: Integer; const IID: TGUID;
  LocaleID: Integer; Flags: Word; var Params;
  VarResult, ExcepInfo, ArgErr: Pointer): HResult;
begin
  Result := DispInvoke(Pointer(Integer(FComponent) +
    TComponentFactory(Factory).DispIntfEntry^.IOffset),
    TComponentFactory(Factory).DispTypeInfo, DispID, Flags,
    TDispParams(Params), VarResult, ExcepInfo, ArgErr);
end;

function TVCLAutoObject.ObjQueryInterface(const IID: TGUID; out Obj): HResult;
begin
  Result := inherited ObjQueryInterface(IID, Obj);
  if (Result <> 0) and (FComponent <> nil) then
    if FComponent.GetInterface(IID, Obj) then Result := 0;
end;

{ TComponentFactory }

constructor TComponentFactory.Create(ComServer: TComServerObject;
  ComponentClass: TComponentClass; const ClassID: TGUID;
  Instancing: TClassInstancing; ThreadingModel: TThreadingModel);
begin
  inherited Create(ComServer, TAutoClass(ComponentClass),
    ClassID, Instancing, ThreadingModel);
end;

type
  TComponentProtectedAccess = class(TComponent);
  TComponentProtectedAccessClass = class of TComponentProtectedAccess;

procedure TComponentFactory.UpdateRegistry(Register: Boolean);
begin
  if Register then inherited UpdateRegistry(Register);
  TComponentProtectedAccessClass(ComClass).UpdateRegistry(Register, GUIDToString(ClassID), ProgID);
  if not Register then inherited UpdateRegistry(Register);
end;

function TComponentFactory.CreateComObject(const Controller: IUnknown): TComObject;
begin
  Result := TVCLAutoObject.CreateFromFactory(Self, Controller);
end;

{ Global routines }

procedure CreateVCLComObject(Component: TComponent);
begin
  TVCLAutoObject.Create(ComClassManager.GetFactoryFromClass(
    Component.ClassType), Component);
end;

initialization
begin
  CreateVCLComObjectProc := CreateVCLComObject;
end;

finalization
begin
  CreateVCLComObjectProc := nil;
end;

end.
